import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_detector/models/history.dart';
import 'package:meat_detector/screen/components/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  List riwayat;

  // Ambil data
  Future<List<History>> history() async {
    //Ambil referensi ke db
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'history_database.db'),
      version: 1,
    );
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The History.
    final List<Map<String, dynamic>> maps = await db.query('history');

    // Convert the List<Map<String, dynamic> into a List<History>.
    return List.generate(maps.length, (i) {
      return History(
        id: maps[i]['id'],
        image: maps[i]['image'],
        akurasi: maps[i]['akurasi'],
        catatan: maps[i]['catatan'],
        hasilDeteksi: maps[i]['hasilDeteksi'],
        tanggal: maps[i]['tanggal'],
      );
    });
  }

  Future<void> getRiwayat() async {
    riwayat = await history();
    setState(() {});
  }

  @override
    void initState() {
      // TODO: implement initState
      getRiwayat();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warna1(),
      appBar: AppBar(
        backgroundColor: warna1(),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context)*(1/15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Riwayat',
              style: TextStyle(
                color: Colors.black,
                fontSize: screenHeight(context)*(1/25),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight(context)*(1/50),
            ),
            Container(
              width: double.infinity,
              height: screenHeight(context)*(1/1.3),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context)*(1/100)
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListView.builder(
                itemCount: riwayat == null ? 0 : riwayat.length,
                itemBuilder: (context, index){
                  return historyContainer(
                    context, 
                    riwayat[index].hasilDeteksi,
                    riwayat[index].tanggal.substring(0,10),
                    riwayat[index].image
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget historyContainer(context, String hasilDeteksi, String tanggal, String gambar){
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight(context)*(1/100)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context)*(1/50),
        vertical: screenWidth(context)*(1/100)
      ),
      width: double.infinity,
      height: screenHeight(context)*(1/10),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [BoxShadow(
          blurRadius: 1,
          color: Colors.grey,
          spreadRadius: 1,
          offset: Offset(0,0)
        )],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth(context)*(1/7),
            height: screenWidth(context)*(1/7),
            child: Image.memory(
              base64Decode(gambar),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: screenWidth(context)*(1/3),
            height: screenWidth(context)*(1/7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hasilDeteksi,
                  style: TextStyle(
                    color: warna1(),
                    letterSpacing: 2
                  ),
                ),
                Text(
                  tanggal,
                  style: TextStyle(
                    color: warna1(),
                    letterSpacing: 2,
                    fontSize: screenHeight(context)*(1/60)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}