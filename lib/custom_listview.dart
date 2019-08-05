import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight/2);

class custom_listview extends StatelessWidget{
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  const custom_listview({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
  }) : assert(name != null),
      assert(color != null),
      assert(iconLocation != null),
      super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}