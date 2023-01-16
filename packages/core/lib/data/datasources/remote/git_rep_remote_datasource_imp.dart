import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:core/data/datasources/http/get_http.dart';
import 'package:core/data/datasources/git_rep_datasource.dart';
import 'package:core/core/params/no_params.dart';
import 'package:core/data/models/git_rep_model.dart';
import 'package:core/helpers/failure.dart';

class GitRepRemoteDataSourceImp implements GitRepDataSource {
  @override
  Future<Either<DataBaseFailure, List<GitRepModel>>> call(
      NoParams params) async {
    var result = await getRepHttp;
    return result.fold((l) => Left(l), (r) {
      List<GitRepModel> list = [];
      for (var element in jsonDecode(r)) {
        try {
          list.add(GitRepModel.fromMap(element));
        } catch (error) {
          print(error);
        }
      }
      return Right(list);
    });
  }
}
