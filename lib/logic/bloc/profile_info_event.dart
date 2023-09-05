part of 'profile_info_bloc.dart';

abstract class ProfileInfoEvent extends Equatable {
  const ProfileInfoEvent();

  @override
  List<Object> get props => [];
}

class ProfileInfoLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
