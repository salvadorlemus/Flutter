import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

var f = NumberFormat("#,###.0#");

Card CoinCard(
    {String coinName = 'BTC',
    String selectedCurrency = 'USD',
    double? coinRate = 0.0,
    bool isLoading = false}) {
  return Card(
    color: Colors.lightBlueAccent,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: SizedBox(
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: !isLoading
            ? Text(
                '1 $coinName = ${f.format(coinRate)} $selectedCurrency',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )
            : const SpinKitCubeGrid(
                color: Colors.white,
                size: 20.0,
              ),
      ),
    ),
  );
}
