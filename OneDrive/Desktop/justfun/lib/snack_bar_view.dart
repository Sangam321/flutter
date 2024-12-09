import 'package:flutter/material.dart';

class SnackBarView extends StatefulWidget {
  const SnackBarView({super.key});

  @override
  State<SnackBarView> createState() => _SnackBarViewState();
}

class _SnackBarViewState extends State<SnackBarView> {
  _showsnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Ehllo sangam'),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => _showsnackbar(), child: const Text('Buttom 1')),
      ),
    );
  }
}
