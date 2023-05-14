import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseController {

  final Logger logger = Logger();

  final PageState defaultSate = PageState.DEFAULT;

  final BehaviorSubject<PageState> stateController = BehaviorSubject<PageState>();

  final BehaviorSubject<String> messageController = BehaviorSubject<String>();
  Stream<String> get message => messageController.stream;
  void updateMessage(String msg) => messageController.sink.add(msg);

  final refreshController = BehaviorSubject<bool>();

  Stream<bool> get isRefreshed => refreshController.stream;

  updateRefresh(bool refresh) => refreshController.sink.add(refresh);

  String errorMessage = "";
  String successMessage = "";

  PageState getPageStateFromErrorType(DioErrorType? errorType, String message) {
    logger.d("Error type: $errorType , message: $message");

    if (errorType == null &&
        (message.trim().toLowerCase().contains("invalid_token") ||
            message.trim().toLowerCase().contains("unauthorized") ||
            message.trim().toLowerCase().contains("invalid_grant"))) {
      return PageState.UNAUTHORIZED;
    }

    switch (errorType) {
      case DioErrorType.other:
        return PageState.NO_INTERNET;
      case DioErrorType.response:
        if (errorMessage.trim().toLowerCase().contains("bad credentials") ||
            errorMessage.trim().toLowerCase().contains("unauthorized") ||
            errorMessage.trim().toLowerCase().contains("invalid_grant")) {
          return PageState.UNAUTHORIZED;
        } else {
          return PageState.FAILED;
        }
      default:
        return PageState.FAILED;
    }
  }

  updatePageState(PageState state) {
    stateController.add(state);
  }

  resetPageState() {
    stateController.add(PageState.DEFAULT);
  }

  showLoadingState(){
    stateController.add(PageState.LOADING);
  }

  showSuccessState(){
    stateController.add(PageState.SUCCESS);
  }

  void dispose() {
    messageController.close();
    refreshController.close();
    stateController.close();
  }

  void handleApiCall(BaseResponse response, {
    required Function(BaseResponse) onSuccess,
    Function (BaseResponse)? onError,
    }) async{
    _handleResponse(response, onSuccess);
  }

  void _handleResponse(BaseResponse response, Function(BaseResponse) handleSuccessResponse) {
    if (response.isSuccess) {
      handleSuccessResponse(response);
    } else {
      _handleErrorResponse(response);
    }
  }

  void _handleErrorResponse(BaseResponse response) {
    errorMessage = response.msg;
    PageState state = getPageStateFromErrorType(
      response.dioErrorType,
      errorMessage,
    );
    updatePageState(state);
    logger.d(errorMessage);
  }

  handleError(dynamic error) {
    errorMessage = "$error";

    if (error is String &&
        (error.trim().toLowerCase().contains("invalid_token") ||
            error.trim().toLowerCase().contains("invalid_grant") ||
            error.trim().toLowerCase().contains("unauthorized"))) {
      stateController.add(PageState.UNAUTHORIZED);
    }

    stateController.add(PageState.MESSAGE);
    logger.d("Something went wrong: $error");
  }
}

enum PageState {
  DEFAULT,
  LOADING,
  SUCCESS,
  FAILED,
  NO_INTERNET,
  MESSAGE,
  UNAUTHORIZED
}
