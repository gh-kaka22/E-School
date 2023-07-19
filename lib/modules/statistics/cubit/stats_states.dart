abstract class StatsStates {}

class StatsInitialState extends StatsStates {}
class StatsLoadingState extends StatsStates {}
class StatsSuccessState extends StatsStates {
}
class StatsErrorState extends StatsStates {
  final String error;
  StatsErrorState(this.error);
}

class StatsChartLoadingState extends StatsStates {}
class StatsChartSuccessState extends StatsStates {
}
