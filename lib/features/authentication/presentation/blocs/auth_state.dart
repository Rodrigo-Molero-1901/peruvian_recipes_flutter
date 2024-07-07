part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthMain extends AuthState {
  final AuthViewModel viewModel;

  AuthMain({
    required this.viewModel,
  });

  @override
  List<Object?> get props => [viewModel];
}
