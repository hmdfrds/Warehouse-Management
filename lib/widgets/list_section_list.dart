// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/models/section.dart';
import 'package:warehouse/widgets/section_list.dart';

class ListSectionList extends StatefulWidget {
  const ListSectionList({
    Key? key,
  }) : super(key: key);

  @override
  State<ListSectionList> createState() => _ListSectionListState();
}

class _ListSectionListState extends State<ListSectionList> {
  List<Section> sections = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: const [
            Text(
              "List of sections",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        const SizedBox(height: 20),
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection("Section").snapshots(),
            builder: (context, snapshot) {
              sections.clear();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  for (var element in snapshot.data!.docs) {
                    Section section = Section.fromMap(element.data());
                    sections.add(section);
                  }
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SectionList(
                            sectionName: sections[index].name,
                            lastUpdatedDate:
                                sections[index].lastUpdateDate.toDate(),
                            percentUsed: sections[index].items.length /
                                sections[index].capacity);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 25);
                      },
                      itemCount: sections.length);
                }
              }
              return const SizedBox();
            }),
      ],
    );
  }
}
