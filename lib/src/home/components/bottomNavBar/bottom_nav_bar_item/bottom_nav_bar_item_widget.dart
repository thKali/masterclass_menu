import 'package:flutter/material.dart';

class BottomNavBarItemWidget extends StatefulWidget {
  const BottomNavBarItemWidget({
    Key? key,
    required this.icon,
    required this.index,
    required this.callback,
    required this.label,
    required this.selected,
  }) : super(key: key);

  final IconData icon;
  final int index;
  final void Function(int) callback;
  final String label;
  final bool selected;

  @override
  State<BottomNavBarItemWidget> createState() => _BottomNavBarItemWidgetState();
}

class _BottomNavBarItemWidgetState extends State<BottomNavBarItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        widget.callback(widget.index);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              duration: const Duration(milliseconds: 150),
              color: Colors.blueGrey.withOpacity(widget.selected ? 0.15 : 0),
              child: Icon(widget.icon),
            ),
          ),
          Text(widget.label),
        ],
      ),
    );
  }
}
