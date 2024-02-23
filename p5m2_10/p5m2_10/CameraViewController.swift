//
//  CameraViewController.swift
//  p5m2_10
//
//  Created by Amina TomasMart on 12.02.2024.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    var images: [UIImage] = []
    var cameraPosition: AVCaptureDevice.Position = .back
    
    var session: AVCaptureSession!
    var preview: AVCaptureVideoPreviewLayer!
    var output = AVCapturePhotoOutput()
    
    lazy var shotBtn: UIButton = {
        $0.frame = CGRect(x: view.frame.width/2-40, y: view.frame.height-110, width: 80, height: 80)
        $0.setBackgroundImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: action))
    
    lazy var action = UIAction { _ in
        let setting = AVCapturePhotoSettings()
        setting.flashMode = .off
        self.output.capturePhoto(with: setting, delegate: self)
    }
    
    lazy var myView: UIView = {
        $0.frame = CGRect(x: 30, y: view.frame.height-90, width: 50, height: 40)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapForItem(sender:)))
        $0.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        $0.addSubview(image)
        return $0
    }(UIView())
    
    lazy var image: UIImageView = {
        $0.frame = CGRect(x: .zero, y: .zero, width: 50, height: 40)
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var btn: UIButton = {
        $0.frame = CGRect(x: view.frame.width-70, y: view.frame.height-90, width: 40, height: 40)
        $0.setBackgroundImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        $0.tintColor = .white
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIButton(primaryAction: actionBtn))
    
    lazy var actionBtn = UIAction { _ in
        var position: AVCaptureDevice.Position = (self.cameraPosition == .back) ? .front : .back
        self.cameraPosition = position
        self.session.beginConfiguration()
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position)
        do {
            let input = try AVCaptureDeviceInput(device: device!)
            for input in self.session.inputs {
                self.session.removeInput(input)
            }
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            self.session.commitConfiguration()
        } catch {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCamera()
        view.addSubview(shotBtn)
        view.addSubview(myView)
        view.addSubview(btn)
    }
    
    @objc func tapForItem(sender: UITapGestureRecognizer) {
        guard sender.view != nil else {return}
        let vc = PhotoViewController()
        vc.images = images
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createCamera() {
        session = AVCaptureSession()
        session.sessionPreset = .hd4K3840x2160
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("No camera")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            if session.canAddInput(input),
               session.canAddOutput(output) {
                
                session.addInput(input)
                session.addOutput(output)
            }
            
            preview = AVCaptureVideoPreviewLayer(session: session)
            preview.videoGravity = .resizeAspect
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.session.startRunning()
            }
            preview.frame = CGRect(x: .zero, y: 50, width: view.frame.width, height: view.frame.height-180)
            view.layer.addSublayer(preview
            )
            
        } catch {
            print("Error")
        }
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else {return}
        if let image = UIImage(data: data) {
            self.image.image = image
            self.images.append(image)
            self.reloadInputViews()
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}
