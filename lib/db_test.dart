import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Helperx {
  Future<Database> database;
  // ignore: non_constant_identifier_names
  Helper() {
    this.setUpDb();
  }

  setUpDb() async {
    this.database = openDatabase(
      join(await getDatabasesPath(), 'waterbilling.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE waterbilling(id INTEGER PRIMARY KEY, accountname TEXT, accountno TEXT,previousreading TEXT,homeaddress TEXT,currentreading TEXT,model TEXT,meternumber TEXT,status TEXT)");
      },
      version: 1,
    );
  }

  Future<bool> insertReading(Reading reading) async {
    // Get a reference to the database.
    Database db = await database;
    try {
      if (db == null) {
        database = await setUpDb();
        db = await database;
      }
      print(reading);

      // Insert the Dog into the correct table. Also specify the
      // `conflictAlgorithm`. In this case, if the same dog is inserted
      // multiple times, it replaces the previous data.
      await db.insert(
        'waterbilling',
        reading.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Reading>> readings() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('waterbilling');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Reading(
        id: maps[i]['id'],
        status: maps[i]['status'],
        accountname: maps[i]['accountname'],
        accountno: maps[i]['accountname'],
        model: maps[i]['model'],
        previousreading: maps[i]['previousname'],
        currentreading: maps[i]['current'],
        homeaddress: maps[i]['homeaddress'],
      );
    });
  }

  Future<void> updateReading(Reading reading) async {
    final db = await database;
    await db.update(
      'waterbilling',
      reading.toMap(),
      where: "id = ?",
      whereArgs: [reading.id],
    );
  }

  Future<void> deleteReading(int id) async {
    final db = await database;
    await db.delete(
      'waterbilling',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  var reading = Reading(
    id: 0,
    accountname: 'Fido',
    meternumber: '566778',
  );
}

class Reading {
  final int id;
  final String accountname;
  final String accountno;
  final String model;
  final String previousreading;
  final String currentreading;
  final String meternumber;
  final String homeaddress;
  final String status;

  Reading(
      {this.id,
      this.accountname,
      this.accountno,
      this.currentreading,
      this.homeaddress,
      this.meternumber,
      this.model,
      this.status,
      this.previousreading});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accountname': accountname,
      'accountno': accountno,
      'model': model,
      'previousreading': previousreading,
      'currentreading': currentreading,
      'meternumber': meternumber,
      'homeaddress': homeaddress,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Reading{id: $id, accountno: $accountno, accountname: $accountname,status: $status,meternumber:$meternumber,previousreading:$previousreading,currentreading:$currentreading,model:$model}';
  }
}
