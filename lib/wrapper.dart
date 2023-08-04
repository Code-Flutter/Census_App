import 'package:census_app/auth.dart';
import 'package:census_app/authenticate.dart';
import 'package:census_app/navrbarpage.dart';
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
      return const HomeScreen();
    }
  }
}
