import 'package:flutter/material.dart';

import '../data/models/nearby_store.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.store});

  final NearbyStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(95, 224, 150, 40),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(32, 217, 7, 7),
            blurRadius: 100,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(24),
            ),
            child: SizedBox(
              width: 120,
              height: double.infinity,
              child: store.imageUrl != null && store.imageUrl!.isNotEmpty
                  ? Image.network(
                      store.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const ColoredBox(
                            color: Color(0xFFE0E0E0),
                            child: Icon(Icons.store),
                          ),
                    )
                  : const ColoredBox(
                      color: Color(0xFFE0E0E0),
                      child: Icon(Icons.store),
                    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.storeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    store.partnerName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _buildMetaText(store),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildProductImage(store),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Product',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _buildMetaText(NearbyStore store) {
    final distanceText = store.distance == null
        ? '-'
        : '${store.distance!.toStringAsFixed(1)} km';
    final durationText = (store.duration == null || store.duration!.isEmpty)
        ? '-'
        : store.duration!;
    return '$distanceText • $durationText';
  }

  Widget _buildProductImage(NearbyStore store) {
    final url = store.productImageUrl;
    if (url == null || url.isEmpty) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Icon(Icons.fastfood, size: 16, color: Colors.black54),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        url,
        width: 28,
        height: 28,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.fastfood, size: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
