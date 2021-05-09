import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import '../constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<bool> verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;

  @override
  void dispose() {
    verificationNotifier.close();
    super.dispose();
  }

  passcodeEntered(String enteredPasscode) {
    var isValid = storedPasscode == enteredPasscode;
    print('macit');
    verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        isAuthenticated = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Parola Kilit Ekranı'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: isAuthenticated
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hoş geldiniz!'),
                        SizedBox(height: 100,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.ac_unit),
                            Icon(Icons.remove_red_eye_outlined),
                            Icon(Icons.workspaces_outline),
                            Icon(Icons.accessibility_sharp),
                            Icon(Icons.add_moderator),
                            Icon(Icons.whatshot),
                          ],
                        )
                      ],
                    ),
                ),
              ),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Giriş başarısız!'),
                              SizedBox(height: 100,),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                 Container(color: Colors.amberAccent, height: 100, width: 100,),
                                 Container(color: Colors.blueGrey, height: 100, width: 100,),
                                 Container(color: Colors.lightBlue, height: 100, width: 100,),
                                 Container(color: Colors.green, height: 100, width: 100,),
                                 Container(color: Colors.redAccent, height: 100, width: 100,),
                                 Container(color: Colors.orange, height: 100, width: 100,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
            ),
            _lockScreenButton(context),
          ],
        ));
  }

  _lockScreenButton(BuildContext context) => MaterialButton(
        padding: EdgeInsets.only(left: 50, right: 50),
        color: Theme.of(context).primaryColor,
        child: Text(
          'Kilit Ekranı',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        onPressed: () {
          showLockScreen(
            context,
            opaque: false,
            cancelButton: Text(
              'Vazgeç',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              semanticsLabel: 'Vazgeç',
            ),
          );
        },
      );

  resetApplicationPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      restoreDialog(() {
        Navigator.maybePop(context);
      });
    });
  }

  restoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[50],
          title: Text(
            "Parola sıfırla",
            style: const TextStyle(color: Colors.black87),
          ),
          content: Text(
            "Parolanızı sıfırlamak üzeresiniz, emin misiniz?",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: Text(
                "Vazgeç",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            ElevatedButton(
              child: Text(
                "Tamam",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }

  showLockScreen(BuildContext context,
      {bool opaque,
      CircleUIConfig circleUIConfig,
      KeyboardUIConfig keyboardUIConfig,
      Widget cancelButton,
      List<String> digits}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              'Parola girin',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: passcodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Sil',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Sil',
            ),
            shouldTriggerVerification: verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: passcodeCancelled,
            digits: digits,
            passwordDigits: 6,
            bottomWidget: passcodeRestoreButton(),
          ),
        ));
  }

  passcodeCancelled() {
    Navigator.maybePop(context);
  }

  passcodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: MaterialButton(
            child: Text(
              "Parola sıfırla",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            //style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: resetApplicationPassword,
          ),
        ),
      );
}
