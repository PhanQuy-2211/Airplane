import 'package:flutter/material.dart';

class CardAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          'John Doe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/008/442/086/small/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg",
              ),
            ),
          ),
        ),
        subtitle: Row(
          children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(
                Icons.album,
                color: Colors.blue,
              ),
              label: Text('666 Poin'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200], // Màu nền
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            ElevatedButton(
              child: Text('Zalo Pay'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200], // Màu nền
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
