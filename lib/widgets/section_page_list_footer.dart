import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/providers/item_provider.dart';
import 'package:warehouse/widgets/item_place.dart';

class SectionPageListFooter extends StatelessWidget {
  const SectionPageListFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemProvider itemProvider =
        Provider.of<ItemProvider>(context, listen: false);
    return Row(
      children: [
        Row(
          children: const [
            ItemPlace(),
            SizedBox(width: 10),
            Text(
              "Free place",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(width: 30),
        Row(
          children: const [
            AbsorbPointer(
              absorbing: true,
              child: ItemPlace(
                itemId: "test",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Loaded place",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
            style: TextButton.styleFrom(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            onPressed: () {
              itemProvider.removeCard();
            },
            child: const Text("Show all"))
      ],
    );
  }
}
