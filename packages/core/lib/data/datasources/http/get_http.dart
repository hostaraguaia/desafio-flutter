import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:core/helpers/failure.dart';

class DataBase {
  Future<Either<DataBaseFailure, String>> getRepositoryHttp() async {
    String url =
        "https://api.github.com/search/repositories?q=language:java&sort=stars&order&page=1=desc";
    var result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      var j = json.encode(json.decode(result.body)["items"]);
      return Right(j);
    } else {
      return Left(DataBaseFailure(
          message: result.body, stackTrace: result.statusCode.toString()));
    }
  }
}

get getRepHttp => DataBase().getRepositoryHttp;
