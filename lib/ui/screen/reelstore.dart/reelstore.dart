import 'package:flutter/material.dart';

class ReelStoreScreen extends StatefulWidget {
  const ReelStoreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReelStoreScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<ReelStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("ReelStoreScreen"));
  }
}
