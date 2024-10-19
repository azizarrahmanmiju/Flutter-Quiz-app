import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/Screen/Adminscreen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BottomNave extends StatefulWidget {
  @override
  State<BottomNave> createState() => _BottomNaveState();
}

class _BottomNaveState extends State<BottomNave> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: const <Widget>[
              Center(child: Text("1")),
              Center(child: Text("2")),
              AdmitScreen()
            ]),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.dashboard,
              outlinedIcon: Icons.dashboard_outlined,
            ),
            BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded),
            BarItem(
              filledIcon: Icons.person_off,
              outlinedIcon: Icons.person_off_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
