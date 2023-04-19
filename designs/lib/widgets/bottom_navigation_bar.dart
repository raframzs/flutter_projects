import 'package:flutter/material.dart';

class CustomBottonNabvar extends StatefulWidget {
  const CustomBottonNabvar({super.key});

  @override
  State<CustomBottonNabvar> createState() => _CustomBottonNabvarState();
}

class _CustomBottonNabvarState extends State<CustomBottonNabvar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,
        backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
                size: 30,
              ),
              label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_outlined,
                size: 30,
              ),
              label: 'Graphic'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3_outlined,
                size: 30,
              ),
              label: 'Users'),
        ]);
  }
}
