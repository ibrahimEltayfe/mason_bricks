import 'failures.dart';

enum Errors{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  UN_AUTHORIZED,
  FORBIDDEN,
  REQUEST_TIMEOUT,
  INTERNAL_SERVER_ERROR,
  NOT_FOUND,

  CONNECTION_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode{
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; //success with no data (no content)
  static const int BAD_REQUEST = 400; // API rejected request
  static const int UN_AUTHORIZED = 401; // un authorized user
  static const int FORBIDDEN = 403; // API rejected request
  static const int NOT_FOUND = 404; // crash in server side
  static const int REQUEST_TIMEOUT= 408;
  static const int INTERNAL_SERVER_ERROR =500; // crash in server side

// Local status code (before sending to api)
  static const int CONNECTION_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int SEND_TIMEOUT= 408;
  static const int RECEIVE_TIMEOUT = -3;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage{
  static const String SUCCESS ="success" ; // success with data
  static const String NO_CONTENT = "success" ; // success with no data (no content)
  static const String BAD_REQUEST = "bad request, Try again later"; // failure, API rejected request
  static const String UN_AUTHORIZED = "user is un authorized" ; // failure, user is not authorised
  static const String FORBIDDEN = "server rejected the request, Try again later" ; // failure, API rejected request
  static const String REQUEST_TIMEOUT = "time out, please try again later" ;
  static const String INTERNAL_SERVER_ERROR = "some thing went wrong, please try again later"; // failure, crash in server side
  static const String NOT_FOUND = "page not found, please try again later";

  // Local status code (before sending to api)
  static const String CONNECTION_TIMEOUT = "time out, please try again";
  static const String CANCEL = "request was cancelled, please try again";
  static const String RECEIVE_TIMEOUT = "time out , please try again";
  static const String SEND_TIMEOUT = "Time out error, please try again";
  static const String CACHE_ERROR =  "cache error, please try again";
  static const String NO_INTERNET_CONNECTION = "PLease check your internet connection";
  static const String DEFAULT ="some thing went wrong, Try again later ";
}

extension ErrorHandling on Errors{
  Failure getFailure(){
    switch(this){
      case Errors.SUCCESS:
        return Failure(ResponseMessage.SUCCESS, ResponseCode.SUCCESS);

      case Errors.NO_CONTENT:
        return Failure(ResponseMessage.NO_CONTENT, ResponseCode.NO_CONTENT);

      case Errors.BAD_REQUEST:
        return Failure(ResponseMessage.BAD_REQUEST, ResponseCode.BAD_REQUEST);

      case Errors.UN_AUTHORIZED:
        return Failure(ResponseMessage.UN_AUTHORIZED, ResponseCode.UN_AUTHORIZED);

      case Errors.FORBIDDEN:
        return Failure(ResponseMessage.FORBIDDEN, ResponseCode.FORBIDDEN);

      case Errors.REQUEST_TIMEOUT:
        return Failure(ResponseMessage.REQUEST_TIMEOUT, ResponseCode.REQUEST_TIMEOUT);

      case Errors.INTERNAL_SERVER_ERROR:
        return Failure(ResponseMessage.INTERNAL_SERVER_ERROR, ResponseCode.INTERNAL_SERVER_ERROR);

      case Errors.NOT_FOUND:
        return Failure(ResponseMessage.NOT_FOUND, ResponseCode.NOT_FOUND);

      case Errors.CONNECTION_TIMEOUT:
        return Failure(ResponseMessage.CONNECTION_TIMEOUT, ResponseCode.CONNECTION_TIMEOUT);

      case Errors.CANCEL:
        return Failure(ResponseMessage.CANCEL, ResponseCode.CANCEL);

      case Errors.RECEIVE_TIMEOUT:
        return Failure(ResponseMessage.RECEIVE_TIMEOUT, ResponseCode.RECEIVE_TIMEOUT);

      case Errors.SEND_TIMEOUT:
        return Failure(ResponseMessage.SEND_TIMEOUT, ResponseCode.SEND_TIMEOUT);

      case Errors.CACHE_ERROR:
        return Failure(ResponseMessage.CACHE_ERROR, ResponseCode.CACHE_ERROR);

      case Errors.NO_INTERNET_CONNECTION:
        return Failure(ResponseMessage.NO_INTERNET_CONNECTION, ResponseCode.NO_INTERNET_CONNECTION);

      case Errors.DEFAULT:
        return Failure(ResponseMessage.DEFAULT, ResponseCode.DEFAULT);
  }
  }
}