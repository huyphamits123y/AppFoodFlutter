import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '';
import '../models/danhmuc.dart';
import '../models/donhang.dart';
import '../models/lichsu.dart';
import '../models/monan.dart';

import '../models/users.dart';



class DatabaseHelper{
  final databaseName = 'note.db';
  String noteTable =
      "CREATE TABLE notes (taikhoan TEXT PRIMARY KEY, matkhau TEXT NOT NULL)";
  String danhmucTable =
      "CREATE TABLE danhmuc(madanhmuc INTEGER PRIMARY KEY, hinhanh TEXT, diachi TEXT, rating INTEGER, ten TEXT)";
  String monanTable =
      "CREATE TABLE monan(mamonan INTEGER PRIMARY KEY, hinhanh TEXT, ten TEXT, gia INTEGER, soluong INTEGER, madanhmuc INTEGER, FOREIGN KEY (madanhmuc) REFERENCES danhmuc(madanhmuc))";
  String donhangTable =
      "CREATE TABLE donhang(madonhang INTEGER PRIMARY KEY AUTOINCREMENT,  hinhanh TEXT, ten TEXT, tennhahang TEXT, gia INTEGER, soluong INTEGER, tongtien INTEGER, taikhoan TEXT,  FOREIGN KEY (taikhoan) REFERENCES notes(taikhoan))";

  String lichsuTable =
      "CREATE TABLE lichsu(id INTEGER PRIMARY KEY AUTOINCREMENT,  hinhanh TEXT, ten TEXT, tennhahang TEXT, gia INTEGER, soluong INTEGER, tongtien INTEGER, taikhoan TEXT,  FOREIGN KEY (taikhoan) REFERENCES notes(taikhoan))";
  List<MonAn> monanValues = [
     MonAn(
      mamonan: 1,
      hinhanh: 'assets/images/img_1.png',
      ten: 'Burrito',
      gia: 50000,
      soluong: 0,
      madanhmuc: 1,
    ),
    MonAn(
      mamonan: 2,
      hinhanh: 'assets/images/img_2.png',
      ten: 'Steak',
      gia: 60000,
      soluong: 0,
      madanhmuc: 1,
    ),
    MonAn(
      mamonan: 3,
      hinhanh: 'assets/images/img_3.png',
      ten: 'Pasta',
      gia: 70000,
      soluong: 0,
      madanhmuc: 2,
    ),
    MonAn(
      mamonan: 4,
      hinhanh: 'assets/images/img_4.png',
      ten: 'Ramen',
      gia: 50000,
      soluong: 0,
      madanhmuc: 2,
    ),
    MonAn(
      mamonan: 5,
      hinhanh: 'assets/images/img_5.png',
      ten: 'Pancakes',
      gia: 50000,
      soluong: 0,
      madanhmuc: 3,
    ),
    MonAn(
      mamonan: 6,
      hinhanh: 'assets/images/img_6.png',
      ten: 'Pizza',
      gia: 50000,
      soluong: 0,
      madanhmuc: 3,
    ), MonAn(
      mamonan: 7,
      hinhanh: 'assets/images/img_7.png',
      ten: 'Salmon Salad',
      gia: 50000,
      soluong: 0,
      madanhmuc: 4,
    ),
    MonAn(
      mamonan: 8,
      hinhanh: 'assets/images/img_8.png',
      ten: 'Burger',
      gia: 50000,
      soluong: 0,
      madanhmuc: 5,
    ),



    // Add more instances as needed
  ];
  List<DanhMuc> danhmucValues = [
    DanhMuc(
      madanhmuc: 1,
      hinhanh: 'assets/images/img_9.png',
      diachi: 'Cala Montjoi, 17480 Roses, Girona, Tây Ban Nha.',
      rating: 5,
      ten: 'El Bulli',
    ),
    DanhMuc(
      madanhmuc: 2,
      hinhanh: 'assets/images/img_10.png',
      diachi: 'Via Stella, 22, 41121 Modena MO, Ý.',
      rating: 4,
      ten: 'Osteria Francescana',
    ),
    DanhMuc(
      madanhmuc: 3,
      hinhanh: 'assets/images/img_11.png',
      diachi: ' Refshalevej 96, 1432 København K, Đan Mạch',
      rating: 4,
      ten: 'Noma',
    ),
    DanhMuc(
      madanhmuc: 4,
      hinhanh: 'assets/images/img_12.png',
      diachi: 'Santa Isabel 376, Miraflores, Lima, Peru.',
      rating: 2,
      ten: 'Central',
    ),
    DanhMuc(
      madanhmuc: 5,
      hinhanh: 'assets/images/img_13.png',
      diachi: '11 Madison Ave, New York, NY 10010, Hoa Kỳ.',
      rating: 3,
      ten: 'Eleven Madison Park',
    ),
    // Add more instances as needed
  ];

