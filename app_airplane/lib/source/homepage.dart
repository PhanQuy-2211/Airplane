import 'package:app_airplane/source/home/login.dart';
import 'package:app_airplane/source/home/signup.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoginHovered = false;
  bool isSignupHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Automatic identity verification which enables you to verify your identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('illustration.jpeg'),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isLoginHovered = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isLoginHovered = false;
                      });
                    },
                    cursor: SystemMouseCursors.click,
                    child: Hero(
                      tag: 'loginButton',
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: isLoginHovered
                            ? MediaQuery.of(context).size.width - 50
                            : MediaQuery.of(context).size.width - 100,
                        height: 60,
                        decoration: BoxDecoration(
                          color: isLoginHovered
                              ?Colors.greenAccent
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black),
                          boxShadow: isLoginHovered
                              ? [
                                  const BoxShadow(
                                    color: Colors.yellow,
                                    blurRadius: 50,
                                    offset: Offset(0, 5),
                                  ),
                                ]
                              : [],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  // Sử dụng Curves.easeInOut để hiệu ứng mềm mại hơn
                                  const curve = Curves.easeInOut;

                                  // Thêm CurvedAnimation cho animation
                                  var curvedAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: curve,
                                  );

                                  return FadeTransition(
                                    opacity: curvedAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(seconds: 2), // Thời gian chuyển cảnh (2 giây)
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Tăng khoảng cách giữa các nút
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isSignupHovered = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isSignupHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: isSignupHovered
                          ? MediaQuery.of(context).size.width - 80
                          : MediaQuery.of(context).size.width - 100,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isSignupHovered
                            ? Colors.amber
                            : Colors.yellow, // Màu khi hover và không hover
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black),
                        boxShadow: isSignupHovered
                            ? [
                                const BoxShadow(
                                  color: Colors.red,
                                  blurRadius: 50,
                                  offset: Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      child: ElevatedButton(
                        onPressed: () {  
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()),);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}