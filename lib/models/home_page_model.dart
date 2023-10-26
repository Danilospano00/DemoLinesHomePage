import 'package:flutter/material.dart';
import 'package:lines_demo_project/view/pages/home_page.dart';

/// This model is used to create a page with all necessary data
/// in [HomePage] widget
class HomePageModel {
  final Image image;
  final String title;
  final String description;

  const HomePageModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
