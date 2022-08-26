class ErrorModel {
  String? response;
  String? error;

  ErrorModel({this.response, this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Response'] = response;
    data['Error'] = error;
    return data;
  }
}
