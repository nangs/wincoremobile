// ignore_for_file: unnecessary_this,, unnecessary_new, prefer_collection_literals

class PindahBukuResponse {
  String? refNo;
  String? status;
  String? info;

  PindahBukuResponse({
    this.refNo,
    this.status,
    this.info,
  });

  PindahBukuResponse.fromJson(Map<String, dynamic> json) {
    refNo = json['ref_no'];
    status = json['status'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ref_no'] = this.refNo;
    data['status'] = this.status;
    data['info'] = this.info;
    return data;
  }
}
