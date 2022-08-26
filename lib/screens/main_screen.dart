import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/providers/item_provider.dart';
import 'package:warehouse/screens/dashboard_screen.dart';
import 'package:warehouse/widgets/item_mini_detail_card.dart';
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
    ItemProvider itemProvider =
        Provider.of<ItemProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            itemProvider.removeCard();
          },
          child: Stack(
            children: [
              Container(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: SideBar(
                              onTap: (index) {
                                itemProvider.removeCard();
                                pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              },
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageController,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return pages[index];
                          }),
                    ),
                  ],
                ),
              ),
              Consumer<ItemProvider>(builder: (context, item, child) {
                return Visibility(
                  visible: item.choosed,
                  child: Transform.translate(
                    offset: Offset(
                      item.ofsetPosition.dx,
                      item.ofsetPosition.dy,
                    ),
                    child: ItemMiniDetailCard(
                      itemId: item.itemId,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
