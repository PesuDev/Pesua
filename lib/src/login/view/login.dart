import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset:false,
      backgroundColor: Color(0xff191D6E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/8,
              ),
              Center(
                child: Text("Sign in",style: TextStyle(
                  fontSize: 62,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Source Sans Pro'
                ),),
              ),
            Container(
              height: MediaQuery.of(context).size.height/10,
            ),
      Container(
        color: Color(0xff0091CD),
        width: double.infinity,
        child:  Row(

          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                    AssetImage('assets/images/google_logo.png'),
                    fit: BoxFit.fitWidth),
                // shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text("Sign In with Google",style: TextStyle(
                fontSize: 18,
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontFamily: 'Source Sans Pro'
            ),)
          ],
        ),
      ),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height:1.0,
                      width:80.0,
                      color:Colors.white,),
                  ),
                  Expanded(
                    child: Container(
                      height:1.0,
                      width:80.0,
                      color:Colors.white,),
                  ),
                  SizedBox(width: 20,),

                  Text("or",style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Source Sans Pro'
                  ),),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height:1.0,
                    width:70.0,
                    color:Colors.white,),
                  Container(
                    height:1.0,
                    width:80.0,
                    color:Colors.white,),

                ],
              ),
              SizedBox(height: 20,),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Username / SRN",
                      hintStyle: TextStyle(  fontSize: 18,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source Sans Pro'),
                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        hintText: "Password",
                      hintStyle: TextStyle(  fontSize: 18,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source Sans Pro'),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;

                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),

                      )

                    ),

                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffED4700)
                  ),
                    onPressed: (){},
                    child: Text("Sign",style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                      fontSize: 16,

                    ),)),
              ),
              SizedBox(height: 40,),
              Text("Forgot Password?",style: TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontFamily: 'Source Sans Pro',
                fontSize: 16,
              ),),
              SizedBox(height: 40,),

              Text("For all login issue, please send an email to ",style: TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontFamily: 'Source Sans Pro',
                fontSize: 16,
              ),),
              Text("support@pesuacademy.com",style: TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontFamily: 'Source Sans Pro',
                fontSize: 16,
              ),),
            ],

          ),
        ),
      ),
    );
  }
}