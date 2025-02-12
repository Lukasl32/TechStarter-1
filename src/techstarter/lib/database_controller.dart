import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

// final db = sqlite3.open("./database.db");
final Database db = sqlite3.openInMemory(); //TODO: Change to .open() for showcase use

void initializeDatabase(){
  if (db.select("SELECT name FROM sqlite_master WHERE type='table';").isNotEmpty) return; //Check if databse was already initialized

  // Setup Databases
  db.execute (
    """
    CREATE TABLE IF NOT EXISTS operators (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64),
      surname VARCHAR(64),
      rfid VARCHAR(12) UNIQUE,
      language VARCHAR(2)
    );
    
    CREATE TABLE IF NOT EXISTS products (
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
      priority BOOL,

      product_id INTEGER REFERENCES products(id)
    );

    CREATE TABLE IF NOT EXISTS logs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,

      operator_id INTEGER REFERENCES operators(id),
      machine_id INTEGER REFERENCES machines(id),
      product_id INTEGER REFERENCES products(id),
      defect_id INTEGER REFERENCES defects(id)
    );
    """
  );

  // Fill database with example data
  db.execute(
    """
    INSERT INTO operators (name, surname, rfid, language)
    VALUES ('Jane', 'Doe', '0B00611CACDA', 'CZ'),
           ('John', 'Doe', '0B00611CB0C6', 'EN');

    INSERT INTO products (id)
    VALUES (1);

    INSERT INTO machines (number, product_id)
    VALUES (1, 1);

    INSERT INTO defects (number, name, description, priority, product_id)
    VALUES (1, 'Name1', 'description1', true, 1),
           (2, 'Name2', 'description2', true, 1),
           (3, 'Name3', 'description3', true, 1),
           (4, 'Name4', 'description4', true, 1),
           (5, 'Name5', 'description5', false, 1),
           (6, 'Name6', 'description6', false, 1),
           (7, 'Name7', 'description7', false, 1),
           (8, 'Name8', 'description8', false, 1);
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
class Product {
  int id;

  Product(this.id);

  static Product? fetchById(int id) {
    var queryResponse = db.select(
      """
      SELECT id
      FROM products 
      WHERE id='$id'
      LIMIT 1
      """
    ).rows;

    if (queryResponse.isEmpty) return null;
    var record = queryResponse[0];
    return Product(
      record[0] as int
    );
  }
}
class Machine {
  int id, number;
  Product product;
  List<Defect>? defects;

  Machine(this.id, this.number, this.product, this.defects);

  static Machine? fetchById(int id){
    var queryResponse = db.select(
      """
      SELECT number, product_id
      FROM machines
      WHERE id='$id'
      LIMIT 1    
      """
    ).rows;


    if (queryResponse.isEmpty) return null;
    var record = queryResponse[0];
    Product? product = Product.fetchById(record[1] as int);
    if (product == null) return null;
    List<Defect> defects = Defect.fetchByProduct(product);
    return Machine(
      id,
      record[0] as int,
      product,
      defects
    );
  }
}
class Defect {
  int id, number;
  String name, description;
  bool priority;
  Product product;

  Defect(this.id, this.number, this.name, this.description, this.priority, this.product);

  static Defect? fetchById(int id){
    var queryResponse = db.select(
      """
      SELECT number, name, description, priority, product_id
      FROM defects 
      WHERE id='$id'
      LIMIT 1    
      """
    ).rows;
  

    if (queryResponse.isEmpty) return null;
    var record = queryResponse[0];
    Product? product = Product.fetchById(record[4] as int);
    if (product == null) return null;
    return Defect(
      id,
      record[0] as int,
      record[1] as String,
      record[2] as String,
      record[3] as bool,
      product
    );
  }

  static List<Defect> fetchByProduct(Product product) {
    var queryResponses = db.select(
      """
      SELECT id, number, name, description, priority
      FROM defects 
      WHERE product_id='${product.id}'  
      """
    ).rows;
    
    List<Defect> defects = [];

    for (var defect in queryResponses) {
      defects.add(Defect(
        defect[0] as int,
        defect[1] as int,
        defect[2] as String,
        defect[3] as String,
        defect[4] as int == 0 ? false : true,
        product
      ));
    }

    return defects;
  }
}
