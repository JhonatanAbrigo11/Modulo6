import 'package:academia_musica/models/student.dart';
import 'package:academia_musica/models/teacher.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final Databasehelper _instancia = Databasehelper.internal();
  factory Databasehelper() => _instancia;
  static Database? _database;
  Databasehelper.internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'music.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, lastName TEXT,instrument TEXT, academicLevel TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            "CREATE TABLE teacher (id INTEGER PRIMARY KEY, name TEXT, lasName TEXT, specialty TEXT)",
          );
        }
      },
    );
  }

  //Metodo insertar
  Future<void> insertStudent(Student student) async {
    final db = await database;
    await db.insert(
      'student',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Metodo obtener
  Future<List<Student>> getStudent() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('student');
    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        lastName: maps[i]['lastName'],
        instrument: maps[i]['instrument'],
        academicLevel: maps[i]['academicLevel'],
      );
    });
  }

  //Metodo actualizar
  Future<void> updateStudent(Student student) async {
    final db = await database;
    await db.update(
      'student',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  //Metodo eliminar
  Future<void> deleteStudent(int id) async {
    final db = await database;
    await db.delete('student', where: 'id = ?', whereArgs: [id]);
  }

  //Metodo para buscar estudiante por nombre o conicidencia
  Future<List<Student>> searchStudentsByName(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'student',
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );
    return maps.map((map) => Student.fromMap(map)).toList();
  }

  //Profesores

  //Insertar
  Future<void> insertTeacher(Teacher teacher) async {
    final db = await database;
    await db.insert(
      'teacher',
      teacher.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Teacher>> getTeachers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('teacher');
    return List.generate(maps.length, (i) {
      return Teacher.fromMap(maps[i]);
    });
  }

  Future<void> updateTeacher(Teacher teacher) async {
    final db = await database;
    await db.update(
      'teacher',
      teacher.toMap(),
      where: 'id = ?',
      whereArgs: [teacher.id],
    );
  }

  Future<void> deleteTeacher(int id) async {
    final db = await database;
    await db.delete('teacher', where: 'id=?', whereArgs: [id]);
  }

  Future<List<Teacher>> searchTeachersByName(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'teacher',
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );
    return maps.map((map) => Teacher.fromMap(map)).toList();
  }
}
