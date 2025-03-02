import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart';

// final db = sqlite3.open("./database.db");
final Database db = sqlite3.openInMemory(); //TODO: Change to .open() for showcase use

void initializeDatabase(){
  if (db.select("SELECT name FROM sqlite_master WHERE type='table';").isNotEmpty) return; //Check if database was already initialized

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
      id INTEGER PRIMARY KEY AUTOINCREMENT,

      defect_0 INTEGER REFERENCES defects(id),
      defect_1 INTEGER REFERENCES defects(id),
      defect_2 INTEGER REFERENCES defects(id),
      defect_3 INTEGER REFERENCES defects(id),
      defect_4 INTEGER REFERENCES defects(id),
      defect_5 INTEGER REFERENCES defects(id),
      defect_6 INTEGER REFERENCES defects(id),
      defect_7 INTEGER REFERENCES defects(id)
    );

    CREATE TABLE IF NOT EXISTS machines (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      number INTEGER UNIQUE,

      product_id INTEGER REFERENCES products(id)
    );
    
    CREATE TABLE IF NOT EXISTS defects (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      number INTEGER UNIQUE,

      cz_name VARCHAR(64) NOT NULL,
      uk_name VARCHAR(64) NOT NULL,
      HU_name VARCHAR(64) NOT NULL,

      description VARCHAR(128),
      count INTEGER NOT NULL DEFAULT 0
    );
    """
  );

  // Fill database with example data
  db.execute(
    """
    INSERT INTO operators (name, surname, rfid, language)
    VALUES ('Jane', 'Doe', '0B00611CACDA', 'CZ'),
           ('John', 'Doe', '0B00611CB0C6', 'UK');

    INSERT INTO products (id, defect_0, defect_1, defect_2, defect_3, defect_4, defect_5, defect_6, defect_7)
    VALUES (1, 1, 2, 3, 4, 5, 6, 7, 8);

    INSERT INTO machines (number, product_id)
    VALUES (1, 1);

    INSERT INTO defects (number, cz_name, uk_name, hu_name)
    VALUES (101010, 'deformace', 'Деформації', 'Deformáció'),
           (101020, 'chybějící zálisek', 'відсутня вставка', 'hiányzó betét'),
           (101030, 'jiná vada', 'Інший дефект', 'Egyéb hiba'),
           (101040, 'nedolité', 'без доливання', 'Feltöltés nélkül'),
           (101050, 'prasklé', 'Тріщини', 'Dilis'),
           (101060, 'propadlé', 'Затонулих', 'Elsüllyedt'),
           (101070, 'protlačené vyhazovače', 'Екструзійні ежектори', 'Extrudáló kidobók'),
           (101080, 'rozjezd výroby', 'Запуск виробництва', 'A gyártás megkezdése'),
           (101090, 'spáleniny', 'Бернс', 'Burns'),
           (101100, 'studený spoj', 'Холодний суглоб', 'Hideg ízület'),
           (101110, 'špatně opracované', 'погано оброблений', 'rosszul megmunkált'),
           (101120, 'vadný rozměr', 'Дефектний розмір', 'Hibás méret'),
           (101130, 'vlas od vtoku', 'Волосинка з вхідного отвору', 'Egy hajszál a bemeneti nyílásból'),
           (101140, 'záměna materiálu', 'Заміна матеріалу', 'Anyaghelyettesítés'),
           (101150, 'zástřik', 'Ін''єкцій', 'injekció'),
           (101160, 'strojem', 'Машина', 'Gép'),
           (102020, 'lesklé skvrny', 'блискучі плями, ', 'Fényes foltok'),
           (102030, 'mastné', 'Жирні', 'Zsíros'),
           (102040, 'nečistoty v materiálu', 'Домішки в матеріалі', 'Szennyeződések az anyagban'),
           (102050, 'neprobarvené', 'незабарвлений', 'színtelen'),
           (102060, 'páry', 'Пари', 'Párok'),
           (102070, 'poškozený dezén', 'Пошкоджений малюнок протектора', 'Sérült futófelület mintázat'),
           (102080, 'poškrábané', 'Подряпав', 'Karcos'),
           (102090, 'stříbření', 'Сріблення', 'Ezüstözés'),
           (102100, 'šlíry', 'Schlieres', 'Schlieres'),
           (500010, 'odlupující se chrom', 'пілінг хрому', 'hámló króm'),
           (500020, 'špatně opracované', 'погано оброблений', 'rosszul megmunkált'),
           (500030, 'ostatní vada galvaniky', 'Інші дефекти гальванічного покриття', 'A galvanizálás egyéb hibái'),
           (500040, 'puchýře', 'Пухирі', 'Hólyagok'),
           (500050, 'vada surového kusu', 'Дефект необробленого шматка', 'Nyers darab hiba');
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
  List<int> defects;

  Product(this.id, this.defects);

  static Product? fetchById(int id) {
    var queryResponse = db.select(
      """
      SELECT id, defect_0, defect_1, defect_2, defect_3, defect_4, defect_5, defect_6, defect_7
      FROM products 
      WHERE id='$id'
      LIMIT 1
      """
    ).rows;

    if (queryResponse.isEmpty) return null;
    var record = queryResponse[0];

    List<int> defects = [];
    for (int i = 1; i <= 8; i++) {
      if (record[i] == null) continue;
      defects.add(record[i] as int);
    }

    return Product(
      record[0] as int,
      defects
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

    List<Defect> defects = [];
    for (int i = 0; i < product.defects.length; i++) {
      Defect? defect = Defect.fetchById(product.defects[i]);
      if (defect == null) continue;
      defects.add(defect);
    }

    return Machine(
      id,
      record[0] as int,
      product,
      defects
    );
  }
}
class Defect {
  int id, number, count;
  Map<String, String> name;
  String description;

  Defect(this.id, this.number, this.name, this.description, this.count);

  static Defect? fetchById(int id){
    var queryResponse = db.select(
      """
      SELECT number, cz_name, uk_name, hu_name, description, count
      FROM defects 
      WHERE id='$id'
      LIMIT 1
      """
    ).rows;

    if (queryResponse.isEmpty) return null;
    var record = queryResponse[0];

    return Defect(
      id,
      record[0] as int,
      {'CZ': record[1] as String, 'UK': record[2] as String, 'HU': record[3] as String},
      record[4].toString(),
      record[5] as int
    );
  }

  static Defect? fetchByNumber(int number){
    var queryResponse = db.select(
      """
      SELECT id, cz_name, uk_name, hu_name, description, count
      FROM defects 
      WHERE id='$number'
      LIMIT 1
      """
    ).rows;
  
    if (queryResponse.isEmpty) return null;
    var record = queryResponse[0];

    return Defect(
      record[0] as int,
      number,
      {'CZ': record[1] as String, 'UK': record[2] as String, 'HU': record[3] as String},
      record[4] as String,
      record[5] as int
    );
  }

  // Increment log's count by one
  void logDefect() {
    count += 1;
    db.execute(
      """
      UPDATE defects
      SET count = count + 1
      WHERE id = '$id';
      """
    );
  }
}