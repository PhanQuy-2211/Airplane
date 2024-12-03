import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_airplane/source/home/signup.dart';
import 'package:app_airplane/source/homepage.dart';
import 'package:app_airplane/source/home/forgetpass.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,  // Giữ cho giao diện cuộn khi bàn phím xuất hiện
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Chuyển tới HomePage
              (Route<dynamic> route) => false, // Loại bỏ tất cả các trang khác khỏi ngăn xếp
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Hình nền
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nội dung trên nền
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa dọc
                crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa ngang
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center, // Căn giữa text
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center, // Căn giữa text
                  ),
                  SizedBox(height: 30),
                  makeInPut(label: "Email"),
                  makeInPut(label: "Password", obscureText: true),
                  SizedBox(height: 20),
                  Hero(
                    tag: 'loginButton',  // Đảm bảo tag trùng với tag ở HomePage
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {},
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
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
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight, // Căn lề phải
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeInPut({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18, color: Colors.black)),
        SizedBox(height: 10),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter $label",
            hintStyle: TextStyle(color: Colors.grey[600]),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}