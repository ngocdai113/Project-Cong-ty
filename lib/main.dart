// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/edit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final Future<Database> database = openDatabase(
  join(getDatabasesPath().toString(), 'data.db'),
  onCreate: (db, version){
    return db.execute(
      "CREATE TABLE danhsach(" + 
        "id INTEGER PRIMARY KEY, " + 
        "ten_khach_hang TEXT, " +
        "sdt INTEGER, " +
        "trang_thai TEXT, " +
        "thanh_toan TEXT, " +
        "san_pham TEXT, " +
        "nhanvien_xuli TEXT, " +
        "ma_don_hang TEXT, " +
        "ma_van_chuyen TEXT, " +
        "lan_mua TINYINT, " +
        "nguon_khach, " +
        ")"
    );
  },
  version: 1,
);
void main() => runApp(MyApp());
BuildContext contextMain;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    contextMain = context;
    return MaterialApp(
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var _checkBox = List.filled(12, false);

  @override
  Widget build(BuildContext contextState) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("Phần mềm lọc danh sách nhân viên công ty"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _addRow),
          IconButton(icon: Icon(Icons.edit), onPressed: (){_editRow(contextState);}),
          IconButton(icon: Icon(Icons.delete), onPressed: _deleteRow),
          IconButton(icon: Icon(Icons.search), onPressed: _searchRow)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: _listViewMain(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.lightGreen, Colors.lightBlue]
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listPages(),
        ),
      ),

    );
  }
  Future<List<Data>> _getRow() async {
    final Database db = await database;
    final List<Map<String, dynamic>> getAll = await db.query('danhsach');
    return List.generate(getAll.length, (i){
      return Data(
        id: getAll[i]['id'],
        ten_khach_hang: getAll[i]['ten_khach_hang'],
        sdt: getAll[i]['sdt'],
        trang_thai: getAll[i]['trang_thai'],
        thanh_toan: getAll[i]['thanh_toan'],
        san_pham: getAll[i]['san_pham'],
        nhanvien_xuli: getAll[i]['nhanvien_xuli'],
        ma_don_hang: getAll[i]['ma_don_hang'],
        ma_van_chuyen: getAll[i]['ma_van_chuyen'],
        lan_mua: getAll[i]['lan_mua'],
        nguon_khach: getAll[i]['nguon_khach']
      );
    });
  }
  Future<void> _addRow(Data data) async{
    final Database db = await database;
    await db.insert('danhsach', data.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  void _editRow(BuildContext buildContext){
    //Navigator.pushReplacementNamed(buildContext, 'myapp/');
    Navigator.of(buildContext).push(
      MaterialPageRoute(
        builder: (_) => EditPage(listEdit: listThongtinKhachhang,),
      ),
    );
  }
  Future<void> _deleteRow(List<int> idXoa) async {
    final db = await database;
    await db.delete(
      'danhsach',
      where: ' id = ? ',
      whereArgs: idXoa,
    );
  }
  void _searchRow(){

  }
  void _pressed(bool b, int i){
    if(i <= 12){
      setState(() {
      _checkBox[i] = b;
    });
    }
    
  }
  List<Widget> listPages(){
    List<Widget> a = new List();
    a.add(IconButton(icon: Icon(Icons.skip_previous), onPressed: (){},));
    for(int i = 1; i <=4; i++){
      a.add(IconButton(icon: Text('$i', style: TextStyle(fontSize: 24),), color: Colors.blue, onPressed: (){}, hoverColor: Colors.black));

    }
    a.add(IconButton(icon: Icon(Icons.skip_next), onPressed: (){},));
    return a;
  }
  Widget _listViewMain(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listThongtinKhachhang.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: Key('key1'),
          leading: Checkbox(value: _checkBox[index], tristate: false, onChanged: (bool a){_pressed(a, index);}, activeColor: Colors.white, checkColor: Colors.pinkAccent,),
          title: Text(listThongtinKhachhang[index].ten_khach_hang, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          subtitle: Text(listThongtinKhachhang[index].ma_don_hang, style: TextStyle(color: Colors.black),),
          trailing: Icon(Icons.arrow_drop_down),
          onTap: (){},
        );
      },
    );
  }
  Widget _alertDialogAdd(){
    return AlertDialog(
      title: Text("Them don hang moi"),
      
    );
  }

}
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();

}
var listThongtinKhachhang = new List<Data>.generate(12, (i){
  return Data(id: 0, ten_khach_hang: 'ngocdai', sdt: 123, trang_thai: '123', thanh_toan: '123', san_pham: 'sp', nhanvien_xuli: 'nvxl', ma_don_hang: 'asd', ma_van_chuyen: 'asda', lan_mua: 1, nguon_khach: 'Hello');
});
class Data{
  final int id;
  final String ten_khach_hang;
  final int sdt;
  final String trang_thai;
  final String thanh_toan;
  final String san_pham;
  final String nhanvien_xuli;
  final String ma_don_hang;
  final String ma_van_chuyen;
  final int lan_mua;
  final String nguon_khach;

  Data({this.id, this.ten_khach_hang, this.sdt, this.trang_thai, this.thanh_toan, this.san_pham, this.nhanvien_xuli, this.ma_don_hang, this.ma_van_chuyen, this.lan_mua, this.nguon_khach});
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'ten_khach_hang': ten_khach_hang,
      'sdt': sdt,
      'trang_thai': trang_thai,
      'thanh_toan': thanh_toan,
      'san_pham': san_pham,
      'nhanvien_xuli': nhanvien_xuli,
      'ma_don_hang': ma_don_hang,
      'ma_van_chuyen': ma_van_chuyen,
      'lan_mua': lan_mua,
      'nguon_khach': nguon_khach
    };
  }
}
