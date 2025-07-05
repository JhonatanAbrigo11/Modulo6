class Student {
  final String id;
  final String name;
  final String lastName;
  final String instrument;
  final String academicLevel;

  Student({
    required this.id,
    required this.name,
    required this.lastName,
    required this.instrument,
    required this.academicLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastName': lastName,
      'instrument': instrument,
      'academicLevel': academicLevel,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map, String id) {
    return Student(
      id: id,
      name: map['name'] ?? '',
      lastName: map['lastName'] ?? '',
      instrument: map['instrument'] ?? '',
      academicLevel: map['academicLevel'] ?? '',
    );
  }
}
