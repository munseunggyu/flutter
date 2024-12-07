import 'package:flutter/material.dart';
import 'package:todo/models/user.dart';

class UserView extends StatelessWidget {
  const UserView({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final color = user.gender == 'male' ? Colors.blue : Colors.amber;
        return ListTile(
          subtitle: Text(
            '${user.phone} / ${user.formatDate}',
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          title: Text(
            '${user.fullName} / ',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          tileColor: color,
        );
      },
    );
  }
}
