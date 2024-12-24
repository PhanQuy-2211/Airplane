import 'package:app_airplane/source/firstpage.dart';
import 'package:app_airplane/source/utils/app_layout.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:app_airplane/source/theme/provider_theme.dart';

class Account extends StatefulWidget {
  final String username;
  final String email;
  const Account({super.key, required this.username, required this.email});

   @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File? _image; // Biến lưu ảnh đại diện

  final ImagePicker _picker = ImagePicker(); // Khởi tạo ImagePicker


  // Hàm để chọn ảnh từ thư viện hoặc camera
  Future<void> _pickImage() async {
    // Hiển thị Dialog để chọn ảnh từ thư viện hoặc camera
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Bạn có thể thay đổi thành camera nếu muốn
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Lưu ảnh vào biến _image
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(context,20),
          vertical: AppLayout.getHeight(context,20),
        ),
        children: [
          SizedBox(height: AppLayout.getHeight(context,40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: AppLayout.getHeight(context,86),
                  width: AppLayout.getWidth(context,86),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppLayout.getHeight(context,10),
                    ),
                    image: _image == null
                        ? const DecorationImage(
                            image: AssetImage("assets/images/img_1.png"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: FileImage(_image!), // Hiển thị ảnh người dùng chọn
                            fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: AppLayout.getWidth(context, 10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.username, style: Styles.headLineStyle1),
                  SizedBox(height: AppLayout.getHeight(context,2)),
                  Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(context,8)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.getWidth(context,3),
                        vertical: AppLayout.getHeight(context,3)),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(context,100)),
                      color: const Color(0xFFFEF4F3),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                   Switch(
                    value: themeProvider.themeData == Styles.darkTheme,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    thumbIcon: MaterialStateProperty.resolveWith<Icon>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return const Icon(Icons.brightness_3, color: Colors.white); // Biểu tượng khi bật dark mode
                      }
                      return const Icon(Icons.light_mode, color: Colors.white); // Biểu tượng khi bật light mode
                    }),
                    activeColor: const Color.fromARGB(255, 66, 104, 169),
                    inactiveThumbColor: const Color.fromARGB(255, 152, 135, 48),
                    activeTrackColor: const Color.fromARGB(255, 147, 151, 215),
                    inactiveTrackColor: const Color.fromARGB(31, 180, 183, 56),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: AppLayout.getHeight(context,8)),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: AppLayout.getHeight(context,8)),
          Stack(
            children: [
              Container(
                height: AppLayout.getHeight(context,90),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(context,18)),
                ),
              ),
              Positioned(
                right: -45,
                top: -40,
                child: Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(context,30)),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 18, color: Color(0xFF264CD2)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getHeight(context,25),
                    vertical: AppLayout.getHeight(context,20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                          Icons.lightbulb_outline,
                          color: Styles.primaryColor,
                          size: 27),
                    ),
                    SizedBox(height: AppLayout.getHeight(context,12)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You've got a new reward",
                          style: Styles.headLineStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "You've 95 flights in a year",
                          style: Styles.headLineStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              Container(
                height: AppLayout.getHeight(context, 55),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(context, 18)),
                ),
              ),
              Positioned(
                right: -45,
                top: -40,
                child: Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(context, 20)),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 18, color: Color(0xFF264CD2)),
                  ),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 70,
                onPressed: () async {
                  // Đăng xuất Firebase
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  "Log out",
                  style: Styles.headLineStyle2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}