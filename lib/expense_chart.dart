import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      color: Colors.yellow,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.blue,
              width: 10,
            ),
            Container(
              color: Colors.blue,
              width: 10,
            ),
            Container(
              color: Colors.blue,
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
