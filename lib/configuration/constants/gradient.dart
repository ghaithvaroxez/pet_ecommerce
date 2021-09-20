import 'package:flutter/material.dart';

LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF49C3EA), Color(0xFF348BA7)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);
LinearGradient blackGradient = LinearGradient(colors: [
  Color(0xFF000000).withOpacity(0.62),
  Color(0xFF348BA7).withOpacity(0.52)
], begin: Alignment.topCenter, end: Alignment.bottomCenter);
LinearGradient whiteGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFFFFFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);
