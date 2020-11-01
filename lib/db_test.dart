import 'dart:io';

import 'package:flutter_water/models/account_data.dart';
import 'package:flutter_water/models/reading.dart';
import 'package:sqflite/sqflite.dart';

class Helperx {
  static Helperx _databaseHelper;
  static Database _database;

  String waterBillingTable = 'waterbilling';
  String waterBillingAccountsData = 'waterbillingaccountsdata';
  String id = 'id';
  String accountname = 'accountname';
  String accountno = 'accountno';
  String units = 'units';
  String previousreading = 'previousreading';
  String currentreading = 'currentreading';
  String meternumber = 'meternumber';
  String homeaddress = 'homeaddress';
  String status = 'status';
  String isPosted = 'isPosted';

  Helperx._createInstance();

  factory Helperx() {
    if (_databaseHelper == null) {
      _databaseHelper = Helperx._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = new Directory(await getDatabasesPath());
    String path = directory.path + "waterbilling.db";

    var waterBillingDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return waterBillingDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $waterBillingTable($id INTEGER PRIMARY KEY AUTOINCREMENT, $accountname TEXT, $accountno TEXT, $previousreading TEXT, $homeaddress TEXT, $currentreading TEXT, $model TEXT, $meternumber TEXT, $status TEXT, $isPosted TEXT)');
    await db.execute(
        'CREATE TABLE $waterBillingAccountsData($id INTEGER PRIMARY KEY AUTOINCREMENT, created_at TEXT, updated_at TEXT, account_number TEXT, name TEXT, house_number TEXT, street_name TEXT, area TEXT, meter_number TEXT, account_id TEXT, model TEXT, status TEXT, route_id TEXT, meter_id TEXT, reading TEXT, reader TEXT)');
  }

  Future<List<Map<String, dynamic>>> getReadingsList() async {
    Database db = await this.database;
    var result = await db.query(waterBillingTable, orderBy: '$id ASC');
    return result;
  }

  Future<List<Map<String, dynamic>>> getSavedAccountsData() async {
    Database db = await this.database;
    var result = await db.query(waterBillingAccountsData);
    return result;
  }

  Future<int> saveReading(Reading reading) async {
    Database db = await this.database;
    var result = await db.insert(waterBillingTable, reading.toMap());
    return result;
  }

  Future<int> saveAccounts(AccountData accountData) async {
    Database db = await this.database;
    var result =
        await db.insert(waterBillingAccountsData, accountData.toJson());
    return result;
  }

  Future<int> updateReading(Reading reading) async {
    var db = await this.database;
    var result = await db.update(
      waterBillingTable,
      reading.toMap(),
      where: '$id = ?',
      whereArgs: [reading.id],
    );
    return result;
  }

  Future<bool> deleteAccountsData() async {
    try {
      Database db = await this.database;
      var result = await db.delete(waterBillingAccountsData);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
