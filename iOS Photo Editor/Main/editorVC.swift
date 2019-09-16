//
//  editorVC.swift
//  iOS Photo Editor
//
//  Created by Vaibhav Mehta on 12/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import CoreImage

class editorVC: UIViewController {

    struct Filter {
        let filterName: String
        var filterEffectValue: Any?
        var filterEffectValueName: String?
        
        init(filterName: String, filterEffectValue: Any?, filterEffectValueName: String) {
            self.filterName = filterName
            self.filterEffectValue = filterEffectValue
            self.filterEffectValueName = filterEffectValueName
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var topTextView: UITextView!
    @IBOutlet weak var bottomTextView: UITextView!
    @IBOutlet weak var mainView: UIView!
    
    private var originalImage: UIImage?
    var selectedImage: UIImage?
    
    let imagePicker = UIImagePickerController()
    
//    @IBOutlet weak var viewText: UIView!
//    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var insideButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var effectsView: UIView!
    @IBOutlet weak var textEnterView: UIView!
    @IBOutlet weak var colourView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //textView.delegate = self
        
        topTextView.isHidden = true
        bottomTextView.isHidden = true

        effectsView.isHidden = true
        textEnterView.isHidden = true
       colourView.isHidden = true
//        insideButton.isHidden = true
//        bottomButton.isHidden = true
//        topButton.isHidden = true
        
//        viewText.isHidden = true
//        textView.isHidden = true
        
        originalImage = imageView.image
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(editorVC.openGallery(tapGesture:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated: true)
        
        topTextView.inputAccessoryView = toolBar
        bottomTextView.inputAccessoryView = toolBar
        
    }
    
    @objc func doneClicked(){
        
        view.endEditing(true)
    }

    @objc func openGallery(tapGesture: UITapGestureRecognizer){
        
        print("hello")
        self.setupImagePicker()

    }
    
    private func applyFilterTo(image: UIImage, filterEffect: Filter) -> UIImage? {
        
        guard let cgImage = image.cgImage,
            let openGLContext = EAGLContext(api: .openGLES3) else {
                
                return nil
        }
        
        let context = CIContext(eaglContext: openGLContext)
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: filterEffect.filterName)
        
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        if let filterEffectValue = filterEffect.filterEffectValue,
            let filterEffectValueName = filterEffect.filterEffectValueName {
            
            filter?.setValue(filterEffectValue, forKey: filterEffectValueName)
        }
        
        var filteredImage: UIImage?
        
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage,
            let cgImageResult = context.createCGImage(output, from: output.extent){
            
            filteredImage = UIImage(cgImage: cgImageResult)
        }
        
        return filteredImage
    }
    
    //override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        for touch in (touches as! Set<UITouch>){
//
//            let loc = touch.location(in: self.view)
//            if viewText.frame.contains(loc){
//
//                viewText.center = loc
//            }
//
//        }
//    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        for touch in (touches as! Set<UITouch>){
//
//            let loc = touch.location(in: self.view)
//            if viewText.frame.contains(loc){
//
//                viewText.center = loc
//            }
//
//        }
//    }
    
    @IBAction func blackColour(_ sender: UIButton) {
        
        self.mainView.backgroundColor = .black
    }
    
    @IBAction func whiteColour(_ sender: Any) {
        
        self.mainView.backgroundColor = .white
    }
    @IBAction func redColour(_ sender: Any) {
        
        self.mainView.backgroundColor = .red
    }
    @IBAction func greyColour(_ sender: Any) {
        
        self.mainView.backgroundColor = .gray
    }
    @IBAction func blueColour(_ sender: Any) {
        
        self.mainView.backgroundColor = .blue
    }
    
    
    @IBAction func filtersButton(_ sender: UIButton) {
        
        effectsView.isHidden = false
        textEnterView.isHidden = true
        colourView.isHidden = true

     }
    
    @IBAction func colourButton(_ sender: UIButton) {
        
        effectsView.isHidden = true
        textEnterView.isHidden = true
        colourView.isHidden = false
    }
    @IBAction func textButton(_ sender: UIButton) {
        
        textEnterView.isHidden = false
        colourView.isHidden = true
        effectsView.isHidden = true
//        insideButton.isHidden = false
//        bottomButton.isHidden = false
//        topButton.isHidden = false
    }
    
    
    @IBAction func stickersButton(_ sender: UIButton) {
        effectsView.isHidden = true
        textEnterView.isHidden = true
        colourView.isHidden = true

    }
    
//    @IBAction func addImage(_ sender: UIBarButtonItem) {
//
//        self.setupImagePicker()
//    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {

