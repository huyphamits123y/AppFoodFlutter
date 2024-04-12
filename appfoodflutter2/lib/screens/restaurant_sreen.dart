//
//
// import 'package:appfoodflutter2/models/users.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../data/sqlite.dart';
// import '../models/danhmuc.dart';
// import '../models/donhang.dart';
// import '../models/monan.dart';
// import '../widgets/rating_start.dart';
//
// class RestaurantScreen extends StatefulWidget{
//   final int madanhmuc;
//   final String taikhoanText;
//   RestaurantScreen({required this.madanhmuc, required this.taikhoanText});
// @override
//   _RestaurantScreenState createState() =>_RestaurantScreenState();
// }
// class _RestaurantScreenState extends State<RestaurantScreen>{
//   final DatabaseHelper dbHelper = DatabaseHelper();
//   late Future<List<MonAn>> filteredDanhMucItems;
//   late Future<List<DanhMuc>> filteredDanhMuc;
//   String tennhahang= "";
//
//   final db = DatabaseHelper();
//
//   @override
//   void initState() {
//     super.initState();
//     filteredDanhMucItems = getFilteredDanhMucItems();
//     filteredDanhMuc = getFilteredDanhMuc();
//   }
//
//   Future<List<MonAn>> getFilteredDanhMucItems() async {
//     // Use your dbHelper method to fetch filtered MonAn items
//     return dbHelper.getMonAn(widget.madanhmuc);
//   }
//   Future<List<DanhMuc>> getFilteredDanhMuc() async {
//     return dbHelper.getDanhMucss(widget.madanhmuc);
//   }
//   _buildMenuItem(MonAn menuItem){
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             height:175.0,
//             width:175.0,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image:AssetImage(menuItem.hinhanh),
//                   fit: BoxFit.cover
//               ),
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//           ),
//           Container(
//             height: 175.0,
//             width: 175.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 gradient: LinearGradient(
//                     begin:  Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [
//                       Colors.black.withOpacity(0.3),
//                       Colors.black87.withOpacity(0.3),
//                       Colors.black54.withOpacity(0.3),
//                       Colors.black38.withOpacity(0.3),
//
//                     ]
//                 )
//             ),
//
//           ),
//           Positioned(
//             bottom: 65.0,
//             child: Column(
//               children: [
//                 Text(
//                   menuItem.ten,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2
//                   ),
//                 ),
//                 Text(
//                   "${menuItem.gia}",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//               bottom:10.0,
//               right:10.0,
//
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.circular(30.0)
//                 ),
//                 child: IconButton(
//                   icon: Icon(Icons.add),
//                   iconSize: 30.0,
//                   color: Colors.white,
//                   onPressed: () {
//                     db.createDonHang(DonHang(
//                       // madonhang INTEGER PRIMARY KEY AUTOINCREMENT,  hinhanh TEXT, ten TEXT, gia INTEGER, soluong INTEGER, tongtien INTEGER, taikhoan TEXT
//                       // taikhoan: taikhoan.text,
//                       // matkhau: matkhau.text,
//                       madonhang: null,
//                       hinhanh: menuItem.hinhanh,
//                       ten : menuItem.ten,
//                       tennhahang: tennhahang,
//                       gia: menuItem.gia,
//                       soluong: 1,
//                       tongtien: 0,
//                       taikhoan: widget.taikhoanText,
//                     ) as DonHang).whenComplete(() {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text("Thông báo"),
//                             content: Text("Đã thêm sản phẩm vào giỏ hàng."),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop(); // Đóng hộp thoại
//                                 },
//                                 child: Text("OK"),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//
//                     });
//
//                   },
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<DanhMuc>>(
//         future: filteredDanhMuc,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // or another loading indicator
//           }
//
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//
//           final danhMucList = snapshot.data!;
//           tennhahang = danhMucList[0].ten;
//           return Column(
//             children: [
//               Stack(
//                 children: [
//                   Hero(
//                     tag: danhMucList[0].hinhanh,
//                     child: Image(
//                       height: 220.0,
//                       width: MediaQuery.of(context).size.width,
//                       image: AssetImage(danhMucList[0].hinhanh),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back_ios),
//                           color: Colors.white,
//                           iconSize: 30.0,
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.favorite),
//                           color: Theme.of(context).primaryColor,
//                           iconSize: 35.0,
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child:Column(
//
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           danhMucList[0].ten,
//                           style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w600
//                           ),
//                         ),
//                         Text(
//                           "0.2 miles away",
//                           style: TextStyle(
//                               fontSize: 18.0
//                           ),
//                         ),
//                       ],
//                     ),
//                     RatingStarts(danhMucList[0].rating),
//                     SizedBox(height:6.0),
//                     Text(
//                       danhMucList[0].diachi,
//                       style: TextStyle(fontSize: 18.0),
//                     )
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//
//                     },
//                     style: TextButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 30.0),
//                         textStyle: TextStyle(
//                             color: Theme.of(context).primaryColor
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         )
//                     ),
//                     child: Text(
//                       "Reviews",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 30.0),
//                         textStyle: TextStyle(
//                             color: Theme.of(context).primaryColor
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         )
//                     ),
//                     child: Text(
//                       "Contact",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height:10.0),
//               Center(
//                 child: Text(
//                   "Menu",
//                   style: TextStyle(
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 1.2
//                   ),
//                 ),
//               ),
//               SizedBox(height:10.0),
//               Expanded(
//                 child: FutureBuilder<List<MonAn>>(
//                   future: filteredDanhMucItems,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator(); // or another loading indicator
//                     }
//
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     }
//
//                     final filteredDanhMucItemsList = snapshot.data!;
//                     return GridView.count(
//                       crossAxisCount: 2,
//                       children: List.generate(filteredDanhMucItemsList.length, (index) {
//                         MonAn food = filteredDanhMucItemsList[index];
//                         return _buildMenuItem(food);
//                       }),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
// }







