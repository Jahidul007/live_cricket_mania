import 'package:logger/logger.dart';

class LoggerProvider{

  LoggerProvider._();

  static Logger? _logger;

  static Logger get logger=>
    _logger ??= Logger();

}