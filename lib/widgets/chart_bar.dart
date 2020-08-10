import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double total;
  final double spendingPercentageOfTotal;

  ChartBar(this.day, this.total, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(day),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  // color: Color.fromARGB(1, 1, 1, 1),
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '\$${total.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
