part of 'model.dart';

class Pagination<T> extends Equatable {
  final int currentPage;
  final int totalPage;
  final int totalRecords;
  final List<T> records;

  const Pagination({
    this.currentPage = 0,
    this.totalPage = 1,
    this.totalRecords = 0,
    this.records = const [],
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      totalPage: json['total_page'],
      totalRecords: json['total_records'],
      records: json['records'],
    );
  }

  @override
  List<Object?> get props => [currentPage, totalPage, totalRecords, records];
}
