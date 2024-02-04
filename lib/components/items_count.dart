import 'package:flutter/material.dart';

class KeyValue extends StatelessWidget {
  String keyString = "";
  String valueString = "";
  KeyValue({super.key, required this.keyString, required this.valueString});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            keyString,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(valueString)
        ],
      ),
    );
  }
}

class ItemsStatsWidget extends StatelessWidget {
  const ItemsStatsWidget({super.key});

  final num = 100000;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        KeyValue(keyString: "Total Items", valueString: num.toString()),
        KeyValue(keyString: "Total Cloths", valueString: num.toString()),
        KeyValue(keyString: "Total Accessories", valueString: num.toString())
      ],
    ));
  }
}
