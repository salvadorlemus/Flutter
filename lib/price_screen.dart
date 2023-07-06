import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'CustomWidgets/CoinCard.dart'; // Import the CoinCard class from the CoinCard.dart file in the CustomWidgets folder
import 'dart:io' show Platform; // Just expose the Platform class from dart:io
import 'package:base/Web/WebUtilities.dart'; // Import the WebUtilities class from the WebUtilities.dart file in the Web folder

const COIN_API_KEY = 'YOUR_API_KEY_HERE';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  bool isLoading = false;
  String selectedCurrency = 'MXN';
  String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

  Map<String, double> criptoPrices = {
    'BTC': 0.0,
    'ETH': 0.0,
    'LTC': 0.0,
  };

  // Method to get the data from the WebUtilities class
  void getCoinRateData() async {
    setState(() {
      isLoading = true;
    });

    for (int i = 0; i < cryptoList.length; i++) {
      var data = await WebUtilities.getWebData(
          '$coinAPIURL/${cryptoList[i]}/$selectedCurrency?apikey=$COIN_API_KEY');
      // print(data);
      //{time: 2023-07-05T23:07:54.0000000Z, asset_id_base: BTC, asset_id_quote: USD, rate: 30396.06354661679}

      criptoPrices[cryptoList[i]] = data['rate'].toDouble();
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCoinRateData();
  }

  // For Android DropDown
  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        selectedCurrency = value!;
        getCoinRateData();
      },
    );
  }

  // For iOS CupertinoPicker
  CupertinoPicker getCupertinoPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getCoinRateData();
      },
      children: pickerItems,
    );
  }

  // Return a widget based on the platform
  Widget GetPicker() {
    if (Platform.isIOS) {
      return getCupertinoPicker();
    } else if (Platform.isAndroid) {
      return getDropDownButton();
    } else {
      return getDropDownButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CoinCard(
                    coinName: cryptoList[0],
                    selectedCurrency: selectedCurrency,
                    coinRate: criptoPrices[cryptoList[0]],
                    isLoading: isLoading),
                CoinCard(
                    coinName: cryptoList[1],
                    selectedCurrency: selectedCurrency,
                    coinRate: criptoPrices[cryptoList[1]],
                    isLoading: isLoading),
                CoinCard(
                    coinName: cryptoList[2],
                    selectedCurrency: selectedCurrency,
                    coinRate: criptoPrices[cryptoList[2]],
                    isLoading: isLoading),
              ],
            ),
          ),
          Container(
            height: 125.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: GetPicker(),
          ),
        ],
      ),
    );
  }
}
