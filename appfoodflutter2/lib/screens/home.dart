// import 'package:appfoodflutter2/screens/recent_orders.dart';
// import 'package:appfoodflutter2/screens/restaurant_sreen.dart';
// import 'package:flutter/material.dart';
//
// import '../data/sqlite.dart';
// import '../models/danhmuc.dart';
// import '../widgets/rating_start.dart';
// import 'cart_screen.dart';
// import 'ls_screen.dart';
//
// class HomeScreen extends StatefulWidget{
//   final String taikhoanText;
//
//   HomeScreen({required this.taikhoanText});
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
//
// class _HomeScreenState extends State<HomeScreen>{
//
//   String tk = "";
//   final DatabaseHelper dbHelper = DatabaseHelper();
//   List<Widget> _buildRestaurants(List<DanhMuc> danhMucList) {
//     List<Widget> danhMucWidgets = [];
//
//     if (danhMucList != null) {
//       tk = widget.taikhoanText;
//       danhMucList.forEach((DanhMuc dm) {
//         danhMucWidgets.add(
//           GestureDetector(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => RestaurantScreen(madanhmuc: dm.madanhmuc, taikhoanText: widget.taikhoanText))
//             ),
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15.0),
//                 border: Border.all(
//                   width: 1.0,
//                   color: Color(0xFFCCCCCC),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(15.0),
//                     child: Hero(
//                       tag: dm.hinhanh,
//                       child: Image(
//                         height: 150.0,
//                         width: 150.0,
//                         image: AssetImage(dm.hinhanh),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin: EdgeInsets.all(12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             dm.ten ?? '', // Sử dụng giá trị mặc định để tránh lỗi null
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           RatingStarts(dm.rating),
//                           SizedBox(height: 4.0),
//                           Text(
//                             dm.diachi ?? '', // Sử dụng giá trị mặc định để tránh lỗi null
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(height: 4.0),
//                           Text(
//                             '0.2 miles away',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
//     }
//
//     return danhMucWidgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.account_circle),
//           iconSize: 30.0,
//           onPressed: () {},
//         ),
//         title: Text('Food Delivery'),
//         centerTitle: true,
//         actions: [
//           TextButton(
//             // onPressed: () => Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //       builder: (_) => CartScreen()
//             //   )
//             // ),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) => LsScreen(taikhoanText: widget.taikhoanText)
//               ),
//             ),
//             child: Text(
//               'History',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20.0,
//               ),
//             ),
//           ),
//           TextButton(
//             // onPressed: () => Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //       builder: (_) => CartScreen()
//             //   )
//             // ),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (_) => CartScreen(taikhoanText: widget.taikhoanText)
//               ),
//             ),
//             child: Text(
//               'Cart',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20.0,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: FutureBuilder<List<DanhMuc>>(
//         future: dbHelper.getDanhMucs(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<DanhMuc> danhMucList = snapshot.data!;
//             return ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(20.0),
//                       fillColor: Colors.white,
//                       filled: true,
//                       hintText: 'Search Food or Restaurant',
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                         borderSide: BorderSide(
//                           width: 0.8,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                         borderSide: BorderSide(width: 0.8),
//                       ),
//                       prefixIcon: Icon(Icons.search, size: 30.0),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ),
//                 ),
//                 // RecentOrders(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Text(
//                         'Nearby Restaurant',
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ),
//                     ..._buildRestaurants(danhMucList),
//                   ],
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
//
// }




import 'package:appfoodflutter2/screens/restaurant_sreen.dart';
import 'package:flutter/material.dart';
import '../data/sqlite.dart';
import '../models/danhmuc.dart';
import '../screens/recent_orders.dart';
import '../Widgets/rating_start.dart';

