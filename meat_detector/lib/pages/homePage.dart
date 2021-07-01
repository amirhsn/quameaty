import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meat_detector/components/constant.dart';
import 'package:meat_detector/pages/historyPage.dart';
import 'package:meat_detector/pages/messagePage.dart';
import 'package:meat_detector/pages/scanPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({ key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: warna1(),
            padding: EdgeInsets.all(screenWidth(context)*(1/20)),
            margin: EdgeInsets.only(
              top: screenHeight(context)*(1/100)
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: screenHeight(context)*(1/3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang \nJohan!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight(context)*(1/25),
                        letterSpacing: 2
                      ),
                    ),
                    menuContainer(context)
                  ],
                ),
              ),
            ),
          ),
          riwayatContainer(context)
        ],
      ),
    );
  }

  Widget menuContainer(context){
    return Container(
      width: double.infinity,
      height: screenHeight(context)*(1/7.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 3,
          spreadRadius: 1,
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
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => halaman,
          )
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            ikon,
            size: screenHeight(context)*(1/18),
            color: Colors.red,
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

  Widget riwayatContainer(context){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(screenWidth(context)*(1/20)),
        width: double.infinity,
        height: screenHeight(context)*(1/1.6),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35)
          ),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0,-1)
          )]
        ),
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