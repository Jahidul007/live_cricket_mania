import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cricket_mania/app/utils/constants.dart';

//ignore: immutable
class ProfilePicture extends StatefulWidget {
  String? partialUrl;
  bool isOnline = false;
  String? iconName;

  ProfilePicture(this.partialUrl, this.isOnline, {Key? key, this.iconName})
      : super(key: key);

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: greyBorderColor,
          radius: 26,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(
              child: widget.partialUrl!.contains("null")
                  ? widget.iconName == null
                      ? const Icon(
                          Icons.person_outline,
                          size: 22,
                          color: primaryColor,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            "images/ic_car.svg",
                            color: Colors.white,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                  : CachedNetworkImage(
                      imageUrl: widget.partialUrl!,
                      fit: BoxFit.cover,
                      height: 90,
                      width: 90,
                    ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: Visibility(
            visible: widget.isOnline,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(0xFF151C26), width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
