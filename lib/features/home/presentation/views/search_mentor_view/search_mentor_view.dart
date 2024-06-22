import 'package:flutter/material.dart';
import 'widgets/search_mentor_app_bar.dart';
import 'widgets/search_mentor_view_body.dart';

class SearchMentorView extends StatelessWidget {
  const SearchMentorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchMentorAppBar(),
      body: SearchMentorViewBody(),
    );
  }
}
