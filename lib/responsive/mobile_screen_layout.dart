import 'package:englishstudy/utils/colors.dart';
import 'package:englishstudy/utils/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTaped(int page){
    pageController.jumpToPage(page);
  }
  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView(
              children: homeScreenItems,
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged
            ),
          bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0), // Set the top left corner radius
                topRight: Radius.circular(20.0), // Set the top right corner radius
              ),

              child: CupertinoTabBar(
                height: 60,
                backgroundColor: appBarColor,
                items: [
                  bottomNavigationBarItemMethod(0, Icons.home_filled),
                  bottomNavigationBarItemMethod(1, Icons.add_circle_outline_sharp),
                  bottomNavigationBarItemMethod(2, Icons.local_library_outlined),

                ],
                onTap: navigationTaped,
              ),
          ),
        )
    );
  }

  BottomNavigationBarItem bottomNavigationBarItemMethod(int page, IconData iconItem){
    return BottomNavigationBarItem(
      icon: Icon(
          iconItem,
          color: _page == page ? Colors.blue[200] : Colors.white,
      ),
      label: "",
      backgroundColor: Colors.blue[500]

    );
  }
}
