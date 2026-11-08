import 'package:flutter/material.dart';
import '../models/product.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Ürün listemiz ve yerel görsel yollarımız eksiksiz tanımlı:
  final List<Product> _products = [
    Product(
      id: 1,
      title: 'Pro Futbol Topu',
      price: 750.0,
      imageUrl: 'assets/images/futbol.png',
      category: 'Futbol',
      description: 'Dayanıklı yüzeye sahip profesyonel maç futbol topu.',
      specifications: 'Boyut: 5\nMalzeme: Sentetik deri\nKullanım: Maç ve antrenman',
    ),
    Product(
      id: 2,
      title: 'Profesyonel Tenis Raketi',
      price: 2450.0,
      imageUrl: 'assets/images/tenis.png',
      category: 'Tenis',
      description: 'Profesyonel kullanım için yüksek kaliteli tenis raketi.',
      specifications: 'Ağırlık: 300 g\nBaş boyutu: 100 inç²\nKullanım: Profesyonel',
    ),
    Product(
      id: 3,
      title: 'Basit Tenis Topu Kutusu',
      price: 320.0,
      imageUrl: 'assets/images/tenistop.png',
      category: 'Tenis',
      description: 'Dayanıklı keçe yapısıyla uzun ömürlü tenis topu seti.',
      specifications: 'İçerik: 4 tenis topu\nYüzey: Dayanıklı keçe\nKullanım: Kort tenis',
    ),
    Product(
      id: 4,
      title: 'Whey Protein Tozu (2300g)',
      price: 1950.0,
      imageUrl: 'assets/images/protein.png',
      category: 'Fitness',
      description: 'Kas gelişimini destekleyici yüksek protein içerikli takviye.',
      specifications: 'Miktar: 2300 g\nProtein: Whey\nKullanım: Antrenman sonrası',
    ),
    Product(
      id: 5,
      title: 'Ayarlanabilir Dumbell Seti',
      price: 1250.0,
      imageUrl: 'assets/images/dumbell.png',
      category: 'Fitness',
      description: 'Evde antrenman için ayarlanabilir ağırlık seti.',
      specifications: 'Ağırlık aralığı: Ayarlanabilir\nKullanım: Ev antrenmanı\nMalzeme: Metal',
    ),
    Product(
      id: 6,
      title: 'Profesyonel Basketbol Topu',
      price: 850.0,
      imageUrl: 'assets/images/basketbol.png',
      category: 'Basketbol',
      description: 'Yüksek tutuş ve kavrama sağlayan profesyonel basketbol topu.',
      specifications: 'Boyut: 7\nMalzeme: Sentetik deri\nKullanım: Salon ve açık alan',
    ),
  ];

  final List<Product> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoş geldin, ${widget.userName}'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: _cartItems,
                    onRemoveItem: (index) {
                      setState(() {
                        _cartItems.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.local_fire_department, color: Colors.deepOrange),
                  SizedBox(width: 10),
                  Text(
                    'SEZON İNDİRİMİ\nTenis ve Fitness ürünlerinde dev kampanya!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tüm Ürünler Katalog',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return GestureDetector(
                    onTap: () async {
                      final added = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(product: product),
                        ),
                      );
                      if (added == true && context.mounted) {
                        setState(() {
                          _cartItems.add(product);
                        });
                      }
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                product.imageUrl,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${product.price} ₺',
                                  style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}