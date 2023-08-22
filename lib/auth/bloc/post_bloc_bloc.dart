import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freelance_app/models/users.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBlocBloc() : super(PostBlocInitial()) {
    on<PostInitialPostEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialPostEvent event, Emitter<PostBlocState> emit) async {
    List<Users> users = [];
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(
          'https://freelancer-app.kyptronixllp.co.in/auth/user_register.php?'));
      print(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
