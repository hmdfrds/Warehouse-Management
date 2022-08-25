import 'package:flutter/material.dart';

class ItemPlace extends StatelessWidget {
  final String? itemId;
  const ItemPlace({
    Key? key,
    this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: itemId == null ? const Color(0xffffe8ca) : const Color(0xffffb550),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
