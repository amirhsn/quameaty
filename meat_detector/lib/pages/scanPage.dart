import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:meat_detector/components/constant.dart';
import 'package:meat_detector/pages/resultPage.dart';
import 'package:tflite/tflite.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({ key }) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  double scale = 1.0;
  var _imageSaved;
  var confidence;
  int index;

  final picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if(cameras.length > 0){
        selectedCameraIndex = 0;
        initCamera(cameras[selectedCameraIndex],).then((_){});
      }else{
        print('error');
      }
    }).catchError((e){
      print(e.code);
    });
    loadModel().then((value){
      setState(() {});
    });
  }

  Future initCamera(CameraDescription cameraDescription) async{
    if (cameraController != null){
      await cameraController.dispose();
    }
    cameraController = CameraController(cameraDescription, ResolutionPreset.veryHigh);
    cameraController.addListener(() {if (mounted){
      setState(() {});
    }});
    if (cameraController.value.hasError){
      print('Camera Error');
    }
    try{
      await cameraController.initialize();
    }catch(e){
      print('Camera error'+e);
    }
    if(mounted){
      setState(() {});
    }
  }  

  loadModel() async{
    await Tflite.loadModel(
      model: 'assets/modelDaging.tflite',
      labels: 'assets/labels.txt',
    );
  }

  classifyImage(File image) async{
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    confidence = output[0]['confidence'];
    index = output[0]['index'];

    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => ResultPage(
        imgPath: _imageSaved,
        confidence: confidence,
        index: index,
      ))
    );
  }

  pickGallery() async{
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image==null) return null;
    setState(() {
      _imageSaved = File(image.path);      
    });
    classifyImage(_imageSaved);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: cameraPreview(),
            ),
            Image.asset(
              'assets/images/mask.png',
              fit: BoxFit.cover,
            ),
            GestureDetector(
              onScaleUpdate: (one){
                scale = one.scale;
                setState(() {});
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: cameraBackWidget(context),
                margin: EdgeInsets.only(
                  top: screenHeight(context)*(1/15),
                  left: screenWidth(context)*(1/20)
                ),
              ),
            ),  
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight(context)*(1/8),
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: warna1(),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [BoxShadow(
                    blurRadius: 9,
                    color: Colors.grey,
                    spreadRadius: 2,
                    offset: Offset(0,0)
                  )]
                ),
                margin: EdgeInsets.only(
                  left: screenWidth(context)*(1/20),
                  right: screenWidth(context)*(1/20),
                  bottom: screenHeight(context)*(1/20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cameraGalleryWidget(context),
                    cameraControlWidget(context),
                    cameraFlashWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//====================================================================//
//====================================================================//
  Widget cameraPreview(){
    if(cameraController == null || !cameraController.value.isInitialized){
      return Text(
        'Loading',
        style: TextStyle(
          color: warna1()
        ),
      );
    }
    return Transform.scale(
      scale: scale,
      child: AspectRatio(
        aspectRatio: cameraController.value.aspectRatio,
        child: CameraPreview(cameraController),
      ),
    );
  }

  Widget cameraGalleryWidget(context){
    return GestureDetector(
      onTap: pickGallery,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: warna1(),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0,0)
          )]
        ),
        height: screenWidth(context)*(1/9),
        width: screenWidth(context)*(1/9),
        child: Icon(
          CupertinoIcons.photo_fill_on_rectangle_fill,
          color: Colors.red,
          size: screenHeight(context)*(1/25),
        ),
      ),
    );
  }

  Widget cameraBackWidget(context){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: warna1(),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0,0)
          )]
        ),
        height: screenWidth(context)*(1/9),
        width: screenWidth(context)*(1/9),
        child: Icon(
          Icons.arrow_back_outlined,
          color: Colors.red,
          size: screenHeight(context)*(1/25),
        ),
      ),
    );
  }

  Widget cameraFlashWidget(){
    if(cameras == null || cameras.isEmpty){
      return Spacer();
    }
    return GestureDetector(
      onTap: (){
        onSwitchFlash();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: warna1(),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0,0)
          )]
        ),
        height: screenWidth(context)*(1/9),
        width: screenWidth(context)*(1/9),
        child: Icon(
          getFlashIcon(cameraController.value.flashMode),
          color: Colors.red,
          size: screenHeight(context)*(1/25),
        ),
      ),
    );
  }

  Widget cameraControlWidget(context){
    return GestureDetector(
      onTap: (){
        onCapture(context);
      },
      child: Container(
        height: screenWidth(context)*(1/6),
        width: screenWidth(context)*(1/6),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0,0)
          )]
        ),
        child: Icon(
          Icons.camera,
          size: screenHeight(context)*(1/20),
          color: warna1(),
        ),
      ),
    );
  }
//====================================================================//
  getFlashIcon(flashStatus){
    switch (flashStatus){
      case FlashMode.off:
        return Icons.flash_off_rounded;
      case FlashMode.always:
        return Icons.flash_on_rounded;
      case FlashMode.auto:
        return Icons.flash_auto_rounded;
      case FlashMode.torch:
        return Icons.touch_app_rounded;  
      default:
        return Icons.device_unknown;
    }
  }
//====================================================================//
//====================================================================//
  onSwitchFlash(){
    FlashMode selectedFlashNow = cameraController.value.flashMode;
    if (selectedFlashNow == FlashMode.off){
      selectedFlashNow = FlashMode.always;
      onSetFlashModeButtonPressed(selectedFlashNow);
    }
    else if (selectedFlashNow == FlashMode.always){
      selectedFlashNow = FlashMode.auto;
      onSetFlashModeButtonPressed(selectedFlashNow);
    }
    else if (selectedFlashNow == FlashMode.auto){
      selectedFlashNow = FlashMode.torch;
      onSetFlashModeButtonPressed(selectedFlashNow);
    }  
    else if (selectedFlashNow == FlashMode.torch){
      selectedFlashNow = FlashMode.off;
      onSetFlashModeButtonPressed(selectedFlashNow);
    }
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (cameraController == null) {
      return;
    }

    try {
      await cameraController.setFlashMode(mode);
    } on CameraException catch (e) {
      print(e.toString());
    }
  }

  onCapture(context) async{
    try{
      cameraController.takePicture().then((value) {
        print(value);
        setState(() {
          _imageSaved = File(value.path);
        });
        classifyImage(_imageSaved);
      });
    }catch(e){
      print('capture gagal');
    }
  }
//====================================================================//
//====================================================================//
  

}