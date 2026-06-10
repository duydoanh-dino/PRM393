import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isLandscape;

  const ProductCard({
    super.key,
    required this.product,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        ),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: isLandscape ? _ColumnLayout(product: product) : _RowLayout(product: product),
      ),
    );

  }
}

// --- Portrait: ảnh trái, info phải ---
class _RowLayout extends StatelessWidget {
  final Product product;
  const _RowLayout({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ProductImage(imageUrl: product.imageUrl, width: 110, height: 110),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: _ProductInfo(product: product),
          ),
        ),
      ],
    );
  }
}

// --- Landscape: ảnh trên, info dưới ---
class _ColumnLayout extends StatelessWidget {
  final Product product;
  const _ColumnLayout({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProductImage(imageUrl: product.imageUrl, width: double.infinity, height: 120),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: _ProductInfo(product: product),
          ),
        ),
      ],
    );
  }
}

// --- Shared: Product image ---
class _ProductImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const _ProductImage({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: Colors.grey.shade200,
        child: const Icon(Icons.smartphone, size: 40, color: Colors.grey),
      ),
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : Container(
        width: width,
        height: height,
        color: Colors.grey.shade100,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  }
}

// --- Shared: Product info block ---
class _ProductInfo extends StatelessWidget {
  final Product product;
  const _ProductInfo({required this.product});

  String _formatVnd(double price) =>
      '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}₫';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Text(
          _formatVnd(product.discountedPrice),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          _formatVnd(product.price),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _DiscountBadge(percent: product.discountPercent),
            const Spacer(),
            _StarBadge(star: product.starNumber),
          ],
        ),
      ],
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  final double percent;
  const _DiscountBadge({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Text(
        '-${percent.toInt()}%',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.red.shade700,
        ),
      ),
    );
  }
}

class _StarBadge extends StatelessWidget {
  final double star;
  const _StarBadge({required this.star});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, size: 15, color: Colors.amber),
        const SizedBox(width: 2),
        Text(star.toStringAsFixed(1), style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}