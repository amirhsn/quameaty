import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_detector/screen/components/constant.dart';

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warna1(),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context)*(1/9),
          vertical: screenHeight(context)*(1/100)
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight(context)*(1/20),
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: screenHeight(context)*(1/8),
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/20),
              ),
              Text(
                'Buat akun kamu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight(context)*(1/35),
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/40),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight(context)*(1/100)
                ),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    blurRadius: 1,
                    color: bayangan(),
                    offset: Offset(0,0),
                    spreadRadius: 1
                  )]
                ),
                child: TextFormField(
                  controller: _namaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama jangan dikosongkan ya';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: warna1(),
                    filled: true,
                    hintText: 'Nama',
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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight(context)*(1/100)
                ),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    blurRadius: 1,
                    color: bayangan(),
                    offset: Offset(0,0),
                    spreadRadius: 1
                  )]
                ),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email jangan dikosongkan ya';
                    }
                    else if (value.length < 11 || !value.contains('@')){
                      return 'Harap masukkan email yang valid';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: warna1(),
                    filled: true,
                    hintText: 'Email',
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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight(context)*(1/100)
                ),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    blurRadius: 1,
                    color: bayangan(),
                    offset: Offset(0,0),
                    spreadRadius: 1
                  )]
                ),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password jangan dikosongkan ya';
                    }
                    else if (value.length < 8){
                      return 'Panjang password minimal 8 karakter';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: warna1(),
                    filled: true,
                    hintText: 'Password',
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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight(context)*(1/100)
                ),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    blurRadius: 1,
                    color: bayangan(),
                    offset: Offset(0,0),
                    spreadRadius: 1
                  )]
                ),
                child: TextFormField(
                  controller: _password2Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password jangan dikosongkan ya';
                    }
                    else if (value != _passwordController.text){
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: warna1(),
                    filled: true,
                    hintText: 'Konfirmasi Password',
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
              GestureDetector(
                onTap: (){
                  if (_formKey.currentState.validate()) {
                    print('cek');
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: screenHeight(context)*(1/100)
                  ),
                  width: double.infinity,
                  height: screenHeight(context)*(1/14),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      blurRadius: 3,
                      color: bayangan(),
                      offset: Offset(0,0),
                      spreadRadius: 3
                    )]
                  ),
                  child: Center(
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        color: warna1(),
                        fontSize: screenHeight(context)*(1/45),
                        letterSpacing: 1
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenHeight(context)*(1/100)
                ),
                width: double.infinity,
                height: screenHeight(context)*(1/14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight(context)*(1/60),
                        letterSpacing: 1
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                          Get.off(
                            SignInPage(),
                            transition: Transition.rightToLeftWithFade,
                            duration: Duration(milliseconds: 800)
                          );
                        },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: screenHeight(context)*(1/60),
                          letterSpacing: 1
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight(context)*(1/30),
              ),    
              Center(
                child: Image.asset(
                  'assets/images/polban.png',
                  height: screenHeight(context)*(1/20),
                ),
              ),SizedBox(
                height: screenHeight(context)*(1/80),
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
      ),
    );
  }
}