import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  ContactsList({required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8.0),
            Icon(
              Icons.more_horiz,
              color: Colors.grey[600],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final User user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(user: user),
              );
            },
          ),
        ),
      ]),
    );
  }
}
