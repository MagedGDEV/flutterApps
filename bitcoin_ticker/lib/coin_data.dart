import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const kApiKey = '716C2630-798F-4FE4-906B-3E9BC5EE1242';

class CoinData {
  Future<double?> getCoinData(String selectedCurreny, String coin) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$coin/$selectedCurreny?apiKey=$kApiKey'),
    );

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['rate'];
    }
    return null;
  }
}
