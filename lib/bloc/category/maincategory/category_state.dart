part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  // List categoryList;
  // CategoryInitial({
  //   required this.categoryList,
  // });
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  List categoryList;
  CategoryLoaded({
    required this.categoryList,
  });
}

// class CategoryInitial extends CategoryState {}
