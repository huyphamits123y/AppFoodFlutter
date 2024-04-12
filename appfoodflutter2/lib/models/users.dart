class users{
  final String taikhoan;
  final String matkhau;

  users({

    required this.taikhoan,
    required this.matkhau,

  });
  factory users.fromMap(Map<String, dynamic> json) => users(
    taikhoan: json["taikhoan"],
    matkhau: json["matkhau"],

  );
  Map<String, dynamic> toMap() =>{
    "taikhoan": taikhoan,
    "matkhau": matkhau,
  };
}