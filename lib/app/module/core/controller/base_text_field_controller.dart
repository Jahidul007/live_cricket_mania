
import 'package:rxdart/rxdart.dart';

class TextFieldController {
  bool validationExpression;
  final String validationMessage;
  final bool isRequired;

  final _textFocusController = BehaviorSubject<bool>();

  Stream<bool> get textFocusStream => _textFocusController.stream;

  updateTextFocus(bool focus) => _textFocusController.sink.add(focus);

  TextFieldController(
      {this.validationExpression = true,
      this.validationMessage = "Enter a valid input",
      this.isRequired = true});

  final _textFieldController = BehaviorSubject<String>();
  final _textFieldErrorController = BehaviorSubject<String?>();

  updateText(String reason) {
    _textFieldController.sink.add(reason);
    updateError(null);
  }

  updateError(String? reason) => _textFieldErrorController.sink.add(reason);

  Stream<String> get textStream => _textFieldController.stream;

  Stream<String?> get errorStream => _textFieldErrorController.stream;

  String get text =>
      _textFieldController.hasValue ? _textFieldController.value.trim() : "";

  bool isInputValid({bool validationExpression = true}) {
    bool isOkay = true;

    if (isRequired) {
      if (text.trim().isEmpty || !validationExpression) {
        updateError(validationMessage);
        isOkay = false;
        updateTextFocus(true);
      }
    } else if (text.trim().isNotEmpty) {
      if (!validationExpression) {
        updateError(validationMessage);
        isOkay = false;
        updateTextFocus(true);
      }
    }
    return isOkay;
  }





  bool isValidAmount() {
    bool retVal = false;

    try {
      var val = text.replaceAll("\$", "").replaceAll(",", "");
      if (double.parse(val.trim()) >= 0) {
        retVal = true;
      } else {
        updateError("Enter valid amount");
      }
    } catch (e) {
      updateError("Enter valid amount");
    }

    return retVal;
  }

  bool isValidAmountLimit() {
    bool retVal = false;

    try {
      var val = text.replaceAll("\$", "").replaceAll(",", "");
      if (double.parse(val.trim()) > 0) {
        if (double.parse(val.trim()) > 1000000) {
          updateError("Amount should be less than 1,000,000");
        } else {
          retVal = true;
        }
      } else {
        updateError("Enter valid amount");
      }
    } catch (e) {
      updateError("Enter valid amount");
    }

    return retVal;
  }

  resetField() {
    updateText("");
    updateError(null);
  }

  dispose() {
    _textFieldController.close();
    _textFieldErrorController.close();
  }
}
