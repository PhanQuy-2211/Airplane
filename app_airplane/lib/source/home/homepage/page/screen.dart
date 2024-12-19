import 'package:flutter/material.dart';

class ScreenGeneral extends StatelessWidget {
  final String title;
  final String content;

  ScreenGeneral({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: FlightHotelSearchDelegate());
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Flight & Hotel Manager'),
      ),
    );
  }
}
// test search
class FlightHotelSearchDelegate extends SearchDelegate {
  final List<String> flightsAndHotels = [
    'Flight: New York to Los Angeles',
    'Flight: Tokyo to Bangkok',
    'Hotel: Grand Plaza, New York',
    'Hotel: Sunrise Beach Resort, Phuket',
    'Flight: Paris to Berlin',
    'Hotel: Eiffel Tower View, Paris',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = flightsAndHotels
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            // Handle the selected item (e.g., navigate to details page)
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = flightsAndHotels
        .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}