import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/models.dart';
import './widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  Rooms({required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 1.0 : 0.0),
      elevation: isDesktop ? 2.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        decoration: isDesktop
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              )
            : null,
        color: isDesktop ? null : Colors.white,
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          color: Colors.blueAccent[100]!,
          width: 3.0,
        ),
        textStyle: const TextStyle(
            color: Palette.facebookBlue,
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}
