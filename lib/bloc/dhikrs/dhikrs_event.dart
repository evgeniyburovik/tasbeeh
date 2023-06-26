part of 'dhikrs_bloc.dart';

abstract class DhikrsEvent extends Equatable {
  const DhikrsEvent();

  @override
  List<Object> get props => [];
}

class LoadDhikrs extends DhikrsEvent {
  final List<Dhikr> dhikrs;

  const LoadDhikrs({this.dhikrs = const <Dhikr>[]});

  @override
  List<Object> get props => [dhikrs];
}

class AddDhikr extends DhikrsEvent {
  final Dhikr dhikr;

  const AddDhikr({required this.dhikr});

  @override
  List<Object> get props => [dhikr];
}

class UpdateDhikr extends DhikrsEvent {
  final Dhikr dhikr;

  const UpdateDhikr({required this.dhikr});

  @override
  List<Object> get props => [dhikr];
}

class DeleteDhikr extends DhikrsEvent {
  final Dhikr dhikr;

  const DeleteDhikr({required this.dhikr});

  @override
  List<Object> get props => [dhikr];
}
