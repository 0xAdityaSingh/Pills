import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pills/pages/add_event_page.dart';
// import 'package:pills/add_task_page.dart';

class MPage extends StatefulWidget {
  MPage({Key key}) : super(key: key);

  @override
  _MPageState createState() => _MPageState();
}

class _MPageState extends State<MPage> {
  PageController _pageController = PageController();

  double currentPage = 0;

  // void _modalBottomSheetMenu() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return new Container(
  //           height: 450.0,
  //           color: Colors.transparent, //could change this to Color(0xFF737373),
  //           //so you don't have to change MaterialApp canvasColor
  //           child: new Container(
  //               decoration: new BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: new BorderRadius.only(
  //                       topLeft: const Radius.circular(10.0),
  //                       topRight: const Radius.circular(10.0))),
  //               child: new Center(
  //                 child: new Text("This is a modal sheet"),
  //               )),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Expanded(
                //   child: Center(
                //     child: Text(
                //       "Pills",
                //       style: GoogleFonts.balooDa(
                //           fontSize: 30,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.grey.shade800),
                //     ),
                //   ),
                // ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          // backgroundColor: Colors.grey.shade900,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.blue,
          //   onPressed: () {},
          //   child: Icon(
          //     Icons.add,
          //     size: 30,
          //   ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: Icon(
          //     Icons.add,
          //     size: 30,
          //   ),
          // ),

          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildPadding("MORNING"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  child: AddEventPage(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))));
                            });
                        // _modalBottomSheetMenu();
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  buildPadding("AFTERNOON"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  child: AddEventPage(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))));
                            });
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  buildPadding("EVENING"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  child: AddEventPage(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))));
                            });
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  buildPadding("NIGHT"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  child: AddEventPage(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))));
                            });
                      },
                    ),
                  )
                ],
              ),
            ],
          )),
        ));
  }

  Expanded buildPadding(String abc) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Text(
          abc,
          style: GoogleFonts.balooDa(
              fontSize: 30,
              // fontWeight: FontWeight.bold,
              color: Colors.grey.shade800),
        ),
      ),
    );
  }
}
