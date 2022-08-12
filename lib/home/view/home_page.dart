import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/app/bloc/app_auth_bloc.dart';
import 'package:quizz_app/home/cubit/user_profile_cubit.dart';
import 'package:quizz_app/home/view/home_page_view.dart';
import 'package:quizz_app/home/widgets/avatar.dart';
import 'package:quizz_app/repository/api_repository.dart';
import 'package:quizz_app/repository/authentication_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _apiRespository = ApiRespository();
    final user = context.select((AppAuthBloc bloc) => bloc.state.user);
    print(user.id);
    return RepositoryProvider.value(
      value: _apiRespository,
      child: BlocProvider(
        create: (context) =>
            UserProfileCubit(apiRepository: _apiRespository, user: user),
        //TODO: add bloc of question page
        child: HomePageView(),
      ),
    );
    //
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home'),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: const Icon(Icons.exit_to_app),
    //           onPressed: () =>
    //               context.read<AppAuthBloc>().add(AppLogoutRequested()),
    //         )
    //       ],
    //     ),
    //     body: Align(
    //       alignment: const Alignment(0, -1 / 3),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: <Widget>[
    //           Avatar(photo: user.photo),
    //         const SizedBox(height: 4),
    //         Text(user.email ?? '', style: textTheme.headline6),
    //         const SizedBox(height: 4),
    //         Text(user.name ?? '', style: textTheme.headline5),
    //       ],
    //     ),
    //   ),
    // );
  }
}
