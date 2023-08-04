import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play'),
      ),
      body: const Center(
        child: Text('Welcome to the Play Screen!'),
      ),
    );
  }
}
