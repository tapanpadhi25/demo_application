import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class BottomNavigateBarScreen extends StatefulWidget {
  const BottomNavigateBarScreen({super.key});

  @override
  State<BottomNavigateBarScreen> createState() =>
      _BottomNavigateBarScreenState();
}

class _BottomNavigateBarScreenState extends State<BottomNavigateBarScreen> {
  RxInt selectedIndex = 0.obs;
  List<Widget> widgetList = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void itemClick(int index) {
    setState(() {
      selectedIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
         () {
          return Center(
            child: widgetList[selectedIndex.value],
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'MIS',
          ),
        ],
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:
            Get.textTheme.titleSmall!.copyWith(color: Colors.grey),
        selectedLabelStyle:
            Get.textTheme.titleSmall!.copyWith(color: Colors.white),
        currentIndex: selectedIndex.value,
        onTap: (value){
          itemClick(value);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
