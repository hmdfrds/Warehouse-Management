import 'package:flutter/material.dart';

class SideBarIcon extends StatefulWidget {
  final Function() onTap;
  final IconData iconData;
  final bool choosed;
  const SideBarIcon(
      {Key? key,
      required this.onTap,
      required this.iconData,
      this.choosed = false})
      : super(key: key);

  @override
  State<SideBarIcon> createState() => _SideBarIconState();
}

class _SideBarIconState extends State<SideBarIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: widget.choosed ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: IconButton(
          onPressed: () {
            widget.onTap();
          },
          icon: Icon(
            widget.iconData,
            color: widget.choosed ? const Color(0xffffb550) : Colors.white,
            size: 30,
          ),
        ));
  }
}

//Color(0xff009865)