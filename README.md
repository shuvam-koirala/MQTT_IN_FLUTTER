# MQTT in Flutter Application

This project demonstrates the integration of MQTT (Message Queuing Telemetry Transport) protocol in a Flutter application. The app connects to an MQTT broker, subscribes to a topic, and listens for messages published to that topic. Additionally, users can publish messages to the MQTT broker from the app.

## Features
- **MQTT Connection:** Connect to an MQTT broker and maintain the connection.
- **Subscribe to Topics:** Listen for messages on specific topics.
- **Publish Messages:** Send messages to the broker under a specific topic.
- **Real-time Updates:** Receive real-time updates from the broker on subscribed topics.

## How to Test MQTT Integration

To test the MQTT integration in this Flutter app, you can use the online MQTT client available at the following link:
[MQTT Test Client](https://testclient-cloud.mqtt.cool/)

### Steps to Test:
1. **Connect to the Broker:**
   - Visit the [MQTT Test Client](https://testclient-cloud.mqtt.cool/).
   
2. **Publish a Message:**
   - In the MQTT Test Client, publish a message under the topic `hello`.
   - Set the Quality of Service (QoS) level to `0`.

3. **Receive the Message in the Flutter App:**
   - The Flutter app will receive the message published under the `hello` topic.

### Prerequisites
- Basic knowledge of Flutter.
- Familiarity with MQTT protocol.

## Getting Started

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/mqtt_flutter_integration.git
   ```
2. **Navigate to the Project Directory:**
   ```bash
   cd mqtt_flutter_integration
   ```
3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the App:**
   ```bash
   flutter run
   ```

## MQTT Broker Setup
This project does not require a custom MQTT broker setup, as you can use the public test client linked above. However, if you wish to set up your own broker, you can use services like Mosquitto, HiveMQ, or EMQX.

## Future Enhancements
- **Custom Broker Configuration:** Allow users to configure their own MQTT broker details.
- **Advanced Topic Management:** Enable dynamic subscription and unsubscription to topics.
- **Enhanced UI:** Improve the user interface for better user experience.

## Contributions
Contributions are welcome! If you have suggestions for improvements or new features, feel free to fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.

---

Happy coding! 🎉