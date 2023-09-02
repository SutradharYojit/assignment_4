import 'package:flutter/material.dart';

import '../view.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final List<Widget> _screens = [
    const MyHomePage(),
    const PendingTaskScreen(),
    const CompletedTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, value, child) {
          return _screens[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.deepPurple),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pending), label: 'Pending Task', backgroundColor: Colors.deepPurple),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Complete Tak',
                backgroundColor: Colors.deepPurple,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: value,
            selectedItemColor: Colors.black,
            iconSize: 35,
            onTap: (index) {
              _selectedIndex.value = index;
            },
            elevation: 10,
          );
        },
      ),
    );
  }
}
