import 'package:equatable/equatable.dart';

class Tutors extends Equatable {
  final String name;
  final String lesson;

  const Tutors({
    required this.name,
    required this.lesson,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, lesson];
}
