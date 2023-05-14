import 'dart:async';
import 'package:cricket_mania/app/module/core/controller/base_controller.dart';
import 'package:rxdart/rxdart.dart';

mixin SubscriptionHandler{

  final CompositeSubscription _subscription = CompositeSubscription();

  void setupListenersForBloc(List<BaseController> blocs){
    if (blocs.isEmpty) return;

    for (var controller in blocs) {
      _addSubscriptions(controller);
    }
  }

  void _addSubscriptions(BaseController controller){
    _addStateSubscription(controller);

    _addRefreshSubscription(controller);

    _addSnackBarSubscription(controller);
  }

  void _addStateSubscription(BaseController controller){
    StreamSubscription stateSubscription = _addStateListener(controller);
    _subscription.add(stateSubscription);
  }

  StreamSubscription _addStateListener(BaseController controller){
    return controller.stateController.stream.listen((event) {
      handleStates(event, controller.errorMessage);
    });
  }

  void handleStates(PageState event, String errorMessage);

  void _addRefreshSubscription(BaseController controller){
    StreamSubscription refreshSubscription = addRefreshListener(controller);
    _subscription.add(refreshSubscription);
  }

  StreamSubscription addRefreshListener(BaseController controller);

  void _addSnackBarSubscription(BaseController controller){
    final StreamSubscription snackBarSubscription = addListenerForSnackBar(controller);
    _subscription.add(snackBarSubscription);
  }

  StreamSubscription addListenerForSnackBar(BaseController controller);

  void disposeSubscription(){
    _subscription.dispose();
  }

}