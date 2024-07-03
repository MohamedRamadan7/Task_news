import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const.dart';
import '../../core/res/res_api_names.dart';
import '../../core/services/http_helper.dart';
import '../models/article_models.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates()) {
    getSearch1();
    getSearch2();
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  ///============== Search ================///

  List<ArticleModel> search1 = [];
  Future<void> getSearch1({
    String country = 'us',
    String category = 'sports',
  }) async {
    emit(Search1LoadingState());
    final url =
        '${ApiNames.news}?country=$country&category=$category&apiKey=$token';
    HttpHelper.getReq(
      url,
    ).then((value) {
      final jsonData = jsonDecode(value.body);
      if (value.statusCode == 200) {
        search1.clear();
        jsonData['articles'].forEach(
          (search) => search1.add(ArticleModel.fromJson(search)),
        );
        emit(Search1SuccessState());
      } else {
        emit(Search1ErrorState(jsonData['errors']));
      }
    }).catchError((e) {
      debugPrint("Search Error : $e");
      emit(Search1ErrorState(e.toString()));
    });
  }

  ///============== News ================///

  List<ArticleModel> search2 = [];
  Future<void> getSearch2({
    String country = 'us',
    String category = 'business',
  }) async {
    emit(Search2LoadingState());
    final url =
        '${ApiNames.news}?country=$country&category=$category&apiKey=$token';

    HttpHelper.getReq(
      url,
    ).then((value) {
      final jsonData = jsonDecode(value.body);
      if (jsonData['status'] == "ok") {
        search2.clear();
        jsonData['articles'].forEach((search) {
          search2.add(ArticleModel.fromJson(search));
        });
        emit(Search2SuccessState());
      } else {
        emit(Search2ErrorState(jsonData['errors']));
      }
    }).catchError((e) {
      debugPrint("Search2 Get Error : $e");
      emit(Search2ErrorState(e.toString()));
    });
  }
}
