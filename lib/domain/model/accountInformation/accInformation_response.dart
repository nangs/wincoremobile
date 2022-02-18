// ignore_for_file: file_names, unnecessary_new, unnecessary_this, prefer_collection_literals
class AccountInfoResponse {
  String? status;
  Info? info;

  AccountInfoResponse({this.status, this.info});

  AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Info {
  String? accountNo;
  String? accountName;
  String? saldoEfektif;
  String? saldoEfektifSign;
  String? noTelephone;
  String? email;
  String? ktp;
  String? tanggalLahir;
  String? namaIbu;
  String? alamat;

  Info(
      {this.accountNo,
      this.accountName,
      this.saldoEfektif,
      this.saldoEfektifSign,
      this.noTelephone,
      this.email,
      this.ktp,
      this.tanggalLahir,
      this.namaIbu,
      this.alamat});

  Info.fromJson(Map<String, dynamic> json) {
    accountNo = json['account_no'];
    accountName = json['account_name'];
    saldoEfektif = json['saldo_efektif'];
    saldoEfektifSign = json['saldo_efektif_sign'];
    noTelephone = json['no_telephone'];
    email = json['email'];
    ktp = json['ktp'];
    tanggalLahir = json['tanggal_lahir'];
    namaIbu = json['nama_ibu'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_no'] = this.accountNo;
    data['account_name'] = this.accountName;
    data['saldo_efektif'] = this.saldoEfektif;
    data['saldo_efektif_sign'] = this.saldoEfektifSign;
    data['no_telephone'] = this.noTelephone;
    data['email'] = this.email;
    data['ktp'] = this.ktp;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['nama_ibu'] = this.namaIbu;
    data['alamat'] = this.alamat;
    return data;
  }
}
