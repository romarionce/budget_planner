// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final int per;
  final double height;
  const Slide({super.key, required this.per, this.height = 4});

  @override
  Widget build(BuildContext context) {
    var val = per;
    if (per >= 100) val = 100;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(.3),
      ),
      child: Row(
        children: [
          Expanded(
            flex: val,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            flex: 100 - val,
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
