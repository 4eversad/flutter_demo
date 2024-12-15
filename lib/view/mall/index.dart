import 'package:flutter/material.dart';

class Mall extends StatelessWidget {
  const Mall({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(title: const Text('市集')),
    ));
  }
}
