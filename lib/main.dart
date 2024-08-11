import 'package:bookreview/firebase_options.dart';
import 'package:bookreview/src/app.dart';
import 'package:bookreview/src/common/cubit/app_data_load_cubit.dart';
import 'package:bookreview/src/common/interceptor/custom_interceptor.dart';
import 'package:bookreview/src/common/model/naver_book_search_option.dart';
import 'package:bookreview/src/common/repository/naver_api_repository.dart';
import 'package:bookreview/src/init/cubit/init_cubit.dart';
import 'package:bookreview/src/splash/cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase의 sdk를 사용할 때 android와 ios의 native level로 상호작용
  //method 채널 사용 -> 위젯, 플러터 바인딩을 한 이후에 사용가능
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  //초기화 완료
  Dio dio = Dio(BaseOptions(baseUrl: 'https://openapi.naver.com/'));
  dio.interceptors.add(
      CustomInterceptor()); //interceptor를 주입해서 모든 Dio를 이용한 API는 인증키가 담겨져서 날아간다
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  final Dio dio;
  const MyApp({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NaverBookRepository(dio),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InitCubit(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => AppDataLoadCubit(),
            lazy: false,
          ),
          BlocProvider(create: (context) => SplashCubit()),
        ],
        child: const App(),
      ),
    );
  }
}
