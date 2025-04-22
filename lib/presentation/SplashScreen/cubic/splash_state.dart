part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
final class SplashLoading extends SplashState {}
final class IsLoggedIn extends SplashState {
  final String token;
  IsLoggedIn({required this.token});
}
final class IsNotLogged extends SplashState {}
