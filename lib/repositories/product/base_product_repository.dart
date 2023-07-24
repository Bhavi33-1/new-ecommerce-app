import 'package:newapp/models/modals.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}