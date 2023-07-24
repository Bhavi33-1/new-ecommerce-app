// // part of 'category_event.dart';
// // part of 'category_state.dart';
//
//
// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// // import '/models/models.dart';
// import '/repositories/category/category_repository.dart';
// import 'category_event.dart';
// import 'category_state.dart';
//
// // part 'category_event.dart';
// // part 'category_state.dart';
//
// class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
//   final CategoryRepository _categoryRepository;
//   StreamSubscription? _categorySubscription;
//
//   CategoryBloc({required CategoryRepository categoryRepository})
//       : _categoryRepository = categoryRepository,
//         super(CategoryLoading()) {
//     on<LoadCategories>(_onLoadCategories);
//     on<UpdateCategories>(_onUpdateCategories);
//   }
//
//   void _onLoadCategories(
//       LoadCategories event,
//       Emitter<CategoryState> emit,
//       ) {
//     _categorySubscription?.cancel();
//     _categorySubscription = _categoryRepository.getAllCategories().listen(
//           (products) => add(
//         UpdateCategories(products),
//       ),
//     );
//   }
//
//   void _onUpdateCategories(
//       UpdateCategories event,
//       Emitter<CategoryState> emit,
//       ) {
//     emit(
//       CategoryLoaded(categories: event.categories),
//     );
//   }
// }


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/repositories/category/category_repository.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc(
  {required CategoryRepository categoryRepository})
       : _categoryRepository = categoryRepository,
      super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
      CategoryEvent event,
      ) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState();
    }
    if(event is UpdateCategories) {
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  Stream<CategoryState> _mapLoadCategoriesToState() async* {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository
        .getAllCategories()
        .listen((categories) => add(UpdateCategories(categories),
    ),
    );
  }

  Stream<CategoryState> _mapUpdateCategoriesToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}

























