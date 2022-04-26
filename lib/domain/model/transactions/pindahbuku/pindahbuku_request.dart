// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, camel_case_types
class PindahBukuRequest {
  final String? srcAccount;
  final String? username;
  final String? mpin;
  final String? description;
  final List<DstAccount>? dstAccount;

  PindahBukuRequest({
    this.srcAccount,
    this.username,
    this.mpin,
    this.description,
    this.dstAccount,
  });

  PindahBukuRequest.fromJson(Map<String, dynamic> json)
      : srcAccount = json['src_account'] as String?,
        username = json['username'] as String?,
        mpin = json['mpin'] as String?,
        description = json['description'] as String?,
        dstAccount = (json['dst_account'] as List?)
            ?.map((dynamic e) => DstAccount.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'src_account': srcAccount,
        'username': username,
        'mpin': mpin,
        'description': description,
        'dst_account': dstAccount?.map((e) => e.toJson()).toList()
      };
}

class DstAccount {
  final String? accountNo;
  final int? amount;

  DstAccount({
    this.accountNo,
    this.amount,
  });

  DstAccount.fromJson(Map<String, dynamic> json)
      : accountNo = json['account_no'] as String?,
        amount = json['amount'] as int?;

  Map<String, dynamic> toJson() => {'account_no': accountNo, 'amount': amount};
}
