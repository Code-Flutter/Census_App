import 'package:Census/auth.dart';
import 'package:Census/authenticate.dart';
import 'package:Census/navrbarpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
