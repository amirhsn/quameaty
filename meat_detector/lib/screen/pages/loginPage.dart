import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_detector/screen/components/constant.dart';
import 'package:meat_detector/screen/pages/registerPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ key }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                'Masuk ke akun kamu',
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
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email jangan dikosongkan ya';
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
                      'Masuk',
                      style: TextStyle(
                        color: warna1(),
                        fontSize: screenHeight(context)*(1/45),
                        letterSpacing: 1
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print('cek');
                },
                child: Text(
                  'Lupa password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: screenHeight(context)*(1/60),
                    letterSpacing: 1
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
                      'Belum punya akun? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight(context)*(1/60),
                        letterSpacing: 1
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                          Get.off(
                            SignUpPage(),
                            transition: Transition.leftToRightWithFade,
                            duration: Duration(milliseconds: 800)
                          );
                        },
                      child: Text(
                        'Daftar',
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
                height: screenHeight(context)*(1/20),
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