import 'package:app_airplane/source/firebase/fire_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
  }

  class _ForgotPasswordPage extends State<ForgotPasswordPage>{
    final _auth = FirebaseAuthService();
    final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước
          },
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
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nội dung chính
          Center( // Căn giữa toàn bộ nội dung
            child: SingleChildScrollView( // Hỗ trợ cuộn khi màn hình nhỏ
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Căn giữa dọc
                  crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa ngang
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Enter your email address below and we’ll send you a link to reset your password.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Success"),
                              content: Text(
                                  "A password reset link has been sent to your email."),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await _auth.resetPassword(_email.text);
                                    Navigator.pop(context); // Đóng dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                        },
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Send Reset Link",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
