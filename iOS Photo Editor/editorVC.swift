//
//  editorVC.swift
//  iOS Photo Editor
//
//  Created by Vaibhav Mehta on 12/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit
import CoreImage
import EFColorPicker

class editorVC: UIViewController, UITextViewDelegate, EFColorSelectionViewControllerDelegate {

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
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    //@IBOutlet weak var navDoneBar: UINavigationBar!
    @IBOutlet var imageView: UIImageView!

    private var originalImage: UIImage?
    var selectedImage: UIImage?
    
    let imagePicker = UIImagePickerController()
    //var loc = CGPoint(x: 0, y: 0)
    
    let xPos: CGFloat = 10
    var yPos: CGFloat = 10
    
    var imageOneView: UIImageView?
    var imageTwoView: UIImageView?
    var imageThreeView: UIImageView?
    var imageFourView: UIImageView?
    var imageFiveView: UIImageView?
    var imageSixView: UIImageView?
    var imageSevenView: UIImageView?
    var imageEightView: UIImageView?
    var imageNineView: UIImageView?
    var imageTenView: UIImageView?
    var imageElevenView: UIImageView?
    var imageTwelveView: UIImageView?
    var imageThirteenView: UIImageView?
    var imageFourteenView: UIImageView?
    var imageFifteenView: UIImageView?
    var imageSixteenView: UIImageView?
    var imageSeventeenView: UIImageView?
    var imageEighteenView: UIImageView?
    var imageNineteenView: UIImageView?
    var imageTwenteyView: UIImageView?
    var imageTwentyoneView: UIImageView?
    var imageTwentytwoView: UIImageView?
    var imageTwentythreeView: UIImageView?
    var imageTwentyfourView: UIImageView?
    var imageTwentyfiveView: UIImageView?
    
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()
    var button5 = UIButton()
    var button6 = UIButton()
    var button7 = UIButton()
    var button8 = UIButton()
    var button9 = UIButton()
    var button10 = UIButton()
    var button11 = UIButton()
    var button12 = UIButton()
    var button13 = UIButton()
    var button14 = UIButton()
    var button15 = UIButton()
    var button16 = UIButton()
    var button17 = UIButton()
    var button18 = UIButton()
    var button19 = UIButton()
    var button20 = UIButton()
    var button21 = UIButton()
    var button22 = UIButton()
    var button23 = UIButton()
    var button24 = UIButton()

    @IBOutlet weak var twelveFont: UIButton!
    @IBOutlet weak var fourteenFont: UIButton!
    @IBOutlet weak var sixteenFont: UIButton!
    @IBOutlet weak var eighteenFont: UIButton!
    @IBOutlet weak var twentyFont: UIButton!
    @IBOutlet weak var twentytwoFont: UIButton!
    @IBOutlet weak var twentyfourFont: UIButton!
    @IBOutlet weak var twentysixFont: UIButton!
    @IBOutlet weak var twentyeightFont: UIButton!
    @IBOutlet weak var thirtyFont: UIButton!
    @IBOutlet weak var thirtytwoFont: UIButton!
    @IBOutlet weak var thirtyfourFont: UIButton!
    @IBOutlet weak var thirtysixFont: UIButton!
    @IBOutlet weak var thirtyeightFont: UIButton!
    @IBOutlet weak var fourtyFont: UIButton!
    
    @IBOutlet weak var styleOne: UIButton!
    @IBOutlet weak var styleTwo: UIButton!
    @IBOutlet weak var styleThree: UIButton!
    @IBOutlet weak var styleFour: UIButton!
    @IBOutlet weak var styleFive: UIButton!
    @IBOutlet weak var styleSix: UIButton!
    @IBOutlet weak var styleSeven: UIButton!
    @IBOutlet weak var styleEight: UIButton!
    @IBOutlet weak var styleNine: UIButton!
    @IBOutlet weak var styleTen: UIButton!
    @IBOutlet weak var styleEleven: UIButton!
    @IBOutlet weak var styleTwelve: UIButton!
    @IBOutlet weak var styleThirteen: UIButton!
    @IBOutlet weak var styleFourteen: UIButton!
    @IBOutlet weak var styleFifteen: UIButton!
    @IBOutlet weak var styleSixteen: UIButton!
    @IBOutlet weak var styleSeventeen: UIButton!
    @IBOutlet weak var styleEighteen: UIButton!
    @IBOutlet weak var styleNineteen: UIButton!
    @IBOutlet weak var styleTwenty: UIButton!
    @IBOutlet weak var styleTwentyone: UIButton!
    
    @IBOutlet weak var topLayoutBtnL: UIButton!
    @IBOutlet weak var customLayoutBtnL: UIButton!
    @IBOutlet weak var bottomLayoutBtnL: UIButton!
    @IBOutlet weak var surroundLayoutBtnL: UIButton!
    
    var RedColour: Float = 0
    var GreenColour: Float = 0
    var BlueColour: Float = 0

    @IBOutlet weak var topTextView: UITextView!
    @IBOutlet weak var bottomTextView: UITextView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainOptionsView: UIView!
    @IBOutlet weak var effectsView: UIView!
    @IBOutlet weak var colourView: UIView!
    @IBOutlet weak var layoutView: UIView!
    @IBOutlet weak var textAttView: UIView!
    @IBOutlet weak var colourTextView: UIView!
    @IBOutlet weak var styleTextView: UIView!
    @IBOutlet weak var sizeTextView: UIView!
    @IBOutlet weak var textVF: UITextView!
    @IBOutlet weak var stickerView: UIView!
    @IBOutlet weak var stickerScrollView: UIScrollView!
    
    @IBOutlet weak var mainOptSV: UIScrollView!
    @IBOutlet weak var layoutSV: UIScrollView!
    @IBOutlet weak var textAttSV: UIScrollView!
    @IBOutlet weak var effectsSV: UIScrollView!
    @IBOutlet weak var colourSV: UIScrollView!
    @IBOutlet weak var sizeTextSV: UIScrollView!
    @IBOutlet weak var styleTextSV: UIScrollView!
    @IBOutlet weak var colourTextSV: UIScrollView!
    
    @IBOutlet weak var scrollViewMain: UIScrollView!
    
    @IBOutlet weak var closeAttrBtnL: UIButton!
    @IBOutlet weak var closeTextAttr: UIButton!
    
    @IBOutlet weak var libColourBackground: UIButton!
    @IBOutlet weak var libColourFont: UIButton!
    
    var libb1: Bool = Bool()
    var libb2: Bool = Bool()
    
    // VIEW

    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.isHidden = false
        
        topTextView.isHidden = true
        bottomTextView.isHidden = true

        scrollViewMain.isScrollEnabled = false
        
        mainOptSV.isHidden = false
        effectsSV.isHidden = true
        colourSV.isHidden = true
        layoutSV.isHidden = true
        textAttSV.isHidden = true
        textVF.isHidden = true
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        stickerScrollView.isHidden = true

        closeAttrBtnL.isHidden = true
        topTextView.delegate = self
        bottomTextView.delegate = self
       
        textVF.delegate = self
        
        topTextView.text = "Enter Text Here!"
        topTextView.textColor = UIColor.lightGray
        
        bottomTextView.text = "Enter Text Here!"
        bottomTextView.textColor = UIColor.lightGray
       
        textVF.text = "Enter Text Here!"
        textVF.textColor = UIColor.lightGray
        
//        stickerImg.image =
        
