import 'package:sqflite/sqflite.dart';

late Database db;

void open() async {
  db = await openDatabase('my_db.db');
}

Future<List> readDatabase() async {
  var result = await db.query('my_table');
  return result;
}
