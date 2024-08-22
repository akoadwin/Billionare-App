import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddMoneyButton extends StatelessWidget {
  AddMoneyButton({super.key, required this.addMoneyFunction});

  void Function() addMoneyFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 0),
              backgroundColor: Colors.red.shade800),
          onPressed: addMoneyFunction,
          child: const Text(
            "Add Money",
            style: TextStyle(fontFamily: 'Poppins'),
          )),
    );
  }
}
