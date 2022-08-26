// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemMiniDetailCard extends StatefulWidget {
  final String itemId;
  const ItemMiniDetailCard({
    Key? key,
    required this.itemId,
  }) : super(key: key);

  @override
  State<ItemMiniDetailCard> createState() => _ItemMiniDetailCardState();
}

class _ItemMiniDetailCardState extends State<ItemMiniDetailCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection("Items")
            .doc(widget.itemId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 150,
            decoration: BoxDecoration(
                color: const Color(0xaa00875a),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/box.jpg",
                    fit: BoxFit.cover,
                    width: 110,
                    height: 110,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Item Name",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "H60 x W60 x 20KG",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "From",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Delivered time",
                      style: TextStyle(fontSize: 20, color: Colors.white60),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
