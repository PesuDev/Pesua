import 'package:flutter/material.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({Key? key}) : super(key: key);

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xff999999),
        appBar: AppBar(
          title: Text("Clubs & Activities",style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF)
          ),),
        ),
        body: InkWell(
          onTap: () {
            _showOptionalDialog(context);
          },
          child: Container(
            child: ListTileTheme.merge(
              dense: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(
                          right: 15, left: 15, top: 10, bottom: 0),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                            elevation: 3,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    _showOptionalDialog(context);
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.album),
                                    title: Text('The Enchanted Nightingale'),
                                    subtitle: Text(
                                        'Music by Julie Gable. Lyrics by Sidney Stein.'),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    color: Color(0xffFFFFFF),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("EVENT",style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000),
                                            fontFamily: 'Open Sans',
                                          ),),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text("EVENT",style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000),
                                            fontFamily: 'Open Sans',
                                          ),),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "About Event",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
          ),
        ));
  }
  _showOptionalDialog(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Testing',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xffFFFFFF),
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("EVENT",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff000000),
                            fontFamily: 'Open Sans',
                          ),),
                          SizedBox(
                            height: 6,
                          ),
                          Text("EVENT",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff000000),
                            fontFamily: 'Open Sans',
                          ),),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "About Event ",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000),
                              fontFamily: 'Open Sans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.22,
                    child: ElevatedButton(
                      child: new Text(
                        'close',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              )
            ],
          );
        });
  }
}
