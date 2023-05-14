import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cricket_mania/app/module/core/controller/base_controller.dart';

import 'element/loading_widget.dart';

class LoadingUtil {
  Widget loadingWidget(Stream<PageState> stream) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == PageState.LOADING) {
            return showLoading(context);
          } else {
            return Container();
          }
        });
  }
}
