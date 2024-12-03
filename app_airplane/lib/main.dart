import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_airplane/source/firebase/firebase_options.dart';
import 'package:app_airplane/source/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}