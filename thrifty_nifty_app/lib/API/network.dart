import 'dart:convert' as JSON;

import 'package:thrifty_nifty_app/model/stock.dart';
import 'package:thrifty_nifty_app/model/index.dart';
import 'package:http/http.dart' as http;

const url = "https://thriftynifty.gautam777.repl.co";

class Network {
  String? currentIndex;
  String? indexTicker;
  String? sortBy;
  Network({
    required this.currentIndex,
    required this.indexTicker,
    required this.sortBy,
  });
  // /347896/data/nifty/indices/all
  Future<List<Index>> fetchIndicesData() async {
    indices = [];
    try {
      final response = await http.get(
        Uri.parse(
          "$url/347896/data/nifty/indices/all",
        ),
      );
      //print(response.body);
      var vals = Map<String, dynamic>.from(
        JSON.jsonDecode(response.body),
      );
      print(vals.keys);
      for (var key in vals.keys) {
        Map<String, dynamic> map = vals[key];
        indices.add(
          Index.fromJson(map),
        );
      }
    } catch (exception) {
      print(exception);
    }
    return indices;
  }

  Future<List<Stock>> fetchData() async {
    stocks = [];
    print(indexTicker);
    print(sortBy);
    try {
      final response = await http.get(
        Uri.parse(
          "$url/347896/data/nifty/$indexTicker/all/sort/$sortBy",
        ),
      );
      print(response.body);
      var values = Map<String, dynamic>.from(
        JSON.jsonDecode(
          response.body,
        ),
      );
      for (var key in values.keys) {
        Map<String, dynamic> map = values[key];
        stocks.add(Stock.fromJson(map));
      }
    } catch (exception) {
      print(exception);
    }
    //print(stocks);
    return stocks;
  }
}

// chng mcap alph price
Network networkController = Network(
  currentIndex: "Nifty 50",
  indexTicker: "50",
  sortBy: "chng",
);
