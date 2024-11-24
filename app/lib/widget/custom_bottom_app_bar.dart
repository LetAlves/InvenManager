import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Color? selectedItemColor;
  final List<CustomBottomAppBarItem> children;
  const CustomBottomAppBar({
    Key? key,
    this.selectedItemColor,
    required this.children,
  }) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.gray_800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.children.map(
          (item) {
            final currentItem =
                widget.children.indexOf(item) == _selectedItemIndex;

            return Expanded(
              key: item.key,
              child: InkWell(
                onTap: item.onPressed,
                onTapUp: (_) {
                  _selectedItemIndex = widget.children.indexOf(item);
                  log(_selectedItemIndex.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        currentItem ? item.primaryIcon : item.secondaryIcon,
                        color: currentItem
                            ? widget.selectedItemColor
                            : AppColor.gray_300,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.label!,
                        style: TextStyle(
                            color: currentItem
                                ? widget.selectedItemColor
                                : AppColor.gray_300),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class CustomBottomAppBarItem {
  final Key? key;
  final String? label;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;
  final VoidCallback? onPressed;

  CustomBottomAppBarItem({
    this.key,
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });

  CustomBottomAppBarItem.empty({
    this.key,
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });
}
