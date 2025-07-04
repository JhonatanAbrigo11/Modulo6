class Teacher {
  final int id;
  final String name;
  final String lasName;
  final String specialty;

  Teacher({
    required this.id,
    required this.name,
    required this.lasName,
    required this.specialty,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'lasName': lasName, 'specialty': specialty};
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'],
      name: map['name'],
      lasName: map['lasName'],
      specialty: map['specialty'],
    );
  }
}
