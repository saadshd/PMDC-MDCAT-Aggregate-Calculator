import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {

  String title, value;
  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,5,5,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}