import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/remote_datasource/i_forecast_weather_remote_datasource.dart';

class ForecastWeatherRemoteDataSource
    implements IForecastWeatherRemoteDataSource {
  const ForecastWeatherRemoteDataSource({
    required this.remoteDataManager,
  });

  final IRemoteDataManager remoteDataManager;

  @override
  Future<RemoteData> getForecastWeather({required String city}) async {
    final endpoint = Endpoint(
      method: Methods.get,
      query: {
        'units': 'metric',
      },
      path: '/forecast?q=$city',
    );
    return remoteDataManager.request(endpoint: endpoint);
  }
}
