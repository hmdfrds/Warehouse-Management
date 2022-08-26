// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:warehouse/models/section.dart';
import 'package:warehouse/widgets/item_place.dart';

class ItemWrap extends StatefulWidget {
  const ItemWrap({
    Key? key,
    required this.sections,
    required this.listIndex,
  }) : super(key: key);

  final List<Section> sections;
  final int listIndex;

  @override
  State<ItemWrap> createState() => _ItemWrapState();
}

class _ItemWrapState extends State<ItemWrap> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Wrap(
          clipBehavior: Clip.none,
          spacing: 5,
          runSpacing: 5,
          children: List.generate(widget.sections[widget.listIndex].capacity,
              (index) {
            return widget.sections[widget.listIndex].items.keys
                    .contains(index.toString())
                ? ItemPlace(
                    itemId: widget
                        .sections[widget.listIndex].items[index.toString()])
                : const ItemPlace();
          }),
        ),
      ),
    );
  }
}
