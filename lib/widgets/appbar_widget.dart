import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, this.title}) : super(key: key);
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
