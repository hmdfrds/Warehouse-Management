import 'package:flutter/material.dart';
import 'package:warehouse/widgets/side_bar_icon.dart';

class SideBar extends StatefulWidget {
  final Function(int) onTap;
  const SideBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SideBarIcon(
            choosed: currentIndex == 0,
            onTap: () {
              widget.onTap(0);
              setState(() {
                currentIndex = 0;
              });
            },
            iconData: Icons.dashboard_outlined),
        SideBarIcon(
            choosed: currentIndex == 1,
            onTap: () {
              widget.onTap(1);
              setState(() {
                currentIndex = 1;
              });
            },
            iconData: Icons.storage_outlined),
        SideBarIcon(
            choosed: currentIndex == 2,
            onTap: () {
              widget.onTap(2);
              setState(() {
                currentIndex = 2;
              });
            },
            iconData: Icons.fire_truck_outlined),
        SideBarIcon(
            choosed: currentIndex == 3,
            onTap: () {
              widget.onTap(3);
              setState(() {
                currentIndex = 3;
              });
            },
            iconData: Icons.notifications_outlined),
        SideBarIcon(
            choosed: currentIndex == 4,
            onTap: () {
              widget.onTap(4);
              setState(() {
                currentIndex = 4;
              });
            },
            iconData: Icons.settings_outlined),
      ],
    );
  }
}
