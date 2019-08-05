import 'package:flutter/material.dart';
import 'package:myapp/Unit.dart';
import 'package:meta/meta.dart';

class converter_route extends StatelessWidget{
  final List<Unit> units;

  const converter_route({@required this.units}) : assert(units != null);
  
  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit){
      return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'convertion: ${unit.convertion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        )
      );
    }).toList();
    // TODO: implement build
    return ListView(
      children: unitWidgets,
    );
  }
  
}