import 'package:flutter/material.dart';
class Dialoguebox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialoguebox({super.key,required this.controller,required this.onCancel,required this.onSave});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[600],
      content: Container(

        padding: EdgeInsets.only(top:7),
        height: 150,
        width: double.infinity,
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add a new Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),

                ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2
                      )
              )
              ),
            ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
      FilledButton(
        style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(Colors.black) ),
  child:  Text('ADD',style: TextStyle(color: Colors.white),),
   onPressed:onSave),
              FilledButton(
                style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(Colors.black) ),
                child: Text('CANCEL',style:  TextStyle(color: Colors.white) ),
                 onPressed:onCancel
                 )

            ],
          )
          ],
        ),
      ),
    );
  }
}
