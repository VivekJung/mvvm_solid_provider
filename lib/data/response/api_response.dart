import 'package:mvm_solid_provider/data/response/status.dart';

//this is handling response

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  //assigning what is happening  i.e. if it is loading then pick the status as loading and so on

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message: $message \n Data: $data";
  }
}
