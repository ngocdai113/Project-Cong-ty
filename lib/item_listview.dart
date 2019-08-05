import 'package:flutter/material.dart';

class item_listview extends StatelessWidget{
  const item_listview();
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];
  static const _baseColors = <Color>[
    Colors.black,
    Colors.amber,
    Colors.black,
    Colors.black54,
    Colors.blue,
    Colors.yellowAccent,
    Colors.yellow,
    Colors.white54
  ];
  @override
  Widget build(BuildContext context) {
    final listview = Container();
    final appBar = AppBar();

    // TODO: implement build
    return Scaffold(
      appBar: appBar,
      body: listview
    );
  }

}