// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class DepositoDetailResponse {
  String? status;
  Info? info;

  DepositoDetailResponse({
    this.status,
    this.info,
  });

  DepositoDetailResponse.fromJson(Map<String, dynamic> json) {
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
  String? nominalDeposito;
  String? akrualBunga;
  int? statusCode;
  String? noRef;
  String? sukuBunga;
  String? nama;
  String? tanggalAkhir;
  String? kodeCabangDeposito;
  String? jangkaWaktu;
  String? tanggalMulai;
  String? custNo;
  int? aroKe;
  int? aro;

  Info(
      {this.nominalDeposito,
      this.akrualBunga,
      this.statusCode,
      this.noRef,
      this.sukuBunga,
      this.nama,
      this.tanggalAkhir,
      this.kodeCabangDeposito,
      this.jangkaWaktu,
      this.tanggalMulai,
      this.custNo,
      this.aroKe,
      this.aro});

  Info.fromJson(Map<String, dynamic> json) {
    nominalDeposito = json['nominal_deposito'];
    akrualBunga = json['akrual_bunga'];
    statusCode = json['status_code'];
    noRef = json['no_ref'];
    sukuBunga = json['suku_bunga'];
    nama = json['nama'];
    tanggalAkhir = json['tanggal_akhir'];
    kodeCabangDeposito = json['kode_cabang_deposito'];
    jangkaWaktu = json['jangka_waktu'];
    tanggalMulai = json['tanggal_mulai'];
    custNo = json['cust_no'];
    aroKe = json['aro_ke'];
    aro = json['aro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nominal_deposito'] = this.nominalDeposito;
    data['akrual_bunga'] = this.akrualBunga;
    data['status_code'] = this.statusCode;
    data['no_ref'] = this.noRef;
    data['suku_bunga'] = this.sukuBunga;
    data['nama'] = this.nama;
    data['tanggal_akhir'] = this.tanggalAkhir;
    data['kode_cabang_deposito'] = this.kodeCabangDeposito;
    data['jangka_waktu'] = this.jangkaWaktu;
    data['tanggal_mulai'] = this.tanggalMulai;
    data['cust_no'] = this.custNo;
    data['aro_ke'] = this.aroKe;
    data['aro'] = this.aro;
    return data;
  }
}
