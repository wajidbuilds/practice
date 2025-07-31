import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetDataScreen extends ConsumerStatefulWidget {
  const GetDataScreen({super.key});

  @override
  ConsumerState<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends ConsumerState<GetDataScreen> {
  String? name; // 👈🏻 name ko intentionally null chhoda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Github Practice"),),
      body: const Center(child: Text("Hello from Git Practice"),),
    );
  }
}
