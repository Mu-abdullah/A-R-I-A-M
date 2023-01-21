abstract class AddDataState {}

class AddDataInitial extends AddDataState {}

class IsDiscount extends AddDataState {}

class ChangeToggle extends AddDataState {}

class GetProductImageFileSuccess extends AddDataState {}

class GetProductImageFileError extends AddDataState {}

class UploadProductImageSuccess extends AddDataState {}

class UploadProductImageError extends AddDataState {
  UploadProductImageError(String error);
}

class UploadProductImageLoading extends AddDataState {}

class SendDataSuccess extends AddDataState {}

class SendDataError extends AddDataState {
      SendDataError(String error);
}

class SendDataLoading extends AddDataState {}
