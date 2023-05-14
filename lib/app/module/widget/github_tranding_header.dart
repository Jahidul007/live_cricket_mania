import 'package:flutter/material.dart';

class GithubAppTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  const GithubAppTopBar(
      {Key? key,
      required this.title,
      this.bgColor = Colors.white,
      this.actions,
      this.onBackPress})
      : super(key: key);

  final String title;
  final Color? bgColor;
  final List<Widget>? actions;
  final Function()? onBackPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: bgColor,
      centerTitle: true,
      leading: BackButton(
          color: Colors.black,
          onPressed: () => onBackPress != null
              ? onBackPress!()
              : Navigator.maybePop(context)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
