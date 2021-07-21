import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_detector/screen/components/constant.dart';
import 'package:meat_detector/screen/pages/scanPage.dart';
import 'historyPage.dart';
import 'messagePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({ key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: warna1(),
        padding: EdgeInsets.all(screenWidth(context)*(1/20)),
        margin: EdgeInsets.only(
          top: screenHeight(context)*(1/28)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang \ndi Quameaty!',
              style: TextStyle(
                color: Colors.black,
                fontSize: screenHeight(context)*(1/30),
                letterSpacing: 2
              ),
            ),
            SizedBox(
              height: screenHeight(context)*(1/40),
            ),
            menuContainer(context),
            SizedBox(
              height: screenHeight(context)*(1/50),
            ),
            Divider(
              color: Colors.black,
              endIndent: 100,
              indent: 100,
            ),
            Container(
              width: double.infinity,
              height: screenHeight(context)*(1/1.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instruksi',
                    style: TextStyle(
                      fontSize: screenHeight(context)*(1/30)
                    ),
                  ),
                  helpContainer(context,'1','Pastikan lensa makro terpasang'),
                  helpContainer(context,'2',"Ketuk 'Pindai' untuk mulai scan"),
                  helpContainer(context,'3','Pastikan objek berada di tengah'),
                  helpContainer(context,'4','Tunggu beberapa saat'),
                  helpContainer(context,'5',"Hasil deteksi akan ditampilkan")
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context)*(1/70),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/polban.png',
                    height: screenHeight(context)*(1/20),
                  ),
                  SizedBox(
                    width: screenWidth(context)*(1/40),
                  ),
                  Text(
                    'PKM POLBAN 2021',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight(context)*(1/60)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget helpContainer(context, String noPetunjuk, String petunjuk){
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight(context)*(1/100)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context)*(1/50),
        vertical: screenWidth(context)*(1/100)
      ),
      width: double.infinity,
      height: screenHeight(context)*(1/12),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenHeight(context)*(1/25),
            height: screenHeight(context)*(1/25),
            margin: EdgeInsets.only(
              right: screenWidth(context)*(1/25)
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            child: Center(
              child: Text(
                noPetunjuk,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Text(
            petunjuk,
            style: TextStyle(
              color: warna1(),
              letterSpacing: 2,
              fontSize: screenWidth(context)*(1/30)
            ),
          ),
        ],
      ),
    );
  }

  Widget menuContainer(context){
    return Container(
      width: double.infinity,
      height: screenHeight(context)*(1/7.5),
      decoration: BoxDecoration(
        color: warna1(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: bayangan(),
          blurRadius: 3,
          spreadRadius: 3,
        )]
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context)*(1/100),
        horizontal: screenHeight(context)*(1/30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconMenu(context, CupertinoIcons.timelapse, 'Riwayat', HistoryPage()),
          garisBatas(),
          iconMenu(context, Icons.camera, 'Pindai', ScanPage()),
          garisBatas(),
          iconMenu(context, Icons.message_rounded, 'Kritik Saran', MessagePage())
        ],
      ),
    );
  }

  Widget iconMenu(context, IconData ikon, String ket, dynamic halaman){
    return GestureDetector(
      onTap: (){
        Get.to(
          halaman,
          transition: Transition.topLevel
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            ikon,
            size: screenHeight(context)*(1/18),
            color: Colors.black,
          ),
          Text(
            ket,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenHeight(context)*(1/50)
            ),
          )
        ],
      ),
    );
  }

  Widget garisBatas(){
    return VerticalDivider(
      color: Colors.black,
      indent: 10,
      endIndent: 10,
      thickness: 0.2,
    );
  }
}