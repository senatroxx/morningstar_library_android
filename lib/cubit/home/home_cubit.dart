import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morningstar_library/core/core.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:morningstar_library/data/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetch() async {
    try {
      emit(const HomeDataLoaded(statusWidget: StatusWidget.LOAD));

      Home home = await HomeService().fetch();

      emit(HomeDataLoaded(
        statusWidget: StatusWidget.SUCCESS,
        data: home,
      ));
    } catch (e) {
      emit(HomeDataLoaded(
        err: e.toString(),
        statusWidget: StatusWidget.FAILURE,
      ));
    }
  }
}
