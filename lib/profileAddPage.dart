import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_create_profile/createProfile.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import '';
import 'headerDesign.dart';
class AddHealth extends StatefulWidget{
  final String appBarTitle;
  final List<String> symptoms;
  final void Function(String value) parentAction;

  const AddHealth({
    required this.appBarTitle,
    required this.symptoms,
    required this.parentAction
});
@override
    AddAllergy createState() => AddAllergy();
}
class AddAllergy extends State<AddHealth> {
  @override
  Widget build(BuildContext context) {
    Color myOrange = Color.fromARGB(255, 240,130,33);
   return Scaffold(
     resizeToAvoidBottomInset: false,
     body: Container(
       child: Stack(
         children: [
           Align(
               alignment: Alignment.topLeft,
               child: CustomPaint(
                   painter: HeaderDesign(
                       myColor1:Color.fromARGB(255, 240,130,33),
                       myColor2:Color.fromARGB(255, 240,130,33)
                   ),
                   child: SizedBox(
                       width: MediaQuery.of(context).size.width *0.8,
                       height: 300
                   )
               )
           ),
           Padding(
             padding: const EdgeInsets.only(left: 30,top: 50),
             child: Align(
               alignment: Alignment.topLeft,
               child: SizedBox(
                   width: 300,
                   child: Text(
                     "Add " + widget.appBarTitle,
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 40,
                         color: Colors.white
                     ),
                   )
               ),
             ),
           ),
           ListView(
           children: <Widget>[
             SizedBox(
               height: 10,
               width: 20,
             ),
             Padding(
               padding: const EdgeInsets.only(left:50, top: 200),
               child: Text(
                 'Please choose Symptoms',
                 textAlign: TextAlign.left,
                 style: TextStyle(
                     fontSize: 20,
                     color: Colors.blueGrey,
                     fontWeight: FontWeight.bold),
               ),
             ),
             SizedBox(
               height: 10,
             ),
             Column(
               children: <Widget>[
                 Column(
                   children: <Widget>[
                     SizedBox(
                       height: 10,
                     ),
                     CustomCheckBoxGroup(
                       buttonTextStyle: ButtonTextStyle(
                         selectedColor: Colors.white,
                         unSelectedColor: Colors.blueGrey,
                         textStyle: TextStyle(
                           fontSize: 16
                         )
                       ),
                       autoWidth: false,
                       enableButtonWrap: true,
                       wrapAlignment: WrapAlignment.start,
                       unSelectedColor: Theme.of(context).canvasColor,
                       buttonLables: widget.symptoms,
                       buttonValuesList: widget.symptoms,
                       checkBoxButtonValues: (values){
                         List<String> str = values.toString().split('[');
                         List<String> str1 = str[1].split(']');
                         widget.parentAction(str1[0]);
                       },
                       defaultSelected: null,
                       horizontal: false,
                       width: 150,
                       selectedColor: Theme.of(context).accentColor,
                       padding: 5,
                       enableShape: true,
                     ),
                     SizedBox(
                       height: 100,
                     ),

                     ElevatedButton(
                       onPressed: (){
                         Navigator.pop(context);
                       },
                       child: Text('Add',
                           style: TextStyle(fontSize: 16, color: Colors.white),
                     ),
                      style: ElevatedButton.styleFrom(primary: myOrange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      minimumSize: Size(200, 50)),
                     ),
                   ],
                 )
               ],
             )
           ],

         ),
     ],
       ),
     )
   );
  }
  }
