import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Entity/ClassificationEntity.dart';


/*
 * 站点分类对象服务类
 * @author: 周韬
 * @date: 2019-9-21
 */

class ClassificationService {
  static final ClassificationService _instance = new ClassificationService.internal();

  factory ClassificationService() => _instance;

  final String tableName = 'classification';

  final String columnId = 'id';
  final String classificationName = 'classificationName';


  static Database _db;

  ClassificationService.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    print(databasesPath);
    String path = join(databasesPath, 'viewer.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $classificationName TEXT)');
  }

  // 插入数据 
  Future<int> saveClassification(ClassificationEntity classificationEntity) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableName, classificationEntity.toJson());

    return result;
  }

  Future<List> selectClassification({int limit, int offset}) async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableName,
      columns: [columnId, classificationName],
      limit: limit,
      offset: offset,
    );
    List<ClassificationEntity> siteEntity = [];
    result.forEach((item) => siteEntity.add(ClassificationEntity.fromSql(item)));
    return siteEntity;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<ClassificationEntity> getClassification(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableName,
        columns: [columnId, classificationName],
        where: '$id = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return ClassificationEntity.fromSql(result.first);
    }

    return null;
  }

  Future<int> deleteClassification(String args) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$classificationName = ?', whereArgs: [args]);
  }

  Future<int> updateClassification(ClassificationEntity classificationEntity) async {
    var dbClient = await db;
    return await dbClient.update(tableName, classificationEntity.toJson(),
        where: "$columnId = ?", whereArgs: [classificationEntity.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}