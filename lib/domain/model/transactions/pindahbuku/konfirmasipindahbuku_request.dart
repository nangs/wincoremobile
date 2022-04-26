// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class TransferConfirmationPBRequest {
  late String accountno;

  TransferConfirmationPBRequest({required this.accountno});

  TransferConfirmationPBRequest.fromJson(Map<String, dynamic> json) {
    if (json["accountno"] is String) {
      this.accountno = json["accountno"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["accountno"] = this.accountno;
    return data;
  }
}
