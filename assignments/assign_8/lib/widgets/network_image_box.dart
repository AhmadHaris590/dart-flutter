import 'package:flutter/material.dart';

class NetworkImageBox extends StatelessWidget {
  const NetworkImageBox({
    super.key,
    required this.url,
    this.borderRadius = 12,
    this.fit = BoxFit.cover,
  });

  final String url;
  final double borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        fit: fit,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: Icon(Icons.image_not_supported_outlined, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}