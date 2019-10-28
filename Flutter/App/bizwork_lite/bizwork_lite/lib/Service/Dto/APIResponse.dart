class APIResponse {
  int returnCode;
  String returnMessage;

  APIResponse({this.returnCode, this.returnMessage});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      returnCode: json['ReturnCode'] as int,
      returnMessage: json['ReturnMessage'] as String,
    );
  }
}
