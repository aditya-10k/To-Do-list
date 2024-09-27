import 'package:hive_flutter/hive_flutter.dart';

class Database {

  List tasks = [];

  final _ice_cream = Hive.box('ice_cream');

  void startnewdb()
  {
    tasks =[['demo',false],['demo2',true]];
  }

  void loaddb()
  {
    tasks= _ice_cream.get('TODOLIST');
  }

  void updatedb()
  {
    _ice_cream.put('TODOLIST', tasks);
  }
}