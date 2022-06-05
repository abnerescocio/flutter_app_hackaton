import 'package:bloc/bloc.dart';
import 'package:flutter_app_hackaton/src/blocs/app_events.dart';
import 'package:flutter_app_hackaton/src/blocs/app_states.dart';
import 'package:flutter_app_hackaton/src/data/mappers.dart';
import 'package:flutter_app_hackaton/src/data/repositories.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final UserRepository _repository = UserRepository();

  GetUserBloc() : super(InitialGetUserState()) {
    on<GetUserEvent>((event, emit) async {
      try {
        await _repository.getById(event.userId).then(
          (value) {
            final user = UserMapper.fromSnapshot(value);
            emit(SuccessGetUserState(user));
          },
        );
      } catch (e) {
        emit(ErrorGetUserState(e));
      }
    });
  }
}

class SetUserBloc extends Bloc<SetUserEvent, SetUserState> {
  final UserRepository _repository = UserRepository();

  SetUserBloc() : super(InitialSetUserState()) {
    on<SetUserEvent>((event, emit) async {
      try {
        final data = UserMapper.toMap(event);
        await _repository.saveUser(data, event.userId).then((value) {
          emit(SuccessSetUserState());
        });
      } catch (e) {
        emit(ErrorSetUserState(e));
      }
    });
  }
}

class SetUserTrainingBloc
    extends Bloc<SetUserTrainingEvent, SetUserTrainingState> {
  final UserRepository _repository = UserRepository();

  SetUserTrainingBloc() : super(InitialSetUserTrainingState()) {
    on<SetUserTrainingEvent>((event, emit) async {
      try {
        final data = TrainingMapper.toMap(event);
        await _repository.saveUserTraining(data, event.userId).then((value) {
          emit(SuccessSetUserTrainingState());
        });
      } catch (e) {
        emit(ErrorSetUserTrainingState(e));
      }
    });
  }
}
