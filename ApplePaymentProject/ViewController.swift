//
//  ViewController.swift
//  ApplePaymentProject
//
//  Created by Akin on 05/09/2021.
//

import UIKit
import PassKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func paymentButton(_ sender: Any) {
        let request = PKPaymentRequest()
        request.merchantIdentifier = "merchant.akinola"
        request.supportedNetworks = [.visa, .masterCard, .amex, .maestro]
        request.supportedCountries = ["GB", "US"]
        request.merchantCapabilities = .capability3DS
        request.countryCode = "GB"
        request.currencyCode = "GBP"
        request.paymentSummaryItems = [PKPaymentSummaryItem(label: "GITHUB PROJECT", amount: 3000)]
        
        if let controller: PKPaymentAuthorizationViewController = PKPaymentAuthorizationViewController(paymentRequest: request) {

           controller.delegate = self

            self.present(controller, animated: true, completion: nil)
            

        }
        
        
    }
    
}


// extend the functionality of the ViewController to add the PKPaymentAuthorizationViewControllerDelegate
extension ViewController: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        completion(PKPaymentAuthorizationStatus.success)
    }

    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}
