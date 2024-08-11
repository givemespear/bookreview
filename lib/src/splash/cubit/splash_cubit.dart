import 'package:flutter_bloc/flutter_bloc.dart';

//어떤 작업을 진행하는지에 대한 상태값을 관리를 해주는 역할

class SplashCubit extends Cubit<LoadStatus> {
  SplashCubit() : super(LoadStatus.data_load);

  //상태 변경경
  changeLoadStatus(LoadStatus status) {
    emit(status);
  }
}

enum LoadStatus {
  //어떤 상태로 스플래시가 돌고 있는 지에 대한 정보르르 보여준다
  data_load('데이터 로드'),
  auth_check('로그인 체크');

  const LoadStatus(this.message);
  final String message;
}
