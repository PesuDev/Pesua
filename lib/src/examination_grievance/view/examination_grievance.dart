import 'package:flutter/material.dart';

class Examination extends StatefulWidget {
  const Examination({Key? key}) : super(key: key);

  @override
  State<Examination> createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Examination Grievance Redressal Sysytem",overflow: TextOverflow.ellipsis,maxLines: 1,),
      ),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 70),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Tickets-Examination Grievance Redressal System Option available only on student web portal,please visit',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,

                            fontSize: 14,
                            color: Colors.grey),),

                    TextSpan(
                        text: ' Pesuacademy.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blueGrey)),
                    TextSpan(
                        text: 'for raising Tickets.',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.grey)),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
