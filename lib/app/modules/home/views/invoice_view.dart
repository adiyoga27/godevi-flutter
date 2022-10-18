import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InvoiceView extends GetView {
  const InvoiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InvoiceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
