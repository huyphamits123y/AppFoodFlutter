

import 'package:flutter/material.dart';
import '../data/data.dart';
import '../data/sqlite.dart';
import '../models/donhang.dart';
import '../models/lichsu.dart';


class CartScreen extends StatefulWidget{
  final String taikhoanText;
  CartScreen({required this.taikhoanText});
  @override
  _CartScreenState createState() => _CartScreenState();


}
class _CartScreenState extends State<CartScreen>{
  late List<DonHang> danhMucList; // Declare a list to store DonHang data
  double totalPrice = 0;


  @override
  void initState() {
    super.initState();
    // Fetch DonHang data from the database
    DatabaseHelper().getDonHang(widget.taikhoanText).then((donHangList) {
      setState(() {
        danhMucList = donHangList;
        // Calculate the total price
        totalPrice = danhMucList.fold<double>(0, (previous, current) =>
        previous + (current.soluong ?? 0) * current.gia);
      });
    });
  }

  void _processPayment() {
    // Iterate through the danhMucList and add data to lichsu table
    for (DonHang dh in danhMucList) {
      LichSu lichSu = LichSu(
        id: null,
        hinhanh: dh.hinhanh,
        ten: dh.ten,
        tennhahang: dh.tennhahang,
        gia: dh.gia,
        soluong: dh.soluong ?? 0,
        tongtien: dh.tongtien ?? 0,
        taikhoan: dh.taikhoan,
      );

      // Add data to lichsu table
      DatabaseHelper().createLichSu(lichSu);

      // Additional logic if needed
    }

    // Additional payment handling logic can be added here if needed
    print("Payment processed!");

    // Now, you may want to navigate to a different screen or perform any other action after payment.
  }

  void _updateDonHang(DonHang dh) {
    // Tính toán tổng tiền mới dựa trên số lượng mới
    int newTongTien = (dh.soluong ?? 0) * dh.gia;

    // Cập nhật số lượng và tổng tiền trong danh sách đơn hàng
    dh.tongtien = newTongTien;

    // Cập nhật trong cơ sở dữ liệu
    DatabaseHelper().updateDonHang(
      dh.taikhoan,
      dh.soluong ?? 0,
      dh.tongtien,
    );
  }

  void _updateDonHang1(String taikhoan, int soluong, int tongtien, String hinhanh, String ten, String tennhahang, int gia) {
    DatabaseHelper().updateDonHang1(
     taikhoan,
      soluong,
      tongtien,
      hinhanh,
      ten,
      tennhahang,
      gia
    );
  }
  void _deleteDonHang(String taikhoan){
    DatabaseHelper().deleteDonHangByTaiKhoan(taikhoan);
  }

  void handlePayment() {
    // Iterate through the danhMucList and call _updateDonHang for each item
    for (DonHang dh in danhMucList) {
      _updateDonHang(dh);
    }

    // Additional payment handling logic can be added here if needed
    print("Payment button pressed!");
  }
  _buildCartItem(DonHang dh){
    // int quantity = dh.soluong;
    int? counter = dh.soluong;


    void incrementCounter() {
      setState(() {
        counter = (counter ?? 0) + 1;
        dh.soluong = counter!;
        // Tính lại tổng giá
        totalPrice = danhMucList.fold<double>(0, (previous, current) =>
        previous + (current.soluong ?? 0) * current.gia);
      });
    }


    void handlePayment() {
      // Add your payment handling logic here
      _updateDonHang(dh);
    }
    void decrementCounter() {
      setState(() {
        if (counter! > 1) {
          counter = counter! - 1;
          dh.soluong = counter!;
          // Tính lại tổng giá
          totalPrice = danhMucList.fold<double>(0, (previous, current) =>
          previous + (current.soluong ?? 0) * current.gia);
        }
      });
    }
    return Container(

      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(dh.hinhanh),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(15.0),
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
                          dh.ten,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height:10.0),
                        Text(
                          dh.tennhahang,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                width: 0.8,
                                color: Colors.black54

                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: decrementCounter,
                                child: Text(
                                    '-',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    )
                                ),
                              ),
                              SizedBox(width:20.0),
                              Text(
                                '${counter}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width:20.0),
                              GestureDetector(
                                onTap: incrementCounter,
                                child: Text(
                                    '+',
                                    style:TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(

                      '${(dh.soluong ?? 0)*dh.gia}',

                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      )
                  ),

                )
              ],
            ),
          ),
        ],
      ),

    );
  }
  @override
  Widget build(BuildContext context){

    double totalPrice = 0;
    danhMucList.forEach((DonHang dh) => totalPrice += (dh.soluong ?? 0) * dh.gia);


    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),

      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < danhMucList.length){
              DonHang dh = danhMucList[index];
              return _buildCartItem(dh);
            }
            return Padding(
              padding: EdgeInsets.all(20.0),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimated Delivery Time: ',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        '25 min',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],

                  ),
                  SizedBox(height: 80.0),
                ],
              ),

            );
          },
          separatorBuilder: (BuildContext context, int index){
            return Divider(
              height: 1.0,
              color: Colors.grey,
            );
          },
          itemCount: danhMucList.length + 1
      ),
      bottomSheet: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0,1),
                blurRadius: 6.0
            ),
          ],
        ),
        child: Center(
          child: TextButton(
            onPressed: () {

              _processPayment();
             _deleteDonHang(widget.taikhoanText);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Thông báo'),
                    content: Text('Thanh toán thành công'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );

            },
            child: Text(
                'Thanh toán',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                )
            ),
          ),
        ),
      ),


    );


  }
}