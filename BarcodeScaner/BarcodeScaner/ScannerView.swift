//
//  ScannerView.swift
//  BarcodeScaner
//
//  Created by Maxim Bekmetov on 25.11.2022.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> ScanerVC {
        ScanerVC(scanerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScanerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
   
    final class Coordinator: NSObject, ScanerVCDelegate {
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
        
        
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
