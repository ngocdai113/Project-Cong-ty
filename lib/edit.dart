import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(EditPage());

class EditPage extends StatelessWidget {
  var listEdit = new List<Data>();
  EditPage({Key key, @required this.listEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatefulEdit(listEdit);
  }
}

class StateEdit extends State<StatefulEdit> {
  void _pressEditOK() {
    setState(() {
      print('OK');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              _pressEditOK();
            },
          )
        ],
      ),
      body: listviewEdit(),
    );
  }

  Widget _sizeBox(var val) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        initialValue: val.toString(),
        decoration: new InputDecoration(),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget listviewEdit() {
    var listViewList = widget.listStateful;
    return ListView.builder(
      itemCount: widget.listStateful.length,
      itemBuilder: (BuildContext buildContext, int i) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Don hang: ' + widget.listStateful[i].ma_don_hang,
                  style: TextStyle(
                      backgroundColor: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                _sizeBox(listViewList[i].ma_don_hang),
                _sizeBox(listViewList[i].ten_khach_hang),
                _sizeBox(listViewList[i].sdt.toString()),
                _sizeBox(listViewList[i].trang_thai),
                _sizeBox(listViewList[i].thanh_toan),
                _sizeBox(listViewList[i].san_pham[0]),
                _sizeBox(listViewList[i].nhanvien_xuli),
              ],
            ),
          ],
        );
      },
    );
  }
}

class StatefulEdit extends StatefulWidget {
  var listStateful = new List<Data>();
  StatefulEdit(var list) {
    this.listStateful = list;
  }
  @override
  StateEdit createState() => StateEdit();
}
