import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'logic/bloc/profile_info_bloc.dart';
import 'presentation/global/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// fix profile stats number

void main() async {
  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseMessaging.instance.getInitialMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileInfoBloc()..add(ProfileInfoLoadedEvent() as ProfileInfoEvent),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CFC Contract',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
          useMaterial3: true,
        ),
        home: const HomePage(),
        // home: const MyTestWidgettoCheck(),
      ),
    );
  }
}
