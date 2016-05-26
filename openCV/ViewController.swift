//
//  ViewController.swift
//  openCV
//
//  Created by rin on 2016/04/12.
//  Copyright © 2016年 rin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //メインのimageView宣言
    @IBOutlet weak var screenImage: UIImageView!
    
    //エッジ処理をするか、元の画像に戻すかのフラグ
    var count = true
    //処理する画像を入れる
    var mainImage = UIImage(named: "IMG_0351.PNG")
    
    //エッジ処理ボタン
    @IBAction func filterButton(sender: AnyObject) {
        
        //エッジ処理
        if(count == true){
            var edgeF = openCV.DetectEdgeWithImage(mainImage)
            count = false
            //imageViewの画像差し替え
            screenImage.image = edgeF as UIImage
        }else{
            //imageViewの画像を処理前に差し替え
            screenImage.image = mainImage
            count = true
        }
    }
    
    
    
    //画像読み込みボタン
    @IBAction func selectIMG(sender: UIButton) {
        //一時ビューでどちらか選択
        let alertController = UIAlertController(title: "どちらから？", message: nil, preferredStyle: .ActionSheet)
        
        let firstAction = UIAlertAction(title: "カメラ", style: .Default){
            action in
            self.importIMG(.Camera)
        }
        
        let secondAction = UIAlertAction(title: "ライブラリ", style: .Default){
            action in
            self.importIMG(.PhotoLibrary)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        
        
        presentViewController(alertController, animated:true, completion: nil)
        //iPad対応
        alertController.popoverPresentationController?.sourceView = view;
        alertController.popoverPresentationController?.sourceRect = sender.frame
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func importIMG(sourceType: UIImagePickerControllerSourceType) {
        
        //画像取得開始
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    //画像選択したとき
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image:UIImage!, editingInfo:NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: nil)
        
        mainImage = image
        screenImage.image = mainImage
        count = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

