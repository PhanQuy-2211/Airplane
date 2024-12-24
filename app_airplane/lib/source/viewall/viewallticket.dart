import 'package:app_airplane/source/home/pages/ticket_view.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllTicketsPage extends StatefulWidget {
  const AllTicketsPage({Key? key}) : super(key: key);

  @override
  State<AllTicketsPage> createState() => _AllTicketsPageState();
}

class _AllTicketsPageState extends State<AllTicketsPage> {
  List<Map<String, dynamic>> ticketList = [];

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  Future<void> loadCsvData() async {
  try {
    // Đọc file CSV từ thư mục assets
    final rawData = await rootBundle.loadString('assets/csv/ticketlist.csv');

    // Cấu hình để dùng dấu phân cách là dấu `;`
    List<List<dynamic>> csvData = const CsvToListConverter(fieldDelimiter: ',').convert(rawData);

    // Kiểm tra nếu file CSV rỗng hoặc không đủ dữ liệu
    if (csvData.isEmpty || csvData.length < 2) {
      print("Error: CSV file is empty or has insufficient data.");
      return;
    }

    // Chuyển đổi dữ liệu CSV thành danh sách Map
    List<Map<String, dynamic>> parsedTickets = [];
    for (int i = 1; i < csvData.length; i++) { // Bỏ qua dòng tiêu đề
      if (csvData[i].length < 7) {
        print("Skipping invalid row: ${csvData[i]}");
        continue;
      }
      parsedTickets.add({
        'from': {'code': csvData[i][0], 'name': csvData[i][1]},
        'to': {'code': csvData[i][2], 'name': csvData[i][3]},
        'flying_time': csvData[i][4],
        'date': csvData[i][5],
        'departure_time': csvData[i][6],
        'number': csvData[i][7],
      });
    }

      setState(() {
        ticketList = parsedTickets;
      });
    } catch (e) {
      print('Error loading CSV: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flight Tickets", style: Styles.headLineStyle3),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ticketList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ticketList.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return TicketView(ticket: ticketList[index]);
              },
            ),
    );
  }
}