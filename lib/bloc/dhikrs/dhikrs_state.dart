part of 'dhikrs_bloc.dart';

abstract class DhikrsState extends Equatable {
  const DhikrsState();

  @override
  List<Object> get props => [];
}

class DhikrsLoding extends DhikrsState {}

class DhikrsLoaded extends DhikrsState {
  final List<Dhikr> dhikrs;

  const DhikrsLoaded({this.dhikrs = const <Dhikr>[]});

  @override
  List<Object> get props => [dhikrs];
}
