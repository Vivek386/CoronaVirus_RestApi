import 'package:corona_virus_rest_api_flutter_coarse/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint {
  cases,
  todayCases,
  active,
  deaths,
  recovered,
  todayDeaths,
  casesPerOneMillion,
  critical,
}

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'gateway.nubentos.com';
  static final int port = 443;
  static final String basePath = '/nubentos.com/ncovapi/2.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: '$basePath/${_paths[endpoint]}',
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.todayCases: 'todayCases',
    Endpoint.active: 'active',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
    Endpoint.todayDeaths: 'todayDeaths',
    Endpoint.casesPerOneMillion: 'casesPerOneMillion',
    Endpoint.critical: 'critical',
  };
}

//https://gateway.nubentos.com:443/nubentos.com/ncovapi/2.0.0
