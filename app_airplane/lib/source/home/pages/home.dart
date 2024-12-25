import 'package:app_airplane/source/utils/app_info_list.dart';
import 'package:app_airplane/source/utils/app_layout.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:app_airplane/source/viewall/viewallhotels.dart';
import 'package:app_airplane/source/viewall/viewallticket.dart';
import 'package:app_airplane/source/widget/double_text.dart';
import 'package:flutter/material.dart';
import 'hotel.dart';
import 'ticket_view.dart';


class Home extends StatelessWidget {
  final String username;

  const Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context,20)),
            child: Column(
              children: [
                SizedBox(height: AppLayout.getHeight(context,40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning", style: Styles.headLineStyle3),
                        SizedBox(height: AppLayout.getHeight(context,5)),
                        Text(username, style: Styles.headLineStyle1),
                      ],
                    ),
                    Container(
                      height: AppLayout.getHeight(context,50),
                      width: AppLayout.getWidth(context,50),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(context,10)),
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/images/danang.png"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: AppLayout.getHeight(context,25)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(context,10)),
                    color: const Color(0xFFF4F6FD),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(context,12),
                    vertical: AppLayout.getHeight(context,12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Color(0xFFBFC205)), // Thay FluentUI icon bằng Icons.search
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                SizedBox(height: AppLayout.getHeight(context,40)),
                AppDoubleTextWidget(
                    bigText: "Upcoming Flights", 
                    smallText: "View all",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllTicketsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: AppLayout.getHeight(context,15)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: AppLayout.getWidth(context,20)),
            child: Row(
              children: ticketList
                  .map((singleTicket) => TicketView(ticket: singleTicket))
                  .toList(),
            ),
          ),
          SizedBox(height: AppLayout.getHeight(context,15)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context,20)),
            child: AppDoubleTextWidget(
              bigText: "Hotels",
              smallText: "View all",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllHotelsPage()),
                );
              },
            ),
          ),
          SizedBox(height: AppLayout.getHeight(context,15)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: AppLayout.getWidth(context,20)),
            child: Row(
              children:
                  hotelList.map((hotel) => HotelScreen(hotel: hotel)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}