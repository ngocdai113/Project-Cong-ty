import 'package:flutter/material.dart';
import 'package:myapp/Unit.dart';
import 'package:myapp/converter_route.dart';
import 'package:meta/meta.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight/2);
class category extends StatelessWidget{
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const category({Key key, @required this.name, @required this.color, @required this.iconLocation, @required this.units}) :
    assert(name != null),
    assert(color != null),
    assert(iconLocation != null),
    assert(units != null);
  void _navigateToConverter(BuildContext context) {
    // TODO: Using the Navigator, navigate to the [ConverterRoute]
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: (){
            print('I was tap');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  iconLocation,
                  size: 40.0
                ),
              ),
              Center()
            ],
          ),

        ),
      ),
    );
  }
  
}