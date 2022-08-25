import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/widgets/item_place.dart';
import 'package:warehouse/widgets/section_page_list.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var format = DateFormat("dd/MM/yyy");
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Warehouse Logistics",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              format.format(DateTime.now()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      ],
                    ),
                    const Expanded(flex: 9, child: SectionPageList()),
                    Row(
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
                            ItemPlace(itemId: ""),
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
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            onPressed: () {},
                            child: const Text("Show all"))
                      ],
                    ),
                    Expanded(flex: 11, child: Column()),
                  ],
                ),
              ),
            ),
            Expanded(child: Column()),
          ],
        ),
      ),
    );
  }
}
