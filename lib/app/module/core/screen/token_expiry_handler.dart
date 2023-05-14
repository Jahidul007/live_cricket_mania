import 'package:flutter/cupertino.dart';

abstract class TokenExpiryHandler{
  void onTokenExpired(BuildContext context);
}