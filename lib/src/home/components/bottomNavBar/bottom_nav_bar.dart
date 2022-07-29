// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'bottom_nav_bar_item/bottom_nav_bar_item_model.dart';
import 'bottom_nav_bar_item/bottom_nav_bar_item_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {required this.selectedIndex,
      required this.callback,
      Key? key,
      required this.items})
      : super(key: key);

  final void Function(int newindex) callback;
  final int selectedIndex;
  final List<BottomNavBarItemModel> items;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 8,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarItemsBuilder(widget.items),
      ),
    );
  }

  List<Widget> bottomNavBarItemsBuilder(List items) {
    var lista = <Widget>[];
    int count = 0;
    for (BottomNavBarItemModel item in items) {
      lista.add(
        BottomNavBarItemWidget(
          selected: count == widget.selectedIndex,
          icon: item.icon,
          label: item.label,
          index: count,
          callback: widget.callback,
        ),
      );
      if (count <= (items.length - 2)) {
        lista.add(const VerticalDivider(width: 22));
      }
      count++;
    }
    return lista;
  }
}
