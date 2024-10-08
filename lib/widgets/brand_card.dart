
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String imageUrl;
  const BrandCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  ClipOval(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade200,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
                }
  }
