import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class CustomDialogBox extends StatefulWidget {

  final String title;
  final List<String> buttonText;
  final void Function(String value) parentAction;

  const CustomDialogBox({required this.title,required this.buttonText, required this.parentAction});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context) {
    var selected = widget.buttonText.first;
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 25,),
              Column(
                children: [
                  /*SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("str", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.orange
                        )
                    ),
                  ),*/
                  CustomRadioButton(
                    elevation: 0,
                    absoluteZeroSpacing: false,
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables: widget.buttonText,
                    buttonValues: widget.buttonText,
                    buttonTextStyle: ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: 16)
                    ),
                    radioButtonValue: (value) {
                      selected = value.toString();
                    },
                    horizontal: true,
                    selectedColor: Colors.orange,
                    enableShape: true,
                    unSelectedBorderColor: Colors.transparent,
                    selectedBorderColor: Colors.orange,
                    defaultSelected: widget.buttonText.first,
                  ),
                  SizedBox(height: 20,),


                ],
              ),
              Row(
                children: [
                  FlatButton(
                      padding: EdgeInsets.only(left: 50),
                      onPressed: (){
                        widget.parentAction(selected.toString());
                        Navigator.of(context).pop();
                      },
                      child: Text("SUBMIT",style: TextStyle(fontSize: 18, color: Colors.orange),)
                  ),

                  FlatButton(

                      padding: EdgeInsets.only(left: 50),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("CANCEL",style: TextStyle(fontSize: 18, color: Color.fromARGB(255,74,74,74)))
                  ),

                ],
              )

            ],
          ),
        ),

      ],
    );
  }
}