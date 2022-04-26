// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names

class PinjamanDetailResponse {
  String? status;
  Info? info;

  PinjamanDetailResponse({
    this.status,
    this.info,
  });

  PinjamanDetailResponse.fromJson(Map<String, dynamic> json) {
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
  String? tagihan_Pokok;
  String? baki_Debet;
  String? noRef;
  String? nama;
  String? produk_Pinjaman;
  String? tanggal_Mulai;
  String? tanggal_Akhir;
  String? total_Angsuran;
  String? suku_Bunga;
  String? tanggal_Angsuran_Pokok;
  String? tanggal_Angsuran_Bunga;
  String? tagihan_Bunga;
  String? tunggakan_Pokok;
  String? tunggakan_Bunga;
  String? denda_Pokok;
  String? denda_Bunga;
  String? denda_Keterlambatan;

  Info(
      {
    this.tagihan_Pokok,
    this.baki_Debet,
    this.nama,
    this.noRef,
    this.produk_Pinjaman,
    this.tanggal_Mulai,
    this.tanggal_Akhir,
    this.total_Angsuran,
    this.suku_Bunga,
    this.tanggal_Angsuran_Pokok,
    this.tanggal_Angsuran_Bunga,
    this.tagihan_Bunga,
    this.tunggakan_Pokok,
    this.tunggakan_Bunga,
    this.denda_Pokok,
    this.denda_Bunga,
    this.denda_Keterlambatan,
  });

  Info.fromJson(Map<String, dynamic> json) {
    tagihan_Pokok = json['tagihan_pokok'];
    baki_Debet = json['baki_debet'];
    noRef = json['no_ref'];
    nama = json['nama'];
    produk_Pinjaman = json['produk_pinjaman'];
    tanggal_Mulai = json['tanggal_mulai'];
    tanggal_Akhir = json['tanggal_akhir'];
    total_Angsuran = json['total_angsuran'];
    suku_Bunga = json['suku_bunga'];
    tanggal_Angsuran_Pokok = json['tanggal_angsuran_pokok'];
    tanggal_Angsuran_Bunga = json['tanggal_angsuran_bunga'];
    tagihan_Bunga = json['tagihan_bunga'];
    tunggakan_Pokok = json['tunggakan_pokok'];
    tunggakan_Bunga = json['tunggakan_bunga'];

    denda_Pokok = json['denda_pokok'];
    denda_Bunga = json['denda_bunga'];
    denda_Keterlambatan = json['denda_keterlambatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagihan_pokok'] = this.tagihan_Pokok;
    data['baki_debet'] = this.baki_Debet;
    data['no_ref'] = this.noRef;
    data['nama'] = this.nama;
    data['produk_pinjaman'] = this.produk_Pinjaman;
    data['tanggal_mulai'] = this.tanggal_Mulai;
    data['tanggal_akhir'] = this.tanggal_Akhir;
    data['total_angsuran'] = this.total_Angsuran;
    data['suku_bunga'] = this.suku_Bunga;
    data['tanggal_angsuran_pokok'] = this.tanggal_Angsuran_Pokok;
    data['tanggal_angsuran_bunga'] = this.tanggal_Angsuran_Bunga;
    data['tagihan_bunga'] = this.tagihan_Bunga;
    data['tunggakan_pokok'] = this.tunggakan_Pokok;
    data['tunggakan_bunga'] = this.tunggakan_Bunga;
    data['denda_pokok'] = this.denda_Pokok;
    data['denda_bunga'] = this.denda_Bunga;
    data['denda_keterlambatan'] = this.denda_Keterlambatan;

    return data;
  }
}
