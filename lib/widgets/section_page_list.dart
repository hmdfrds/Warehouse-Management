import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/models/section.dart';
import 'package:warehouse/widgets/item_place.dart';

class SectionPageList extends StatefulWidget {
  const SectionPageList({Key? key}) : super(key: key);

  @override
  State<SectionPageList> createState() => _SectionPageListState();
}

class _SectionPageListState extends State<SectionPageList> {
  List<Section> sections = [];

  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("Section")
            .orderBy("name")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isNotEmpty) {
            sections.clear();
            for (var element in snapshot.data!.docs) {
              Section section = Section.fromMap(element.data());
              sections.add(section);
            }
            return PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: sections.length,
                itemBuilder: (context, listIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Visibility(
                            visible: pageIndex - 1 != -1,
                            child: IconButton(
                              onPressed: () {
                                pageIndex -= 1;
                                pageController.animateToPage(pageIndex,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              },
                              icon: const Icon(Icons.chevron_left_sharp),
                            ),
                          ),
                          Text(
                            "Section ${sections[listIndex].name}",
                            style: const TextStyle(fontSize: 25),
                          ),
                          Visibility(
                            visible: pageIndex + 1 != sections.length,
                            child: IconButton(
                              onPressed: () {
                                pageIndex += 1;
                                pageController.animateToPage(pageIndex,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              },
                              icon: const Icon(Icons.chevron_right_sharp),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(sections[listIndex].capacity,
                              (index) {
                            return sections[listIndex]
                                    .items
                                    .keys
                                    .contains(index.toString())
                                ? ItemPlace(
                                    itemId: sections[listIndex]
                                        .items[index.toString()])
                                : const ItemPlace();
                          }),
                        ),
                      ),
                    ],
                  );
                });
          }
          return const SizedBox();
        });
  }
}
