//
//  BluetoothVC.swift
//  SwiftMasterProject
//
//  Created by Potenza on 09/02/24.
//

import UIKit
import CoreBluetooth

class BluetoothVC: UIViewController, CBPeripheralDelegate {
    
    var cbCentralManager = CBCentralManager()
    var peripheral : CBPeripheral?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    func setUpView() {
        cbCentralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension BluetoothVC : CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
            print("Scanning...")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
      guard peripheral.name != nil else {return}
      
      if peripheral.name! == "Thunder Sense #33549" {
      
        print("Sensor Found!")
        //stopScan
        cbCentralManager.stopScan()
//        cbCentralManager
          
        //connect
        cbCentralManager.connect(peripheral, options: nil)
        self.peripheral = peripheral
       
       }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
      //discover all service
      peripheral.discoverServices(nil)
      peripheral.delegate = self

    }
}
