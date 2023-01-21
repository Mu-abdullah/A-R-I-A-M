
abstract class AuthState {}

class UserSignInitial extends AuthState {}
class Loading extends AuthState {}
class AdminLoginSuccess extends AuthState {}
class AdminLoginFailed extends AuthState {}

class ErrorOccurred extends AuthState {
  final String errorMsg;
  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmitted extends AuthState{}

class PhoneOTPVerified extends AuthState{}


class SuccessUserExit extends AuthState{}
class SuccessNoUserExit extends AuthState{}

class SuccessGetUserExitData extends AuthState{}

class FailedUserExit extends AuthState{}
class FailedNoUserExit extends AuthState{}


