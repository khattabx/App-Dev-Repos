import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': FontAwesomeIcons.burger,
    'color': Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '-\$45.00',
    'date': 'Today',
  },
  {
    'icon': FontAwesomeIcons.bagShopping,
    'color': Colors.purple,
    'name': 'Shopping',
    'totalAmount': '-\$230.00',
    'date': 'Today',
  },
  {
    'icon': FontAwesomeIcons.heartCircleCheck,
    'color': Colors.red,
    'name': 'Health',
    'totalAmount': '-\$79.00',
    'date': 'Yesterday',
  },
  {
    'icon': FontAwesomeIcons.plane,
    'color': Colors.teal,
    'name': 'Travel',
    'totalAmount': '-\$379.00',
    'date': 'Yesterday',
  },
  {
    'icon': FontAwesomeIcons.house,
    'color': Colors.blueGrey,
    'name': 'House',
    'totalAmount': '-\$200.00',
    'date': 'Week ago',
  },
];
