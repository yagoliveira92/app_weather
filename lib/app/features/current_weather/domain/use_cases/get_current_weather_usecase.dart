import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/use_cases/enums/cities_concert_weather_enum.dart';

class GetCurrentWeatherUseCase {
  final ICurrentWeatherRepository repository;

  GetCurrentWeatherUseCase({required this.repository});

  Future<({Response result, List<CurrentWeatherEntity> currentWeatherList})>
      call() async {
    List<CurrentWeatherEntity> currentWeatherList = [];
    final resultSilverstone = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.silverstone.getCity,
    );
    if (resultSilverstone is Success) {
      currentWeatherList.add(resultSilverstone.currentWeather);
    }
    final resultSaoPaulo = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.saoPaulo.getCity,
    );
    if (resultSaoPaulo is Success) {
      currentWeatherList.add(resultSaoPaulo.currentWeather);
    }
    final resultMelbourne = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.melbourne.getCity,
    );
    if (resultMelbourne is Success) {
      currentWeatherList.add(resultMelbourne.currentWeather);
    }
    final resultMonteCarlo = await repository.getCurrentWeather(
      city: CitiesConcertWeatherEnum.monteCarlo.getCity,
    );
    if (resultMonteCarlo is Success) {
      currentWeatherList.add(resultMonteCarlo.currentWeather);
    }

    if (currentWeatherList.isEmpty) {
      return (result: GeneralFailure(), currentWeatherList: currentWeatherList);
    }
    return (result: Success(), currentWeatherList: currentWeatherList);
  }
}