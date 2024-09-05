import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_in_flutter/blocs/mqtt_response_cubit/mqtt_response_cubit.dart';
import 'package:mqtt_in_flutter/services/mqtt_service.dart';

class MqttPage extends StatefulWidget {
  const MqttPage({
    super.key,
  });

  @override
  State<MqttPage> createState() => _MqttPageState();
}

class _MqttPageState extends State<MqttPage> {
  @override
  void initState() {
    MqttService().initializeMQTTClient(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Mqtt in Flutter'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Message From Mqtt'),
            const SizedBox(height: 10),
            BlocBuilder<MqttResponseCubit, MqttResponseState>(
                builder: (context, state) {
              if (state.mqttResponseModel == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.mqttResponseModel!),
                    ],
                  ),
                );
              }
            })
          ],
        ));
  }
}