        originalImage = imageView.image
        
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        
        numberToolbar.barStyle = .default
        numberToolbar.items = [UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneWithNumberPad))]
        numberToolbar.sizeToFit()
        topTextView.inputAccessoryView = numberToolbar
        bottomTextView.inputAccessoryView = numberToolbar
        textVF.inputAccessoryView = numberToolbar
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doSomething))
        view.addGestureRecognizer(tapGesture)
        
        
        twelveFont.layer.cornerRadius = 0.5 * twelveFont.bounds.size.width
        fourteenFont.layer.cornerRadius = 0.5 * fourteenFont.bounds.size.width
        sixteenFont.layer.cornerRadius = 0.5 * sixteenFont.bounds.size.width
        eighteenFont.layer.cornerRadius = 0.5 * eighteenFont.bounds.size.width
        twentyFont.layer.cornerRadius = 0.5 * twentyFont.bounds.size.width
        twentytwoFont.layer.cornerRadius = 0.5 * twentytwoFont.bounds.size.width
        twentyfourFont.layer.cornerRadius = 0.5 * twentyfourFont.bounds.size.width
        twentysixFont.layer.cornerRadius = 0.5 * twentysixFont.bounds.size.width
        twentyeightFont.layer.cornerRadius = 0.5 * twentyeightFont.bounds.size.width
        thirtyFont.layer.cornerRadius = 0.5 * thirtyFont.bounds.size.width
        thirtytwoFont.layer.cornerRadius = 0.5 * thirtytwoFont.bounds.size.width
        thirtyfourFont.layer.cornerRadius = 0.5 * twelveFont.bounds.size.width
        thirtysixFont.layer.cornerRadius = 0.5 * thirtysixFont.bounds.size.width
        thirtyeightFont.layer.cornerRadius = 0.5 * thirtyeightFont.bounds.size.width
        fourtyFont.layer.cornerRadius = 0.5 * fourtyFont.bounds.size.width

        styleOne.layer.cornerRadius = 0.5 * styleOne.bounds.size.width
        styleTwo.layer.cornerRadius = 0.5 * styleTwo.bounds.size.width
        styleThree.layer.cornerRadius = 0.5 * styleThree.bounds.size.width
        styleFour.layer.cornerRadius = 0.5 * styleFour.bounds.size.width
        styleFive.layer.cornerRadius = 0.5 * styleFive.bounds.size.width
        styleSix.layer.cornerRadius = 0.5 * styleSix.bounds.size.width
        styleSeven.layer.cornerRadius = 0.5 * styleSeven.bounds.size.width
        styleEight.layer.cornerRadius = 0.5 * styleEight.bounds.size.width
        styleNine.layer.cornerRadius = 0.5 * styleNine.bounds.size.width
        styleTen.layer.cornerRadius = 0.5 * styleTen.bounds.size.width
        styleEleven.layer.cornerRadius = 0.5 * styleEleven.bounds.size.width
        styleTwelve.layer.cornerRadius = 0.5 * styleTwelve.bounds.size.width
        styleThirteen.layer.cornerRadius = 0.5 * styleThirteen.bounds.size.width
        styleFourteen.layer.cornerRadius = 0.5 * styleFourteen.bounds.size.width
        styleFifteen.layer.cornerRadius = 0.5 * styleFifteen.bounds.size.width
        styleSixteen.layer.cornerRadius = 0.5 * styleSixteen.bounds.size.width
        styleSeventeen.layer.cornerRadius = 0.5 * styleSeventeen.bounds.size.width
        styleEighteen.layer.cornerRadius = 0.5 * styleEighteen.bounds.size.width
        styleNineteen.layer.cornerRadius = 0.5 * styleNineteen.bounds.size.width
        styleTwenty.layer.cornerRadius = 0.5 * styleTwenty.bounds.size.width
        styleTwentyone.layer.cornerRadius = 0.5 * styleTwentyone.bounds.size.width
    }
    
    @objc func doSomething() {
            print("do something")
        button1.removeFromSuperview()
        button2.removeFromSuperview()
        button3.removeFromSuperview()
        button4.removeFromSuperview()
        button5.removeFromSuperview()
        button6.removeFromSuperview()
        button7.removeFromSuperview()
        button8.removeFromSuperview()
        button9.removeFromSuperview()
        button10.removeFromSuperview()
        button11.removeFromSuperview()
        button12.removeFromSuperview()
        button13.removeFromSuperview()
        button14.removeFromSuperview()
        button15.removeFromSuperview()
        button16.removeFromSuperview()
        button17.removeFromSuperview()
        button18.removeFromSuperview()
        button19.removeFromSuperview()
        button20.removeFromSuperview()
        button21.removeFromSuperview()
        button22.removeFromSuperview()
        button23.removeFromSuperview()
        button24.removeFromSuperview()
        }
    
    // KEYBOARD AND TEXT LAYOUT
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        effectsSV.isHidden = true
        colourSV.isHidden = true
        layoutSV.isHidden = true

        if textView == topTextView{
          //  navDoneBar.isHidden = false
            
            if topTextView.textColor == UIColor.lightGray
            {
                topTextView.text = ""
                topTextView.textColor = UIColor.black
            }
        }
        if textView == bottomTextView{
            movetextview(textView: textView, movedistance: -250, up: true)
            //navDoneBar.isHidden = false
            if bottomTextView.textColor == UIColor.lightGray{

                        bottomTextView.text = ""
                        bottomTextView.textColor = UIColor.black
            }
            
        }
        
        if textView == textVF{
            if textVF.textColor == UIColor.lightGray{
                
                textVF.text = ""
                textVF.textColor = UIColor.black
            }
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        
        mainOptionsView.isHidden = false
        if textView == topTextView{
            
        if topTextView.text == "" {
    
            topTextView.text = "Enter Text Here!!"
            topTextView.textColor = UIColor.lightGray
            }
        }
        
        if textView == bottomTextView{
     
            movetextview(textView: textView, movedistance: -250, up: false)
            
        if bottomTextView.text == "" {

            bottomTextView.text = "Enter Text Here!!"
            bottomTextView.textColor = UIColor.lightGray
            }
        }
        
        if textView == textVF{

            if textVF.text == "" {
                
                textVF.text = "Enter Text Here!!"
                textVF.textColor = UIColor.lightGray
            }
        }
        
        self.mainView .sendSubviewToBack(textView)
    }

    func textFieldShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func movetextview(textView: UITextView, movedistance: Int, up: Bool) {

        let moveduration = 0.3
        let movement: CGFloat = CGFloat(up ? movedistance : -movedistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveduration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }

    @objc func cancelNumberPad() {
        
        topTextView.text = "Enter Text Here!"
        topTextView.textColor = UIColor.lightGray
        
        bottomTextView.text = "Enter Text Here!"
        bottomTextView.textColor = UIColor.lightGray
        
        textVF.text = "Enter Text Here!"
        textVF.textColor = UIColor.lightGray
        
        view.endEditing(true)
    }
    
    @objc func doneWithNumberPad() {
        view.endEditing(true)
    }
    
    // ADD IMAGE
    
    @IBAction func openPhotos(_ sender: UIButton) {
        self.setupImagePicker()
        imageView.isHidden = false
    }

    @objc func openGallery(tapGesture: UITapGestureRecognizer){
        
    }
    
    // FILTER
    
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

    // BACKGROUND COLOURS
    
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
    
    @IBAction func greenColour(_ sender: Any) {
        self.mainView.backgroundColor = .green
    }
    
    @IBAction func yellowColour(_ sender: Any) {
        self.mainView.backgroundColor = .yellow
    }
    
    @IBAction func cyanColour(_ sender: Any) {
        self.mainView.backgroundColor = .cyan
    }
    
    @IBAction func brownColour(_ sender: Any) {
        self.mainView.backgroundColor = .brown
    }
    
    @IBAction func extraColour(_ sender: Any) {
        
    let colorSelectionController = EFColorSelectionViewController()
        let navCtrl = UINavigationController(rootViewController: colorSelectionController)
        navCtrl.navigationBar.backgroundColor = UIColor.white
        navCtrl.navigationBar.isTranslucent = false
        navCtrl.modalPresentationStyle = UIModalPresentationStyle.popover
        navCtrl.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        navCtrl.popoverPresentationController?.sourceView = sender as! UIView
        navCtrl.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        navCtrl.preferredContentSize = colorSelectionController.view.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize
        )
        
        colorSelectionController.delegate = self as! EFColorSelectionViewControllerDelegate
        colorSelectionController.color = self.view.backgroundColor ?? UIColor.white
        colorSelectionController.setMode(mode: EFColorSelectionMode.all)
        
        if UIUserInterfaceSizeClass.compact == self.traitCollection.horizontalSizeClass {
            let doneBtn: UIBarButtonItem = UIBarButtonItem(
                title: NSLocalizedString("Done", comment: ""),
                style: UIBarButtonItem.Style.done,
                target: self,
                action: #selector(ef_dismissViewController(sender:))
            )
            colorSelectionController.navigationItem.rightBarButtonItem = doneBtn
        }
        self.present(navCtrl, animated: true, completion: nil)
    }
   
    
    @IBAction func closeColour(_ sender: UIButton) {
        colourSV.isHidden = true
    }
    
    // MENU BUTTONS
    
    @IBAction func filtersButton(_ sender: UIButton) {
        effectsSV.isHidden = false
        colourSV.isHidden = true
        layoutSV.isHidden = true
        textAttSV.isHidden = true
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        stickerScrollView.isHidden = true
     }
    
    @IBAction func colourButton(_ sender: UIButton) {
        effectsSV.isHidden = true
        colourSV.isHidden = false
        layoutSV.isHidden = true
        textAttSV.isHidden = true
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        stickerScrollView.isHidden = true
    }
    
    @IBAction func layoutButton(_ sender: UIButton) {
        effectsSV.isHidden = true
        colourSV.isHidden = true
        layoutSV.isHidden = false
        textAttSV.isHidden = true
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        stickerScrollView.isHidden = true
    }
    
    @IBAction func textButton(_ sender: UIButton) {
        effectsSV.isHidden = true
        colourSV.isHidden = true
        layoutSV.isHidden = true
        textAttSV.isHidden = false
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        stickerScrollView.isHidden = true
        
        scrollViewMain.isScrollEnabled = true

//        yPos += 60
//        textVF.frame = CGRect(x: xPos, y: yPos, width: imageView.contentClippingRect.width-20, height: 50)
//        textVF.textAlignment = .center
//        textVF.backgroundColor = .white
//        self.mainView.addSubview(textVF)
    }
    
    @IBAction func stickersButton(_ sender: UIButton) {
        effectsSV.isHidden = true
        colourSV.isHidden = true
        layoutSV.isHidden = true
        textAttSV.isHidden = true
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        stickerScrollView.isHidden = false

    }
    
    // CANCEL BUTTON
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {

        self.dismiss(animated: true, completion: nil)
    }
    
    // LAYOUTS
    
    @IBAction func topLayoutBtn(_ sender: UIButton) {
       
        imageView.frame = CGRect(x: 0, y: 0  , width: mainView.frame.width, height: mainView.frame.height)
        

        imageView.frame = CGRect(x: 0, y: 100  , width: mainView.frame.width, height: imageView.frame.height - 100)

        topTextView.isHidden = false
        bottomTextView.isHidden = true
        topTextView.frame.size.width = imageView.contentClippingRect.width
        self.mainView .bringSubviewToFront(topTextView)

        if imageView.image == originalImage{
        
        topTextView.center.x = mainView.center.x
        topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        topTextView.textContainer.lineBreakMode = .byWordWrapping
        }
    
        else{

            topTextView.center.x = mainView.center.x
            topTextView.textContainer.maximumNumberOfLines = 4
            topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
            topTextView.textContainer.lineBreakMode = .byWordWrapping
    }
}
    
    @IBAction func bottomLayoutBtn(_ sender: UIButton) {
       
        imageView.frame = CGRect(x: 0, y: 0  , width: mainView.frame.width, height: mainView.frame.height)
        
        imageView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: imageView.frame.height - bottomTextView.frame.height)
        topTextView.isHidden = true
        bottomTextView.isHidden = false
        bottomTextView.frame.size.width = imageView.contentClippingRect.width
        self.mainView .bringSubviewToFront(bottomTextView)

        if imageView.image == originalImage{
            
        bottomTextView.center.x = mainView.center.x
        bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        bottomTextView.textContainer.lineBreakMode = .byWordWrapping
        
        }
        else{
            
            bottomTextView.center.x = mainView.center.x
            bottomTextView.textContainer.maximumNumberOfLines = 4
            bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
            bottomTextView.textContainer.lineBreakMode = .byWordWrapping
            
        }
        
    }
    
    @IBAction func surroundLayoutBtn(_ sender: UIButton) {
    
        imageView.frame = CGRect(x: 0, y: 0  , width: mainView.frame.width, height: mainView.frame.height)
        
        imageView.frame = CGRect(x: 0, y: 100, width: mainView.frame.width, height: imageView.frame.height - (bottomTextView.frame.height + 100))
        topTextView.isHidden = false
        bottomTextView.isHidden = false
        topTextView.frame.size.width = imageView.contentClippingRect.width
        bottomTextView.frame.size.width = imageView.contentClippingRect.width
        self.mainView .bringSubviewToFront(topTextView)
        self.mainView .bringSubviewToFront(bottomTextView)
        
        if imageView.image == originalImage{
        
        topTextView.center.x = mainView.center.x
        topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        topTextView.textContainer.lineBreakMode = .byWordWrapping
            
        bottomTextView.center.x = mainView.center.x
        bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        bottomTextView.textContainer.lineBreakMode = .byWordWrapping
        
    }
        else{

            topTextView.center.x = mainView.center.x
            topTextView.textContainer.maximumNumberOfLines = 4
            topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
            topTextView.textContainer.lineBreakMode = .byWordWrapping
            
            bottomTextView.center.x = mainView.center.x
            bottomTextView.textContainer.maximumNumberOfLines = 4
            bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
            bottomTextView.textContainer.lineBreakMode = .byWordWrapping
        }
        
    }
    
    @IBAction func customLayoutBtn(_ sender: UIButton) {
        
        textVF.isHidden = false
        textVF.frame.size.width = imageView.contentClippingRect.width
        textVF.center.x = mainView.center.x
        textVF.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textVF.textContainer.lineBreakMode = .byWordWrapping
    }
    
    @IBAction func closeLayout(_ sender: UIButton) {
            layoutSV.isHidden = true
    }
    
    
    // TEXT LAYOUTS
    
