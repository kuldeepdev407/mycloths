import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  int itemType = 0;
  final activeButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      return Colors.blue;
    }),
  );

  void setActiveItemType(int index) {
    setState(() {
      itemType = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: const Text('Add Item'),
          leading: IconButton(
              onPressed: () {
                context.go("/");
              },
              icon: const Icon(Icons.chevron_left_rounded))),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: OutlinedButton(
                  style:
                      itemType == 0 ? activeButtonStyle : const ButtonStyle(),
                  onPressed: () => {setActiveItemType(0)},
                  child: const Text("Cloths"),
                )),
                const SizedBox(
                  width: 2.0,
                ),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => {setActiveItemType(1)},
                        child: const Text("Accessory"))),
                // ElevatedButton(onPressed: () => {}, child: Text("Accessory")),
                // ElevatedButton(onPressed: () => {}, child: Text("Work"))
              ],
            ),
            const Divider(),
            Row(
              children: [
                const SizedBox(width: 60, child: Text("Name")),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 60, child: Text("Price")),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
