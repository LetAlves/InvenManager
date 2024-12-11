import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Color? selectedItemColor;
  final int currentIndex;
  final List<CustomBottomAppBarItem> children;

  const CustomBottomAppBar({
    Key? key,
    this.selectedItemColor,
    required this.currentIndex,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.gray_800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children.asMap().entries.map((entry) {
          final int index = entry.key;
          final CustomBottomAppBarItem item = entry.value;
          final bool isSelected = index == currentIndex;

          return Expanded(
            key: item.key,
            child: InkWell(
              onTap: () {
                if (item.onPressed != null) {
                  item.onPressed!();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isSelected ? item.secondaryIcon : item.primaryIcon,
                      color: isSelected ? selectedItemColor : AppColor.gray_300,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      item.label ?? '',
                      style: TextStyle(
                        color:
                            isSelected ? selectedItemColor : AppColor.gray_300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
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
