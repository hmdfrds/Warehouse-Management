// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:warehouse/models/section.dart';
import 'package:warehouse/providers/item_provider.dart';
import 'package:warehouse/providers/section_provider.dart';
import 'package:warehouse/widgets/item_wrap.dart';

class SectionPageList extends StatefulWidget {
  const SectionPageList({
    Key? key,
  }) : super(key: key);

  @override
  State<SectionPageList> createState() => _SectionPageListState();
}

class _SectionPageListState extends State<SectionPageList> {
  List<Section> sections = [];

  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    ItemProvider itemProvider =
        Provider.of<ItemProvider>(context, listen: false);
    SectionProvider sectionProvider =
        Provider.of<SectionProvider>(context, listen: false);
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
              section.id = element.id;
              sections.add(section);
            }
            Future.delayed(Duration.zero, () {
              sectionProvider.setSectionId(sections.first.id);
            });
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
                                itemProvider.removeCard();
                                pageIndex -= 1;
                                sectionProvider
                                    .setSectionId(sections[pageIndex].id);
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
                                itemProvider.removeCard();
                                pageIndex += 1;
                                sectionProvider
                                    .setSectionId(sections[pageIndex].id);
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
                        child:
                            ItemWrap(sections: sections, listIndex: listIndex),
                      ),
                    ],
                  );
                });
          }
          return const SizedBox();
        });
  }
}
