import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opi_se/core/cubits/app_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
    return SafeArea(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: cubit.bottomNavBarIndex,
              children: cubit.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,
              currentIndex: cubit.bottomNavBarIndex,
              onTap: (index) {
                cubit.changeBottomNavBarIndex(index);
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_fill),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svgs/notes.svg',
                      colorFilter: ColorFilter.mode(
                        cubit.bottomNavBarIndex == 2
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                        BlendMode.srcIn,
                      )),
                  label: 'Notes',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
