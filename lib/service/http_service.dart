import 'package:statefulclickcounter/constants/constants.dart';
import 'package:statefulclickcounter/model/stock.dart';
import 'package:dio/dio.dart';
import 'package:statefulclickcounter/model/stock_data.dart';

class HttpService {
  final dio = Dio();
  Future<List<Stock>> getStocks() async {
    final response = await dio.get(
      'https://brapi.dev/api/quote/list?token=$API_KEY&limit=10',
    );

    List<Stock> returnList = [];

    for (var item in response.data['stocks']) {
      returnList.add(Stock.fromJson(item));
    }

    return returnList;
  }

  Future<StockData> getSpecificStock(Stock stock) async {
    final response = await dio.get(
      'https://brapi.dev/api/quote/${stock.stock}?token=$API_KEY&range=1d',
    );

    return StockData.fromJson(response.data!['results'][0]);
  }
}
