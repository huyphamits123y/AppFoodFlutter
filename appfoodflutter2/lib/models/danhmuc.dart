
class DanhMuc{
  final int madanhmuc;
  final String hinhanh;
  final String diachi;
  final int rating;
  final String ten;

  DanhMuc({

    required this.madanhmuc,
    required this.hinhanh,
    required this.diachi,
    required this.rating,
    required this.ten,

  });
  factory DanhMuc.fromMap(Map<String, dynamic> json) => DanhMuc(
    madanhmuc: json["madanhmuc"],
    hinhanh: json["hinhanh"],
    diachi: json["diachi"],
    rating: json["rating"],
    ten: json["ten"]

  );
  Map<String, dynamic> toMap() =>{
    "madanhmuc": madanhmuc,
    "hinhanh": hinhanh,
    "diachi": diachi,
    "rating": rating,
    "ten": ten
  };
}