import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizz_app/app/bloc/app_auth_bloc.dart';
import 'package:quizz_app/home/cubit/user_profile_cubit.dart';
import 'package:quizz_app/home/widgets/subject_card.dart';
import 'package:quizz_app/models/user_profile.dart';
import 'package:quizz_app/repository/authentication_repository.dart';

const Color KPRIMAY = Color(0xff55747E);
const Color KSECONDARY = Color(0XFFE5FEEC);
const Color KTHIRD = Color(0xff28E68E);
const Color KFOUR = Color(0xffF1FFEF);
const Color KFIVE = Color(0xffDDFEE4);

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppAuthBloc bloc) => bloc.state.user);
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffF9FAFB),
              Color(0xffFEFEFF),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Builder(builder: (context) {
                UserProfileState profile =
                    context.watch<UserProfileCubit>().state;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff6A72FF),
                              Color(0xff4697FF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  MaterialButton(
                                    shape: const CircleBorder(),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    padding: const EdgeInsets.all(7),
                                    onPressed: () => context
                                        .read<AppAuthBloc>()
                                        .add(AppLogoutRequested()),
                                    child: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 23,
                                      color: Color(0xff4B82EC),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 53.4,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    user.photo!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(user.name!,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          const SizedBox(
                            height: 13,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 18.0, top: 20, bottom: 20),
                          child: Text("SUBJECTS",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xff9FB2BA),
                                fontSize: 17,
                              )),
                        ),
                      ],
                    ),
                    SubjectCard(
                        const Color(0xffF5F0FF),
                        const Color(0xffDED5FF),
                        const Color(0xff8068FF),
                        "Mathematics",
                        "${profile.profile.mathsScore} answered questions",
                        profile.profile.mathsScore!.toDouble()),
                    SubjectCard(
                        const Color(0xffFFF5FC),
                        const Color(0xffFFE7F5),
                        const Color(0xffFF6BC0),
                        "Computers organization",
                        "${profile.profile.computerScienceScore} answered questions",
                        profile.profile.computerScienceScore!.toDouble()),
                    SubjectCard(
                        const Color.fromARGB(255, 217, 239, 238),
                        const Color.fromARGB(255, 189, 233, 228),
                        const Color.fromARGB(255, 8, 235, 216),
                        "General knowledge",
                        "${profile.profile.generalKnowledgeScore} answered questions",
                        profile.profile.generalKnowledgeScore!.toDouble()),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
