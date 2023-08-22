part of 'post_bloc_bloc.dart';

@immutable
sealed class PostBlocEvent {}

class PostInitialPostEvent extends PostBlocEvent {}
