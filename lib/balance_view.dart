import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatelessWidget {
  BalanceView({
    super.key,
    required this.balance,
  });

  double balance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Balance",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            ' ${NumberFormat.simpleCurrency(name: '₱ ').format(balance)}',
            // " $balance",
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
