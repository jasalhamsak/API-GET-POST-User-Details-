part of 'homescreen_cubit.dart';

@immutable
sealed class HomescreenState {}

final class HomescreenInitial extends HomescreenState {}
final class HomescreenLoading extends HomescreenState {}
final class HomescreenLoaded extends HomescreenState {
  final DetailsModel data;
  HomescreenLoaded({required this.data});
}
final class HomescreenError extends HomescreenState {}
