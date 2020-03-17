import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() => MyApp2();
}

class MyApp2 extends State<MyApp> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            title: Text(
              "Fancy Bottom Uygulaması",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: _getPage(currentPage),
            ),
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Colors.white,
            activeIconColor: Colors.black,
            inactiveIconColor: Colors.white,
            barBackgroundColor: Colors.lightGreenAccent,
            textColor: Colors.black,
            tabs: [
              TabData(
                  iconData: Icons.people,
                  title: "Rehber",
                  onclick: () {
                    final FancyBottomNavigationState fState =
                        bottomNavigationKey.currentState;
                    fState.setPage(2);
                  }),
              TabData(
                iconData: Icons.home,
                title: "Anasayfa",
              ),
              TabData(iconData: Icons.message, title: "Mesajlar")
            ],
            initialSelection: 1,
            key: bottomNavigationKey,
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          ),


        ));
  }

    _getPage(int page) {
      switch (page) {
        case 0:
          return
            Column(
              children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.purple[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Kadriye", style: TextStyle(
                          fontSize: 20
                        ),),
                      ),
                      height: 50,
                      width: 500,
                       ),
                  ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Furkan", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    height: 50,
                    width: 500,
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Alperen", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    height: 50,
                    width: 500,
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Berkay", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    height: 50,
                    width: 500,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Gizem", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    height: 50,
                    width: 500,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sezgi", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    height: 50,
                    width: 500,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.purple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Yetgin", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    height: 50,
                    width: 500,
                  ),
                ),




              ],
            );


        case 1:
          return
            Column(
              children: <Widget>[

               Padding(
                 padding: const EdgeInsets.only(top: 50.0),
                 child: Container(
                   height: 100,
                     width: 100,
                     child: Image.asset("images/linux_icon.webp")
                 ),
               ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Linux dersleri",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),

                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("images/flutter_icon.png")),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Flutter dersleri",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),

                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("images/python_icon.png")),

                Text("Python dersleri",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),



              ],
            );


        default:
          return

            Column(

              children: <Widget>[

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   color: Colors.blue[100],
                   child: Row(

                     children: <Widget>[

                       Container(
                         height: 80,
                         width: 80,
                         child: CircleAvatar(
                           backgroundImage: AssetImage("images/kad.jpg"),
                         ),
                       ),

                       Padding(
                         padding: const EdgeInsets.only(left: 8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[

                             Text(
                               "Kadriye",
                               style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold
                               ),
                             ),

                             Padding(
                               padding: const EdgeInsets.only(top: 5.0),
                               child: Text("Flutter'a yeni video geldi!",
                               ),
                             )

                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue[100],
                    child: Row(

                      children: <Widget>[

                        Container(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/feye.jpg"),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(
                                "Furkan",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text("Hello World kanalına abone oldun mu?",
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )

              ],
            );
      }
    }
  }

