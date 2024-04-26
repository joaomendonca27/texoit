import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('List movies'),
            ],
          ),
        ),
      ),
    );
  }
}
