import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/app/app.dart';
import 'package:quizz_app/app/view/loading.dart';
import 'package:quizz_app/repository/authentication_repository.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await BlocOverrides.runZoned(
    () async {
      await runZonedGuarded(
        () async => runApp(Initial()),
        (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
