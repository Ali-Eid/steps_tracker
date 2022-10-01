import 'package:flutter/material.dart';
import 'package:step_tracker/core/constants/constatns.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(token ?? 'null'));
  }
}
