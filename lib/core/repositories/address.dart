part of '../core.dart';

class AddressService extends Services {
  AddressService()
      : super(
          options: BaseOptions(
            baseUrl: MorningstarAPI.baseUrl,
            connectTimeout: const Duration(hours: 1),
            receiveTimeout: const Duration(hours: 1),
          ),
        );

  Future<Pagination<Address>> fetch() async {
    try {
      Response response = await get(MorningstarAPI.userAddress);

      var data = response.data['data'];

      data['records'] =
          (data['data'] as List).map((e) => Address.fromJson(e)).toList();

      return Pagination<Address>.fromJson(data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<Address> primary() async {
    try {
      Response response = await get(MorningstarAPI.userAddressPrimary);

      return Address.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<void> store({required Map<String, dynamic> data}) async {
    try {
      await post(MorningstarAPI.userAddress, data: data);
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<void> destroy({required int id}) async {
    try {
      await delete("${MorningstarAPI.userAddress}/$id");
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }
}
