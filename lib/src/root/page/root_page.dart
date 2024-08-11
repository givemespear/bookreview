import 'package:bookreview/src/init/cubit/init_cubit.dart';
import 'package:bookreview/src/init/page/init_page.dart';
import 'package:bookreview/src/splash/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitCubit, bool>(
      builder: (context, state) {
        //처음 진입하는 경우 Init Page 아닐 경우 Splash Page로 진입
        return state ? const SplashPage() : const InitPage();
      },
    );
  }
}
