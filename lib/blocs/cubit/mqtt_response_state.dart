part of 'mqtt_response_cubit.dart';

@immutable
sealed class MqttResponseState {
  const MqttResponseState(this.mqttResponseModel);
  // final MqttResponseModel? mqttResponseModel;

  final String? mqttResponseModel;
}

final class MqttResponseInitial extends MqttResponseState {
  const MqttResponseInitial() : super(null);
}

final class MqttResponseLoading extends MqttResponseState {
  const MqttResponseLoading(super.mqttResponseModel);
}

final class MqttResponseLoaded extends MqttResponseState {
  const MqttResponseLoaded(super.mqttResponseModel);
}

final class MqttResponseError extends MqttResponseState {
  const MqttResponseError(super.mqttResponseModel);
}
