// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';

class TabbarBottom extends StatefulWidget {
  final tabbarItems;
  final tabbarItem1;
  final tabbarItem2;
  final tabbarItem3;
  final tabbarItemTitle;
  const TabbarBottom(
      {Key? key,
      this.tabbarItem1,
      this.tabbarItem2,
      this.tabbarItem3,
      this.tabbarItems,
      this.tabbarItemTitle})
      : super(key: key);
  @override
  State<TabbarBottom> createState() => _TabbarBottomState();
}

class _TabbarBottomState extends State<TabbarBottom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem myWidget(item) {
    final data = Map<String, dynamic>.from(item as Map<dynamic, dynamic>);
    var userProfile = data.toString();
    return BottomNavigationBarItem(
        icon: Icon(Icons.search), label: userProfile);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      widget.tabbarItem1,
      widget.tabbarItem2,
      widget.tabbarItem3,
    ];
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'tabbarItem1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'tabbarItem1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'tabbarItem1',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorPrimary,
        onTap: _onItemTapped,
      ),
    );
  }
}
