import 'package:flutter/material.dart';
import 'package:warehouse/screens/dashboard_screen.dart';
import 'package:warehouse/widgets/side_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  var pages = [
    const DashBoardScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.red,
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xff00875a),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Admin",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SideBar(
                        onTap: (index) {
                          pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return pages[index];
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
