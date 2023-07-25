part of 'dhikrs_bloc.dart';

abstract class DhikrsEvent extends Equatable {
  const DhikrsEvent();

  @override
  List<Object> get props => [];
}

class AddDhikr extends DhikrsEvent {
  final String title;
  final int count;

  const AddDhikr(this.title, this.count);

  @override
  List<Object> get props => [title, count];
}

class UpdateDhikr extends DhikrsEvent {
  final String title;
  final String id;

  const UpdateDhikr(this.title, this.id);

  @override
  List<Object> get props => [title, id];
}

class DeleteDhikr extends DhikrsEvent {
  final String id;

  const DeleteDhikr(this.id);

  @override
  List<Object> get props => [id];
}
