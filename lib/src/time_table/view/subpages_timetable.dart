import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Monday extends StatefulWidget {
  const Monday({Key? key}) : super(key: key);

  @override
  State<Monday> createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text("08:15-09:15",style: TextStyle(
                                    color: Color(0xff000000),
                                    fontFamily: 'Open Sans',
                                    fontSize: 16,
                                    fontWeight: FontWeight. normal
                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Digital ",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontFamily: 'Open Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                          ),),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UM21MB651B",   style: TextStyle(
                    color: Color(0xff666666),
                    fontFamily: 'Open Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 17,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "BREAK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Text("08:15-09:15",style: TextStyle(
                                        color: Color(0xff000000),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight. normal
                                    ),),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.50,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Digital",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight. normal
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("UM21MB651B", style: TextStyle(
                                          color: Color(0xff666666),
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tuesday extends StatefulWidget {
  const Tuesday({Key? key}) : super(key: key);

  @override
  State<Tuesday> createState() => _TuesdayState();
}

class _TuesdayState extends State<Tuesday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text("08:15-09:15",style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight. normal
                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Digital ",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal
                                              ),),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UM21MB651B",   style: TextStyle(
                                        color: Color(0xff666666),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 17,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "BREAK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Text("08:15-09:15",style: TextStyle(
                                        color: Color(0xff000000),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight. normal
                                    ),),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.50,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Digital",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight. normal
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("UM21MB651B", style: TextStyle(
                                          color: Color(0xff666666),
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wednesday extends StatefulWidget {
  const Wednesday({Key? key}) : super(key: key);

  @override
  State<Wednesday> createState() => _WednesdayState();
}

class _WednesdayState extends State<Wednesday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text("08:15-09:15",style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight. normal
                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Digital ",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal
                                              ),),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UM21MB651B",   style: TextStyle(
                                        color: Color(0xff666666),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 17,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "BREAK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Text("08:15-09:15",style: TextStyle(
                                        color: Color(0xff000000),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight. normal
                                    ),),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.50,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Digital",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight. normal
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("UM21MB651B", style: TextStyle(
                                          color: Color(0xff666666),
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Thursday extends StatefulWidget {
  const Thursday({Key? key}) : super(key: key);

  @override
  State<Thursday> createState() => _ThursdayState();
}

class _ThursdayState extends State<Thursday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text("08:15-09:15",style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight. normal
                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Digital ",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal
                                              ),),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UM21MB651B",   style: TextStyle(
                                        color: Color(0xff666666),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 17,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "BREAK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Text("08:15-09:15",style: TextStyle(
                                        color: Color(0xff000000),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight. normal
                                    ),),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.50,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Digital",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight. normal
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("UM21MB651B", style: TextStyle(
                                          color: Color(0xff666666),
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Friday extends StatefulWidget {
  const Friday({Key? key}) : super(key: key);

  @override
  State<Friday> createState() => _FridayState();
}

class _FridayState extends State<Friday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text("08:15-09:15",style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight. normal
                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Digital ",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal
                                              ),),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UM21MB651B",   style: TextStyle(
                                        color: Color(0xff666666),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 17,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "BREAK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Text("08:15-09:15",style: TextStyle(
                                        color: Color(0xff000000),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight. normal
                                    ),),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.50,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Digital",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight. normal
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("UM21MB651B", style: TextStyle(
                                          color: Color(0xff666666),
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Saturday extends StatefulWidget {
  const Saturday({Key? key}) : super(key: key);

  @override
  State<Saturday> createState() => _SaturdayState();
}

class _SaturdayState extends State<Saturday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 1.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text("08:15-09:15",style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: 'Open Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight. normal
                                  ),),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Digital ",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal
                                              ),),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("UM21MB651B",   style: TextStyle(
                                        color: Color(0xff666666),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 17,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "BREAK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Text("08:15-09:15",style: TextStyle(
                                        color: Color(0xff000000),
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight. normal
                                    ),),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.50,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Digital",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xff000000),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight. normal
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("UM21MB651B", style: TextStyle(
                                          color: Color(0xff666666),
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sunday extends StatefulWidget {
  const Sunday({Key? key}) : super(key: key);

  @override
  State<Sunday> createState() => _SundayState();
}

class _SundayState extends State<Sunday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 380,
              margin: const EdgeInsets.all(19.0),
              // padding: EdgeInsets.only(left: 50, top: 5),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
              child:
              Center(
                child: Text('NO CLASSES AVAILABLE ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff717171),
                        fontWeight: FontWeight.w600)),
              ),
            ),
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.refresh,
                color: Color(0xff0091cd),
                size: 30.0,
              ),
            ),
            Text("Refresh",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff0091cd),
                )),
          ],
        ),
      ),
    );
  }
}
