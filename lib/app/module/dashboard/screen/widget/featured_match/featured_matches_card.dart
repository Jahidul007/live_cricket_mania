import 'package:cricket_mania/app/module/common/data/model/match_info_response.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:cricket_mania/app/utils/util_values.dart';
import 'package:cricket_mania/app/utils/string_extension.dart';
import 'package:flutter/material.dart';

class FeaturedMatchCard extends StatelessWidget {
  final Results results;

  const FeaturedMatchCard({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  getDisplayText(results.matchSubtitle),
                  style: body2regular.copyWith(
                      color: primaryTextColor, fontSize: 12),
                ),
                Expanded(
                  child: Text(
                    getDisplayText(". ${results.venue?.split(',').first}"),
                    maxLines: 1,
                    style: body2regular.copyWith(
                        color: primaryTextColor, fontSize: 12),
                  ),
                ),
              ],
            ),
            customHeight(),
            Text(
              '${results.home?.name}',
              style: body2regular,
            ),
            customHeight(),
            Text(
              '${results.away?.name}',
              style: body2regular,
            ),
            customHeight(),
            results.result!.isNotEmpty
                ? Expanded(
                    child: Text(
                      getDisplayText("${results.result}}"),
                      style: body2regular.copyWith(color: primaryColor),
                      maxLines: 2,
                    ),
                  )
                : Text(
                    getDisplayText(
                      "Today ${results.date?.getFormattedDateFromFormattedString(
                        currentFormat: "yyyy-MM-ddTHH:mm:ss",
                        desiredFormat: 'hh:mm a',
                        isUtc: true,
                      )}",
                    ),
                    style: body2regular.copyWith(color: red),
                  ),
          ],
        ),
      ),
    );
  }
}
