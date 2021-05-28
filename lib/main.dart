import 'package:flutter/material.dart';
import 'package:user_create_profile/createProfile.dart';
import 'package:user_create_profile/profileAddPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
      ],
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: CreateProfile(),

    );
  }
}

