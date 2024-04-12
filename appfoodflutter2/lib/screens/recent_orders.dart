
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/danhmuc.dart';

import '../data/sqlite.dart';
class RecentOrders extends StatelessWidget{

  final DatabaseHelper dbHelper = DatabaseHelper();
  _buildRecentOrder(BuildContext context, DanhMuc dm){
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 320,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width:1.0,
              color: Color(0xFFCCCCCC),

            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        height: 100.0,
                        width: 100.0,
                        image: AssetImage(dm.hinhanh),
                        fit:BoxFit.cover,
                      ),

                    )
                  ],

                )
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dm.ten,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      dm.ten,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                      ),
                      overflow: TextOverflow.ellipsis,

                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              width: 48.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {




                },
              ),
            )

          ],
        )

    );
  }
  @override
  Widget build(BuildContext context){
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 20),
    //       child: Text(
    //         'Recent Orders',
    //         style: TextStyle(
    //             fontSize: 24.0,
    //             fontWeight: FontWeight.w600,
    //             letterSpacing: 1.2
    //         ),
    //       ),
    //
    //     ),
    //
    //     Container(
    //         height: 120.0,
    //         child: ListView.builder(
    //             physics: BouncingScrollPhysics(),
    //             padding: EdgeInsets.only(left: 10.0),
    //             scrollDirection: Axis.horizontal,
    //             itemCount: ,
    //             itemBuilder: (BuildContext context, int index){
    //
    //               Order order = currentUser.orders[index];
    //               return _buildRecentOrder(context, order);
    //             }
    //         )
    //     )
    //
    //
    //   ],
    //
    // );
    return FutureBuilder<List<DanhMuc>>(
      future: dbHelper.getDanhMucs(), // Sử dụng phương thức từ DatabaseHelper để lấy danh sách DanhMuc
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Hiển thị tiến trình khi đang tải dữ liệu
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<DanhMuc> danhMucList = snapshot.data!; // Lấy danh sách DanhMuc từ snapshot
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recent Orders',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Container(
                height: 120.0,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: danhMucList.length,
                  itemBuilder: (BuildContext context, int index) {
                    DanhMuc danhMuc = danhMucList[index];
                    return _buildRecentOrder(context, danhMuc);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}