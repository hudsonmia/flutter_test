// app_bar.dart

import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: const Icon(
        Icons.calculate,
        color: Colors.white,
        size: 40,
      ),
      title: const Row(
        children: [
          Text(
            "계산기",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      actions: const [
        Icon(Icons.search),
      ],
    );
  }
}
