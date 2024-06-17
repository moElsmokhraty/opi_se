import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'resume_page.dart';
import 'prefers_page.dart';
import 'experience_page.dart';
import 'certificates_page.dart';
import '../../../cubits/mentor_prefers_cubit/mentor_prefers_cubit.dart';

class MentorPrefersViewBody extends StatelessWidget {
  const MentorPrefersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: BlocProvider.of<MentorPrefersCubit>(context).pageController,
      //physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        ExperiencePage(),
        PrefersPage(),
        ResumePage(),
        CertificatesPage(),
      ],
    );
  }
}
