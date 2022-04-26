// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names

class PinjamanResponse {
  String? status;
  Info? info;

  PinjamanResponse({
    this.status,
    this.info,
  });

  PinjamanResponse.fromJson(Map<String, dynamic> json) {
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
  List<Accounts>? accounts;

  Info({this.accounts});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Accounts {
  String? jenisRekening;
  String? accountName;
  String? jam;
  String? produkRekening;
  String? tipeRekening;
  String? tanggal;
  String? mataUang;
  String? saldoEfektif;
  String? accountNo;
  String? status;
  String? saldoBuku;

  Accounts({
    this.jenisRekening,
    this.accountName,
    this.jam,
    this.produkRekening,
    this.tipeRekening,
    this.tanggal,
    this.mataUang,
    this.saldoEfektif,
    this.accountNo,
    this.status,
    this.saldoBuku,
  });

  Accounts.fromJson(Map<String, dynamic> json) {
    jenisRekening = json['jenis_rekening'];
    accountName = json['account_name'];
    jam = json['jam'];
    produkRekening = json['produk_rekening'];
    tipeRekening = json['tipe_rekening'];
    tanggal = json['tanggal'];
    mataUang = json['mata_uang'];
    saldoEfektif = json['saldo_efektif'];
    accountNo = json['account_no'];
    status = json['status'];
    saldoBuku = json['saldo_buku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jenis_rekening'] = this.jenisRekening;
    data['account_name'] = this.accountName;
    data['jam'] = this.jam;
    data['produk_rekening'] = this.produkRekening;
    data['tipe_rekening'] = this.tipeRekening;
    data['tanggal'] = this.tanggal;
    data['mata_uang'] = this.mataUang;
    data['saldo_efektif'] = this.saldoEfektif;
    data['account_no'] = this.accountNo;
    data['status'] = this.status;
    data['saldo_buku'] = this.saldoBuku;
    return data;
  }
}
