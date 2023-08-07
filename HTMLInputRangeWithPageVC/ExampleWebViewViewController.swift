//
//  ExampleWebViewViewController.swift
//  HTMLInputRangeWithPageVC
//

import UIKit
import WebKit

class ExampleWebViewViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let htmlCode = """
        <!DOCTYPE html
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <style>
            body {
               background-color: ""
               font-family: DeviceUI, sans-serif;
               font-size: 12pt;
               -webkit-tap-highlight-color: rgba(0,0,0,0);
            }
        
            video {
                width: 100%;
            }
           
            </style>
        </head>
        <body>
            <h1>Testing HTML input range slider</h1>
        <p>HTML5 video</p>
          <video playsinline src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" controls>
            <p>Your browser does not support HTML5 video.</p>
          </video>
                <p>Regular input slider</p>
        <p><input type="range" id="volume" name="volume" min="0" max="11" /></p>
        </body>
        </html>
        """

        webView.backgroundColor = .white
        webView.loadHTMLString(htmlCode, baseURL: nil)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.isInspectable = true
        view = webView
    }
}

extension UIColor {
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
        else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }
}
