import 'package:app_airplane/source/home/homepage/page/allProduct.dart';
import 'package:app_airplane/source/home/homepage/page/screen.dart';
import 'package:flutter/material.dart';


class MainMenuItemData {
  final String title;
  final IconData icon;
  final Color colorBox;
  final Color iconColor;
  final String? screenTitle;
  final String? screenContent;
  final Widget? screenWidget;

  MainMenuItemData({
    required this.title,
    required this.icon,
    required this.colorBox,
    required this.iconColor,
    this.screenTitle,
    this.screenContent,
    this.screenWidget,
  });
}

final List<MainMenuItemData> mainMenuItems = [
  MainMenuItemData(
    title: 'Flights',
    icon: Icons.flight,
    colorBox: Colors.blue,
    iconColor: Colors.white,
    screenTitle: 'Search Flights',
    screenContent: 'Flights',
  ),
  MainMenuItemData(
    title: 'Hotels',
    icon: Icons.hotel,
    colorBox: Colors.blue[900]!,
    iconColor: Colors.white,
    screenTitle: 'Search Hotels',
    screenContent: 'Hotel',
  ),
  MainMenuItemData(
    title: 'Flight + Hotel',
    icon: Icons.flight_land,
    colorBox: Colors.purple,
    iconColor: Colors.white,
    screenTitle: 'Search Flight + Hotel',
    screenContent: 'Flight + Hotel',
  ),
  MainMenuItemData(
    title: 'Attractions & Activities',
    icon: Icons.local_play,
    colorBox: Colors.green[300]!,
    iconColor: Colors.white,
    screenTitle: 'Attractions & Activities',
    screenContent: 'Activities',
  ),
  MainMenuItemData(
    title: 'All Products',
    icon: Icons.apps,
    colorBox: Colors.grey,
    iconColor: Colors.white,
    screenWidget: AllProduct(),
  ),
];

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: mainMenuItems.length,
        itemBuilder: (context, index) {
          return MainMenuItem(itemData: mainMenuItems[index]);
        },
      ),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final MainMenuItemData itemData;

  const MainMenuItem({required this.itemData});

  void _navigate(BuildContext context) {
    Widget destination = itemData.screenWidget ?? ScreenGeneral(
      title: itemData.screenTitle ?? '',
      content: itemData.screenContent ?? '',
    );

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigate(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: itemData.colorBox,
              shape: BoxShape.circle,
            ),
            child: Icon(
              itemData.icon,
              color: itemData.iconColor,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            itemData.title,
            style: const TextStyle(fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
