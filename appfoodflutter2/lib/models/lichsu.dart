
class LichSu{
  int? id;
  String hinhanh;
  String ten;
  String tennhahang;
  int gia;
  int soluong;
  int tongtien;
  String taikhoan;

  LichSu({

    required this.id,
    required this.hinhanh,
    required this.ten,
    required this.tennhahang,
    required this.gia,
    required this.soluong,
    required this.tongtien,
    required this.taikhoan,

  });
  factory LichSu.fromMap(Map<String, dynamic> json) => LichSu(
    id: json["id"],
    hinhanh: json["hinhanh"],
    ten: json["ten"],
    tennhahang: json["tennhahang"],
    gia: json["gia"],
    soluong: json["soluong"],
    tongtien: json["tongtien"],
    taikhoan: json["taikhoan"],

  );
  Map<String, dynamic> toMap() =>{
    "id": id,
    "hinhanh": hinhanh,
    "ten": ten,
    "tennhahang": tennhahang,
    "gia": gia,
    "soluong": soluong,
    "tongtien": tongtien,
    "taikhoan": taikhoan
  };

}