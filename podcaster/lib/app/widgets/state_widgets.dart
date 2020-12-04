import 'package:flutter/material.dart';

Widget buildLoadingWidget() => const CircularProgressIndicator();

Widget buildFailureWidget(String failure) => Text(failure);