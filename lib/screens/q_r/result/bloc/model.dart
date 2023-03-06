class ScanModel {
  int? status;
  String? massage;
  List<Data>? data;
  ScanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage']??"";
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? code;
  String? createdAt;
  String? updatedAt;
  String? scannerId;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    code = json['code']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    scannerId = json['scanner_id']??"";
  }
}
