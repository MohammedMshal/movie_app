import 'package:clean_arctitcher/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  const ServerException({
    required this.errorModel
  });
}

//يمكن إضافة عدة اخطاء مثلا locale data
 class LocaleDataException{
  final String message;
  const LocaleDataException({
    required this.message,
 });
 }