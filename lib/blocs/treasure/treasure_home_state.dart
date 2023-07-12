part of 'treasure_home_bloc.dart';

abstract class TreasureHomeState extends Equatable {
  final double? percentTreasure;
  final double? totalPercentTreasure;
  const TreasureHomeState(
      {this.percentTreasure = 0, this.totalPercentTreasure = 0});

  @override
  List<Object> get props => [];
}

class TreasureHomeInitial extends TreasureHomeState {}

class TreasureHomeLoadedState extends TreasureHomeState {
  const TreasureHomeLoadedState(
      double percentTreasure, double totalPercentTreasure)
      : super(
            percentTreasure: percentTreasure,
            totalPercentTreasure: totalPercentTreasure);
}
