import 'package:flutter/material.dart';

class SharedHomeView extends StatelessWidget {
  const SharedHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Home'),
      ),
      body: const Center(
        child: Text('Shared Home'),
      ),
    );
  }
}
