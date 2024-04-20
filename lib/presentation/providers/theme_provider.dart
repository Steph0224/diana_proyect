import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeColorProvider = StateProvider<Color>((ref) => Colors.blue);

final themeBrightnessProvider =
    StateProvider<Brightness>((ref) => Brightness.light);
