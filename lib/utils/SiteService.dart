import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Entity/SiteEntity.dart';


/*
 * 站点对象服务类
 * @author: 周韬
 * @date: 2019-9-21
 */
class SiteService {
  static final SiteService _instance = new SiteService.internal();

  factory SiteService() => _instance;

  final String tableName = 'site';
  final String columnId = 'id';
  final String siteName = 'siteName';
  final String siteClassification = 'siteClassifiacation';
  final String siteContent = 'siteContent';

  static Database _db;

  SiteService.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'viewer.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $siteName TEXT, $siteClassification TEXT, $siteContent TEXT)');
  }

  // 插入数据 
  Future<int> insertSite(SiteEntity siteEntity) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableName, siteEntity.toJson());

    return result;
  }

  Future<List> selectSite({int limit, int offset}) async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableName,
      columns: [columnId, siteName, siteClassification, siteContent],
      limit: limit,
      offset: offset,
    );
    List<SiteEntity> siteEntity = [];
    result.forEach((item) => siteEntity.add(SiteEntity.fromSql(item)));
    return siteEntity;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<SiteEntity> getSite(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableName,
        columns: [columnId, siteName, siteClassification, siteContent],
        where: '$id = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return SiteEntity.fromSql(result.first);
    }

    return null;
  }

  Future<int> deleteSite(String args) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$siteName = ?', whereArgs: [args]);
  }

  Future<int> updateSite(SiteEntity siteEntity) async {
    var dbClient = await db;
    return await dbClient.update(tableName, siteEntity.toJson(),
        where: "$columnId = ?", whereArgs: [siteEntity.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}