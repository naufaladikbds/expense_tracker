import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      color: Color.fromARGB(255, 214, 214, 214),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 8, bottom: 12, left: 10, right: 10),
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
