import 'package:app_airplane/source/utils/app_layout.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:app_airplane/source/utils/ticket_tabs.dart';
import 'package:app_airplane/source/widget/double_text.dart';
import 'package:app_airplane/source/widget/icon_text_widget.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(context,20),
          vertical: AppLayout.getHeight(context,20),
        ),
        children: [
          SizedBox(height: AppLayout.getHeight(context,40)),
          Text(
            "What are\nyou looking for?",
            style: Styles.headLineStyle1
                .copyWith(fontSize: AppLayout.getWidth(context,35)),
          ),
          SizedBox(height: AppLayout.getHeight(context,20)),
          AppTicketTabs(
            firstTab: "Airline Tickets",
            secondTab: "Hotels",
          ),
          SizedBox(height: AppLayout.getHeight(context,25)),
          const AppIconText(
              icon: Icons.flight_takeoff_rounded, text: " Departure"),
          SizedBox(height: AppLayout.getHeight(context,20)),
          const AppIconText(icon: Icons.flight_land_rounded, text: " Arrival"),
          SizedBox(height: AppLayout.getHeight(context,25)),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppLayout.getHeight(context,18),
              horizontal: AppLayout.getWidth(context,15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppLayout.getHeight(context,5),
              ),
              color: const Color(0xD91120CE),
            ),
            child: Center(
              child: Text("find tickets",
                  style: Styles.textStyle.copyWith(color: Colors.white)),
            ),
          ),
          SizedBox(height: AppLayout.getHeight(context,40)),
          const AppDoubleTextWidget(
            bigText: "Upcoming Flights",
            smallText: "View all",
          ),
          SizedBox(height: AppLayout.getHeight(context,15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(context,425),
                width: size.width * 0.42,
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(context,15),
                  vertical: AppLayout.getWidth(context,15),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppLayout.getHeight(context,20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(context,190),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppLayout.getHeight(context,12),
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/sit.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(height: AppLayout.getHeight(context,12)),
                    Text(
                      "20% discount on the early booing of this flight, Don't miss out on this chance",
                      style: Styles.headLineStyle2,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: AppLayout.getHeight(context,201),
                        padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(context,15),
                          horizontal: AppLayout.getWidth(context,15),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3AB8B8),
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount\nfor survey",
                              style: Styles.headLineStyle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: AppLayout.getHeight(context,10)),
                            Text(
                              "Take the survey about our services and get discount.",
                              style: Styles.headLineStyle2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(context,30)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 18,
                              color: Color(0xFF189999),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: AppLayout.getHeight(context,15)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(context,15),
                      horizontal: AppLayout.getWidth(context,15),
                    ),
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(context,210),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppLayout.getHeight(context,18),
                      ),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Take love",
                          style: Styles.headLineStyle2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppLayout.getHeight(context,15)),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: '😍',
                              style: TextStyle(fontSize: 30),
                            ),
                            TextSpan(
                              text: '🥰',
                              style: TextStyle(fontSize: 40),
                            ),
                            TextSpan(
                              text: '😘',
                              style: TextStyle(fontSize: 30),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}