import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_in_flutter/blocs/mqtt_response_cubit/mqtt_response_cubit.dart';

class MqttService {
  static final MqttService _instance = MqttService._internal();
  factory MqttService() {
    return _instance;
  }

  MqttService._internal();

  late MqttServerClient _mqttClient;

  final String _server = 'broker.mqtt.cool';
  final int _port = 1883;
  final String _username = 'admin';
  final String _password = 'admin';
  final String _topic = "hello";

  void initializeMQTTClient(BuildContext context) async {
    _mqttClient = MqttServerClient.withPort(_server, "zzzwaterZZZ", _port)
      ..onConnected = () {
        log("Successfully connected to the MQTT broker");
        _onConnected(context);
      }
      ..onDisconnected = () {
        log("Failed to connect to the MQTT broker");
      }
      ..onSubscribed = (String topic) {
        log("Subscribed to $topic");
      }
      ..onUnsubscribed = (String? topic) {
        log("Unsubscribed from ${topic ?? ""}");
      }
      ..onSubscribeFail = (String topic) {
        log("Failed to subscribe to $topic");
      }
      ..keepAlivePeriod = 30
      ..logging(on: true);
    _mqttClient.setProtocolV311();

    _mqttClient.connectionMessage = MqttConnectMessage()
        .withClientIdentifier('zzzwaterZZZ')
        .withWillTopic('unexpected-disconnect')
        .withWillMessage('client disconnected unexpectedly')
        .authenticateAs(_username, _password)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    connectMQTT();
  }

  Future connectMQTT() async {
    log('Mosquitto client connecting....');
    try {
      await _mqttClient.connect();
    } on NoConnectionException catch (e) {
      log(e.toString());
      _mqttClient.disconnect();
    }
  }

  void disConnectMQTT() {
    try {
      _mqttClient.disconnect();
    } catch (e) {
      log(e.toString());
    }
  }

  void _onConnected(BuildContext context) {
    log('Connected');

    try {
      _mqttClient.subscribe(_topic, MqttQos.atMostOnce);
      _mqttClient.updates!.listen((dynamic t) {
        final MqttPublishMessage recMess = t[0].payload;
        final message =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        log('message : $message');
        context.read<MqttResponseCubit>().getMqttResponse(message);
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
