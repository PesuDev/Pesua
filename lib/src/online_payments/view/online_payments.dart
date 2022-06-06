import 'package:flutter/material.dart';

class OnlinePayments extends StatelessWidget {
  const OnlinePayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Payments",overflow: TextOverflow.ellipsis,maxLines: 1,),
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
                      text: 'Payments option available only on student web portal,please visti',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,

                          fontSize: 14,
                          color: Colors.grey),),

                    TextSpan(
                        text: ' Pesuacademy.com.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blueGrey)),
                    TextSpan(
                        text: 'for raising Tickets:',
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
