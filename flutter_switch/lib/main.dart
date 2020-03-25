import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool switchControl = false;
  bool switchControl2 = false;
  bool switchControl3 = false;
  var textHolder = 'OFF';
  var textHolder2 = "OFF";
  var textHolder3 ="OFF";

  Future<void> toggleSwitch(bool value) async {

    if(switchControl == false)
    {
      setState(() {
        saveSwitchState(value);
        switchControl = true;
        textHolder = 'ON';
      });
      print('ON');



    }
    else
    {
      setState(() {
        saveSwitchState(value);
        switchControl = false;
        textHolder = 'OFF';
      });
      print('OFF');


    }


  }


  void toggleSwitch2(bool value) {

    if(switchControl2 == false)
    {
      setState(() {
        saveSwitchState2(value);
        switchControl2 = true;
        textHolder2 = "yeşil ON";
      });
      print('5');


    }
    else
    {
      setState(() {
        saveSwitchState2(value);
        switchControl2 = false;
        textHolder2 = 'OFF';
      });
      print('OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  void toggleSwitch3(bool value) {

    if(switchControl3 == false)
    {
      setState(() {
        saveSwitchState3(value);
        switchControl3 = true;
        textHolder3 = "mor ON";
      });
      print('ON');

    }
    else
    {
      setState(() {
        saveSwitchState3(value);
        switchControl3 = false;
        textHolder3 = 'OFF';
      });
      print('OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }




  @override
  initState() {
    super.initState();
    getSwitchValues();
  }





  getSwitchValues() async {
    switchControl = await getSwitchState();
    setState(() {});

    switchControl2 = await getSwitchState2();
    setState(() {});

    switchControl3 = await getSwitchState3();
    setState(() {});
  }


  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    return prefs.setBool("switchState", value);
  }

  Future<bool> saveSwitchState2(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState2", value);
    print('Switch Value2 saved $value');
    return prefs.setBool("switchState2", value);
  }

  Future<bool> saveSwitchState3(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState3", value);
    print('Switch Value3 saved $value');
    return prefs.setBool("switchState3", value);
  }



  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitchedFT = prefs.getBool("switchState") ?? false;
    print(isSwitchedFT);

    return isSwitchedFT;
  }

  Future<bool> getSwitchState2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitchedFT2 = prefs.getBool("switchState2") ?? false;
    print(isSwitchedFT2);

    return isSwitchedFT2;
  }

  Future<bool> getSwitchState3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitchedFT3 = prefs.getBool("switchState3") ?? false;
    print(isSwitchedFT3);

    return isSwitchedFT3;
  }






  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.cyan,
            title: Text("Switch Uygulaması"),
        ),


        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Switch(
                  onChanged: toggleSwitch,
                  value: switchControl,
                  activeColor: Colors.pinkAccent,
                  activeTrackColor: Colors.grey[400],
                  inactiveThumbColor: Colors.grey[200],
                  inactiveTrackColor: Colors.grey,
                ),
              ),

              Text("$textHolder"),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Switch(
                  onChanged: toggleSwitch2,
                  value: switchControl2,
                  activeColor: Colors.greenAccent,
                  activeTrackColor: Colors.grey[400],
                  inactiveThumbColor: Colors.grey[200],
                  inactiveTrackColor: Colors.grey,
                ),
              ),


              Text("$textHolder2"),



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Switch(
                  onChanged: toggleSwitch3,
                  value: switchControl3,
                  activeColor: Colors.deepPurple,
                  activeTrackColor: Colors.grey[400],
                  inactiveThumbColor: Colors.grey[200],
                  inactiveTrackColor: Colors.grey,
                ),
              ),


              Text("$textHolder3"),




            ],
          )
        ),
      ),
    );
  }
}