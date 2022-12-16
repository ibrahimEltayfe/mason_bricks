import 'dio_errors.dart';
import 'failures.dart';
import 'package:dio/dio.dart';

class ExceptionHandler implements Exception{
   late final Failure failure;

   ExceptionHandler.handle(dynamic error){
     if(error is DioError){
        failure = _handleDioErrors(error);
     }else{
       failure = Errors.DEFAULT.getFailure();
     }
   }

   Failure _handleDioErrors(DioError error){
     switch(error.type){
       case DioErrorType.connectTimeout:
         return Errors.CONNECTION_TIMEOUT.getFailure();

       case DioErrorType.sendTimeout:
         return Errors.SEND_TIMEOUT.getFailure();

       case DioErrorType.receiveTimeout:
         return Errors.RECEIVE_TIMEOUT.getFailure();

       case DioErrorType.response:
         if(error.response != null){
           if(error.response!.statusCode != null){
             switch (error.response!.statusCode) {
               case ResponseCode.BAD_REQUEST:
                 return Errors.BAD_REQUEST.getFailure();

               case ResponseCode.UN_AUTHORIZED:
                 return Errors.UN_AUTHORIZED.getFailure();

               case ResponseCode.NOT_FOUND:
                 return Errors.NOT_FOUND.getFailure();

               case ResponseCode.SEND_TIMEOUT:
                 return Errors.SEND_TIMEOUT.getFailure();

               case ResponseCode.INTERNAL_SERVER_ERROR:
                 return Errors.INTERNAL_SERVER_ERROR.getFailure();

               default:
                 return Errors.DEFAULT.getFailure();
           }
         }
       }
        return Errors.DEFAULT.getFailure();

       case DioErrorType.cancel:
         return Errors.CANCEL.getFailure();

       case DioErrorType.other:
         return Errors.DEFAULT.getFailure();

     }
   }
}