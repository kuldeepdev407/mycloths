import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mycloths/components/items_card.dart';
import 'package:mycloths/components/items_count.dart';
import 'package:mycloths/main.dart';
import 'package:mycloths/models/item.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  void _AddItem() {
    context.goNamed('AddItem');
  }

  int selectedClothCount = 0;

  List<Map> Cloths = [
    {
      "id": 1,
      "name": "White Shirt",
      "image": "",
      "availableCount": 3,
      "selected": 0
    },
    {
      "id": 2,
      "name": "Blue Shirt",
      "image": "",
      "availableCount": 1,
      "selected": 0
    },
    {
      "id": 3,
      "name": "Green Shirt",
      "image": "",
      "availableCount": 1,
      "selected": 0
    },
    {
      "id": 4,
      "name": "Green Shirt",
      "image": "",
      "availableCount": 1,
      "selected": 0
    },
    {
      "id": 4,
      "name": "Green Shirt",
      "image": "",
      "availableCount": 1,
      "selected": 0
    },
    {
      "id": 4,
      "name": "Green Shirt",
      "image": "",
      "availableCount": 1,
      "selected": 0
    },
    {
      "id": 4,
      "name": "Green Shirt",
      "image": "",
      "availableCount": 1,
      "selected": 0
    }
  ];

  void getAllCloths() {
    final itemStore = objectBox.store.box<Item>();

    final remaing =
        itemStore.getAll().where((element) => element.isInLaundary == false);

    final data = remaing.toList();
    setState(() {
      List<Map> clothsData = [];
      for (int i = 0; i < data.length; i++) {
        clothsData.add({
          "id": data[i].id,
          "name": data[i].name,
          "image": data[i].imgpath.isNotEmpty ? data[i].imgpath[0] : "",
          "availableCount": 1,
          "selected": 0
        });
      }
      Cloths = clothsData;
    });

    // {
    //   "id": 1,
    //   "name": "White Shirt",
    //   "image": "",
    //   "availableCount": 3,
    //   "selected": 0
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Inventory"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Theme.of(context).primaryColor))
        ],
        elevation: 1.0,
      ),
      body: Container(
        // padding: const EdgeInsets.all(10),
        child: Column(children: [
          Expanded(
            // height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1 / 1.18),
                  itemCount: Cloths.length,
                  itemBuilder: (_, index) {
                    return ItemsCard(
                      count: Cloths[index]["availableCount"].toString(),
                      title: Cloths[index]["name"],
                    );
                  }),
            ),
          ),
          selectedClothCount > 0
              ? ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("10 Cloths are Added",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Theme.of(context).canvasColor,
                                )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "send cloths to laundary",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context).canvasColor,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
              : const SizedBox()
        ]),
      ),
      floatingActionButton: selectedClothCount == 0
          ? FloatingActionButton(
              onPressed: _AddItem,
              shape: const CircleBorder(eccentricity: 0.5),
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
    );
  }
}
