import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';

class  DBProvider{

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
    
  }

  Future<Database> initDB() async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "ProductsDB.db");
    print(path);

    return await openDatabase(
      path,
      version: 3,
      onCreate: (Database db, int version) async{

        await db.execute('''
          CREATE TABLE Products(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            nombre TEXT,
            precio INTEGER,
            disponibilidad INTEGER,
            imagen TEXT
          )       
        ''');
      }

    );

  }

  Future<int?> nuevoProducto(ProductModel nuevoProducto ) async {
    final db = await database;
    
    final res = await db!.insert('Products', nuevoProducto.toJson());
    print(res);
    return res;
  }

  Future<ProductModel?> getProductById(int id) async {
    final db = await database;
    
    final res = await db?.query('Products', where: 'id = ?', whereArgs: [id]);

    if(res != null)
    {
      return ProductModel.fromJson(res.first);
    }

    return null;
  }

  Future<List<ProductModel>> getTodosLosProductos() async {
    final db = await database;
    
    final res = await db!.query('Products');

    return res.map((p) => ProductModel.fromJson(p)).toList();
    
  }

  Future<int?> updateProduct(ProductModel pro) async {
    final db = await database;
    
    final res = await db?.update('Products', pro.toJson(), where: 'id = ?', whereArgs: [pro.id]);

    return res;
  } 

  Future<int?> deleteProduct(int id) async{
    final db = await database; 
    final res = await db?.delete('Products', where: 'id = ?', whereArgs: [id]);

    return res;
  }

}