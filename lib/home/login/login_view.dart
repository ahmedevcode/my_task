import 'package:flutter/material.dart';
import 'package:tasks3/home/login/widget/login_body.dart';

class login_view extends StatelessWidget {
  const login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login_body(),
    );
  }
}
