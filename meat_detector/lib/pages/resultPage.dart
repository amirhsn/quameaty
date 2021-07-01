import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meat_detector/components/constant.dart';
import 'package:meat_detector/pages/homePage.dart';

class ResultPage extends StatefulWidget {
  final dynamic imgPath;
  final int index;
  final dynamic confidence;
  const ResultPage({key, this.imgPath, this.index, this.confidence}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  var labelKey = '';
  var labelValues;
  bool isLoading = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: warna1(),
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ), 
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          ),
          elevation: 0,
        ),
        backgroundColor: warna1(),
        body: Center(
          child: Container(
            width: screenWidth(context)*(1/1.2),
            height: screenHeight(context)*(1/1.6),
            decoration: BoxDecoration(
              color: warna1(),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 2,
              )]
            ),
            margin: EdgeInsets.only(
              bottom: screenHeight(context)*(1/15)
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context)*(1/20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenHeight(context)*(1/5),
                  height: screenHeight(context)*(1/5),
                  //color: Colors.orange,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(widget.imgPath.path),
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                SizedBox(
                  height: screenHeight(context)*(1/100),
                ),
                Center(
                  child: Text(
                    'HASIL',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight(context)*(1/25),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.red,
                  indent: 60,
                  endIndent: 60,
                ),
                rowHasil('Jenis', 'Ayam'),
                rowHasil('Kualitas', mapHasilIndex(widget.index)),
                rowHasil('Akurasi', konversiHasilConf(widget.confidence)),
              ],
            ),
          ),
        ),
    );
  }
//===========================================================//
//===========================================================//
  Widget rowHasil(String bagian, String hasil){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context)*(1/20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bagian,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth(context)*(1/20),
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '$hasil',
            style: TextStyle(
              color: Colors.red,
              fontSize: screenWidth(context)*(1/20),
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  String mapHasilIndex(nilaiIndex){
    switch (nilaiIndex){
      case 0:
      return 'Tidak Segar';
      case 1:
      return 'Segar';
    }
  }

  String konversiHasilConf(nilaiConf){
    var nilaiConfDouble = nilaiConf * 100;
    nilaiConfDouble = nilaiConfDouble.toStringAsFixed(2);
    return nilaiConfDouble+' %';
  }
}