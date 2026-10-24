import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> galleryImages;
  final List<String> availableSizes;
  final String selectedSize;
  final List<Color> colors;
  final double rating;
  final int reviewsCount;
  final String category;
  final bool isNewRelease;

  Product({
    required this.id,
    required this.title,
    this.subtitle = 'Unisex • 2 colors',
    required this.description,
    required this.price,
    required this.imageUrl,
    this.galleryImages = const [],
    this.availableSizes = const ['7', '8', '9', '10', '11', '12'],
    this.selectedSize = '9',
    this.colors = const [Color(0xFF2555FF), Color(0xFF1E293B), Color(0xFFE2E8F0)],
    this.rating = 4.9,
    this.reviewsCount = 128,
    this.category = 'Footwear',
    this.isNewRelease = false,
  });
}
