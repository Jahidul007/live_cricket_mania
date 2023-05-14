import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_height_width.dart';

Widget customDivider() {
  return Divider(
    thickness: 1,
    color: const Color(0xff002540).withOpacity(.1),
  );
}

Widget customDividerGrey() {
  return const Divider(
    thickness: 1,
    color: Color(0xffE8EEF2),
  );
}

Widget customDividerGreyWithHeight() {
  return Column(
    children: [
      customHeight(),
      const Divider(
        thickness: 1,
        color: Color(0xffE8EEF2),
      ),
      customHeight(),
    ],
  );
}

Widget customDividerLessOpacity() {
  return Divider(
    thickness: 1,
    color: const Color(0xff002540).withOpacity(.1),
  );
}

customVerticalDivider() {
  return Column(
    children: [
      SvgPicture.asset(
        "images/ic_line.svg",
        color: Colors.white,
        width: 1.1,
      ),
      customHeight(height: 55),
      const SizedBox()
    ],
  );
}
