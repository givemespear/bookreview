import 'package:bookreview/src/init/cubit/init_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/app_font.dart';
import '../../common/components/btn.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash_bg.png',
            fit: BoxFit.cover, // 전체화면 설정
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom,
            left: 40,
            right: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppFont(
                  '도서 리뷰 앱으로\n좋아하는 책을 찾아보세요.',
                  textAlign: TextAlign.center,
                  size: 25,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                const AppFont(
                  '책 리뷰에서 솔직하고 통찰력 있는 리뷰를 받아보세요.\n모든 장르의 책에 대한 리뷰를 확인할 수 있습니다.\n(로맨스에서 공상과학까지)',
                  textAlign: TextAlign.center,
                  size: 11,
                  color: Color(0xff878787),
                ),
                const SizedBox(height: 20),
                Btn(
                  onTap: context.read<InitCubit>().startApp,
                  text: '시작하기',
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
