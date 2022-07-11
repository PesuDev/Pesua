import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/dashboard_module/view/dashboard_page.dart';
import 'dart:math' as math;

import 'package:pesu/src/dashboard_module/view/home_page.dart';


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
                  fontWeight: FontWeight.w300,
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
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardScreen()));
                    },
                    child: Text("Sign in",style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Source Sans Pro',
                      fontSize: 16,

                    ),)),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupDialog(context),
                  );
                },
                child: Text("Forgot Password?",style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 16,
                ),),
              ),
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
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    contentPadding: EdgeInsets.all(0),

    content: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(Icons.lock_outline_rounded,color: Colors.white,),
                SizedBox(width: 10,),
                Text("Forget your Password?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          )
        ),
        Padding(
          padding:EdgeInsets.only(left: 10,right: 10,top: 10),

         child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "Enter Login ID/ SRN",
                      hintStyle: TextStyle(  fontSize: 18,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source Sans Pro'),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40,bottom: 10),
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.blueAccent,

                ),
                child:
                TextButton(

                    onPressed: (){
                    },
                    child: Text("CONTINUE",style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16,

                    ),)),
              ),

              Container(
                margin: EdgeInsets.only(top:10,bottom: 20),
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)

                ),
                child:
                TextButton(

                    onPressed: (){
                     Navigator.pop(context);
                    },
                    child: Text("CANCEL",style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16,

                    ),)),
              ),
            ],
          ),
        ),


      ],
    ),

  );
}
