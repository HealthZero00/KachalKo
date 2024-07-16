import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:KachalKo/controller/controller.dart';
import 'package:KachalKo/pages/category.dart';
import 'package:KachalKo/pages/notes.dart';
import 'package:KachalKo/pages/timer.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController(initialIndex: 1));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            TTimer(),
            Category(),
            Notes(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          backgroundColor: Color(0xff006363),
          selectedItemColor: Color(0xffFFAA00),
          unselectedFontSize: 12,
          selectedFontSize: 12,
          items: [
            _bottomBarItem(Icons.timer, "Таймер"),
            _bottomBarItem(Icons.category, "Категории"),
            _bottomBarItem(Icons.note, "Заметки"),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem _bottomBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
