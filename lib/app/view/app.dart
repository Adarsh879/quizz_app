import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/app/bloc/app_auth_bloc.dart';
import 'package:quizz_app/home/view/home_page.dart';
import 'package:quizz_app/login/view/login_page.dart';
import 'package:quizz_app/repository/authentication_repository.dart';

class App extends StatelessWidget {
  const App(
      {Key? key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppAuthBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppStatus>(
      state: context.select((AppAuthBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateAppViewPages,
    );
  }

  List<Page> onGenerateAppViewPages(
      AppStatus state, List<Page<dynamic>> pages) {
    switch (state) {
      case AppStatus.authenticated:
        return [HomePage.page()];
      case AppStatus.unauthenticated:
        return [LoginPage.page()];
    }
  }
}

// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//     );
//     // return MultiBlocProvider(
//     //   providers: [
//     //     BlocProvider(create: (_) => AudioControlBloc()),
//     //     BlocProvider(
//     //       create: (context) =>
//     //           AudioPlayerCubit(context.read<AudioControlBloc>()),
//     //     ),
//     //     BlocProvider(create: (_) => AssetcacheCubit()),
//     //   ],
//     //   child: AppKeyboardHandler(
//     //     child: MaterialApp(
//     //       supportedLocales: AppLocalizations.supportedLocales,
//     //       localizationsDelegates: const [
//     //         AppLocalizations.delegate,
//     //         GlobalMaterialLocalizations.delegate,
//     //         GlobalCupertinoLocalizations.delegate,
//     //         GlobalWidgetsLocalizations.delegate,
//     //       ],
//     //       title: 'Planets',
//     //       theme: ThemeData(fontFamily: kFontFamily),
//     //       home: const LoadingPage(),
//     //     ),
//     //   ),
//     // );
//   }
// }
