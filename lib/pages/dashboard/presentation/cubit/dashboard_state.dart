import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class SuccessYearsWinnersState extends DashboardState {
  const SuccessYearsWinnersState();
}

class SuccessStudiosWinCountState extends DashboardState {
  const SuccessStudiosWinCountState();
}

class SuccessPruducersWinIntervalState extends DashboardState {
  const SuccessPruducersWinIntervalState();
}

class SuccessWinnerByYearState extends DashboardState {
  const SuccessWinnerByYearState();
}

class LoadingState extends DashboardState {
  const LoadingState();
}

class InitState extends DashboardState {
  const InitState();
}
