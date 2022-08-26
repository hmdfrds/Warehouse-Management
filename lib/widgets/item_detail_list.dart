import 'package:flutter/material.dart';
import 'package:warehouse/widgets/item_list_view.dart';

class ItemDetailList extends StatefulWidget {
  const ItemDetailList({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemDetailList> createState() => _ItemDetailListState();
}

class _ItemDetailListState extends State<ItemDetailList> {
  var status = ["received", "sent", "expected"];
  int choosedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      choosedIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Received",
                      style: TextStyle(
                          fontSize: 20,
                          color:
                              choosedIndex == 0 ? Colors.green : Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      choosedIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Sent",
                      style: TextStyle(
                          fontSize: 20,
                          color:
                              choosedIndex == 1 ? Colors.green : Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      choosedIndex = 2;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Expected",
                      style: TextStyle(
                          fontSize: 20,
                          color:
                              choosedIndex == 2 ? Colors.green : Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ItemListView(
            status: status[choosedIndex],
          )
        ],
      ),
    );
  }
}
