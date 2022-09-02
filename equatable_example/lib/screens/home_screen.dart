import 'package:equatable_example/models/students.dart';
import 'package:equatable_example/models/tutors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSameStudents = true;

  bool isSameTutors = true;

  final Students _firstStudent = Students(
      name: "Kadriye", surname: "Macit", department: "Software", year: 4);

  final Students _secondStudent = Students(
      name: "Kadriye", surname: "Macit", department: "Software", year: 4);

  final Tutors _firstTutor =
      const Tutors(name: "Damla Yılmaz", lesson: "Flutter");

  final Tutors _secondTutor =
      const Tutors(name: "Damla Yılmaz", lesson: "Flutter");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isSameStudents.toString(),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSameStudents = _firstStudent == _secondStudent;
                  });
                },
                child: const Text("students"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSameTutors = _firstTutor == _secondTutor;
                  });
                },
                child: const Text("tutors"),
              ),
              Text(
                isSameTutors.toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
