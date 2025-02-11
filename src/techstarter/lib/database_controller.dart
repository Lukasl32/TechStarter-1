import 'package:sqlite3/sqlite3.dart';

final db = sqlite3.open("./database.db");

void initializeDatabase(){
  if (db.select("SELECT name FROM sqlite_master WHERE type='table';").isEmpty) return; //Check if databse was already initialized

  db.execute(
    '''
    CREATE TABLE IF NOT EXISTS operators (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64),
      surname VARCHAR(64),
      rfid VARCHAR(12),
      language VARCHAR(2)
    );
    
    CREATE TABLE IF NOT EXISTS product (
      id INTEGER PRIMARY KEY AUTOINCREMENT
    );

    CREATE TABLE IF NOT EXISTS machines (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      number INTEGER UNIQUE,

      product INTEGER REFERENCES products(id)
    );
    
    CREATE TABLE IF NOT EXISTS defects (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      number INT,
      name VARCHAR(64),
      description VARCHAR(128),
      priority BOOL

      product INTEGER REFERENCES products(id)
    );

    CREATE TABLE IF NOT EXISTS logs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,

      operator INTEGER REFERENCES operators(id),
      machine INTEGER REFERENCES machines(id),
      product INTEGER REFERENCES products(id),
      defect INTEGER REFERENCES defects(id)
    );
    '''
  );
}