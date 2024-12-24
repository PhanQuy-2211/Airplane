import 'package:app_airplane/source/home/pages/hotel.dart';
import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllHotelsPage extends StatefulWidget {
  const AllHotelsPage({Key? key}) : super(key: key);

  @override
  State<AllHotelsPage> createState() => _AllHotelsPageState();
}

class _AllHotelsPageState extends State<AllHotelsPage> {
  List<Map<String, dynamic>> hotelList = [];

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  Future<void> loadCsvData() async {
    try {
      // Đọc file CSV từ thư mục assets
      final rawData = await rootBundle.loadString('assets/csv/ticketlist.csv');

      // Cấu hình để dùng dấu phân cách là dấu ;
      List<List<dynamic>> csvData = const CsvToListConverter(fieldDelimiter: ',').convert(rawData);

      // Kiểm tra nếu file CSV rỗng hoặc không đủ dữ liệu
      if (csvData.isEmpty || csvData.length < 2) {
        print("Error: CSV file is empty or has insufficient data.");
        return;
      }

      // Chuyển đổi dữ liệu CSV thành danh sách Map
      List<Map<String, dynamic>> parsedHotels = [];
      for (int i = 1; i < csvData.length; i++) { // Bỏ qua dòng tiêu đề
        if (csvData[i].length < 4) {
          print("Skipping invalid row: ${csvData[i]}");
          continue;
        }
        parsedHotels.add({
          'place': csvData[i][0],       // Tên khách sạn
          'destination': csvData[i][1],   // Địa điểm
          'price': csvData[i][2],      // Giá
          'image': csvData[i][3],  // Hình ảnh
        });
      }

      setState(() {
        hotelList = parsedHotels;
      });
    } catch (e) {
      print('Error loading CSV: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotels", style: Styles.headLineStyle3),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: hotelList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: hotelList.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return HotelScreen(hotel: hotelList[index]);
              },
            ),
    );
  }
}
