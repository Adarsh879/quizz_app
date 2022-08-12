import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quizz_app/app/app.dart';
import 'package:quizz_app/repository/authentication_repository.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
    );
  }
}

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _Loading();
}

class _Loading extends State<Loading> {
  @override
  void initState() {
    initialize().then((value) => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => App(
                        authenticationRepository: value,
                      )))
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitRipple(
      color: Color.fromARGB(255, 255, 251, 251),
      size: 100.0,
    );
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff654FE5),
            Color(0xffEF3CB0),
          ],
        ),
      ),
      child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: spinkit,
          )),
    );
  }

  Future<AuthenticationRepository> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authenticationRepository = AuthenticationRepository();
    await authenticationRepository.user.first;
    return authenticationRepository;
  }
}
