
import 'package:flutter/material.dart';
import 'package:cricket_mania/app/utils/constants.dart';

import 'app_button_small.dart';

showSuccessDialog(BuildContext context, String msg, String subtitle,
    {Function? onTapOkay,
    String iconName = "images/ic_success.png",
    Color iconColor = Colors.green}) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      barrierColor: const Color(0xff002540).withOpacity(0.4),
      isScrollControlled: true,
      builder: (BuildContext buildContext) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    iconName,
                    color: iconColor,
                  ),
                ),
                Container(height: 20),
                msg.trim().isNotEmpty
                    ? Align(
                        child: Text(
                          msg,
                          style: textNormalStyle.copyWith(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                Container(height: msg.trim().isNotEmpty ? 20 : 0),
                Align(
                  child: Text(
                    subtitle,
                    style: textNormalStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(height: 20),
                AppButtonSmall(
                  title: "Ok",
                  onPressed: () {
                    if (onTapOkay != null) {
                      onTapOkay();
                    } else {
                      Navigator.of(buildContext).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      });
}