import 'package:flutter/material.dart';

import '../data/sqlite.dart';
import '../models/danhmuc.dart';
import '../models/donhang.dart';
import '../models/monan.dart';


import '../widgets/rating_start.dart';

class RestaurantScreen extends StatefulWidget{
     final int madanhmuc;
   final String taikhoanText;
     RestaurantScreen({required this.madanhmuc, required this.taikhoanText});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}
class _RestaurantScreenState extends State<RestaurantScreen>{
  late List<MonAn> monanList;
  late List<DanhMuc> danhmucList;
  @override
  void initState() {
    super.initState();
    // Fetch DonHang data from the database
    DatabaseHelper().getDanhMucss(widget.madanhmuc).then((dmList) {
      setState(() {
       danhmucList = dmList;
        // Calculate the total price

      });
    });
    DatabaseHelper().getMonAn(widget.madanhmuc).then((maList) {
      setState(() {
        monanList = maList;
        // Calculate the total price

      });
    });
  }
  _buildMenuItem(MonAn menuItem){
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height:175.0,
            width:175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage(menuItem.hinhanh),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin:  Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),

                    ]
                )
            ),

          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  menuItem.ten,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                  ),
                ),
                Text(
                  "${menuItem.gia}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom:10.0,
              right:10.0,

              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30.0,
                  color: Colors.white,

                  onPressed: (){
                    DatabaseHelper().createDonHang1(menuItem.hinhanh, menuItem.ten, danhmucList[0].ten, menuItem.gia, 1, menuItem.gia, widget.taikhoanText);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sản phẩm đã được thêm vào giỏ hàng'),
                        duration: Duration(seconds: 2), // Đặt thời gian hiển thị thông báo
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag:danhmucList[0].hinhanh,
                  child: Image(
                    height:220.0,
                    width:MediaQuery.of(context).size.width,
                    image: AssetImage(danhmucList[0].hinhanh),
                    fit:BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                            iconSize: 30.0,
                            onPressed: () => Navigator.pop(context)
                        ),
                        IconButton(
                            icon: Icon(Icons.favorite),
                            color: Theme.of(context).primaryColor,
                            iconSize: 35.0,
                            onPressed: () {})
                      ],
                    )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child:Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        danhmucList[0].ten,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        "0.2 miles away",
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                      ),
                    ],
                  ),
                  RatingStarts(danhmucList[0].rating),
                  SizedBox(height:6.0),
                  Text(
                    danhmucList[0].diachi,
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      textStyle: TextStyle(
                          color: Theme.of(context).primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  ),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      textStyle: TextStyle(
                          color: Theme.of(context).primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  ),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height:10.0),
            Center(
              child: Text(
                "Menu",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2
                ),
              ),
            ),
            SizedBox(height:10.0),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(monanList.length, (index){
                    MonAn food = monanList[index];
                    return _buildMenuItem(food);
                  })
              ),
            ),
          ],
        )
    );
  }
}