  Future<Database> initDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async{
      await db.execute(noteTable);

      await db.execute(danhmucTable);
      await db.execute(monanTable);
      await db.execute(donhangTable);
      await db.execute(lichsuTable);
      for (DanhMuc danhmuc in danhmucValues) {
        await db.insert('danhmuc', danhmuc.toMap());
      }
      for (MonAn monan in monanValues) {
        await db.insert('monan', monan.toMap());
      }

    });
  }
  Future<int> createNote(users note) async{
    final Database db = await initDB();
    return db.insert('notes', note.toMap());
  }
  Future<int> createDonHang(DonHang dh) async{
    final Database db = await initDB();
    return db.insert('donhang', dh.toMap());
  }

  Future<int> createDonHang1( String hinhanh, String ten, String tennhahang, int gia, int soluong, int tongtien, String taikhoan) async {
    final Database db = await initDB();
    final Map<String, dynamic> donHangMap = {
      'hinhanh': hinhanh,
      'ten': ten,
      'tennhahang': tennhahang,
      'gia': gia,
      'soluong': soluong,
      'tongtien': tongtien,
      'taikhoan': taikhoan,
    };
    return db.insert('donhang', donHangMap);
  }

  Future<int> createLichSu(LichSu ls) async{
    final Database db = await initDB();
    return db.insert('lichsu', ls.toMap());
  }
  Future<List<LichSu>> getLichSu(String taikhoan) async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query(
      'lichsu',
      where: 'taikhoan = ?',
      whereArgs: [taikhoan],
    );
    return result.map((e) => LichSu.fromMap(e)).toList();
  }
  Future<List<users>> getNotes() async{
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('notes');
    return result.map((e) => users.fromMap(e)).toList();
  }

  Future<List<DanhMuc>> getRestaurant() async{
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('danhmuc');
    return result.map((e) => DanhMuc.fromMap(e)).toList();
  }

  Future<List<DanhMuc>> getDanhMucs() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('danhmuc');
    return result.map((e) => DanhMuc.fromMap(e)).toList();
  }
  Future<List<MonAn>> getMonAn(int madanhmuc) async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query(
      'monan',
      where: 'madanhmuc = ?',
      whereArgs: [madanhmuc],
    );
    return result.map((e) => MonAn.fromMap(e)).toList();
  }
  Future<List<DanhMuc>> getDanhMucss(int madanhmuc) async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query(
      'danhmuc',
      where: 'madanhmuc = ?',
      whereArgs: [madanhmuc],
    );
    return result.map((e) => DanhMuc.fromMap(e)).toList();
  }
  Future<List<DonHang>> getDonHang(String taikhoan) async{
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query(
        'donhang',
        where: 'taikhoan = ?',
        whereArgs: [taikhoan],
    );
    return result.map((e) => DonHang.fromMap(e)).toList();

  }
  Future<void> updateDonHang(String taikhoan, int soluong, int tongtien) async {
    final Database db = await initDB();
    await db.update(
      'donhang',
      {
        'soluong': soluong,
        'tongtien': tongtien,
      },
      where: 'taikhoan = ?',
      whereArgs: [taikhoan],
    );
  }
  Future<void> updateDonHang1(String taikhoan, int soluong, int tongtien, String hinhanh, String ten, String tennhahang, int gia) async {
    final Database db = await initDB();
    await db.update(
      'donhang',
      {
        'soluong': soluong,
        'tongtien': tongtien,
        'hinhanh': hinhanh,
        'ten': ten,
        'tennhahang': tennhahang,
        'gia': gia

      },
      where: 'taikhoan = ?',
      whereArgs: [taikhoan],
    );
  }
  Future<void> deleteDonHangByTaiKhoan(String taikhoan) async {
    final Database db = await initDB();

    await db.delete(
      'donhang',
      where: 'taikhoan = ?',
      whereArgs: [taikhoan],
    );
  }





}