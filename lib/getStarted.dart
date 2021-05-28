import 'package:flutter/cupertino.dart';
import 'createProfile.dart';
import 'package:flutter/material.dart';
import 'headerDesign.dart';

class ProfileCreated extends StatefulWidget{
  final String fullName;
  const ProfileCreated({
    required this.fullName
});
  @override
    ProfileCreatedState createState() =>ProfileCreatedState();
}

class ProfileCreatedState extends State<ProfileCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
        child: Stack(
          children:[
            Align(
                alignment: Alignment.topLeft,
                child: CustomPaint(
                    painter: HeaderDesign(
                        myColor1: Color.fromARGB(255, 107,158,215),
                        myColor2: Color.fromARGB(255, 74,122,196)
                    ),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width *0.9,
                        height: 400
                    )
                )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Text("Welcome",
                      textAlign: TextAlign.center, style: TextStyle(fontSize:20, color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.fullName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey),),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: ElevatedButton(
                      onPressed:() {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Welcome!', textAlign: TextAlign.center,)));
                    },
                        child: Text("Let's Get Started",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      style: ElevatedButton.styleFrom(primary: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          minimumSize: Size(300, 50)),
                    ),
                  ),

                ],
              )
          ),
          ],
        ),
      ),
    );
  }
}