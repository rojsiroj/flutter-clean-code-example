import 'package:flutter/material.dart';

import '../../../domain/entities/user.dart';

class MainPage extends StatelessWidget {
  final User user;
  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }
}
