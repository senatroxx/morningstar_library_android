part of "checkout_cubit.dart";

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];

  get statusWidget => null;

  get costs => null;
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutDataLoaded extends CheckoutState {
  final StatusWidget statusWidget;
  final User? user;
  final CheckoutRequest? data;
  final List<Cost>? costs;
  final String? err;

  const CheckoutDataLoaded({
    this.statusWidget = StatusWidget.INITIAL,
    this.costs = const [],
    this.user,
    this.data,
    this.err,
  });

  CheckoutDataLoaded copyWith({
    StatusWidget? statusWidget,
    User? user,
    List<Cost>? costs,
    CheckoutRequest? data,
    String? err,
  }) {
    return CheckoutDataLoaded(
      statusWidget: statusWidget ?? this.statusWidget,
      user: user ?? this.user,
      costs: costs ?? this.costs,
      data: data ?? this.data,
      err: err ?? this.err,
    );
  }

  @override
  List<Object?> get props => [
        statusWidget,
        user,
        costs,
        data,
        err,
      ];
}
