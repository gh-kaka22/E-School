import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PusherClient pusher;
  //late Channel channel;

  @override
  void initState() {
    super.initState();

    pusher = PusherClient(
      'E_school',
      PusherOptions(
        host: '127.0.0.1',
        wsPort: 6001,
        wssPort: 443,
        encrypted: true,
        cluster: 'mt1',
      ),
      enableLogging: true,
    );

    //channel = pusher.subscribe('my-channel');

    //channel.bind('my-event', (event) {
      //print('Received event: ${event!.data}');
    //});

    pusher.connect();
  }

  @override
  void dispose() {
    pusher.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pusher Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pusher Example'),
        ),
        body: Center(
          child: Text('Listening for Pusher events...'),
        ),
      ),
    );
  }
}