import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class OnlinePayments extends StatelessWidget {
  const OnlinePayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Online payments"),
      backgroundColor:Colors.white.withOpacity(0.9),
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
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)
                      ),),

                    TextSpan(
                        text: ' Pesuacademy.com.',
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000)
                      ),),
                    TextSpan(
                        text: 'for raising Tickets:',
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)
                      ),),

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
