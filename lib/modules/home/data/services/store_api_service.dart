import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/nearby_store.dart';

class StoreApiService {
  static const String _endpoint = String.fromEnvironment(
    'ROBINFOOD_GRAPHQL_URL',
    defaultValue: 'https://api.dev.robinfood.dev/graphql',
  );
  static const String _xAppToken = String.fromEnvironment(
    'ROBINFOOD_X_APP_TOKEN',
    defaultValue: '',
  );
  static const String _bearerToken = String.fromEnvironment(
    'ROBINFOOD_BEARER_TOKEN',
    defaultValue: '',
  );
  static const String _xAppHeader = String.fromEnvironment(
    'ROBINFOOD_X_APP_HEADER',
    defaultValue: 'x-app-token',
  );

  static const String _query = r'''
    query GetNearbyStores($coordinate: CoordinateArgs!) {
      getNearbyStores(coordinate: $coordinate) {
        id
        partnerName
        storeName
        distance
        imageUrl
        coverImageUrl
        productImageUrl
        duration
      }
    }
  ''';

  Future<List<NearbyStore>> getNearbyStores({
    required double latitude,
    required double longitude,
  }) async {
    if (_xAppToken.isEmpty) {
      throw Exception('Missing ROBINFOOD_X_APP_TOKEN dart-define.');
    }
    if (_bearerToken.isEmpty) {
      throw Exception('Missing ROBINFOOD_BEARER_TOKEN dart-define.');
    }

    final response = await http
        .post(
          Uri.parse(_endpoint),
          headers: {
            'Content-Type': 'application/json',
            _xAppHeader: _xAppToken,
            'Authorization': 'Bearer $_bearerToken',
          },
          body: jsonEncode({
            'query': _query,
            'variables': {
              'coordinate': {'latitude': latitude, 'longitude': longitude},
            },
          }),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('GraphQL HTTP ${response.statusCode}: ${response.body}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final errors = decoded['errors'];
    if (errors is List && errors.isNotEmpty) {
      throw Exception('GraphQL error: ${errors.first}');
    }

    final data = decoded['data'] as Map<String, dynamic>?;
    final list = data?['getNearbyStores'] as List<dynamic>?;
    if (list == null) {
      return const <NearbyStore>[];
    }

    return list
        .whereType<Map<String, dynamic>>()
        .map(NearbyStore.fromJson)
        .toList();
  }
}
