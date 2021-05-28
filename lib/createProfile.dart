import 'package:user_create_profile/footerDesign.dart';
import 'getStarted.dart';
import 'package:user_create_profile/headerDesign.dart';

import 'customDialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_create_profile/createProfile.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:user_create_profile/profileAddPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_rounded_date_picker/rounded_picker.dart';


// ignore: camel_case_types
class CreateProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return CreateProfileState();
  }
}

class CreateProfileState extends State<CreateProfile>{
  String _firstName =' ' ;
  String _lastName=' ';
  String _dob= '' ;
  var dobController = TextEditingController();
  var genderController = TextEditingController();
  var bloodController = TextEditingController();
  Color myOrange = Color.fromARGB(255, 240,130,33);

  String _emergencyContact =' ';
  String _pinCode =' ';

  String allergySelect = '';
  String comorbiditySelect = '';

  _updateAllergy(String str){
    setState(() {
      allergySelect=str;
    });
  }
  _updateComorbidity(String str){
    setState(() {
      comorbiditySelect=str;
    });
  }

  _updateMyGender(String str){
    setState(() {
      genderController.text=str;
    });
  }

  _updateMyBlood(String str){
    setState(() {
      bloodController.text=str;
    });
  }

  final _formKey = GlobalKey<FormState>();
  // Widget _buildGender(){
  //initialDatePickerMode: DatePickerMode.year,
  //   return null;
  // }
  Widget _buildEmergencyContact(){

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'Emergency Contact Number',
            prefixIcon: Padding(padding: EdgeInsets.only(left: 10,right:20, top: 20,bottom: 15),
                child: Text('+91 ',style:
                TextStyle(color: Colors.white, fontSize: 16),)),
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.only(left: 20,top: 20,bottom: 15),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),

        ),
        validator: (value){
          if(value==null || value.isEmpty){
            return 'Mobile number is required';
          }
          if(value.length!=10){
            return 'Mobile number not valid';
          }
          else
            return null;
        },
        onSaved: (value){
          _emergencyContact= value!;
        },
      ),
    );
  }
  Widget _buildPinCode(){
    Pattern pattern = r'^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}' ;
    RegExp regExp = new RegExp(pattern.toString());
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10,bottom: 10),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'PinCode',
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10.0),
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Pin Code is required';
            }
            if(!regExp.hasMatch(value)){
              return 'Enter correct pinCode';
            }
            else
              return null;
          }
      ),
    );
  }
  // Widget _buildBloodGroup(){
  //   return null;
  // }
  DateTime selectedDate = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate:DateTime(1960),
        lastDate:DateTime(2022),
        initialDatePickerMode: DatePickerMode.year,
    );
    if(picked !=null && picked !=selectedDate){
      setState(() {
        selectedDate=picked;
        print(selectedDate.toString());
        dobController.text = selectedDate.day.toString() + "/" +selectedDate.month.toString()+ "/"+ selectedDate.year.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    List<String> buttonWords = ["Male", "Female"];
    List<String> buttonWords2 = ["A+", "AB+", "AB-","B+", "O+", "O-"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Color.fromARGB(255, 107,158,215),
              Color.fromARGB(255, 74,122,196)
            ],
          ),
        ),
        child: Form(
          key: _formKey,
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
                      width: 350,
                      child: Text(
                        "Tell us about yourself.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'First Name',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                contentPadding: EdgeInsets.all(10.0)
                            ),
                            validator:(value){
                              if(value== null || value.isEmpty){
                                return 'First Name is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _firstName = value!;
                              print(_firstName);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              contentPadding: EdgeInsets.all(10.0),
                            ),
                            validator: (val){
                              if(val==null || val.isEmpty){
                                return 'Last name is required';
                              }
                              return null;
                            },
                            onSaved: (val){
                              _lastName= val!;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )

                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(

                          child: TextFormField(
                            controller: dobController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Date of birth',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              contentPadding: EdgeInsets.only(left: 10, top: 25,bottom: 10),
                            ),
                            onTap: (){
                              selectTimePicker(context);
                            },
                            // initialValue: _dob,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: genderController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Gender',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              contentPadding: EdgeInsets.only(left: 10, top: 25,bottom: 10),
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (BuildContext){
                                return CustomDialogBox(
                                  title: "Select Gender",
                                  buttonText: buttonWords,
                                  parentAction: _updateMyGender,
                                );
                              });
                            },
                            // initialValue: _dob,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          height: 20,
                        ),
                      ],

                    ),
                    _buildEmergencyContact(),
                    _buildPinCode(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: bloodController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Blood Group',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        onTap: (){
                          showDialog(context: context, builder: (BuildContext){
                            return CustomDialogBox(
                              title: "Blood Group",
                              buttonText: buttonWords2,
                              parentAction: _updateMyBlood,
                            );
                          });
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20,bottom: 10,right: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text('Allergies',
                                style: TextStyle(fontSize: 16, color: Colors.white,
                                ),),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                iconSize: 20,
                                color: Colors.white,
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddHealth(
                                    appBarTitle: "Allergies",
                                    symptoms: ["Cough", "Headache",
                                      "Breathlessness",
                                      "Sweating",
                                      "Fever",
                                      "Bodyache",
                                      "Chest Pain",
                                      "Heart Burn",
                                      "Nausea"],
                                    parentAction: _updateAllergy,
                                  ))
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  allergySelect, style: TextStyle(fontSize: 16,
                                    color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text('Comorbidities',
                                style: TextStyle(fontSize: 16, color: Colors.white,
                                ),),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                iconSize: 20,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddHealth(
                                    appBarTitle: "Comorbidities",
                                    symptoms: ["Cough", "Headache",
                                      "Breathlessness",
                                      "Sweating",
                                      "Fever",
                                      "Bodyache",
                                      "Chest Pain",
                                      "Heart Burn",
                                      "Nausea"],
                                    parentAction: _updateComorbidity,
                                  ))
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  comorbiditySelect, style: TextStyle(fontSize: 16,
                                    color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: CustomPaint(
              //         painter: FooterDesign(),
              //         child: SizedBox(
              //             width: MediaQuery.of(context).size.width,
              //             height: 200
              //         )
              //     )
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    child: Text('Create Profile',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(primary: myOrange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                        ,minimumSize: Size(350, 50)),
                    onPressed:(){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> ProfileCreated(fullName: _firstName + ' ' + _lastName,)));

                      }
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }
}


