import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morningstar_library/core/core.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:morningstar_library/data/data.dart';
import 'package:morningstar_library/data/model/request/request.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void init() {
    emit(const CheckoutDataLoaded());
  }

  Future<void> getCheckoutData() async {
    emit((state as CheckoutDataLoaded).copyWith(
      statusWidget: StatusWidget.LOAD,
    ));
    try {
      final user = await StoreKeyValue().getUser();
      final data = await StoreKeyValue().getCheckout();

      emit((state as CheckoutDataLoaded).copyWith(
        statusWidget: StatusWidget.SUCCESS,
        user: user,
        data: data,
      ));
    } catch (e) {
      emit((state as CheckoutDataLoaded).copyWith(
        statusWidget: StatusWidget.FAILURE,
        err: e.toString(),
      ));
    }
  }

  Future<void> getCost({
    required String origin,
    required String destination,
    required int weight,
    required String courier,
  }) async {
    emit((state as CheckoutDataLoaded).copyWith(
      statusWidget: StatusWidget.LOADMORE,
      costs: [],
    ));
    try {
      final response = await RajaOngkirService().getCost(
        origin: origin,
        destination: destination,
        weight: weight,
        courier: courier,
      );

      emit((state as CheckoutDataLoaded).copyWith(
        statusWidget: StatusWidget.SUCCESS,
        costs: response,
      ));
    } catch (e) {
      emit((state as CheckoutDataLoaded).copyWith(
        statusWidget: StatusWidget.FAILURE,
        err: e.toString(),
      ));
    }
  }
}
