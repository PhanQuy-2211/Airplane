import 'package:app_airplane/source/utils/app_layout.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:flutter/material.dart';

//import 'package:appbooking/utils/app_info_list.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Hotel price is ${hotel['price']}');
    final size = MediaQuery.of(context).size; // Sử dụng MediaQuery thay cho AppLayout.getSize
    return Container(
        width: size.width * 0.6,
        height: AppLayout.getHeight(context, 350), // Truyền context vào AppLayout.getHeight
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(context, 15), // Truyền context vào AppLayout.getWidth
            vertical: AppLayout.getHeight(context, 17)), // Truyền context vào AppLayout.getHeight
        margin: EdgeInsets.only(
            right: AppLayout.getWidth(context, 17), // Truyền context vào AppLayout.getWidth
            top: AppLayout.getHeight(context, 5)), // Truyền context vào AppLayout.getHeight
        decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(AppLayout.getHeight(context, 24)), // Truyền context vào AppLayout.getHeight
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppLayout.getHeight(context, 180), // Truyền context vào AppLayout.getHeight
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Styles.primaryColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/${hotel['image']}'),
                ),
              ),
            ),
            SizedBox(height: AppLayout.getHeight(context, 10)), // Truyền context vào AppLayout.getHeight
            Text(
              hotel['place'],
              style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
            ),
            SizedBox(height: AppLayout.getHeight(context, 5)), // Truyền context vào AppLayout.getHeight
            Text(
              hotel['destination'],
              style: Styles.headLineStyle3.copyWith(color: Colors.white),
            ),
            SizedBox(height: AppLayout.getHeight(context, 8)), // Truyền context vào AppLayout.getHeight
            Text(
              '\$${hotel['price']}/night',
              style: Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
            ),
          ],
        ));
  }
}
