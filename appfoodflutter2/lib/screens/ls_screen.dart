

import 'package:flutter/material.dart';
import '../data/data.dart';
import '../data/sqlite.dart';
import '../models/lichsu.dart';


class LsScreen extends StatefulWidget{
  final String taikhoanText;
  LsScreen({required this.taikhoanText});
  @override
  _LsScreenState createState() => _LsScreenState();


}
class _LsScreenState extends State<LsScreen>{
  late List<LichSu> lichSuList;
  @override
  void initState() {
    super.initState();
    // Fetch DonHang data from the database
    DatabaseHelper().getLichSu(widget.taikhoanText).then((lsList) {
      setState(() {
        lichSuList = lsList;
        // Calculate the total price

      });
    });
  }
  _buildCartItem(LichSu ls){
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
                        image: AssetImage(ls.hinhanh),
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
                          ls.ten,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height:10.0),
                        Text(
                          ls.tennhahang,
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
                                onTap: () {},
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
                                ls.soluong.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width:20.0),
                              GestureDetector(
                                onTap: () {},
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
                      '${ls.soluong*ls.gia}',
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index < lichSuList.length) {
            LichSu ls = lichSuList[index];
            return _buildCartItem(ls);
          }
          // If index is out of bounds, return an empty container
          return Container();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: lichSuList.length,
      ),
    );
  }
}