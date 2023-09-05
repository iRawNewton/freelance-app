part of 'profile_info_bloc.dart';

sealed class ProfileInfoState extends Equatable {
  const ProfileInfoState();

  @override
  List<Object> get props => [];
}

// initial
final class ProfileInfoInitial extends ProfileInfoState {}

// loading
final class ProfileInfoLoading extends ProfileInfoState {}

// loaded
final class ProfileInfoLoaded extends ProfileInfoState {
  final List<Users> users;

  const ProfileInfoLoaded(this.users);

  @override
  List<Object> get props => [users];
}

// empty
final class ProfileInfoEmpty extends ProfileInfoState {}

// error
final class ProfileInfoError extends ProfileInfoState {
  final String errorMessage;

  const ProfileInfoError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
