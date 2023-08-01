import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList.first;
  int? rateBTC;
  int? rateETH;
  int? rateLTC;

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value ?? 'USD';
          getRate();
        });
      },
      items: dropdownItems,
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> cupertinoPickerItems = [];
    for (String curreny in currenciesList) {
      cupertinoPickerItems.add(Text(curreny));
    }

    return CupertinoPicker(
      children: cupertinoPickerItems,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getRate();
      },
      itemExtent: 32.0,
    );
  }

  void getRate() async {
    CoinData coinData = CoinData();
    double? rateBTCAsDouble =
        await coinData.getCoinData(selectedCurrency, 'BTC');
    double? rateETHAsDouble =
        await coinData.getCoinData(selectedCurrency, 'ETH');
    double? rateLTCAsDouble =
        await coinData.getCoinData(selectedCurrency, 'LTC');
    setState(() {
      if (rateBTCAsDouble != null) {
        rateBTC = rateBTCAsDouble.toInt();
      }
      if (rateETHAsDouble != null) {
        rateETH = rateETHAsDouble.toInt();
      }
      if (rateLTCAsDouble != null) {
        rateLTC = rateLTCAsDouble.toInt();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoinCard(
                  coin: 'BTC',
                  rate: rateBTC,
                  selectedCurrency: selectedCurrency),
              CoinCard(
                  coin: 'ETH',
                  rate: rateETH,
                  selectedCurrency: selectedCurrency),
              CoinCard(
                  coin: 'LTC',
                  rate: rateLTC,
                  selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.coin,
    required this.rate,
    required this.selectedCurrency,
  });

  final String coin;
  final int? rate;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coin = ${rate ?? '?'} $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
