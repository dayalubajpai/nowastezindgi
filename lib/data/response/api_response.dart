import 'package:nowaste_zindagi/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETE;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    // TODO: implement toString
    return "Status : $status \n Message : $message \n Data : $data";
  }
}