import '../data/data.dart';
import 'cart_screen.dart';
import 'ls_screen.dart';
// class HomeScreen extends StatefulWidget{
//   final String taikhoanText;
//   HomeScreen({required this.taikhoanText});
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen>{
//   late List<DanhMuc> resList;
//   @override
//   void initState() {
//     super.initState();
//     // Fetch DonHang data from the database
//     DatabaseHelper().getRestaurant(widget.taikhoanText).then((restList) {
//       setState(() {
//         resList = restList;
//         // Calculate the total price
//
//       });
//     });
//   }
//
//  _buildRestaurants(DanhMuc dm) {
//
//
//
//           GestureDetector(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => RestaurantScreen(madanhmuc: dm.madanhmuc, taikhoanText: widget.taikhoanText))
//             ),
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15.0),
//                 border: Border.all(
//                   width: 1.0,
//                   color: Color(0xFFCCCCCC),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(15.0),
//                     child: Hero(
//                       tag: dm.hinhanh,
//                       child: Image(
//                         height: 150.0,
//                         width: 150.0,
//                         image: AssetImage(dm.hinhanh),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin: EdgeInsets.all(12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             dm.ten ?? '', // Sử dụng giá trị mặc định để tránh lỗi null
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           RatingStarts(dm.rating),
//                           SizedBox(height: 4.0),
//                           Text(
//                             dm.diachi ?? '', // Sử dụng giá trị mặc định để tránh lỗi null
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(height: 4.0),
//                           Text(
//                             '0.2 miles away',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//
//
//
//
//
//
//
//   // }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.account_circle),
//             iconSize: 30.0,
//             onPressed: () {  },
//           ),
//           title: Text('Food Delivery'),
//           centerTitle: true,
//           actions: [
//             TextButton(
//                 onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => CartScreen(taikhoanText: widget.taikhoanText)
//                   ),
//                 ),
//                 child:Text(
//                     "Cart",
//                     style: TextStyle(
//                       color:Colors.white,
//                       fontSize: 20.0,
//                     )
//                 )
//             ),
//           ],
//         ),
//         body: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(20.0),
//               child:TextField(
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(20.0),
//                     fillColor: Colors.white,
//                     filled: true,
//                     hintText: 'Search Food or Restaurant',
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: BorderSide(
//                           width:0.8,
//                           color: Theme.of(context).primaryColor
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                         borderSide: BorderSide(width: 0.8)
//                     ),
//                     prefixIcon: Icon(Icons.search, size: 30.0),
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.clear),
//                       onPressed: (){},
//
//                     )
//
//                 ),
//               ),
//             ),
//             RecentOrders(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child:  Text(
//                     'Nearby Restaurant',
//                     style: TextStyle(
//                         fontSize: 24.0,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1.2
//                     ),
//                   ),
//                 ),
//
//                 ..._buildRestaurants(),
//               ],
//             ),
//           ],
//         )
//
//     );
//   }
// }
//
//
//
//




class HomeScreen extends StatefulWidget {
  final String taikhoanText;
  HomeScreen({required this.taikhoanText});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<DanhMuc> resList;
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    // Fetch DonHang data from the database
    DatabaseHelper().getRestaurant().then((restList) {
      setState(() {
        resList = restList;
        // Calculate the total price
      });
    });
  }

  List<Widget> _buildRestaurants() {
    if (resList == null) {
      return []; // Tránh lỗi null khi danh sách rỗng
    }
    List<DanhMuc> filteredList = resList.where((dm) {
      // Lọc dữ liệu theo nội dung tìm kiếm
      return dm.ten?.toLowerCase().contains(searchTerm.toLowerCase()) ?? false;
    }).toList();

    return filteredList.map((dm) {
      return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RestaurantScreen(
                    madanhmuc: dm.madanhmuc, taikhoanText: widget.taikhoanText))),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Color(0xFFCCCCCC),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: dm.hinhanh,
                  child: Image(
                    height: 150.0,
                    width: 150.0,
                    image: AssetImage(dm.hinhanh),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dm.ten ?? '', // Sử dụng giá trị mặc định để tránh lỗi null
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStarts(dm.rating),
                      SizedBox(height: 4.0),
                      Text(
                        dm.diachi ?? '', // Sử dụng giá trị mặc định để tránh lỗi null
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        centerTitle: true,
                actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => LsScreen(taikhoanText: widget.taikhoanText)
              ),
            ),
            child: Text(
              'History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CartScreen(taikhoanText: widget.taikhoanText)
              ),
            ),
            child: Text(
              'Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search Food or Restaurant',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide(width: 0.8)),
                  prefixIcon: Icon(Icons.search, size: 30.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        searchTerm = '';
                      });
                    },
                  )
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurant',
                  style: TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),
                ),
              ),
              ..._buildRestaurants(),
            ],
          ),
        ],
      ),
    );
  }
}

