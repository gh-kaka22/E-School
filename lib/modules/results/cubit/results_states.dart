import 'package:untitled/models/calc_model.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/ranking_model.dart';
import 'package:untitled/models/show_students_model.dart';
import 'package:untitled/models/upgrade_model.dart';

abstract class ResultsStates {}

class ResultsInitialState extends ResultsStates {}
///Ranking
class ResultsLoadingState extends ResultsStates{}
class ResultsSuccessState extends ResultsStates{
  final RankingModel rankingModel;
  ResultsSuccessState(this.rankingModel);
}

class ResultsErrorState extends ResultsStates{
  final String error;
  ResultsErrorState(this.error);
}
///Dropdowns
class ResultsClassDropDownButtonState extends ResultsStates{}
class ResultsYearDropDownButtonState extends ResultsStates{}


///Calculate

class ResultsCalcLoadingState extends ResultsStates{}
class ResultsCalcSuccessState extends ResultsStates{
  final CalcModel calcModel;
  ResultsCalcSuccessState(this.calcModel);
}
class ResultsCalcErrorState extends ResultsStates{
  final String error;
  ResultsCalcErrorState(this.error);
}

///Upgrade

class ResultsUpgradeLoadingState extends ResultsStates{}
class ResultsUpgradeSuccessState extends ResultsStates{
  final UpgradeModel upgradeModel;
  ResultsUpgradeSuccessState(this.upgradeModel);
}
class ResultsUpgradeErrorState extends ResultsStates{
  final String error;
  ResultsUpgradeErrorState(this.error);
}


