import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          height: MediaQuery.of(context)
              .size
              .height, //to have the 100% of the height size
          color: Colors.amber,
        ),
        Container(
          height: 200,
          color: Colors.red,
        ),
      ],
    );
  }
}
