import 'package:sqlite3/sqlite3.dart';

// final db = sqlite3.open("./database.db");
final Database db = sqlite3.openInMemory(); //TODO: Change to .open() for showcase use

void initializeDatabase(){
  if (db.select("SELECT name FROM sqlite_master WHERE type='table';").isNotEmpty) return; //Check if databse was already initialized

  // Setup Databases
  db.execute(
    """
    BEGIN TRANSACTION;

    CREATE TABLE IF NOT EXISTS operators (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64),
      surname VARCHAR(64),
      rfid VARCHAR(12) UNIQUE,
      language VARCHAR(2)
    );
    
    CREATE TABLE IF NOT EXISTS product (
      id INTEGER PRIMARY KEY AUTOINCREMENT
    );

    CREATE TABLE IF NOT EXISTS machines (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      number INTEGER UNIQUE,

      product_id INTEGER REFERENCES products(id)
    );
    
    CREATE TABLE IF NOT EXISTS defects (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      number INT,
      name VARCHAR(64),
      description VARCHAR(128),
      priority BOOL

      product_id INTEGER REFERENCES products(id)
    );

    CREATE TABLE IF NOT EXISTS logs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,

      operator_id INTEGER REFERENCES operators(id),
      machine_id INTEGER REFERENCES machines(id),
      product_id INTEGER REFERENCES products(id),
      defect_id INTEGER REFERENCES defects(id)
    );

    COMMIT TRANSACTION;
    """
  );

  // Fill database with example data
  db.execute(
    """
    INSERT INTO operators (name, surname, rfid, language)
    VALUES ('Jane', 'Doe', '0B00611CACDA', 'CZ'),
           ('John', 'Doe', '0B00611CB0C6', 'EN');
    """
  );
}

class Operator {
  int id;
  String name, surname, rfid, language;

  Operator(this.id, this.name, this.surname, this.rfid, this.language);

  static Operator? fetchByRfid(String rfid){
    var queryResponse = db.select(
      """
      SELECT id, name, surname, language 
      FROM operators 
      WHERE rfid='$rfid'
      LIMIT 1    
      """
    ).rows;

    if (queryResponse.isNotEmpty) {
      var record = queryResponse[0];
      return Operator(
        record[0] as int, 
        record[1] as String, 
        record[2] as String, 
        rfid, 
        record[3] as String
      );
    }
    else {
      return null;
    }
  }
  static Operator? fetchById(int id){
    var queryResponse = db.select(
      """
      SELECT name, surname, rfid, language 
      FROM operators 
      WHERE id='$id'
      LIMIT 1    
      """
    ).rows;
  
    if (queryResponse.isNotEmpty) {
      var record = queryResponse[0];
      return Operator(
        id,
        record[0] as String, 
        record[1] as String, 
        record[2] as String, 
        record[3] as String
      );
    }
    else {
      return null;
    }
  }
}