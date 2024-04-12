
class MonAn{
  final int mamonan;
  final String hinhanh;
  final String ten;
  final int gia;
  final int soluong;
  final int madanhmuc;

  MonAn({

    required this.mamonan,
    required this.hinhanh,
    required this.ten,
    required this.gia,
    required this.soluong,
    required this.madanhmuc,

  });
  factory MonAn.fromMap(Map<String, dynamic> json) => MonAn(
      mamonan: json["mamonan"],
      hinhanh: json["hinhanh"],
      ten: json["ten"],
      gia: json["gia"],
      soluong: json["soluong"],
      madanhmuc: json["madanhmuc"]

  );
  Map<String, dynamic> toMap() =>{
    "mamonan": mamonan,
    "hinhanh": hinhanh,
    "ten": ten,
    "gia": gia,
    "soluong": soluong,
    "madanhmuc": madanhmuc
  };
}