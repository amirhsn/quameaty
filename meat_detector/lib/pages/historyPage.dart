import 'package:flutter/material.dart';
import 'package:meat_detector/components/constant.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warna1(),
      appBar: AppBar(
        backgroundColor: warna1(),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
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
              height: screenHeight(context)*(1/1.4),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context)*(1/100)
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListView(
                children: [
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                  historyContainer(context),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget historyContainer(context){
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
            color: Colors.blueGrey,
            width: screenWidth(context)*(1/7),
            height: screenWidth(context)*(1/7),
          ),
          Container(
            width: screenWidth(context)*(1/3),
            height: screenWidth(context)*(1/7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Tidak Segar',
                  style: TextStyle(
                    color: warna1(),
                    letterSpacing: 2
                  ),
                ),
                Text(
                  '24/06/2021',
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