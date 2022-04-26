part of 'konfirmasi_pindah_buku_cubit.dart';

@immutable
abstract class KonfirmasiPindahBukuState {}

class KonfirmasiPindahBukuInitial extends KonfirmasiPindahBukuState {}

class KonfirmasiPindahBukuLoading extends KonfirmasiPindahBukuState {}

class KonfirmasiPindahBukuError extends KonfirmasiPindahBukuState {
  final String errorMsg;
  KonfirmasiPindahBukuError(this.errorMsg);
}

class KonfirmasiPindahBukuSuccess extends KonfirmasiPindahBukuState {
  final TransferConfirmationPBResponse response;
  KonfirmasiPindahBukuSuccess(this.response);
}
