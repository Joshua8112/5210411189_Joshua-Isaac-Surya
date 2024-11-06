// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tml/Halaman/Login.dart';

class Splas extends StatefulWidget {
  @override
  _SplasState createState() => _SplasState();
}

class _SplasState extends State<Splas> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/image/logo.png', 
              width: 200,
              height: 200,
            ),
            const CircularProgressIndicator(), 
          ],
        ),
      ),
    );
  }
}
