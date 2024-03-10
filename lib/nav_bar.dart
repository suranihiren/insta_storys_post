import 'dart:io';

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 0,
        right: 0,
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        height: 100,
        color:Colors.transparent,
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(


            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                navItem(
                  pageIndex == 0?Icons.home :Icons.home_outlined,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  Icons.search,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                // const SizedBox(width: 80),
                navItem(
                  pageIndex == 2?Icons.person_pin_rounded :Icons.person_pin_outlined,
                  pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  pageIndex == 3?Icons.notifications:Icons.notifications_none,
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
                navItem(
                  Icons.menu,
                  pageIndex == 4,
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected ? Colors.indigo : Colors.black.withOpacity(0.5),size: 28,
        ),
      ),
    );
  }
}
