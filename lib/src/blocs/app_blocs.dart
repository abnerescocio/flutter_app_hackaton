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
