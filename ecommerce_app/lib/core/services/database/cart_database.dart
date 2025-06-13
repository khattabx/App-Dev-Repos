import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  CartDatabase._();
  static final CartDatabase db = CartDatabase._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableCartProduct (
            $columnName TEXT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnPrice TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            $columnProductId TEXT NOT NULL)
        ''');
      },
    );
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);
    
    return maps.isNotEmpty
        ? maps.map((map) => CartProductModel.fromJson(map)).toList()
        : [];
  }

  Future<void> insert(CartProductModel model) async {
    var dbClient = await database;

    await dbClient.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
