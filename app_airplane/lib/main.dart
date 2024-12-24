import 'package:app_airplane/source/home/login.dart';
import 'package:app_airplane/source/home/pages/bottom_bar.dart';
import 'package:app_airplane/source/home/signup.dart';
import 'package:app_airplane/source/theme/provider_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_airplane/source/firebase/firebase_options.dart';
import 'package:app_airplane/source/firstpage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
  ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Travel",
          theme: themeProvider.themeData,
          home: HomePage(),
          //home: BottomBar(),
          routes: {
            '/login': (context) => LoginPage(),
            '/signUp': (context) => SignUpPage(),
            '/home': (context) => BottomBar(),
          },
        );
      },
    );
  }
}
