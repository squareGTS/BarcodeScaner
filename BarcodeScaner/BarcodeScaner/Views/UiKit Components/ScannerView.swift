//
//  ScannerView.swift
//  BarcodeScaner
//
//  Created by Maxim Bekmetov on 25.11.2022.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?

    func makeUIViewController(context: Context) -> ScanerVC {
        ScanerVC(scanerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScanerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scanerView: self)
    }
   
    final class Coordinator: NSObject, ScanerVCDelegate {
        private let scanerView: ScannerView
        
        init(scanerView: ScannerView) {
            self.scanerView = scanerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            scanerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scanerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scanerView.alertItem = AlertContext.invalidScanedInput
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("123456"), alertItem: .constant(AlertItem(title: "test",
                                                                                     message: "test",
                                                                                     dismissButton: .default(Text("Ok")))))
    }
}
