class Students {
  final String name;
  final String surname;
  final String department;
  final int year;

  Students({
    required this.name,
    required this.surname,
    required this.department,
    required this.year,
  });

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is Students &&
  //       other.name == name &&
  //       other.surname == surname &&
  //       other.department == department &&
  //       other.year == year;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //       surname.hashCode ^
  //       department.hashCode ^
  //       year.hashCode;
  // }
}
