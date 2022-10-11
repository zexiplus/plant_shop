import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black12),
        child: const Center(
            child: Text(
          'you have clicked',
          textAlign: TextAlign.center,
        )));
  }
}
