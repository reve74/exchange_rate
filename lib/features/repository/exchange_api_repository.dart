import 'package:dio/dio.dart';
import 'package:exchange_rate/core/const/constants.dart';
import 'package:exchange_rate/features/models/dunamu_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'exchange_api_repository.g.dart';

final exchangeRepositoryProvider = Provider<ExchangeApiRepository>((ref) {
  final dio = Dio();
  final repository = ExchangeApiRepository(dio, baseUrl: dunamuBaseUrl);

  return repository;
});

@RestApi()
abstract class ExchangeApiRepository {
  factory ExchangeApiRepository(Dio dio, {String baseUrl}) =
      _ExchangeApiRepository;

  @GET('/')
  Future<List<DunamuModel>> getExchange({
    @Query("codes") required String codes,
  });
}
