import 'package:app_airplane/source/utils/app_layout.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:app_airplane/source/widget/layout_widget_builder.dart';
import 'package:app_airplane/source/widget/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';


class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    // Xử lý các giá trị null hoặc không tồn tại
    String fromCode = ticket['from']?['code'] ?? 'N/A';
    String fromName = ticket['from']?['name'] ?? 'Unknown';
    String toCode = ticket['to']?['code'] ?? 'N/A';
    String toName = ticket['to']?['name'] ?? 'Unknown';
    String flyingTime = ticket['flying_time'] ?? 'Unknown';
    String date = ticket['date'] ?? 'Unknown';
    String departureTime = ticket['departure_time'] ?? 'Unknown';
    String ticketNumber = ticket['number']?.toString() ?? 'N/A';

    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(context, GetPlatform.isAndroid == true ? 180 : 180),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(context, 16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Phần đầu xanh
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Color(0xFF526799) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(context, 21)),
                  topRight: Radius.circular(AppLayout.getHeight(context, 21)),
                ),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(context, 16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        fromCode,
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                      const Spacer(),
                      const ThickContainer(isColor: true),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: AppLayout.getHeight(context, 21),
                              child: const AppLayoutBuilderWidget(
                                sections: 6,
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor == null
                                      ? Colors.white
                                      : const Color(0xFF8ACCF7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ThickContainer(isColor: true),
                      const Spacer(),
                      Text(
                        toCode,
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                    ],
                  ),
                  SizedBox(height: AppLayout.getHeight(context, 3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(context, 100),
                        child: Text(fromName,
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4),
                      ),
                      Text(
                        flyingTime,
                        style: isColor == null
                            ? Styles.headLineStyle4
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle4,
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(context, 100),
                        child: Text(
                          toName,
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Phần giữa đỏ
            Container(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      height: AppLayout.getHeight(context, 20),
                      width: AppLayout.getHeight(context, 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.white
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppLayout.getHeight(context, 10)),
                            bottomRight:
                                Radius.circular(AppLayout.getHeight(context, 10)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(AppLayout.getHeight(context, 6)),
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                width: AppLayout.getWidth(context, 5),
                                height: AppLayout.getHeight(context, 1),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: isColor == null
                                        ? Colors.white
                                        : Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(context, 20),
                      width: AppLayout.getWidth(context, 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: isColor == null
                              ? Colors.white
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppLayout.getHeight(context, 10)),
                            bottomLeft:
                                Radius.circular(AppLayout.getHeight(context, 10)),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            // Phần cuối
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      isColor == null ? AppLayout.getHeight(context, 21) : 0),
                  bottomRight: Radius.circular(
                      isColor == null ? AppLayout.getHeight(context, 21) : 0),
                ),
              ),
              padding: EdgeInsets.only(
                  left: AppLayout.getWidth(context, 16),
                  top: AppLayout.getHeight(context, 10),
                  right: AppLayout.getWidth(context, 16),
                  bottom: AppLayout.getHeight(context, 16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date,
                            style: isColor == null
                                ? Styles.headLineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3,
                          ),
                          SizedBox(height: AppLayout.getHeight(context, 5)),
                          Text(
                            "Date",
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            departureTime,
                            style: isColor == null
                                ? Styles.headLineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3,
                          ),
                          SizedBox(height: AppLayout.getHeight(context, 5)),
                          Text(
                            "Departure Time",
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ticketNumber,
                            style: isColor == null
                                ? Styles.headLineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3,
                          ),
                          SizedBox(height: AppLayout.getHeight(context, 5)),
                          Text(
                            "Number",
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
