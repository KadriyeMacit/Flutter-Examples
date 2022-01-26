import 'package:flutter/material.dart';
import 'package:flutter_add_dynamic_widget/textfield_example/problem.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  _MyTextFieldExampleState createState() => _MyTextFieldExampleState();
}

class _MyTextFieldExampleState extends State<TextFieldExample> {
  List<Problem> problemList = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();

    problemList.add(Problem(id: '1', problemName: 'Display'));
    problemList.add(Problem(id: '2', problemName: 'Bluetooth'));
    problemList.add(Problem(id: '3', problemName: 'Speaker'));
    problemList.add(Problem(id: '4', problemName: 'PCB'));
    problemList.add(Problem(id: '5', problemName: 'Camera'));
    problemList.add(Problem(id: '6', problemName: 'Glass'));
    problemList.add(Problem(id: '7', problemName: 'Press button'));
    problemList.add(Problem(id: '8', problemName: 'Charging'));
    problemList.add(Problem(id: '9', problemName: 'Battery'));
    problemList.add(Problem(id: '10', problemName: 'Storage'));
    problemList.add(Problem(id: '11', problemName: 'Overheating'));
    problemList.add(Problem(id: '12', problemName: 'Restart Problem'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ListView Dynamic Create TextField')), body: _bodyList(problemList));
  }

  _bodyList(List<Problem> problemList) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: problemList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        _controllers.add(TextEditingController());
        _controllers[index].text = problemList[index].enterValue;

        return Container(
            padding: const EdgeInsets.only(top: 0, right: 10, left: 10),
            child: Row(children: <Widget>[
              expandStyle(
                  2, Container(margin: const EdgeInsets.only(top: 35), child: Text(problemList[index].problemName))),
              expandStyle(
                  1,
                  TextFormField(
                      controller: TextEditingController.fromValue(TextEditingValue(
                          text: problemList[index].enterValue,
                          selection: TextSelection.collapsed(offset: problemList[index].enterValue.length))),
                      keyboardType: TextInputType.number,
                      onChanged: (String str) {
                        problemList[index].enterValue = str;
                        var total = problemList.fold(
                            0,
                            (t, e) =>
                                double.parse(t.toString()) + double.parse(e.enterValue.isEmpty ? '0' : e.enterValue));
                        //print(total);
                      }))
            ]));
      });
}

expandStyle(int flex, Widget child) => Expanded(flex: flex, child: child);
