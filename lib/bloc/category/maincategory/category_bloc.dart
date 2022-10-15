import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../dummy/category_json.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  int index = 0;
  CategoryBloc() : super(CategoryInitial()) {
    emit(CategoryLoaded(categoryList: categoryJSON));
    on<CategorySelected>(onCategorySelected);
  }

  void onCategorySelected(CategorySelected event, Emitter<CategoryState> emit) {
    // emit(CategoryLoading());
    for (var element in event.categorylist) {
      element["isSelected"] = false;
    }
    event.categorylist[index]["isSelected"] =
        !event.categorylist[index]["isSelected"];

    emit(CategoryLoaded(categoryList: event.categorylist));
  }
}
