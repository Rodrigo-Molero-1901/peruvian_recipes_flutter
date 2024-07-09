part of 'home_cubit.dart';

sealed class HomeState extends Equatable {}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeMain extends HomeState {
  final HomeViewModel viewModel;

  HomeMain({
    required this.viewModel,
  });

  @override
  List<Object?> get props => [];
}
