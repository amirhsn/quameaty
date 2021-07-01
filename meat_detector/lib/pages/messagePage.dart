import 'package:flutter/material.dart';
import 'package:meat_detector/components/constant.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({ key }) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _isiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Kritik & Saran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight(context)*(1/25),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/100),
              ),
              Text(
                'Nama',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight(context)*(1/35),
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/65),
              ),
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jangan dikosongkan ya';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: warna1(),
                  filled: true,
                  hintText: 'Nama kamu',
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
                height: screenHeight(context)*(1/100),
              ),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight(context)*(1/35),
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/65),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jangan dikosongkan ya';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: warna1(),
                  filled: true,
                  hintText: 'Email kamu',
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
                height: screenHeight(context)*(1/100),
              ),
              Text(
                'Kritik & saran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight(context)*(1/35),
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/65),
              ),
              TextFormField(
                controller: _isiController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jangan dikosongkan ya';
                  }
                  return null;
                },
                maxLines: 7,
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: warna1(),
                  filled: true,
                  hintText: 'Kritik dan saran',
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
                height: screenHeight(context)*(1/25),
              ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    if (_formKey.currentState.validate()) {
                      print('berhasil');
                    }
                  },
                  child: Container(
                    height: screenHeight(context)*(1/15),
                    margin: EdgeInsets.only(
                      bottom: 15
                    ),
                    width: screenWidth(context)*(1/3),
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
                          'Kirim',
                          style: TextStyle(
                            color: warna1(),
                            letterSpacing: 2,
                            fontSize: screenWidth(context)*(1/25)
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
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
      ),
    );
  }
}