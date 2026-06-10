import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  String _formatVnd(double price) =>
      '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}₫';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HeroImage(imageUrl: product.imageUrl),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        _formatVnd(product.discountedPrice),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _formatVnd(product.price),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _DiscountChip(percent: product.discountPercent),
                      const SizedBox(width: 12),
                      _StarRow(star: product.starNumber),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text(
                    'Mô tả sản phẩm',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${product.name} là một trong những sản phẩm điện thoại cao cấp '
                        'nổi bật với thiết kế sang trọng, hiệu năng mạnh mẽ và camera '
                        'chuyên nghiệp. Sản phẩm phù hợp cho cả công việc lẫn giải trí, '
                        'mang đến trải nghiệm người dùng tuyệt vời.',
                    style: const TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
                  ),
                ],
              ),
            ),
            // Padding bottom để nội dung không bị che bởi bottomNavigationBar
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _AddToCartBar(productName: product.name),
    );
  }
}

// --- Hero image ---
class _HeroImage extends StatelessWidget {
  final String imageUrl;

  const _HeroImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 300,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        height: 300,
        color: Colors.grey.shade200,
        child: const Icon(Icons.smartphone, size: 80, color: Colors.grey),
      ),
    );
  }
}

// --- Discount chip ---
class _DiscountChip extends StatelessWidget {
  final double percent;

  const _DiscountChip({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        'Giảm ${percent.toInt()}%',
        style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.red.shade50,
      side: BorderSide(color: Colors.red.shade200),
      padding: EdgeInsets.zero,
    );
  }
}

// --- Star row --- (nhận star qua constructor, không tham chiếu product trực tiếp)
class _StarRow extends StatelessWidget {
  final double star;

  const _StarRow({required this.star});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
              (i) => Icon(
            i < star.floor() ? Icons.star_rounded : Icons.star_outline_rounded,
            size: 20,
            color: Colors.amber,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '${star.toStringAsFixed(1)} / 5.0',
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }
}

// --- Add to cart bottom bar --- (widget riêng, nằm ngoài ProductDetailScreen)
class _AddToCartBar extends StatelessWidget {
  final String productName;

  const _AddToCartBar({required this.productName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton.icon(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đã thêm "$productName" vào giỏ hàng')),
          ),
          icon: const Icon(Icons.shopping_cart_outlined),
          label: const Text('Thêm vào giỏ hàng'),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}