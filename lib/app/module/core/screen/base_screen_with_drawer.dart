import 'dart:async';

import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:cricket_mania/app/module/widget/element/snackbar_widget.dart';
import 'package:cricket_mania/app/module/widget/no_network_dialog.dart';
import 'package:flutter/material.dart';

import 'base_page_screen.dart';
import 'subscription_handler.dart';

abstract class BaseScreenWithDrawer<Page extends BasePageScreen> extends
    BasePageScreenState<Page> with SubscriptionHandler {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bindControllers();
    setupListenersForBloc(blocs);
  }

  @override
  void handleStates(PageState event, String errorMessage){
    if (event == PageState.FAILED || event == PageState.MESSAGE) {
      if (errorMessage.trim().isNotEmpty) {
        //todo extract this
        showSnackBar(globalKey, errorMessage);
      }
    } else if (event == PageState.NO_INTERNET) {
      //todo extract this
      showNoNetworkDialog(context, retryFunctionOnNoNetwork());
    } else if (event == PageState.UNAUTHORIZED) {
      //getIt<TokenExpiryHandler>().onTokenExpired(context);
    }
  }

  @override
  StreamSubscription addRefreshListener(BaseController controller){
    return controller.isRefreshed.listen((event) {
      if (event == true){
        //todo extract this
        onPageRefresh();
        controller.updateRefresh(false);
      }
    });
  }

  void onPageRefresh() {
  }

  @override
  StreamSubscription addListenerForSnackBar(BaseController controller){
    return controller.message.listen((event) {
      //todo extract this
      showSnackBar(globalKey, event.toString());
    });
  }

  @override
  void dispose() {
    disposeSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: globalKey,
          appBar: appBar(),
          floatingActionButton: floatingActionButton(),
          drawer: drawer(),
          body: SafeArea(
            child: body(),
          ),
        ),
        _loadingWidgets(),
      ],
    );
  }

  Stack _loadingWidgets() {
    return Stack(
      children: _getLoadingWidgets(),
    );
  }

  List<Widget> _getLoadingWidgets() {
    List<Widget> widgets = [];

    if (blocs.isEmpty) {
      widgets.add(Container());
    } else {
      for (var baseBloc in blocs) {
        widgets.add(loadingWidget(baseBloc.stateController));
      }
    }

    return widgets;
  }

  Widget body();

  PreferredSizeWidget? appBar();

  Widget? floatingActionButton();

  Widget? drawer();
}
