import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:draggable_floating_button/draggable_floating_button.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
          primarySwatch: Colors.cyan,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Draggable FAB',
            theme: theme,
            home: new MyHomePage(title: 'Draggable FAB'),
          );
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AppBar appBar;
  bool accepted = false;

  Color lightDfabColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {

    appBar = getAppBar();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    return Scaffold(
      appBar: appBar,
      body: Stack (
          children: <Widget>[
            new Positioned (
              child: new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: DragTarget(
                        builder: (context, List<String> candidateData, rejectedData) {
                          print('builder');
                          return Center(
                              child: Text(
                                "Info",
                                style: TextStyle(color: Colors.white, fontSize: 22.0),
                              )
                          );
                        },
                        onWillAccept: (data) {
                          print('onWillAccept ' + data);
                          return true;
                        },
                        onAccept: (data) {
                          print('onAccept ' + data);
                          if(data == 'desktop_mac'){
                            _showDialog(
                                'Müzik',
                                'Youtube video açılacak.'
                            );
                            return true;
                          }

                          if(data == 'wb_incandescent'){
                            _showDialog(
                                'Lamba',
                                'Lambayı yakıp kapatabilirsin.'
                            );
                            return true;
                          }

                        },
                        onLeave: (data) {
                          print('onLeave' + data);
                        }
                    ),
                  )
              ),
            ),
            Stack(
              children: <Widget>[
                getContextButton(),
                getLightDfab(),
              ],
            ),
          ]
      ),
    );
  }

  getAppBar() {
    return AppBar(
      title: Text(widget.title),
    );
  }

  _showDialog(title, content) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  changeBrightness() {
    print('changeBrightness');
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);

    lightDfabColor = (lightDfabColor == Colors.white) ? Colors.yellow : Colors.white;
    setState(() {
    });

  }

  openYoutubeMusicVideo() async {
    const url = 'https://www.youtube.com/watch?v=dfIB1yEuPaA';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  DraggableFloatingActionButton getLightDfab() {
    return DraggableFloatingActionButton(
      offset: new Offset(100, 100),
      backgroundColor: Theme.of(context).accentColor,
      child: new Icon(
        Icons.wb_incandescent,
        color: lightDfabColor,
      ),
      onPressed: () => changeBrightness(),
      appContext: context,
      appBar: appBar,
      data: 'wb_incandescent',
    );
  }

  DraggableFloatingActionButton getContextButton() {
    return DraggableFloatingActionButton(
      offset: new Offset(200, 200),
      backgroundColor: Theme.of(context).accentColor,
      child: new Icon(
        Icons.audiotrack,
        color: lightDfabColor,
      ),
      onPressed: () => openYoutubeMusicVideo(),
      appContext: context,
      appBar: appBar,
      data: 'desktop_mac',
    );
  }

}