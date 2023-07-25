part of 'dhikrs_bloc.dart';

abstract class DhikrsState extends Equatable {
  const DhikrsState();

  @override
  List<Object> get props => [];

  Map<String, dynamic>? toJson() {}
}

class DhikrsLoding extends DhikrsState {}

class DhikrsLoaded extends DhikrsState {
  final List<Dhikr> dhikrs;

  const DhikrsLoaded(this.dhikrs);

  @override
  List<Object> get props => [dhikrs];

  @override
  Map<String, dynamic> toJson() {
    return {'dhikrs': dhikrs};
  }
}
