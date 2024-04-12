


import 'package:appfoodflutter2/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'package:flutter/material.dart';

import 'data/sqlite.dart';
import 'main.dart';
import 'models/users.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPass = false;
  TextEditingController taikhoan = new TextEditingController();
  TextEditingController matkhau = new TextEditingController();
  var _usernameerror = "Tài khoản không hợp lệ";
  var _passerror = "Mật khẩu trên 6 ký tự";
  var _userInvalid = false;
  var _passInvalid = false;
  late Future<List<users>> notes;
  late List<users> items = [];
  late DatabaseHelper handler;
  final db = DatabaseHelper();
  @override
  void initState(){
    handler =  DatabaseHelper();
    // notes = handler.getNotes();
    handler.initDB().whenComplete(() {
      setState(() {
        notes = getAllNotes();
      });
    });
    super.initState();

  }
  Future<List<users>> getAllNotes(){
    return handler.getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffd8d8d8),
                  ),
                  child: Image.network(
                    'https://traungonquan.vn/wp-content/uploads/2019/01/icon-web-05.png',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: taikhoan,


                  decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _userInvalid ? _usernameerror : null,
                    labelStyle:
                    TextStyle(color: Color(0xff888888), fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: matkhau,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _passInvalid ? _passerror : null,
                        labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        _showPass ? "HIDE" : "SHOW",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton (
                    onPressed: () async{
                      bool isSignUpSuccessful = await onSignUpClicked(taikhoan.text);
                      if (isSignUpSuccessful) {
                        // Thực hiện đăng ký khi không có lỗi
                        db.createNote(users(
                          taikhoan: taikhoan.text,
                          matkhau: matkhau.text,
                        )).whenComplete(() {
                          Navigator.of(context).pop(true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );

                        });
                      } else {
                        // Xử lý khi tài khoản đã tồn tại
                        // Hiển thị thông báo hoặc thực hiện các thao tác khác tùy thuộc vào yêu cầu của bạn
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Thông báo"),
                              content: Text("Tài khoản đã tồn tại! Vui lòng chọn tài khoản khác."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),

              Container(
                height: 130,
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NEW USER? SIGN UP",
                      style:
                      TextStyle(fontSize: 15, color: Color(0xffd8d8d8)),
                    ),
                    Text(
                      "FORGET PASSWORD",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }


  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
  List<String> getListItems() {
    return items.map((users) => users.taikhoan).toList();
  }

  bool isStringExists(String searchString) {
    return items.any((users) => users.taikhoan.contains(searchString));
  }
  Future<bool> onSignUpClicked(String taikhoan) async {
    List<users> userList = await db.getNotes();
    int a = 0;
    for (int i = 0; i < userList.length; i++){
      if (taikhoan == userList[i].taikhoan){
        a++;
      }
    }
    if (a == 0){
      return true;
    }
    else
      return false;
  }
}
