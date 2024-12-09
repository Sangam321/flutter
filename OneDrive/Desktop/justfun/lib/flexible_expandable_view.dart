import 'package:flutter/material.dart';

class FlexibleExpandableView extends StatelessWidget {
  const FlexibleExpandableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
