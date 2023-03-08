import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinMarketCap {
  Future<List<Market>> getMarkets() async {
    var address = "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing";
    var token = "5f2860f2-237f-4f50-965e-6757107dcf6f";
    var resualt = await http.get(Uri.parse(address),headers: {
      "X-CMC_PRO_API_KEY" : token
    });
    List<Market> markets = [];
    if (resualt.statusCode == 200) {
      var json = jsonDecode(resualt.body);
      for (var jsonMarket in json['data']['cryptoCurrencyList']){
        var market = Market.fromJson(jsonMarket);
        markets.add(market);
      }
    }
    return markets;
  }
}

class Market {
  final String name;
  final double price;
  final String exchange;
  final String logo;
  final String symbol;
  final String FullName;

  Market(this.name,this.price,this.exchange,this.logo,this.symbol,this.FullName);

  factory Market.fromJson(Map<String,dynamic> json){
    return Market(
      json['name'],
      json['quotes'][0]['price'],
      json['quotes'][0]['name'],
      "https://s2.coinmarketcap.com/static/img/coins/64x64/${json['id']}.png",
      json['symbol'],
      "${json['name']} - ${json['symbol']}",
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name
    };
  }

  String toString() {
    return "{name: $name}";
  }
}
