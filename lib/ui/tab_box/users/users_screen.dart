import 'package:airways/data/network/repositories/user_repo.dart';
import 'package:flutter/material.dart';
class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, required this.userRepo}) : super(key: key);
  final UserRepo userRepo;
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
