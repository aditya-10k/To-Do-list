import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:tasksmgmt/screens/home.dart';
//import 'package:tasksmgmt/utility/dialoguebox.dart';
//import 'package:tasksmgmt/utility/button.dart';
class Taskstile extends StatelessWidget {
   Taskstile({super.key,required this.onChanged,required this.taskname,required this.complete,required this.deletefunc,required this.onEdit});

final String taskname;
final bool complete;
Function(bool?)? onChanged;
Function(BuildContext)? deletefunc;
final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 30, right: 30,top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deletefunc,
              backgroundColor: Colors.red,
              icon:Icons.delete_outline,
              borderRadius: BorderRadius.circular(20),
            )
          ],


        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.yellow[600],
                borderRadius: BorderRadius.circular(20),
              //border: Border.all(color: Colors.black)
                     ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         Checkbox(value: complete, onChanged: onChanged,
         checkColor: Colors.yellow[200],
         activeColor: Colors.black,
         ),
          Text(
              taskname,
          style: TextStyle(
            fontSize: 30-10,
            letterSpacing: 1,
            //fontWeight: FontWeight.bold,
            decoration: complete? TextDecoration.lineThrough : TextDecoration.none),
          ),
              IconButton(onPressed:onEdit
                  , icon: Icon(Icons.edit))
            ],
          ),
        ),
      ),
    );

  }
}
