// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SectionList extends StatefulWidget {
  final String sectionName;
  final DateTime lastUpdatedDate;
  final double percentUsed;
  const SectionList({
    Key? key,
    required this.sectionName,
    required this.lastUpdatedDate,
    required this.percentUsed,
  }) : super(key: key);

  @override
  State<SectionList> createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  DateFormat dateFormat = DateFormat("dd/MM/yy");
  var color = [
    Colors.yellowAccent,
    Colors.yellow,
    Colors.amberAccent,
    Colors.amber,
    Colors.orangeAccent,
    Colors.orange,
    Colors.deepOrangeAccent,
    Colors.lightGreen,
    Colors.green,
    Colors.redAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Row(
        children: [
          Text(
            "Section ${widget.sectionName}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: Colors.black45,
              ),
              const SizedBox(width: 10),
              Text(
                dateFormat.format(widget.lastUpdatedDate),
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Used",
                style: TextStyle(fontSize: 20),
              ),
              LinearPercentIndicator(
                animateFromLastPercent: true,
                animation: true,
                barRadius: const Radius.circular(20),
                width: constraint.maxWidth / 2.5,
                lineHeight: 14.0,
                percent: widget.percentUsed,
                progressColor: color[(widget.percentUsed * 10).toInt()],
              ),
            ],
          ),
          const Spacer(),
          Expanded(
            child: Text(
              "${(widget.percentUsed * 100).toStringAsFixed(0)}%",
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          )
        ],
      );
    });
  }
}