//    @IBAction func topBtn(_ sender: UIButton) {
//
//        topTextView.isHidden = false
//        bottomTextView.isHidden = true
//
//        imageView.frame = CGRect(x: 0, y: 70, width: 375, height: 370)
//
//        topTextView.frame.size.width = imageView.contentClippingRect.width
//        topTextView.center.x = mainView.center.x
//        topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
//        topTextView.textContainer.maximumNumberOfLines = 3
//        topTextView.textContainer.lineBreakMode = .byWordWrapping
//
//    }
//
//    @IBAction func surroundedButton(_ sender: UIButton) {
//
//        topTextView.isHidden = false
//        bottomTextView.isHidden = false
//
//        imageView.frame = CGRect(x: 0, y: 70, width: 375, height: 292)
//
//        topTextView.frame.size.width = imageView.contentClippingRect.width
//        topTextView.center.x = mainView.center.x
//        topTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
//        topTextView.textContainer.maximumNumberOfLines = 3
//        topTextView.textContainer.lineBreakMode = .byWordWrapping
//
//        bottomTextView.frame.size.width = imageView.contentClippingRect.width
//        bottomTextView.center.x = mainView.center.x
//        bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
//        bottomTextView.textContainer.maximumNumberOfLines = 3
//        bottomTextView.textContainer.lineBreakMode = .byWordWrapping
//    }
//
//    @IBAction func bottomBtn(_ sender: UIButton) {
//        bottomTextView.isHidden = false
//        topTextView.isHidden = true
//
//        imageView.frame = CGRect(x: 0, y: 0, width: 375, height: 362)
//
//        bottomTextView.frame.size.width = imageView.contentClippingRect.width
//        bottomTextView.center.x = mainView.center.x
//        bottomTextView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
//        bottomTextView.textContainer.maximumNumberOfLines = 3
//        bottomTextView.textContainer.lineBreakMode = .byWordWrapping
//    }
    
    
    // TEXT ATTRIBUTES
    
    @IBAction func fontColour(_ sender: UIButton) {
        colourTextSV.isHidden = false
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        closeAttrBtnL.isHidden = false
        closeTextAttr.isHidden = true
    }
    
    @IBAction func fontStyle(_ sender: UIButton) {
        colourTextSV.isHidden = true
        styleTextSV.isHidden = false
        sizeTextSV.isHidden = true
        closeAttrBtnL.isHidden = false
        closeTextAttr.isHidden = true
    }
   
    @IBAction func fontSize(_ sender: UIButton) {
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = false
        closeAttrBtnL.isHidden = false
        closeTextAttr.isHidden = true
    }
    @IBAction func closeAtt(_ sender: UIButton) {
        textAttSV.isHidden = true
        colourTextSV.isHidden = true
        styleTextSV.isHidden = true
        sizeTextSV.isHidden = true
        scrollViewMain.isScrollEnabled = false
        scrollViewMain.setContentOffset(.zero, animated: true)
    }
    
    // EFFECTS
    
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
    
    
    @IBAction func closeEffectView(_ sender: Any) {
        effectsSV.isHidden = true
    }
    
    // FONT COLOURS
    
    @IBAction func blackFont(_ sender: UIButton) {
        topTextView.textColor = .black
        bottomTextView.textColor = .black
        textVF.textColor = .black
    }
    
    @IBAction func whiteFont(_ sender: UIButton) {
        topTextView.textColor = .white
        bottomTextView.textColor = .white
        textVF.textColor = .white
    }
    
    @IBAction func redFont(_ sender: UIButton) {
        topTextView.textColor = .red
        bottomTextView.textColor = .red
        textVF.textColor = .red
    }
    
    @IBAction func grayFont(_ sender: UIButton) {
        topTextView.textColor = .gray
        bottomTextView.textColor = .gray
        textVF.textColor = .gray
    }
    
    @IBAction func blueFont(_ sender: UIButton) {
        topTextView.textColor = .blue
        bottomTextView.textColor = .blue
        textVF.textColor = .blue
    }
    
    @IBAction func greenFont(_ sender: Any) {
        topTextView.textColor = .green
        bottomTextView.textColor = .green
        textVF.textColor = .green
    }
    
    @IBAction func yellowFont(_ sender: Any) {
        topTextView.textColor = .yellow
        bottomTextView.textColor = .yellow
        textVF.textColor = .yellow
    }
    
    @IBAction func cyanFont(_ sender: Any) {
        topTextView.textColor = .cyan
        bottomTextView.textColor = .cyan
        textVF.textColor = .cyan
    }
    
    @IBAction func brownFont(_ sender: Any) {
        topTextView.textColor = .brown
        bottomTextView.textColor = .brown
        textVF.textColor = .brown
    }
    
    @IBAction func orangeFont(_ sender: Any) {
        topTextView.textColor = .orange
        bottomTextView.textColor = .orange
        textVF.textColor = .orange
    }
    
    @IBAction func pinkFont(_ sender: Any) {
        topTextView.textColor = .magenta
        bottomTextView.textColor = .magenta
        textVF.textColor = .magenta
    }
    
    @IBAction func darkFont(_ sender: Any) {
        topTextView.textColor = .purple
        bottomTextView.textColor = .purple
        textVF.textColor = .purple
    }
    
    @IBAction func darkgreenFont(_ sender: Any) {
        topTextView.textColor = .green
        bottomTextView.textColor = .green
        textVF.textColor = .green
    }
    
    @IBAction func extraFont(_ sender: Any) {
        
        let colorSelectionController = EFColorSelectionViewController()
        let navCtrl = UINavigationController(rootViewController: colorSelectionController)
        navCtrl.navigationBar.backgroundColor = UIColor.white
        navCtrl.navigationBar.isTranslucent = false
        navCtrl.modalPresentationStyle = UIModalPresentationStyle.popover
        navCtrl.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        navCtrl.popoverPresentationController?.sourceView = sender as! UIView
        navCtrl.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
        navCtrl.preferredContentSize = colorSelectionController.view.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize
        )
        
        colorSelectionController.delegate = self as! EFColorSelectionViewControllerDelegate
        colorSelectionController.color = self.view.backgroundColor ?? UIColor.white
        colorSelectionController.setMode(mode: EFColorSelectionMode.all)
        
        if UIUserInterfaceSizeClass.compact == self.traitCollection.horizontalSizeClass {
            let doneBtn: UIBarButtonItem = UIBarButtonItem(
                title: NSLocalizedString("Done", comment: ""),
                style: UIBarButtonItem.Style.done,
                target: self,
                action: #selector(ef_dismissViewController(sender:))
            )
            colorSelectionController.navigationItem.rightBarButtonItem = doneBtn
        }
        self.present(navCtrl, animated: true, completion: nil)

        
    }
    
    func colorViewController(_ colorViewCntroller: EFColorSelectionViewController, didChangeColor color: UIColor) {
     
        mainView.backgroundColor = color

//        topTextView.textColor = color
//        bottomTextView.textColor = color
//        textVF.textColor = color
        
        func libback(){
            
            mainView.backgroundColor = color
        }
        func libfont(){
            
            topTextView.textColor = color
            bottomTextView.textColor = color
            textVF.textColor = color
        }
        print("New color: " + color.debugDescription)
        
        }
    
    @objc func ef_dismissViewController(sender: UIBarButtonItem) {
        self.dismiss(animated: true) {
            [weak self] in
            if let _ = self {
                // TODO: You can do something here when EFColorPicker close.
                print("EFColorPicker closed.")
            }
        }
    }
    
    
    // FONT STYLE
    
    @IBAction func fontStyleOne(_ sender: UIButton) {
        topTextView.font = UIFont(name: "Carrington", size: 20)
        bottomTextView.font = UIFont(name: "Carrington", size: 20)
        textVF.font = UIFont(name: "Carrington", size: 20)
        
    }
    
    @IBAction func fontStyleTwo(_ sender: UIButton) {
        
        topTextView.font = UIFont(name: "Caviar_Dreams_Bold", size: 18)
        bottomTextView.font = UIFont(name: "Caviar_Dreams_Bold", size: 18)
        textVF.font = UIFont(name: "Caviar_Dreams_Bold", size: 18)
    }
    
    @IBAction func fontStyleThree(_ sender: UIButton) {
        topTextView.font = UIFont(name: "CaviarDreams_BoldItalic", size: 18)
            bottomTextView.font = UIFont(name: "CaviarDreams_BoldItalic", size: 18)
        textVF.font = UIFont(name: "CaviarDreams_BoldItalic", size: 18)
    }
    
    @IBAction func fontStyleFour(_ sender: UIButton) {
        topTextView.font = UIFont(name: "CaviarDreams_Italic", size: 18)
        bottomTextView.font = UIFont(name: "CaviarDreams_Italic", size: 18)
        textVF.font = UIFont(name: "CaviarDreams_Italic", size: 18)
    }
    
    @IBAction func fontStyleFive(_ sender: UIButton) {
        topTextView.font = UIFont(name: "CaviarDreams", size: 18)
        bottomTextView.font = UIFont(name: "CaviarDreams", size: 18)
        textVF.font = UIFont(name: "CaviarDreams", size: 18)
    }
    
    @IBAction func fontStyleSix(_ sender: UIButton) {
        topTextView.font = UIFont(name: "Kingthings_Calligraphica_2", size: 18)
        bottomTextView.font = UIFont(name: "Kingthings_Calligraphica_2", size: 18)
        textVF.font = UIFont(name: "Kingthings_Calligraphica_2", size: 18)
    }
    
    @IBAction func fontStyleSeven(_ sender: UIButton) {
        topTextView.font = UIFont(name: "Kingthings_Calligraphica_Italic", size: 18)
        bottomTextView.font = UIFont(name: "Kingthings_Calligraphica_Italic", size: 18)
        textVF.font = UIFont(name: "Kingthings_Calligraphica_Italic", size: 18)
    }
    
    @IBAction func fontStyleEight(_ sender: UIButton) {
        topTextView.font = UIFont(name: "Kingthings_Calligraphica_Light", size: 18)
        bottomTextView.font = UIFont(name: "Kingthings_Calligraphica_Light", size: 18)
        textVF.font = UIFont(name: "Kingthings_Calligraphica_Light", size: 18)
    }
    
    @IBAction func fontStyleNine(_ sender: UIButton) {
        topTextView.font = UIFont(name: "Kingthings_Foundation", size: 18)
        bottomTextView.font = UIFont(name: "Kingthings_Foundation", size: 18)
        textVF.font = UIFont(name: "Kingthings_Foundation", size: 18)
    }
    
    @IBAction func fontStyleTen(_ sender: UIButton) {
        topTextView.font = UIFont(name: "PlayfairDisplay-Black", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplay-Black", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplay-Black", size: 18)
    }
    
    @IBAction func fontStyleEleven(_ sender: UIButton) {
        topTextView.font = UIFont(name: "PlayfairDisplay-BlackItalic", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplay-BlackItalic", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplay-BlackItalic", size: 18)
    }
    
    @IBAction func fontStyleTwelve(_ sender: UIButton) {
        topTextView.font = UIFont(name: "PlayfairDisplay-Bold", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplay-Bold", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplay-Bold", size: 18)
    }
    
    @IBAction func fontStyleThirteen(_ sender: Any) {
        topTextView.font = UIFont(name: "PlayfairDisplaySC-Black", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-Black", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplaySC-Black", size: 18)
    }
    
    @IBAction func fontStyleFourteen(_ sender: Any) {
        topTextView.font = UIFont(name: "PlayfairDisplaySC-BlackItalic", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-BlackItalic", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplaySC-BlackItalic", size: 18)
    }
    
    @IBAction func fontStyleFifteen(_ sender: Any) {
        topTextView.font = UIFont(name: "PlayfairDisplaySC-BlackItalic", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-BlackItalic", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplaySC-BlackItalic", size: 18)
    }
    
    @IBAction func fontStyleSixteen(_ sender: Any) {
        topTextView.font = UIFont(name: "PlayfairDisplaySC-Bold", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-Bold", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplaySC-Bold", size: 18)
    }
    
    @IBAction func fontStyleSeventeen(_ sender: Any) {
        topTextView.font = UIFont(name: "PlayfairDisplaySC-BoldItalic", size: 18)
        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-BoldItalic", size: 18)
        textVF.font = UIFont(name: "PlayfairDisplaySC-BoldItalic", size: 18)
    }
    
    @IBAction func fontStyleEighteen(_ sender: Any) {
//        topTextView.font = UIFont(name: "PlayfairDisplaySC-Italic", size: 18)
//        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-Italic", size: 18)
//        textVF.font = UIFont(name: "PlayfairDisplaySC-Italic", size: 18)
    }
    
    @IBAction func fontStyleNineteen(_ sender: Any) {
//        topTextView.font = UIFont(name: "PlayfairDisplaySC-Regular", size: 18)
//        bottomTextView.font = UIFont(name: "PlayfairDisplaySC-Regular", size: 18)
//        textVF.font = UIFont(name: "PlayfairDisplaySC-Regular", size: 18)
    }
    
    @IBAction func fontStyleTwenty(_ sender: Any) {
//        topTextView.font = UIFont(name: "RechtmanPlain", size: 18)
//        bottomTextView.font = UIFont(name: "RechtmanPlain", size: 18)
//        textVF.font = UIFont(name: "RechtmanPlain", size: 18)
    }
    
    @IBAction func fontStyleTwentyOne(_ sender: Any) {
//        topTextView.font = UIFont(name: "Redressed", size: 18)
//        bottomTextView.font = UIFont(name: "Redressed", size: 18)
//        textVF.font = UIFont(name: "Redressed", size: 18)
    }
    
    
    
    // FONT SIZE
    
    @IBAction func fontTwelve(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(12)
        bottomTextView.font = bottomTextView.font!.withSize(12)
        textVF.font = textVF.font!.withSize(12)
    }
    
    @IBAction func fontFourteen(_ sender: UIButton) {
       topTextView.font = topTextView.font!.withSize(14)
        bottomTextView.font = bottomTextView.font!.withSize(14)
        textVF.font = textVF.font!.withSize(14)
    }
    @IBAction func fontSixteen(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(16)
        bottomTextView.font = bottomTextView.font!.withSize(16)
        textVF.font = textVF.font!.withSize(16)
    }
    
    @IBAction func fontEighteen(_ sender: UIButton) {
        topTextView.font = topTextView.font!.withSize(18)
        bottomTextView.font = bottomTextView.font!.withSize(18)
        textVF.font = textVF.font!.withSize(18)
    }
    
    @IBAction func fontTwenty(_ sender: UIButton) {
        topTextView.font = topTextView.font!.withSize(20)
        bottomTextView.font = bottomTextView.font!.withSize(20)
        textVF.font = textVF.font!.withSize(20)
    }
    @IBAction func fontTwentyTwo(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(22)
        bottomTextView.font = bottomTextView.font!.withSize(22)
        textVF.font = textVF.font!.withSize(22)
    }
    
    @IBAction func fontTwentyFour(_ sender: UIButton) {
        topTextView.font = topTextView.font!.withSize(24)
        bottomTextView.font = bottomTextView.font!.withSize(24)
        textVF.font = textVF.font!.withSize(24)
    }
    
    @IBAction func fontTwentySix(_ sender: UIButton) {
        topTextView.font = topTextView.font!.withSize(26)
        bottomTextView.font = bottomTextView.font!.withSize(26)
        textVF.font = textVF.font!.withSize(26)
    }
    @IBAction func fontTwentyEight(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(28)
        bottomTextView.font = bottomTextView.font!.withSize(28)
        textVF.font = textVF.font!.withSize(28)
    }
    @IBAction func fontThirty(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(30)
        bottomTextView.font = bottomTextView.font!.withSize(30)
        textVF.font = textVF.font!.withSize(30)
    }
    @IBAction func fontThirtyTwo(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(32)
        bottomTextView.font = bottomTextView.font!.withSize(32)
        textVF.font = textVF.font!.withSize(32)
    }
    @IBAction func fontThirtyFour(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(34)
        bottomTextView.font = bottomTextView.font!.withSize(34)
        textVF.font = textVF.font!.withSize(34)
    }
    @IBAction func fontThirtySix(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(36)
        bottomTextView.font = bottomTextView.font!.withSize(36)
        textVF.font = textVF.font!.withSize(36)
    }
    @IBAction func fontThirtyEight(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(38)
        bottomTextView.font = bottomTextView.font!.withSize(38)
        textVF.font = textVF.font!.withSize(38)
    }
    @IBAction func fontFourty(_ sender: Any) {
        topTextView.font = topTextView.font!.withSize(40)
        bottomTextView.font = bottomTextView.font!.withSize(40)
        textVF.font = textVF.font!.withSize(40)
    }
    
  
    @IBAction func closeAttrBtn(_ sender: Any) {
        
        sizeTextSV.isHidden = true
        styleTextSV.isHidden = true
        colourTextSV.isHidden = true
        closeAttrBtnL.isHidden = true
        closeTextAttr.isHidden = false
        textAttSV.isHidden = true
        scrollViewMain.isScrollEnabled = false
        
        
        scrollViewMain.setContentOffset(.zero, animated: true)

    }
    
    // STICKERS
    
    @IBAction func closeSticker(_ sender: UIButton) {
        
        stickerScrollView.isHidden = true
    }
    @IBAction func stickerOne(_ sender: UIButton) {
        
        let imageOneName = "akshay_baap_ko_mt_sikha.png"
        let imageOne = UIImage(named: imageOneName)
        imageOneView = UIImageView(image: imageOne!)
        
        imageOneView!.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        imageOneView!.addGestureRecognizer(tapG)
        imageOneView!.isUserInteractionEnabled = true

        self.mainView.addSubview(imageOneView!)
    
    }
    
    @objc func tapGesture(gesture: UIGestureRecognizer) {
     
        button1.frame = CGRect(x: (imageOneView?.frame.origin.x)!, y: (imageOneView?.frame.origin.y)!, width: 20, height: 20)
        button1.setImage(UIImage(named: "close.png"), for: .normal)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.mainView.addSubview(button1)

    }
    @objc func buttonAction(sender: UIButton!) {
        
        imageOneView!.removeFromSuperview()
        button1.removeFromSuperview()
    }
    
    @IBAction func stickerTwo(_ sender: UIButton) {
        
        let imageTwoName = "akshay_chhotu.png"
        let imageTwo = UIImage(named: imageTwoName)
        imageTwoView = UIImageView(image: imageTwo!)
        
        imageTwoView!.frame = CGRect(x: 10, y: 20, width: 150, height: 150)
      
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture2))
        imageTwoView!.addGestureRecognizer(tapG)
        imageTwoView!.isUserInteractionEnabled = true

        self.mainView.addSubview(imageTwoView!)
    }
    @objc func tapGesture2(gesture: UIGestureRecognizer) {
        
        button2.frame = CGRect(x: (imageTwoView?.frame.origin.x)!, y: (imageTwoView?.frame.origin.y)!, width: 20, height: 20)
        button2.setImage(UIImage(named: "close.png"), for: .normal)
        button2.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        self.mainView.addSubview(button2)
        
    }
    @objc func buttonAction2(sender: UIButton!) {
        
        imageTwoView!.removeFromSuperview()
        button2.removeFromSuperview()
    }
    
    @IBAction func stickerThree(_ sender: UIButton) {
        
        let imageThreeName = "amareesh_thapad.png"
        let imageThree = UIImage(named: imageThreeName)
        imageThreeView = UIImageView(image: imageThree!)
        
        imageThreeView!.frame = CGRect(x: 10, y: 30, width: 150, height: 150)
        self.mainView.addSubview(imageThreeView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture3))
        imageThreeView!.addGestureRecognizer(tapG)
        imageThreeView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture3(gesture: UIGestureRecognizer) {
        
        button3.frame = CGRect(x: (imageThreeView?.frame.origin.x)!, y: (imageThreeView?.frame.origin.y)!, width: 20, height: 20)
        button3.setImage(UIImage(named: "close.png"), for: .normal)
        button3.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)
        self.mainView.addSubview(button3)
        
    }
    @objc func buttonAction3(sender: UIButton!) {
        
        imageThreeView!.removeFromSuperview()
        button3.removeFromSuperview()
    }
    
    
    @IBAction func stickerFour(_ sender: UIButton) {
        let imageFourName = "amitabh_laugh.png"
        let imageFour = UIImage(named: imageFourName)
        imageFourView = UIImageView(image: imageFour!)
        
        imageFourView!.frame = CGRect(x: 10, y: 40, width: 150, height: 150)
        self.mainView.addSubview(imageFourView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture4))
        imageFourView!.addGestureRecognizer(tapG)
        imageFourView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture4(gesture: UIGestureRecognizer) {
        
        button4.frame = CGRect(x: (imageFourView?.frame.origin.x)!, y: (imageFourView?.frame.origin.y)!, width: 20, height: 20)
        button4.setImage(UIImage(named: "close.png"), for: .normal)
        button4.addTarget(self, action: #selector(buttonAction4), for: .touchUpInside)
        self.mainView.addSubview(button4)
        
    }
    @objc func buttonAction4(sender: UIButton!) {
        
        imageFourView!.removeFromSuperview()
        button4.removeFromSuperview()
    }
    @IBAction func stickerFive(_ sender: Any) {
        let imageFiveName = "amitabh_sorry.png"
        let imageFive = UIImage(named: imageFiveName)
        imageFiveView = UIImageView(image: imageFive!)
        
        imageFiveView!.frame = CGRect(x: 10, y: 50, width: 150, height: 150)
        self.mainView.addSubview(imageFiveView!)

        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture5))
        imageFiveView!.addGestureRecognizer(tapG)
        imageFiveView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture5(gesture: UIGestureRecognizer) {
        
        button5.frame = CGRect(x: (imageFiveView?.frame.origin.x)!, y: (imageFiveView?.frame.origin.y)!, width: 20, height: 20)
        button5.setImage(UIImage(named: "close.png"), for: .normal)
        button5.addTarget(self, action: #selector(buttonAction5), for: .touchUpInside)
        self.mainView.addSubview(button5)
        
    }
    @objc func buttonAction5(sender: UIButton!) {
        
        imageFiveView!.removeFromSuperview()
        button5.removeFromSuperview()
    }
    @IBAction func stickerSix(_ sender: Any) {
        let imageSixName = "amitabh_thinking.png"
        let imageSix = UIImage(named: imageSixName)
        imageSixView = UIImageView(image: imageSix!)
        
        imageSixView!.frame = CGRect(x: 10, y: 60, width: 150, height: 150)
        self.mainView.addSubview(imageSixView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture6))
        imageSixView!.addGestureRecognizer(tapG)
        imageSixView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture6(gesture: UIGestureRecognizer) {
        
        button6.frame = CGRect(x: (imageSixView?.frame.origin.x)!, y: (imageSixView?.frame.origin.y)!, width: 20, height: 20)
        button6.setImage(UIImage(named: "close.png"), for: .normal)
        button6.addTarget(self, action: #selector(buttonAction6), for: .touchUpInside)
        self.mainView.addSubview(button6)
        
    }
    @objc func buttonAction6(sender: UIButton!) {
        
        imageSixView!.removeFromSuperview()
        button6.removeFromSuperview()
    }
    @IBAction func stickerSeven(_ sender: Any) {
        let imageSevenName = "anushka_excited.png"
        let imageSeven = UIImage(named: imageSevenName)
        imageSevenView = UIImageView(image: imageSeven!)
        
        imageSevenView!.frame = CGRect(x: 10, y: 70, width: 150, height: 150)
        self.mainView.addSubview(imageSevenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture7))
        imageSevenView!.addGestureRecognizer(tapG)
        imageSevenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture7(gesture: UIGestureRecognizer) {
        
        button7.frame = CGRect(x: (imageSevenView?.frame.origin.x)!, y: (imageSevenView?.frame.origin.y)!, width: 20, height: 20)
        button7.setImage(UIImage(named: "close.png"), for: .normal)
        button7.addTarget(self, action: #selector(buttonAction7), for: .touchUpInside)
        self.mainView.addSubview(button7)
        
    }
    @objc func buttonAction7(sender: UIButton!) {
        
        imageSevenView!.removeFromSuperview()
        button7.removeFromSuperview()
    }
    @IBAction func stickerEight(_ sender: Any) {
        let imageEightName = "anushka_thinking.png"
        let imageEight = UIImage(named: imageEightName)
        imageEightView = UIImageView(image: imageEight!)
        
        imageEightView!.frame = CGRect(x: 10, y: 80, width: 150, height: 150)
        self.mainView.addSubview(imageEightView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture8))
        imageEightView!.addGestureRecognizer(tapG)
        imageEightView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture8(gesture: UIGestureRecognizer) {
        
        button8.frame = CGRect(x: (imageEightView?.frame.origin.x)!, y: (imageEightView?.frame.origin.y)!, width: 20, height: 20)
        button8.setImage(UIImage(named: "close.png"), for: .normal)
        button8.addTarget(self, action: #selector(buttonAction8), for: .touchUpInside)
        self.mainView.addSubview(button8)
        
    }
    @objc func buttonAction8(sender: UIButton!) {
        
        imageEightView!.removeFromSuperview()
        button8.removeFromSuperview()
    }
    @IBAction func stickerNine(_ sender: Any) {
        let imageNineName = "bb_chai.png"
        let imageNine = UIImage(named: imageNineName)
        imageNineView = UIImageView(image: imageNine!)
        
        imageNineView!.frame = CGRect(x: 10, y: 90, width: 150, height: 150)
        self.mainView.addSubview(imageNineView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture9))
        imageNineView!.addGestureRecognizer(tapG)
        imageNineView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture9(gesture: UIGestureRecognizer) {
        
        button9.frame = CGRect(x: (imageNineView?.frame.origin.x)!, y: (imageNineView?.frame.origin.y)!, width: 20, height: 20)
        button9.setImage(UIImage(named: "close.png"), for: .normal)
        button9.addTarget(self, action: #selector(buttonAction9), for: .touchUpInside)
        self.mainView.addSubview(button9)
        
    }
    @objc func buttonAction9(sender: UIButton!) {
        
        imageNineView!.removeFromSuperview()
        button9.removeFromSuperview()
    }
    @IBAction func stickerTen(_ sender: Any) {
        let imageTenName = "bb_plaas.png"
        let imageTen = UIImage(named: imageTenName)
        imageTenView = UIImageView(image: imageTen!)
        
        imageTenView!.frame = CGRect(x: 10, y: 100, width: 150, height: 150)
        self.mainView.addSubview(imageTenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        imageTenView!.addGestureRecognizer(tapG)
        imageTenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture10(gesture: UIGestureRecognizer) {
        
        button10.frame = CGRect(x: (imageTenView?.frame.origin.x)!, y: (imageTenView?.frame.origin.y)!, width: 20, height: 20)
        button10.setImage(UIImage(named: "close.png"), for: .normal)
        button10.addTarget(self, action: #selector(buttonAction10), for: .touchUpInside)
        self.mainView.addSubview(button10)
        
    }
    @objc func buttonAction10(sender: UIButton!) {
        
        imageTenView!.removeFromSuperview()
        button10.removeFromSuperview()
    }
    @IBAction func stickerEleven(_ sender: Any) {
        let imageElevenName = "bhai_bhai_bhai.png"
        let imageEleven = UIImage(named: imageElevenName)
        imageElevenView = UIImageView(image: imageEleven!)
        
        imageElevenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageElevenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture11))
        imageElevenView!.addGestureRecognizer(tapG)
        imageElevenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture11(gesture: UIGestureRecognizer) {
        
        button11.frame = CGRect(x: (imageElevenView?.frame.origin.x)!, y: (imageElevenView?.frame.origin.y)!, width: 20, height: 20)
        button11.setImage(UIImage(named: "close.png"), for: .normal)
        button11.addTarget(self, action: #selector(buttonAction11), for: .touchUpInside)
        self.mainView.addSubview(button11)
        
    }
    @objc func buttonAction11(sender: UIButton!) {
        
        imageElevenView!.removeFromSuperview()
        button11.removeFromSuperview()
    }
    @IBAction func stickerTwelve(_ sender: Any) {
        let imageTwelveName = "bhai_bhai_bhai_pointing.png"
        let imageTwelve = UIImage(named: imageTwelveName)
        imageTwelveView = UIImageView(image: imageTwelve!)
        
        imageTwelveView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageTwelveView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture12))
        imageTwelveView!.addGestureRecognizer(tapG)
        imageTwelveView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture12(gesture: UIGestureRecognizer) {
        
        button12.frame = CGRect(x: (imageTwelveView?.frame.origin.x)!, y: (imageTwelveView?.frame.origin.y)!, width: 20, height: 20)
        button12.setImage(UIImage(named: "close.png"), for: .normal)
        button12.addTarget(self, action: #selector(buttonAction12), for: .touchUpInside)
        self.mainView.addSubview(button12)
        
    }
    @objc func buttonAction12(sender: UIButton!) {
        
        imageTwelveView!.removeFromSuperview()
        button12.removeFromSuperview()
    }
    @IBAction func stickerThirteen(_ sender: Any) {
        let imageThirteenName = "chhoti_bahu.png"
        let imageThirteen = UIImage(named: imageThirteenName)
        imageThirteenView = UIImageView(image: imageThirteen!)
        
        imageThirteenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageThirteenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture13))
        imageThirteenView!.addGestureRecognizer(tapG)
        imageThirteenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture13(gesture: UIGestureRecognizer) {
        
        button13.frame = CGRect(x: (imageThirteenView?.frame.origin.x)!, y: (imageThirteenView?.frame.origin.y)!, width: 20, height: 20)
        button13.setImage(UIImage(named: "close.png"), for: .normal)
        button13.addTarget(self, action: #selector(buttonAction13), for: .touchUpInside)
        self.mainView.addSubview(button13)
        
    }
    @objc func buttonAction13(sender: UIButton!) {
        
        imageThirteenView!.removeFromSuperview()
        button13.removeFromSuperview()
    }
    @IBAction func stickerFourteen(_ sender: Any) {
        let imageFourteenName = "deepak_crying.png"
        let imageFourteen = UIImage(named: imageFourteenName)
        imageFourteenView = UIImageView(image: imageFourteen!)
        
        imageFourteenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageFourteenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture14))
        imageFourteenView!.addGestureRecognizer(tapG)
        imageFourteenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture14(gesture: UIGestureRecognizer) {
        
        button14.frame = CGRect(x: (imageFourteenView?.frame.origin.x)!, y: (imageFourteenView?.frame.origin.y)!, width: 20, height: 20)
        button14.setImage(UIImage(named: "close.png"), for: .normal)
        button14.addTarget(self, action: #selector(buttonAction14), for: .touchUpInside)
        self.mainView.addSubview(button14)
        
    }
    @objc func buttonAction14(sender: UIButton!) {
        
        imageFourteenView!.removeFromSuperview()
        button14.removeFromSuperview()
    }
    @IBAction func stickerFifteen(_ sender: Any) {
        let imageFifteenName = "dhamaal.png"
        let imageFifteen = UIImage(named: imageFifteenName)
        imageFifteenView = UIImageView(image: imageFifteen!)
        
        imageFifteenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageFifteenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture15))
        imageFifteenView!.addGestureRecognizer(tapG)
        imageFifteenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture15(gesture: UIGestureRecognizer) {
        
        button15.frame = CGRect(x: (imageFifteenView?.frame.origin.x)!, y: (imageFifteenView?.frame.origin.y)!, width: 20, height: 20)
        button15.setImage(UIImage(named: "close.png"), for: .normal)
        button15.addTarget(self, action: #selector(buttonAction15), for: .touchUpInside)
        self.mainView.addSubview(button15)
        
    }
    @objc func buttonAction15(sender: UIButton!) {
        
        imageFifteenView!.removeFromSuperview()
        button15.removeFromSuperview()
    }
    @IBAction func stickerSixteen(_ sender: Any) {
        let imageSixteenName = "irrfan_aao_kabhi_haveli_pe.png"
        let imageSixteen = UIImage(named: imageSixteenName)
        imageSixteenView = UIImageView(image: imageSixteen!)
        
        imageSixteenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageSixteenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture16))
        imageSixteenView!.addGestureRecognizer(tapG)
        imageSixteenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture16(gesture: UIGestureRecognizer) {
        
        button16.frame = CGRect(x: (imageSixteenView?.frame.origin.x)!, y: (imageSixteenView?.frame.origin.y)!, width: 20, height: 20)
        button16.setImage(UIImage(named: "close.png"), for: .normal)
        button16.addTarget(self, action: #selector(buttonAction16), for: .touchUpInside)
        self.mainView.addSubview(button16)
        
    }
    @objc func buttonAction16(sender: UIButton!) {
        
        imageSixteenView!.removeFromSuperview()
        button16.removeFromSuperview()
    }
    @IBAction func stickerSeventeen(_ sender: Any) {
        let imageSeventeenName = "irrfan_aunty.png"
        let imageSeventeen = UIImage(named: imageSeventeenName)
        imageSeventeenView = UIImageView(image: imageSeventeen!)
        
        imageSeventeenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageSeventeenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture17))
        imageSeventeenView!.addGestureRecognizer(tapG)
        imageSeventeenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture17(gesture: UIGestureRecognizer) {
        
        button17.frame = CGRect(x: (imageSeventeenView?.frame.origin.x)!, y: (imageSeventeenView?.frame.origin.y)!, width: 20, height: 20)
        button17.setImage(UIImage(named: "close.png"), for: .normal)
        button17.addTarget(self, action: #selector(buttonAction17), for: .touchUpInside)
        self.mainView.addSubview(button17)
        
    }
    @objc func buttonAction17(sender: UIButton!) {
        
        imageSeventeenView!.removeFromSuperview()
        button17.removeFromSuperview()
    }
    @IBAction func stickerEighteen(_ sender: Any) {
        let imageEighteenName = "irrfan_drake_no.png"
        let imageEighteen = UIImage(named: imageEighteenName)
        imageEighteenView = UIImageView(image: imageEighteen!)
        
        imageEighteenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageEighteenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture18))
        imageEighteenView!.addGestureRecognizer(tapG)
        imageEighteenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture18(gesture: UIGestureRecognizer) {
        
        button18.frame = CGRect(x: (imageEighteenView?.frame.origin.x)!, y: (imageEighteenView?.frame.origin.y)!, width: 20, height: 20)
        button18.setImage(UIImage(named: "close.png"), for: .normal)
        button18.addTarget(self, action: #selector(buttonAction18), for: .touchUpInside)
        self.mainView.addSubview(button18)
        
    }
    @objc func buttonAction18(sender: UIButton!) {
        
        imageEighteenView!.removeFromSuperview()
        button18.removeFromSuperview()
    }
    @IBAction func stickerNineteen(_ sender: Any) {
        let imageNineteenName = "irrfan_drake_yes.png"
        let imageNineteen = UIImage(named: imageNineteenName)
        imageNineteenView = UIImageView(image: imageNineteen!)
        
        imageNineteenView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageNineteenView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture19))
        imageNineteenView!.addGestureRecognizer(tapG)
        imageNineteenView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture19(gesture: UIGestureRecognizer) {
        
        button19.frame = CGRect(x: (imageNineteenView?.frame.origin.x)!, y: (imageNineteenView?.frame.origin.y)!, width: 20, height: 20)
        button19.setImage(UIImage(named: "close.png"), for: .normal)
        button19.addTarget(self, action: #selector(buttonAction19), for: .touchUpInside)
        self.mainView.addSubview(button19)
        
    }
    @objc func buttonAction19(sender: UIButton!) {
        
        imageNineteenView!.removeFromSuperview()
        button19.removeFromSuperview()
    }
    @IBAction func stickerTwentey(_ sender: Any) {
        let imageTwenteyName = "irrfan_if_you_meme.png"
        let imageTwentey = UIImage(named: imageTwenteyName)
        imageTwenteyView = UIImageView(image: imageTwentey!)
        
        imageTwenteyView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageTwenteyView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture20))
        imageTwenteyView!.addGestureRecognizer(tapG)
        imageTwenteyView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture20(gesture: UIGestureRecognizer) {
        
        button20.frame = CGRect(x: (imageTwenteyView?.frame.origin.x)!, y: (imageTwenteyView?.frame.origin.y)!, width: 20, height: 20)
        button20.setImage(UIImage(named: "close.png"), for: .normal)
        button20.addTarget(self, action: #selector(buttonAction20), for: .touchUpInside)
        self.mainView.addSubview(button20)
        
    }
    @objc func buttonAction20(sender: UIButton!) {
        
        imageTwenteyView!.removeFromSuperview()
        button20.removeFromSuperview()
    }
    @IBAction func stickerTwentyone(_ sender: Any) {
        let imageTwentyoneName = "irrfan_thinking.png"
        let imageTwentyone = UIImage(named: imageTwentyoneName)
        imageTwentyoneView = UIImageView(image: imageTwentyone!)
        
        imageTwentyoneView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageTwentyoneView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture21))
        imageTwentyoneView!.addGestureRecognizer(tapG)
        imageTwentyoneView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture21(gesture: UIGestureRecognizer) {
        
        button21.frame = CGRect(x: (imageTwentyoneView?.frame.origin.x)!, y: (imageTwentyoneView?.frame.origin.y)!, width: 20, height: 20)
        button21.setImage(UIImage(named: "close.png"), for: .normal)
        button21.addTarget(self, action: #selector(buttonAction21), for: .touchUpInside)
        self.mainView.addSubview(button21)
        
    }
    @objc func buttonAction21(sender: UIButton!) {
        
        imageTwentyoneView!.removeFromSuperview()
        button21.removeFromSuperview()
    }
    @IBAction func stickerTwentytwo(_ sender: Any) {
        let imageTwentytwoName = "not_yaar.png"
        let imageTwentytwo = UIImage(named: imageTwentytwoName)
        imageTwentytwoView = UIImageView(image: imageTwentytwo!)
        
        imageTwentytwoView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageTwentytwoView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture22))
        imageTwentytwoView!.addGestureRecognizer(tapG)
        imageTwentytwoView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture22(gesture: UIGestureRecognizer) {
        
        button22.frame = CGRect(x: (imageTwentytwoView?.frame.origin.x)!, y: (imageTwentytwoView?.frame.origin.y)!, width: 20, height: 20)
        button22.setImage(UIImage(named: "close.png"), for: .normal)
        button22.addTarget(self, action: #selector(buttonAction22), for: .touchUpInside)
        self.mainView.addSubview(button22)
        
    }
    @objc func buttonAction22(sender: UIButton!) {
        
        imageTwentytwoView!.removeFromSuperview()
        button22.removeFromSuperview()
    }
    @IBAction func stickerTwentythree(_ sender: Any) {
        let imageTwentythreeName = "pooja_selfie"
        let imageTwentythree = UIImage(named: imageTwentythreeName)
        imageTwentythreeView = UIImageView(image: imageTwentythree!)
        
        imageTwentythreeView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageTwentythreeView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture23))
        imageTwentythreeView!.addGestureRecognizer(tapG)
        imageTwentythreeView!.isUserInteractionEnabled = true

    }
    @objc func tapGesture23(gesture: UIGestureRecognizer) {
        
        button23.frame = CGRect(x: (imageTwentythreeView?.frame.origin.x)!, y: (imageTwentythreeView?.frame.origin.y)!, width: 20, height: 20)
        button23.setImage(UIImage(named: "close.png"), for: .normal)
        button23.addTarget(self, action: #selector(buttonAction23), for: .touchUpInside)
        self.mainView.addSubview(button23)
        
    }
    @objc func buttonAction23(sender: UIButton!) {
        
        imageTwentythreeView!.removeFromSuperview()
        button23.removeFromSuperview()
    }
    @IBAction func stickerTwentyfour(_ sender: Any) {
        let imageTwentyfourName = "pooja_victory"
        let imageTwentyfour = UIImage(named: imageTwentyfourName)
        imageTwentyfourView = UIImageView(image: imageTwentyfour!)
        
        imageTwentyfourView!.frame = CGRect(x: 100, y: 200, width: 150, height: 150)
        self.mainView.addSubview(imageTwentyfourView!)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGesture24))
        imageTwentyfourView!.addGestureRecognizer(tapG)
        imageTwentyfourView!.isUserInteractionEnabled = true
    }
        @objc func tapGesture24(gesture: UIGestureRecognizer) {
            
            button24.frame = CGRect(x: (imageTwentyfourView?.frame.origin.x)!, y: (imageTwentyfourView?.frame.origin.y)!, width: 20, height: 20)
            button24.setImage(UIImage(named: "close.png"), for: .normal)
            button24.addTarget(self, action: #selector(buttonAction24), for: .touchUpInside)
            self.mainView.addSubview(button24)
            
        }
        @objc func buttonAction24(sender: UIButton!) {
            
            imageTwentyfourView!.removeFromSuperview()
            button24.removeFromSuperview()
        }
    
    //STICKER MOVEMENT
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches){
            
            let loc1 = touch.location(in: self.mainView)
            
            if imageOneView?.frame.contains(loc1) ?? false{
                
                imageOneView!.center = loc1
            }
            let loc2 = touch.location(in: self.mainView)

            if imageTwoView?.frame.contains(loc2) ?? false{
                
                imageTwoView!.center = loc2
            }
            let loc3 = touch.location(in: self.mainView)

            if imageThreeView?.frame.contains(loc3) ?? false{
                
                imageThreeView!.center = loc3
            }
            let loc4 = touch.location(in: self.mainView)
            
            if imageFourView?.frame.contains(loc4) ?? false{
                
                imageFourView!.center = loc4
            }
            let loc5 = touch.location(in: self.mainView)
            
            if imageFiveView?.frame.contains(loc5) ?? false{
                
                imageFiveView!.center = loc5
            }
            let loc6 = touch.location(in: self.mainView)
            
            if imageSixView?.frame.contains(loc6) ?? false{
                
                imageSixView!.center = loc6
            }
            let loc7 = touch.location(in: self.mainView)
            
            if imageSevenView?.frame.contains(loc7) ?? false{
                
                imageSevenView!.center = loc7
            }
            let loc8 = touch.location(in: self.mainView)
            
            if imageEightView?.frame.contains(loc8) ?? false{
                
                imageEightView!.center = loc8
            }
            let loc9 = touch.location(in: self.mainView)
            
            if imageNineView?.frame.contains(loc9) ?? false{
                
                imageNineView!.center = loc9
            }
            let loc10 = touch.location(in: self.mainView)
            
            if imageTenView?.frame.contains(loc10) ?? false{
                
                imageTenView!.center = loc10
            }
            let loc11 = touch.location(in: self.mainView)
            
            if imageElevenView?.frame.contains(loc11) ?? false{
                
                imageElevenView!.center = loc11
            }
            let loc12 = touch.location(in: self.mainView)
            
            if imageTwelveView?.frame.contains(loc12) ?? false{
                
                imageTwelveView!.center = loc1
            }
            let loc13 = touch.location(in: self.mainView)
            
            if imageThirteenView?.frame.contains(loc13) ?? false{
                
                imageThirteenView!.center = loc13
            }
            let loc14 = touch.location(in: self.mainView)
            
            if imageFourteenView?.frame.contains(loc14) ?? false{
                
                imageFourteenView!.center = loc14
            }
            let loc15 = touch.location(in: self.mainView)
            
            if imageFifteenView?.frame.contains(loc15) ?? false{
                
                imageFifteenView!.center = loc15
            }
            let loc16 = touch.location(in: self.mainView)
            
            if imageSixteenView?.frame.contains(loc16) ?? false{
                
                imageSixteenView!.center = loc16
            }
            let loc17 = touch.location(in: self.mainView)
            
            if imageSeventeenView?.frame.contains(loc17) ?? false{
                
                imageSeventeenView!.center = loc17
            }
            let loc18 = touch.location(in: self.mainView)
            
            if imageEighteenView?.frame.contains(loc18) ?? false{
                
                imageEighteenView!.center = loc18
            }
            let loc19 = touch.location(in: self.mainView)
            
            if imageNineteenView?.frame.contains(loc19) ?? false{
                
                imageNineteenView!.center = loc19
            }
            let loc20 = touch.location(in: self.mainView)
            
            if imageTwenteyView?.frame.contains(loc20) ?? false{
                
                imageTwenteyView!.center = loc20
            }
            let loc21 = touch.location(in: self.mainView)
            
            if imageTwentyoneView?.frame.contains(loc21) ?? false{
                
                imageTwentyoneView!.center = loc21
            }
            let loc22 = touch.location(in: self.mainView)
            
            if imageTwentytwoView?.frame.contains(loc22) ?? false{
                
                imageTwentytwoView!.center = loc22
            }
            let loc23 = touch.location(in: self.mainView)
            
            if imageTwentythreeView?.frame.contains(loc23) ?? false{
                
                imageTwentythreeView!.center = loc23
            }
            
            let loc24 = touch.location(in: self.mainView)
            
            if imageTwentyfourView?.frame.contains(loc24) ?? false{
                
                imageTwentyfourView!.center = loc24
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches){
            
            let loc = touch.location(in: self.mainView)
            
            if imageOneView?.frame.contains(loc) ?? false{
                
                imageOneView!.center = loc
            }
            
            else if imageTwoView?.frame.contains(loc) ?? false{
                
                imageTwoView!.center = loc
            }
            
            else if imageThreeView?.frame.contains(loc) ?? false{
                
                imageThreeView!.center = loc
            }
            
           else if imageFourView?.frame.contains(loc) ?? false{
                
                imageFourView!.center = loc
            }
            
            else if imageFiveView?.frame.contains(loc) ?? false{
                
                imageFiveView!.center = loc
            }
            
            else if imageSixView?.frame.contains(loc) ?? false{
                
                imageSixView!.center = loc
            }
            
            else if imageSevenView?.frame.contains(loc) ?? false{
                
                imageSevenView!.center = loc
            }

            else if imageEightView?.frame.contains(loc) ?? false{
            
                imageEightView!.center = loc
            }
            
            else if imageNineView?.frame.contains(loc) ?? false{
                
                imageNineView!.center = loc
            }
            
            else if imageTenView?.frame.contains(loc) ?? false{
                
                imageTenView!.center = loc
            }
            
            else if imageElevenView?.frame.contains(loc) ?? false{
            
                imageElevenView!.center = loc
            }
            
            else if imageTwelveView?.frame.contains(loc) ?? false{
            
                imageTwelveView!.center = loc
            }
            
            else if imageThirteenView?.frame.contains(loc) ?? false{
                
                imageThirteenView!.center = loc
            }
            
            else if imageFourteenView?.frame.contains(loc) ?? false{
                
                imageFourteenView!.center = loc
            }
            
            else if imageFifteenView?.frame.contains(loc) ?? false{
                
                imageFifteenView!.center = loc
            }
            
            else if imageSixteenView?.frame.contains(loc) ?? false{
                
                imageSixteenView!.center = loc
            }
            
            else if imageSeventeenView?.frame.contains(loc) ?? false{
                
                imageSeventeenView!.center = loc
            }
            
            else if imageEighteenView?.frame.contains(loc) ?? false{
                
                imageEighteenView!.center = loc
            }
            
            else if imageNineteenView?.frame.contains(loc) ?? false{
                
                imageNineteenView!.center = loc
            }
            
            else if imageTwenteyView?.frame.contains(loc) ?? false{
                
                imageTwenteyView!.center = loc
            }
            
            else if imageTwentyoneView?.frame.contains(loc) ?? false{
                
                imageTwentyoneView!.center = loc
            }
            
            else if imageTwentytwoView?.frame.contains(loc) ?? false{
                
                imageTwentytwoView!.center = loc
            }
            
            else if imageTwentythreeView?.frame.contains(loc) ?? false{
                
                imageTwentythreeView!.center = loc
            }
            
            else if imageTwentyfourView?.frame.contains(loc) ?? false{
                
                imageTwentyfourView!.center = loc
            }
        }

    }
    
    // SAVE IMAGE
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
      
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
        let okAction = UIAlertAction(title: "OK", style: .default){ (action) -> Void in
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "home")
            self.present(HomeVC!, animated: true, completion: nil)
        }
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
        imageView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        selectedImage = image
       
        print("width\(image.size.width)")
        print("height\(image.size.height)")

        self.imageView.contentClippingRect
        self.mainView.backgroundColor = .clear
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        print("AspectFit::\(CGRect(x: x, y: y, width: size.width, height: size.height))")
        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}
