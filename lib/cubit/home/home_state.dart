part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeDataLoaded extends HomeState {
  final StatusWidget statusWidget;
  final String? err;
  final Home? data;

  const HomeDataLoaded({
    this.statusWidget = StatusWidget.INITIAL,
    this.err,
    this.data,
  });

  HomeDataLoaded copyWith({
    StatusWidget? statusWidget,
    String? err,
    Home? data,
  }) {
    return HomeDataLoaded(
      err: err,
      statusWidget: statusWidget ?? this.statusWidget,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        statusWidget,
        err,
        data,
      ];
}