        imageView.image = originalImage
        effectsView.isHidden = true
//        viewText.isHidden = true
//        textView.isHidden = true
        topTextView.isHidden = true
      //  topTextView.text = "ENTER TEXT HERE!"
      //  bottomTextView.text = "ENTER TEXT HERE!"
        bottomTextView.isHidden = true
        textEnterView.isHidden = true
        self.mainView.backgroundColor = .clear
        
//        insideButton.isHidden = true
//        bottomButton.isHidden = true
//        topButton.isHidden = true
    }
    
    @IBAction func topBtn(_ sender: UIButton) {

        topTextView.isHidden = false
        bottomTextView.isHidden = true
       
        topTextView.text = "ENTER TEXT HERE!"

        topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        topTextView.sizeThatFits(CGSize(width: imageView.image!.size.width, height: 63))
        print("width: \(imageView.image!.size.width)") //Printing ImageView size only not image size
        topTextView.textContainer.maximumNumberOfLines = 3
        topTextView.textContainer.lineBreakMode = .byWordWrapping
        
    }
    
    @IBAction func surroundedButton(_ sender: UIButton) {
        
        topTextView.isHidden = false
        bottomTextView.isHidden = false

        topTextView.text = "ENTER TEXT HERE!"
        bottomTextView.text = "ENTER TEXT HERE!"

        topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        topTextView.sizeThatFits(CGSize(width: imageView.image!.size.width, height: 63))
        print("width: \(imageView.image!.size.width)") //Printing ImageView size only not image size
        topTextView.textContainer.maximumNumberOfLines = 3
        topTextView.textContainer.lineBreakMode = .byWordWrapping
        
        
        bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        bottomTextView.sizeThatFits(CGSize(width: imageView.image!.size.width * imageView.image!.scale, height: 63))
        print("width: \(imageView.image!.size.width)")
        bottomTextView.textContainer.maximumNumberOfLines = 3
        bottomTextView.textContainer.lineBreakMode = .byWordWrapping
    }
    
    
    @IBAction func bottomBtn(_ sender: UIButton) {
        bottomTextView.isHidden = false
        topTextView.isHidden = true
        
        bottomTextView.text = "ENTER TEXT HERE!"

        bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        bottomTextView.sizeThatFits(CGSize(width: imageView.image!.size.width * imageView.image!.scale, height: 63))
        print("width: \(imageView.image!.size.width)")
        bottomTextView.textContainer.maximumNumberOfLines = 3
        bottomTextView.textContainer.lineBreakMode = .byWordWrapping
    }
    
    @IBAction func sepiaEffectButton(_ sender: UIButton) {
        
        imageView.image = selectedImage
        guard let image = imageView.image else{
            return
        }
        imageView.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CISepiaTone", filterEffectValue: 0.90, filterEffectValueName: kCIInputIntensityKey))
    }
    
    @IBAction func blurEffectButton(_ sender: UIButton) {
        imageView.image = selectedImage

        guard let image = imageView.image else{
            return
        }
        imageView.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CIGaussianBlur", filterEffectValue: 8.0, filterEffectValueName: kCIInputRadiusKey))
    }
    
    @IBAction func noirEffectButton(_ sender: UIButton) {
        imageView.image = selectedImage

        guard let image = imageView.image else{
            return
        }
        imageView.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CIPhotoEffectNoir", filterEffectValue: nil, filterEffectValueName: ""))
    }
    
    @IBAction func photoprocessEffectButton(_ sender: UIButton) {
        imageView.image = selectedImage

        guard let image = imageView.image else{
            return
        }
        imageView.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CIPhotoEffectProcess", filterEffectValue: nil, filterEffectValueName: ""))
    }
    
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func saveImage(_ sender: UIButton) {
        
//        let imageData = imageView.image!.pngData()
//        let compressedImage = UIImage(data: imageData!)
//        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
       
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawHierarchy(in: view.frame, afterScreenUpdates: true)
        var img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if(mainView != nil){
            var rect = (mainView?.frame)!
            rect.size.height *= img!.scale
            rect.size.width *= img!.scale
            let imageRef = img?.cgImage!.cropping(to: rect)
            img = UIImage(cgImage: imageRef!, scale: img!.scale, orientation: img!.imageOrientation)
        }
        
        let alert = UIAlertController(title: "Saved", message: "Your image has been saved to Photos", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return UIImageWriteToSavedPhotosAlbum(img!, nil, nil, nil)
        
        
    }
    

}

extension editorVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func setupImagePicker(){
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate = self
            imagePicker.isEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        selectedImage = image
       
        print("width\(image.size.width)")
        print("height\(image.size.height)")
        
        topTextView.text = "ENTER TEXT HERE!"
        bottomTextView.text = "ENTER TEXT HERE!"
        
        self.mainView.backgroundColor = .clear
        
        self.dismiss(animated: true, completion: nil)
        
    }
}

