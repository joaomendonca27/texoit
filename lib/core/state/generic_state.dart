import 'package:equatable/equatable.dart';

abstract class GenericStates extends Equatable {
  const GenericStates();

  @override
  List<Object> get props => [];
}

class InitState extends GenericStates {
  const InitState();
}

class SuccessState extends GenericStates {
  const SuccessState();
}

class LoadingState extends GenericStates {
  const LoadingState();
}

class ErrorState extends GenericStates {
  const ErrorState();
}
