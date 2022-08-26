import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/models/section.dart';
import 'package:warehouse/providers/section_provider.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SectionProvider sectionProvider = Provider.of<SectionProvider>(context);
    return Container(
        padding: const EdgeInsets.all(40),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff00875a),
            borderRadius: BorderRadius.circular(50)),
        margin: const EdgeInsets.all(40),
        child: sectionProvider.sectionId != ""
            ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("Section")
                    .doc(sectionProvider.sectionId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  Section section = Section.fromMap(snapshot.data!.data()!);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Section ${section.name} usage",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                      CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 10.0,
                        percent: section.items.length / section.capacity,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${(section.items.length / section.capacity * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Location used",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: const Color(0xffffb550),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Loaded",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white60),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${section.items.length} Shelves",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              const Text(
                                "Empty",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white60),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${section.capacity - section.items.length} Shelves",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                })
            : const Center(child: CircularProgressIndicator()));
  }
}
