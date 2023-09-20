import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScreen<T> extends GetView<T> {
  const BaseScreen({super.key});

  PreferredSize? appBar() => null;
  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }
}
