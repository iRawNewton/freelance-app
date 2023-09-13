import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../models/users_model.dart';

part 'profile_info_event.dart';
part 'profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  ProfileInfoBloc() : super(ProfileInfoLoading()) {
    on<ProfileInfoEvent>(
      (event, emit) async {
        try {
          emit(ProfileInfoLoading());
          var response = await http.get(
            Uri.parse('----------'),
          );
          if (response.statusCode == 200) {
            emit(
              ProfileInfoLoaded(
                usersFromJson(response.body),
              ),
            );
          } else {
            throw Exception('Failed to load profile');
          }
        } catch (e) {
          emit(
            ProfileInfoError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
