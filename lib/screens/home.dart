import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasksmgmt/data/database.dart';
import 'package:tasksmgmt/utility/dialoguebox.dart';
import 'package:tasksmgmt/utility/taskstile.dart';
class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _ice_cream= Hive.box('ice_cream');
  final _controller = TextEditingController();

Database db = Database();
  @override
  void initState()
  {
  if(_ice_cream.get('TODOLIST')== null )
  db.startnewdb();
  else
  db.loaddb();
  super.initState();
  }



  
  void addnewtask()
  {
    setState(() {
      db.tasks.add([_controller.text,false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updatedb();
  }

  void createnewtask()
  {
    showDialog(context: context, builder: (context){
      return Dialoguebox(controller: _controller,
        onCancel:() => Navigator.of(context).pop(),
        onSave: addnewtask ,
      );});
      db.updatedb();
  }

  void checkboxchanged(bool? value ,int index)
  {
    setState(() {
        db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updatedb();
  }

  void deletetask(int index) {
    setState(() {

      if (db.tasks.isNotEmpty && index >= 0 && index < db.tasks.length) {
        db.tasks.removeAt(index);
      }
    });
    db.updatedb();
  }

  void editTask(int index) {
    _controller.text = db.tasks[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return Dialoguebox(
          controller: _controller,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },

          onSave: () {
            if (_controller.text.isNotEmpty) {
              setState(() {
                db.tasks[index][0] = _controller.text;
              });
              _controller.clear();
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
    db.updatedb();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100-30,
          backgroundColor: const Color.fromARGB(1, 37, 37, 37),
         // elevation: 10,
          title: Text(
              'Notes',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
              letterSpacing: 2,

            ),
          ),
          //centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: db.tasks.length,
          itemBuilder: (context,index) {
            return Taskstile(
              taskname: db.tasks[index][0],
              complete: db.tasks[index][1],
              onChanged: (value) => checkboxchanged(value,index),
              deletefunc: (context)=> deletetask(index),
              onEdit: () => editTask(index),
            );
          },
          
            //Taskstile(),
        ),
        backgroundColor: Color.fromARGB(1,255,255,255),
        floatingActionButton: Container(
          
          width: 70,
          height: 70,
          child: FloatingActionButton(onPressed: () {
            return createnewtask();
          },
            backgroundColor: Colors.yellow[600],
            //shape: ShapeBorder(),
            child: Icon(Icons.add,
            color: Colors.black,
            size: 40,),
          ),
        ),
      ),
    );
  }
}
