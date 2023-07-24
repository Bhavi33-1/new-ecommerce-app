// import 'package:flutter/foundation.dart';
import 'package:newapp/models/modals.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}