import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 40),
      width: double.infinity,
      color: Color.fromARGB(255, 179, 179, 179),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CandleChart(),
            CandleChart(),
            CandleChart(),
            CandleChart(),
            CandleChart(),
            CandleChart(),
            CandleChart(),
          ],
        ),
      ),
    );
  }
}

class CandleChart extends StatelessWidget {
  const CandleChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("\$"),
        Expanded(
          child: Container(
            color: Colors.blue,
            width: 10,
          ),
        ),
      ],
    );
  }
}
