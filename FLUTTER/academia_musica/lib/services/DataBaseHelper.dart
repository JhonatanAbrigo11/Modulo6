import 'package:academia_musica/models/student.dart';
import 'package:academia_musica/models/teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Databasehelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference studentCollection = _firestore.collection(
    'student',
  );

  static final CollectionReference teacherCollection = _firestore.collection(
    'teacher',
  );

  Future<void> insertStudent(Student student) async {
    await studentCollection.add(student.toMap());
  }

  Future<List<Student>> getStudent() async {
    final snapshot = await studentCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Student.fromMap(data, doc.id);
    }).toList();
  }

  Future<void> updateStudent(Student student) async {
    await studentCollection.doc(student.id).update(student.toMap());
  }

  Future<void> deleteStudent(String id) async {
    await studentCollection.doc(id).delete();
  }

  Future<List<Student>> searchStudentsByName(String name) async {
    final querySnapshot = await studentCollection
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: name + 'z') // Para hacer búsqueda tipo LIKE
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Student.fromMap(data, doc.id);
    }).toList();
  }

  //Teacher;

  Future<void> insertTeacher(Teacher teacher) async {
    await teacherCollection.add(teacher.toMap());
  }

  Future<List<Teacher>> getTeachers() async {
    final snapshot = await teacherCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Teacher.fromMap(data, doc.id);
    }).toList();
  }

  Future<void> updateTeacher(Teacher teacher) async {
    await teacherCollection.doc(teacher.id).update(teacher.toMap());
  }

  Future<void> deleteTeacher(String id) async {
    await teacherCollection.doc(id).delete();
  }

  Future<List<Teacher>> searchTeachersByName(String name) async {
    final querySnapshot = await teacherCollection
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: name + 'z') // Para hacer búsqueda tipo LIKE
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Teacher.fromMap(data, doc.id);
    }).toList();
  }
}

/*import 'package:academia_musica/models/student.dart';
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
}*/
