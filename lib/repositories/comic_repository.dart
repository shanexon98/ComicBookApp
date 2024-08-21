import 'dart:convert';
import 'package:comic_book_app/models/comic_creators_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/comic_model.dart';
import '../models/comic_detail_model.dart';

class ComicRepository {
  final String _baseUrl = 'https://comicvine.gamespot.com/api/';
//La clave API 57c19e6ee955653665add3e18186bb73fdc9001a está codificada en Base64, resultando en NTdjMTllNmVlOTU1NjUzNjY1YWRkM2UxODE4NmJiNzNmZGM5MDAxYQ==.
  final String _encodedApiKey =
      'NTdjMTllNmVlOTU1NjUzNjY1YWRkM2UxODE4NmJiNzNmZGM5MDAxYQ==';

  String get _apiKey => utf8.decode(base64.decode(_encodedApiKey));

  Future<ComicModel> fetchComics() async {
    final response =
        await _get('${_baseUrl}issues/?api_key=$_apiKey&format=json');

    if (response.statusCode == 200) {
      return ComicModel.fromJson(jsonDecode(response.body));
    } else {
      return _handleError(response);
    }
  }

  Future<ComicDetailModel> fetchComicDetail(int comicId,
      {bool forceRefresh = false}) async {
    final box = Hive.box('comic_cache');
    final cacheKey = 'comic_$comicId';

    if (!forceRefresh) {
      final cachedData = box.get(cacheKey);
      if (cachedData != null) {
        return cachedData as ComicDetailModel;
      }
    }

    final response = await _get(
        '${_baseUrl}issue/4000-$comicId/?api_key=$_apiKey&format=json');

    if (response.statusCode == 200) {
      final comicDetail = ComicDetailModel.fromJson(jsonDecode(response.body));
      box.put(cacheKey, comicDetail);
      return comicDetail;
    } else {
      return _handleError(response);
    }
  }

  Future<ComicCreatorsModel> fetchPersonDetails(String apiUrl) async {
    final response = await _get(apiUrl);

    if (response.statusCode == 200) {
      return ComicCreatorsModel.fromJson(jsonDecode(response.body));
    } else {
      return _handleError(response);
    }
  }

  Future<http.Response> _get(String url) async {
    try {
      return await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Never _handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw Exception('Bad request: ${response.statusCode}');
      case 401:
        throw Exception('Unauthorized: ${response.statusCode}');
      case 500:
        throw Exception('Internal server error: ${response.statusCode}');
      default:
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
