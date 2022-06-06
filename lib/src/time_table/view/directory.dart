import 'package:flutter/material.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Directory",style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF)
        ),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Department",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff000000)
                    ),),
                    Text("HOD",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff000000)
                    ),),
                    Text("Department Office",style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff000000)
                    ),)
                  ],
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.78,
                margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 0),
                color: Color(0xffFFFFFF),
                child: ListTileTheme.merge(
                  dense: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Physics labs",overflow: TextOverflow.ellipsis,maxLines: 5,textAlign: TextAlign.start,style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff000000)
                                      ),),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("256",maxLines: 5,textAlign: TextAlign.start,style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff000000)
                                      ),),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("4",style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff000000)
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 3,
                            ),
                          ],
                        ),
                      );
                    },
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
