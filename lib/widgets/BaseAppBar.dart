import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  const BaseAppBar({
    Key? key,
    required this.title,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: (Text(
        title,
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
