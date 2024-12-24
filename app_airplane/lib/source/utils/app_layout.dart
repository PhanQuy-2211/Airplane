import 'package:flutter/material.dart';

class AppLayout {
  // Lấy kích thước màn hình từ MediaQuery
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // Lấy chiều cao của màn hình
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Lấy chiều rộng của màn hình
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Lấy chiều cao theo tỷ lệ (pixels là số pixel mong muốn)
  static double getHeight(BuildContext context, double pixels) {
    return getScreenHeight(context) * (pixels / 812); // 812 là chiều cao tiêu chuẩn của màn hình iPhone X
  }

  // Lấy chiều rộng theo tỷ lệ (pixels là số pixel mong muốn)
  static double getWidth(BuildContext context, double pixels) {
    return getScreenWidth(context) * (pixels / 375); // 375 là chiều rộng tiêu chuẩn của màn hình iPhone X
  }
}
