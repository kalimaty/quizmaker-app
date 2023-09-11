import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:json_cache/json_cache.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import 'models/category.dart';

/*
localstorage: ^4.0.1+2
json_cache: ^2.1.0
dio_cache_interceptor_hive_store: ^3.2.1
*/
class TempService {
  static TempService instance;

  static JsonCache jsonCache;
  static Future<TempService> getInstance() async {
    if (instance == null) {
      CacheStore cacheStore;
      final LocalStorage storage = LocalStorage('home');
      jsonCache = JsonCacheMem(JsonCacheLocalStorage(storage));
      var dir = await getApplicationSupportDirectory();

      cacheStore = HiveCacheStore(dir.path);
      var cacheOptions = CacheOptions(
        store: cacheStore,
// maxStale: const Duration(days: 7),
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [], // for offline behaviour
      );
      Dio dio = Dio()
        ..interceptors.add(
          DioCacheInterceptor(options: cacheOptions),
        );
      return instance = TempService._internal(dio);
    } else {
      return instance;
    }
  }

  TempService._internal(dio) : _dio = dio;
  final Dio _dio;

  Future loadCategories() async {
    String cacheKey = "categories";

    Map<String, dynamic> cachedData = await jsonCache?.value(cacheKey);
    if (cachedData != null) {
      categoriesListModel = CategoriesListModel.fromMap(cachedData);
    } else {
      categoriesListModel = CategoriesListModel(categories: []);
    }
  }

  Future addCategory(CategoryModel category) async {
    categoriesListModel.categories.add(category);
    String cacheKey = "categories";

    jsonCache?.refresh(
      cacheKey,
      categoriesListModel.toMap(),
    );
  }

  // Future removeCategory(CategoryModel category) async {
  //   categoriesListModel.categories.remove(category);
  //   String cacheKey = "categories";

  //   jsonCache?.refresh(
  //     cacheKey,
  //     categoriesListModel.toMap(),
  //   );
  // }

  Future removeCategory(CategoryModel category) async {
    categoriesListModel.categories.remove(category);
    String cacheKey = "categories";

    await jsonCache?.refresh(
      cacheKey,
      categoriesListModel.toMap(),
    );
  }

  CategoriesListModel categoriesListModel;
}

class CategoriesListModel {
  List<CategoryModel> categories;
  /*
  List<CategoryModel> categories = [
  CategoryModel(
    name: "Basic",
    quizList: [
      QuizModel(
        imgUrl: "",
        name: "What is flutter?",
        correct: "Framework",
        incorrect: [
          "Editor",
          "Module",
          "Library",
        ],
      ),
    ],
  ),
];
  */
  CategoriesListModel({
    this.categories,
  });

  CategoriesListModel copyWith({
    List<CategoryModel> categories,
  }) {
    return CategoriesListModel(
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoriesListModel.fromMap(Map map) {
    return CategoriesListModel(
      categories: map['categories'] == null
          ? []
          : List<CategoryModel>.from(
              map['categories']?.map((x) => CategoryModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesListModel.fromJson(String source) =>
      CategoriesListModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoriesListModel(categories: $categories)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesListModel &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode => categories.hashCode;
}
