import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mqtt_response_state.dart';

class MqttResponseCubit extends Cubit<MqttResponseState> {
  MqttResponseCubit() : super(const MqttResponseInitial());

  void getMqttResponse(String message) {
    emit(MqttResponseLoading(state.mqttResponseModel));
    // final mqttResponseModel = mqttResponseModelFromJson(message);
    // emit(MqttResponseLoaded(mqttResponseModel));
    emit(MqttResponseLoaded(message));
  }
}
