import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency",style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF)
        ),),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: 10,top: 10,right: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 140,
                    child: Text("Police Control Room",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                 Container(
                   margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff999999),
                          ),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        height: 32,
                        child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('100',style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000)
                        ),)),
                      ),
                    ],
                  ),
                    SizedBox(
                      height: 15,
                    ),
              Row(
                children: [
                  Container(
                    width: 140,
                    child: Text("Fire",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('101',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    child: Text("Hoysala",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('103',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    child: Text("Ambulance",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('108',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    child: Text("CUPA",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('23413427',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 140,
                    child: Text("Railways Arrival & Departure(City",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('131',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                  Text("/"),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('137',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.15,
                    // height: MediaQuery.of(context).size.height/6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 140,
                            child: Text("Airport Enquiries",style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000)
                            ),)),
                        Text(":"),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Toll Free:",style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000)
                              ),),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/2,
                                    child:
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xff999999),
                                              ),
                                              borderRadius: BorderRadius.circular(16)
                                          ),
                                          height: 32,
                                          child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('1800 425 4425',style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000)
                                          ),)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Text("(24×7)",style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff000000)
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text("Whatsapp: +91 8884998888  (24×7)",style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff000000)
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: 140,
                    child: Text("KSRTC",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),),
                  ),
                  Text(":"),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    height: 32,
                    child: TextButton.icon(onPressed: null, icon: Icon(Icons.phone,size: 15,), label: Text('080-49596666',style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)
                    ),)),
                  ),
                ],
              ),
                ],
              ),
        ),
          ),
        );
  }
}
