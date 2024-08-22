// ignore_for_file: avoid_print

import 'package:billionare_app/add_money_button.dart';
import 'package:billionare_app/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;

  Future<void> addMoney() async {
    setState(() {
      balance = balance + 500;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);

    print(balance);
  }

  Future<void> loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  @override
  void initState() {
    loadBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Billionare App",
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),
        body: Container(
            color: Colors.blueGrey.shade800,
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // In this area, we will see the passing of properties or PROPS
                //Parent to Child Communication
                BalanceView(
                  balance: balance,
                ),
                //Child to Parent Communication
                AddMoneyButton(
                  addMoneyFunction: addMoney,
                )
              ],
            )),
      ),
    );
  }
}
