import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meat_detector/models/history.dart';
import 'package:meat_detector/screen/components/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'homePage.dart';

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
  String image64;
  String hasilDeteksi, akurasi, tanggal, catatan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hasilDeteksi = mapHasilIndex(widget.index);
    akurasi = konversiHasilConf(widget.confidence);
    imageToBase64(File(widget.imgPath.path));
  }
  
  Future<void> insertHistory(History history) async{
    //Ambil referensi ke db
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'history_database.db'),
      version: 1,
    );
    final db = await database;

    await db.insert(
      'history', 
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

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
                Get.off(
                  HomePage(),
                );
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
                      color: bayangan(),
                      blurRadius: 5,
                      spreadRadius: 5,
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
                        color: Colors.black,
                        indent: 60,
                        endIndent: 60,
                      ),
                      rowHasil(context, 'Jenis', 'Ayam'),
                      rowHasil(context, 'Kualitas', hasilDeteksi),
                      rowHasil(context, 'Akurasi', akurasi),
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
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                          color: bayangan(),
                          offset: Offset(0,0),
                          spreadRadius: 2
                        )]
                      ),
                      child: TextFormField(
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
                              color: warna1(),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: warna1(),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: warna1(),
                            ),
                          ),
                          contentPadding:EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context)*(1/40),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: ()async{
                          var dataSaatIni = History(
                            image: image64,
                            akurasi: akurasi,
                            hasilDeteksi: hasilDeteksi,
                            catatan: _catatanController.text,
                            tanggal: DateTime.now().toString(),
                          );
                          await insertHistory(dataSaatIni).then((value) => print('Sukses'));
                        },
                        child: Container(
                          height: screenHeight(context)*(1/15),
                          width: screenWidth(context)*(1/2.7),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [BoxShadow(
                              blurRadius: 2,
                              color: bayangan(),
                              offset: Offset(0,0),
                              spreadRadius: 2
                            )]
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
  Future imageToBase64(File image) async{
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    image64 = base64Image;
  }

  Widget rowHasil(BuildContext context, String bagian, String hasil){
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
              color: Colors.black,
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