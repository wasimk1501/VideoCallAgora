import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:video_testing/settings/settings.dart';

import '../meeting_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late RtcEngine _agoraEngine;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                var role = ClientRoleType.clientRoleBroadcaster;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MeetingScreen(
                              channelName: channel,
                              role: role,
                              userJoined: true,
                            )));
              },
              child: Text("Join as Broadcaster")),
          TextButton(
              onPressed: () {
                var role2 = ClientRoleType.clientRoleAudience;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MeetingScreen(
                              channelName: channel,
                              role: role2,
                              userJoined: true,
                            )));
              },
              child: Text("Join as Audience")),
        ],
      )),
    );
  }
}
