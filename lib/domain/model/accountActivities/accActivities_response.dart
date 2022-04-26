// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this
class AccountActivitiesResponse {
  final String? status;
  final Info? info;

  AccountActivitiesResponse({
    this.status,
    this.info,
  });

  AccountActivitiesResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        info = (json['info'] as Map<String, dynamic>?) != null
            ? Info.fromJson(json['info'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'status': status, 'info': info?.toJson()};
}

class Info {
  final int? statusCode;
  final List<Mutasi>? mutasi;
  final bool? eof;
  final int? sequenceNo;

  Info({
    this.statusCode,
    this.mutasi,
    this.eof,
    this.sequenceNo,
  });

  Info.fromJson(Map<String, dynamic> json)
      : statusCode = json['status_code'] as int?,
        mutasi = (json['mutasi'] as List?)
            ?.map((dynamic e) => Mutasi.fromJson(e as Map<String, dynamic>))
            .toList(),
        eof = json['eof'] as bool?,
        sequenceNo = json['sequence_no'] as int?;

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'mutasi': mutasi?.map((e) => e.toJson()).toList(),
        'eof': eof,
        'sequence_no': sequenceNo
      };
}

class Mutasi {
  final String? keterangan1;
  final String? keterangan2;
  final String? nilaiTransaksi;
  final String? userInput;
  final String? jamInput;
  final String? tanggalValuta;
  final String? noReferensi;
  final String? mataUang;
  final String? signTransaksi;
  final String? tanggalPosting;

  Mutasi({
    this.keterangan1,
    this.keterangan2,
    this.nilaiTransaksi,
    this.userInput,
    this.jamInput,
    this.tanggalValuta,
    this.noReferensi,
    this.mataUang,
    this.signTransaksi,
    this.tanggalPosting,
  });

  Mutasi.fromJson(Map<String, dynamic> json)
      : keterangan1 = json['keterangan_1'] as String?,
        keterangan2 = json['keterangan_2'] as String?,
        nilaiTransaksi = json['nilai_transaksi'] as String?,
        userInput = json['user_input'] as String?,
        jamInput = json['jam_input'] as String?,
        tanggalValuta = json['tanggal_valuta'] as String?,
        noReferensi = json['no_referensi'] as String?,
        mataUang = json['mata_uang'] as String?,
        signTransaksi = json['sign_transaksi'] as String?,
        tanggalPosting = json['tanggal_posting'] as String?;

  Map<String, dynamic> toJson() => {
        'keterangan_1': keterangan1,
        'keterangan_2': keterangan2,
        'nilai_transaksi': nilaiTransaksi,
        'user_input': userInput,
        'jam_input': jamInput,
        'tanggal_valuta': tanggalValuta,
        'no_referensi': noReferensi,
        'mata_uang': mataUang,
        'sign_transaksi': signTransaksi,
        'tanggal_posting': tanggalPosting
      };
}
