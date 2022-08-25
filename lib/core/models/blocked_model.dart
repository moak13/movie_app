class Blocked {
  String? title;

  Blocked({this.title});

  Blocked.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    return data;
  }
}
