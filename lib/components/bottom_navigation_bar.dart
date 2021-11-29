import 'package:flutter/material.dart';
import 'package:passapp_clone/config/app_config.dart';

class CBottomNavigationBar extends StatelessWidget {
  const CBottomNavigationBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onItemTapped;

  static const List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_book,
      ),
      label: 'My Booking',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.phone_rounded,
      ),
      label: "Contact us",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        ..._bottomNavigationBarItem
      ],
      currentIndex: selectedIndex,
      selectedItemColor: AppConfig.primaryColor,
      unselectedItemColor: AppConfig.primaryGreyColor,
      onTap: onItemTapped,
    );
  }
}
