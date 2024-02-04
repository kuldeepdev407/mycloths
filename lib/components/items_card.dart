import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class ItemsCard extends StatelessWidget {
  String? imageLink =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.SexDBQkwAv9g6dyOBaZl3AHaJC%26pid%3DApi&f=1&ipt=d019429c75a890e8a08cc332c309516eeb5d6efd9687141e4e36f70d0ebf4f54&ipo=images";
  String? title = "My Shirt";
  String? count = "10";
  ItemsCard({super.key, this.title, this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      semanticContainer: true,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      margin: const EdgeInsets.all(0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 200,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                imageLink!,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title!, style: Theme.of(context).textTheme.bodyLarge),
                Text(count!, style: Theme.of(context).textTheme.bodyLarge),
                // const Expanded(child: SizedBox()),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.local_laundry_service),
                )),
          )
        ],
      ),
    );
  }
}
