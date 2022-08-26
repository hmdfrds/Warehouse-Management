// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/providers/item_provider.dart';

class ItemPlace extends StatefulWidget {

  final String? itemId;
  const ItemPlace({
    Key? key,

    this.itemId,
  }) : super(key: key);

  @override
  State<ItemPlace> createState() => _ItemPlaceState();
}

class _ItemPlaceState extends State<ItemPlace> {
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    ItemProvider itemProvider =
        Provider.of<ItemProvider>(context, listen: false);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: widget.itemId == null
                ? const Color(0xffffe8ca)
                : const Color(0xffffb550),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        GestureDetector(
          onTapDown: (tapDownDetails) {
            if (widget.itemId != null) {
              itemProvider.setItemId(
                  widget.itemId!, tapDownDetails.globalPosition);
            }
          },
          child: Consumer<ItemProvider>(
            builder: (context, value, child) {
              return AnimatedContainer(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: value.itemId == widget.itemId
                      ? const Color(0xff00875a).withOpacity(0.3)
                      : const Color(0xff00875a).withOpacity(0),
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: const Duration(milliseconds: 200),
              );
            },
          ),
        ),
      ],
    );
  }
}
