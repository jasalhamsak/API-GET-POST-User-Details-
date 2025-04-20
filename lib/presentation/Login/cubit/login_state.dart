part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginInLoading extends LoginState {}
final class LoginInLoaded extends LoginState {
  final PostModel data;
  LoginInLoaded({required this.data});
}
final class LoginInError extends LoginState {
}
