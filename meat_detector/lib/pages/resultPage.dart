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
  TextEditingController _catatanController = TextEditingController();

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
        body: Padding(
          padding: EdgeInsets.all(screenWidth(context)*(1/25)),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: screenWidth(context)*(1/1.2),
                  height: screenHeight(context)*(1/2.1),
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
                    bottom: screenHeight(context)*(1/40),
                    top: screenHeight(context)*(0.001)
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context)*(1/20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: screenHeight(context)*(1/80)
                        ),
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
              Container(
                width: double.infinity,
                height: screenHeight(context)*(1/3.5),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context)*(1/30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catatan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight(context)*(1/35),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context)*(1/65),
                    ),
                    TextFormField(
                      controller: _catatanController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        isDense: true,
                        fillColor: warna1(),
                        filled: true,
                        hintText: 'Catatan barangkali ada?',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        contentPadding:EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context)*(1/40),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: screenHeight(context)*(1/15),
                          width: screenWidth(context)*(1/2.7),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(context)*(1/20),
                            vertical: screenHeight(context)*(1/100)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Simpan',
                                style: TextStyle(
                                  color: warna1(),
                                  letterSpacing: 2,
                                  fontSize: screenWidth(context)*(1/25)
                                ),
                              ),
                              Icon(
                                Icons.save_alt_outlined,
                                color: warna1(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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