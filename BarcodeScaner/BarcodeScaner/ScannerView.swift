//
//  ScannerView.swift
//  BarcodeScaner
//
//  Created by Maxim Bekmetov on 25.11.2022.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String

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
            print(error.rawValue)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannCode: .constant("123456"))
    }
}
