import 'package:cricket_mania/app/module/widget/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cricket_mania/app/utils/constants.dart';

class CustomCard extends StatelessWidget {
  final String? imageUrl; //if null it will hide image section
  final String? iconName; //if null it will hide image section
  final String? title;
  final String? code;
  final bool? online;
  final Widget? subRow1;
  final Widget? subRow2;
  final Widget? subRow3;
  final Widget? subRow4;
  final Widget? subRow5;
  final VoidCallback? onTapMore;
  final VoidCallback? onTap;

  const CustomCard(
      {Key? key,
      this.imageUrl,
      this.iconName,
      @required this.title,
      this.code,
      this.online,
      this.subRow1,
      this.subRow2,
      this.subRow3,
      this.subRow4,
      this.subRow5,
      this.onTapMore,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                imageUrl == null
                    ? const SizedBox()
                    : Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: ProfilePicture(
                          imageUrl,
                          online!,
                          iconName: iconName,
                        ),
                      ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title ?? "",
                          style: homeCardTitleStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      onTapMore != null
                          ? Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: InkWell(
                                onTap: onTapMore,
                                borderRadius: BorderRadius.circular(30),
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SvgPicture.asset("images/ic_more.svg"),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subRow1 ?? const SizedBox(),
                subRow2 != null ? const SizedBox(height: 8) : const SizedBox(),
                subRow2 ?? const SizedBox(),
                subRow3 != null ? const SizedBox(height: 8) : const SizedBox(),
                subRow3 ?? const SizedBox(),
                subRow4 != null ? const SizedBox(height: 8) : const SizedBox(),
                subRow4 ?? const SizedBox(),
                subRow5 != null ? const SizedBox(height: 8) : const SizedBox(),
                subRow5 ?? const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
