import 'package:meta/meta.dart';
class Unit{
  final String name;
  final double convertion;
  const Unit({
    @required this.name,
    @required this.convertion
  }) : assert(name != null),
      assert(convertion != null);
  Unit.fromJson(Map jsonMap)
    : assert(jsonMap['name'] != null),
      assert(jsonMap['convertion'] != null),
      name = jsonMap['name'],
      convertion = jsonMap['convertion'].toDouble();
      

}