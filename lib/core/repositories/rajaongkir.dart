part of "../core.dart";

class RajaOngkirService extends Services {
  RajaOngkirService()
      : super(
          options: BaseOptions(
            baseUrl: RajaOngkirAPI.baseUrl,
            headers: {
              'Key': RajaOngkirAPI.key,
            },
          ),
        );

  Future<List<Province>> getProvince() async {
    try {
      Response response = await get(RajaOngkirAPI.province);

      var data = response.data['rajaongkir'];

      data['records'] =
          (data['results'] as List).map((e) => Province.fromJson(e)).toList();

      return data['records'];
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<List<City>> getCity({required String provinceId}) async {
    try {
      Response response = await get(
        RajaOngkirAPI.city,
        queryParameters: {
          'province': provinceId,
        },
      );

      var data = response.data['rajaongkir'];

      data['records'] =
          (data['results'] as List).map((e) => City.fromJson(e)).toList();

      return data['records'];
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }

  Future<List<Cost>> getCost({
    required String origin,
    required String destination,
    required int weight,
    required String courier,
  }) async {
    try {
      Response response = await post(
        RajaOngkirAPI.cost,
        data: {
          'origin': origin,
          'destination': destination,
          'weight': weight,
          'courier': courier,
        },
      );

      var data = response.data['rajaongkir'];

      data['records'] = (data['results'] as List)
          .expand((e) => (e['costs'] as List).map((x) => Cost.fromJson(x)))
          .toList();

      return data['records'];
    } on DioException catch (e) {
      throw e.msgDioErr();
    }
  }
}
