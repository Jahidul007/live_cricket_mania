import 'package:cricket_mania/app/module/core/screen/base_page_screen.dart';
import 'package:cricket_mania/app/module/core/screen/base_screen.dart';
import 'package:cricket_mania/app/module/dashboard/data/model/series_response.dart';
import 'package:cricket_mania/app/module/series/controller/series_controller.dart';
import 'package:cricket_mania/app/module/widget/custom_height_width.dart';
import 'package:cricket_mania/app/module/widget/item_with_value.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:cricket_mania/app/utils/util_values.dart';
import 'package:flutter/material.dart';

class SeriesScreen extends BasePageScreen {
  final List<Series> series;

  const SeriesScreen({Key? key, required this.series}) : super(key: key);

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends BaseState<SeriesScreen> {
  final SeriesController _seriesController = SeriesController();

  @override
  void initState() {
    super.initState();
    //  _seriesController.getSeries();
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Series"),
      centerTitle: true,
    );
  }

  @override
  bindControllers() {
    addControllers(_seriesController);
  }

  @override
  Widget body() {
    return widget.series.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.series.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDisplayText(widget.series[index].seriesName),
                          style: titleTag,
                        ),
                        customHeight(),
                        ItemWithValue(
                            "Series Id: ${widget.series[index].seriesId}",
                            "Session: ${widget.series[index].season}"),
                        customHeight(),
                        ItemWithValue(
                          "Status",
                          "${widget.series[index].status}",
                          textStyle: textNormalStyle.copyWith(color: red),
                        ),
                        customHeight(),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return customHeight(height: 5);
              },
            ),
          )
        : const Center(
            child: Text(
              "There is no series",
              style: body2regular,
            ),
          );
  }

  @override
  Widget? floatingActionButton() {
    return null;
  }

  @override
  void onClickBackButton() {}

  @override
  Color? pageBackgroundColor() {
    return null;
  }
}
