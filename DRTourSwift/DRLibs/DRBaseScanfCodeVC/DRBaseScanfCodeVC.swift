//
//  DRBaseScanfCodeVC.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/21.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit
import AVFoundation

typealias ScanfCodeSuccessBlock = (scanfCodeString: String) -> ()

class DRBaseScanfCodeVC: UIViewController {
    
    var captureSession: AVCaptureSession!
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer!
    var captureInput: AVCaptureDeviceInput!
    var scanfCodeSuccessBlock = ScanfCodeSuccessBlock!()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 检查设备是否有相机
        if !UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let alert = DRAlert.alert(.alert, title: "没有相机", mess: nil);
            alert.addButtonWithTitle("确定", block: {
            })
            alert.show();
            return;
        }

        // 检查app是否有相机权限
        let authStatus =  AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        if (authStatus == .Restricted  || authStatus == .Denied) {
            let alert = DRAlert.alert(.alert, title: "没有相机权限", mess: nil);
            alert.addButtonWithTitle("确定", block: {
            })
            alert.show();
            return;
        }
        
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo);
        do{
            try self.captureInput = AVCaptureDeviceInput(device: device)
            
            let output = AVCaptureMetadataOutput();
            output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue());
            
            self.captureSession = AVCaptureSession()
            self.captureSession.canSetSessionPreset(AVCaptureSessionPresetHigh)
            self.captureSession.addInput(captureInput)
            self.captureSession.addOutput(output)
            output.metadataObjectTypes = [
                AVMetadataObjectTypeUPCECode,
                AVMetadataObjectTypeCode39Code,
                AVMetadataObjectTypeCode39Mod43Code,
                AVMetadataObjectTypeEAN13Code,
                AVMetadataObjectTypeEAN8Code,
                AVMetadataObjectTypeCode93Code ,
                AVMetadataObjectTypeCode128Code ,
                AVMetadataObjectTypePDF417Code,
                AVMetadataObjectTypeQRCode,
                AVMetadataObjectTypeAztecCode];
            self.captureVideoPreviewLayer  = AVCaptureVideoPreviewLayer.init(session: self.captureSession);
            self.captureVideoPreviewLayer.frame = screenBounds();
            self.captureVideoPreviewLayer.connection.videoOrientation = .Portrait
            self.view.layer.insertSublayer(self.captureVideoPreviewLayer, atIndex: 0)
            
        }catch let error as NSError{
            
            print(error)
            return ;
        }
        self.view.addSubview(DRBaseScanfCodeSettingView.baseScanfCodeSettingViewWithFrame(UIScreen.mainScreen().bounds))
    }

    internal class func baseScanfCodeVCWithScanfCodeBlock(block: ((codeString: String) -> ())) -> (DRBaseScanfCodeVC){
        let c = DRBaseScanfCodeVC()
        c.scanfCodeSuccessBlock = block;
        return c;
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        if self.captureSession != nil {
            self.captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        if self.captureSession != nil {
            self.captureSession.stopRunning();
        }
    }
    
    private func screenBounds() -> (CGRect) {
        let screen = UIScreen.mainScreen();
        return screen.bounds;
    }
}

extension DRBaseScanfCodeVC: AVCaptureMetadataOutputObjectsDelegate {
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        if metadataObjects.count > 0 {
            self.captureSession.stopRunning();
            print("\(metadataObjects.first)")
            let obj: AVMetadataMachineReadableCodeObject = metadataObjects.first as! AVMetadataMachineReadableCodeObject;
            self.navigationController?.popViewControllerAnimated(true);
            if (self.scanfCodeSuccessBlock != nil) {
                self.scanfCodeSuccessBlock(scanfCodeString: obj.stringValue);
            }
        }
    }
}