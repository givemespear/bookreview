//가짜로 데이터를 로드하는 것처럼 보여줄 파일
//실제적으로 cubit을 활용해서 필요한 API를 통해서 데이터를 받아오거나 그런 작업은 여기서 처리하면 된다.
import 'package:bloc/bloc.dart';
import 'package:bookreview/src/common/enum/common_state_status.dart';
import 'package:equatable/equatable.dart';

class AppDataLoadCubit extends Cubit<AppDataLoadState> {
  AppDataLoadCubit() : super(const AppDataLoadState()) {
    _loadData();
  }

  //API를 통해서 Data를 받을 때, 그 과정 중에서 발생할 수 있는 상태들을 정해져 있다 Init 상태, Loading 상태, Loaded 상태, Error 상태(4가지)
  void _loadData() async {
    emit(state.copyWith(
        status: CommonStateStatus.loading)); //상태를 loading상태로 변경해준다.
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(
        status: CommonStateStatus.loaded)); //정상적으로 값을 받으면 loaded 상태로 변경해준다.
  }
}

class AppDataLoadState extends Equatable {
  final CommonStateStatus status;
  const AppDataLoadState(
      {this.status = CommonStateStatus.init}); //초기 상태 : init 상태 설정
  AppDataLoadState copyWith({
    CommonStateStatus? status,
  }) {
    return AppDataLoadState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
