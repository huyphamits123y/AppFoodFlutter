
class DonHang{
   int? madonhang;
   String hinhanh;
   String ten;
   String tennhahang;
   int gia;
   int? soluong;
   int tongtien;
   String taikhoan;

  DonHang({

    required this.madonhang,
    required this.hinhanh,
    required this.ten,
    required this.tennhahang,
    required this.gia,
    required this.soluong,
    required this.tongtien,
    required this.taikhoan,

  });
  factory DonHang.fromMap(Map<String, dynamic> json) => DonHang(
      madonhang: json["madonhang"],
      hinhanh: json["hinhanh"],
      ten: json["ten"],
      tennhahang: json["tennhahang"],
      gia: json["gia"],
      soluong: json["soluong"],
      tongtien: json["tongtien"],
      taikhoan: json["taikhoan"],

  );
  Map<String, dynamic> toMap() =>{
    "madonhang": madonhang,
    "hinhanh": hinhanh,
    "ten": ten,
    "tennhahang": tennhahang,
    "gia": gia,
    "soluong": soluong,
    "tongtien": tongtien,
    "taikhoan": taikhoan
  };
}