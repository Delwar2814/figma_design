import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';
import 'wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  int _selectedNavIndex = 0;
  String _searchQuery = '';

  final List<String> categories = ['For you', 'Footwear', 'Clothing', 'Accessories'];

  final List<Product> sampleProducts = [
    Product(
      id: 'aeroform-01',
      title: 'Aeroform 01',
      subtitle: 'Unisex • 2 colors',
      description:
          'Breathable silver mesh. Sculpted foam cushioning. A bold blue support cage. From the first train to the last mile, Aeroform moves at your pace.',
      price: 148.00,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=800',
      galleryImages: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=800',
        'https://images.unsplash.com/photo-1608231387042-66d1773070a5?auto=format&fit=crop&q=80&w=800',
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?auto=format&fit=crop&q=80&w=800',
      ],
      isNewRelease: true,
      category: 'Footwear',
      colors: const [Color(0xFF2555FF), Color(0xFF0F172A), Color(0xFFE2E8F0)],
    ),
    Product(
      id: 'form-track',
      title: 'Form Track Jacket',
      subtitle: 'Unisex • 2 colors',
      description:
          'Lightweight electric blue track jacket built for movement, weather protection, and sleek streetwear style.',
      price: 96.00,
      imageUrl:
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&q=80&w=800',
      galleryImages: [
        'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&q=80&w=800',
      ],
      category: 'Clothing',
      colors: const [Color(0xFF2555FF), Color(0xFF0F172A)],
    ),
    Product(
      id: 'velocity-runner',
      title: 'Velocity Runner Pro',
      subtitle: 'Men • 3 colors',
      description:
          'Engineered for maximum energy return and lightweight road running durability.',
      price: 120.00,
      imageUrl:
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?auto=format&fit=crop&q=80&w=800',
      category: 'Footwear',
      colors: const [Color(0xFF0F172A), Color(0xFF2555FF), Color(0xFFE2E8F0)],
    ),
    Product(
      id: 'movement-pack',
      title: 'Movement Pack',
      subtitle: 'Water-resistant',
      description:
          'Compact, ergonomic athletic backpack with padded laptop sleeve and quick-access pockets.',
      price: 78.00,
      imageUrl:
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&q=80&w=800',
      category: 'Accessories',
      colors: const [Color(0xFF0F172A)],
    ),
    Product(
      id: 'hyperpace-carbon',
      title: 'HyperPace Carbon',
      subtitle: 'Marathon Edition',
      description:
          'Full-length carbon fiber plate combined with high-rebound foam for peak race-day speeds.',
      price: 185.00,
      imageUrl:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?auto=format&fit=crop&q=80&w=800',
      isNewRelease: true,
      category: 'Footwear',
      colors: const [Color(0xFF2555FF), Color(0xFFE2E8F0)],
    ),
    Product(
      id: 'tech-hoodie',
      title: 'FlexMotion Hoodie',
      subtitle: 'Thermal Zip-Up',
      description:
          'Premium double-knit technical fleece providing lightweight warmth and 4-way stretch flexibility.',
      price: 110.00,
      imageUrl:
          'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?auto=format&fit=crop&q=80&w=800',
      category: 'Clothing',
      colors: const [Color(0xFF0F172A), Color(0xFF64748B)],
    ),
    Product(
      id: 'pro-joggers',
      title: 'Pro Training Joggers',
      subtitle: 'Tapered Fit',
      description:
          'Sweat-wicking performance pants designed for intense gym workouts and everyday urban recovery.',
      price: 85.00,
      imageUrl:
          'https://images.unsplash.com/photo-1517445312882-bc9910d016b7?auto=format&fit=crop&q=80&w=800',
      category: 'Clothing',
      colors: const [Color(0xFF0F172A), Color(0xFF2555FF)],
    ),
    Product(
      id: 'aircap-run',
      title: 'Pace AirCap Run',
      subtitle: 'Laser Ventilated',
      description:
          'Ultralight, packable moisture-wicking cap designed for intense sun protection on trail runs.',
      price: 32.00,
      imageUrl:
          'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?auto=format&fit=crop&q=80&w=800',
      category: 'Accessories',
      colors: const [Color(0xFF2555FF), Color(0xFF0F172A), Color(0xFFE2E8F0)],
    ),
    Product(
      id: 'stride-shorts',
      title: 'Stride Elite Shorts',
      subtitle: '5" Linerless',
      description:
          'Featherlight 4-way stretch fabric with targeted ventilation for maximum range of motion.',
      price: 52.00,
      imageUrl:
          'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?auto=format&fit=crop&q=80&w=800',
      category: 'Clothing',
      colors: const [Color(0xFF2555FF), Color(0xFF0F172A)],
    ),
    Product(
      id: 'aeroform-trail',
      title: 'Aeroform Trail X',
      subtitle: 'All-Terrain Runner',
      description:
          'Aggressive Vibram lug outsole and reinforced toe protection for rugged off-road trail conditions.',
      price: 160.00,
      imageUrl:
          'https://images.unsplash.com/photo-1608231387042-66d1773070a5?auto=format&fit=crop&q=80&w=800',
      isNewRelease: true,
      category: 'Footwear',
      colors: const [Color(0xFF0F172A), Color(0xFF2555FF)],
    ),
    Product(
      id: 'impact-top',
      title: 'Impact Base Layer',
      subtitle: 'Compression Top',
      description:
          'Zoned compression paneling supports core muscles and regulates body temperature during workouts.',
      price: 65.00,
      imageUrl:
          'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?auto=format&fit=crop&q=80&w=800',
      category: 'Clothing',
      colors: const [Color(0xFF0F172A)],
    ),
    Product(
      id: 'hydro-bottle',
      title: 'Pace HydroBottle 1L',
      subtitle: 'Vacuum Insulated',
      description:
          'Double-wall stainless steel keeps drinks ice cold for 24 hours with leak-proof sport cap.',
      price: 28.00,
      imageUrl:
          'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&q=80&w=800',
      category: 'Accessories',
      colors: const [Color(0xFF2555FF), Color(0xFF0F172A)],
    ),











  ];

  List<Product> get filteredProducts {
    final category = categories[_selectedCategoryIndex];
    return sampleProducts.where((p) {
      final matchesCategory = (category == 'For you') || (p.category == category);
      final matchesSearch = _searchQuery.isEmpty ||
          p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.category.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _showNavigationDrawerMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PACE® Brand Navigation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2555FF),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.grid_view_rounded, color: Color(0xFF0F172A)),
                title: const Text('All Products'),
                onTap: () {
                  setState(() => _selectedCategoryIndex = 0);
                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                leading: const Icon(Icons.directions_run_rounded, color: Color(0xFF0F172A)),
                title: const Text('Footwear'),
                onTap: () {
                  setState(() => _selectedCategoryIndex = 1);
                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                leading: const Icon(Icons.checkroom_rounded, color: Color(0xFF0F172A)),
                title: const Text('Clothing'),
                onTap: () {
                  setState(() => _selectedCategoryIndex = 2);
                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                leading: const Icon(Icons.backpack_rounded, color: Color(0xFF0F172A)),
                title: const Text('Accessories'),
                onTap: () {
                  setState(() => _selectedCategoryIndex = 3);
                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, color: Color(0xFF0F172A), size: 28),
          onPressed: () => _showNavigationDrawerMenu(context),
        ),
        title: RichText(
          text: const TextSpan(
            text: 'PACE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xFF2555FF),
              letterSpacing: 2.0,
            ),
            children: [
              TextSpan(
                text: '®',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Color(0xFF0F172A), size: 26),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              if (cartProvider.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2555FF),
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '${cartProvider.itemCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search_rounded, color: Color(0xFF64748B)),
                    hintText: 'Find your next move...',
                    hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.tune_rounded, color: Color(0xFF0F172A), size: 20),
                  ),
                ),
              ),
            ),

            // Category Chips Row
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedCategoryIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0, top: 6.0, bottom: 6.0),
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF2555FF) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF2555FF) : const Color(0xFFCBD5E1),
                        ),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF0F172A),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Hero Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 240,
                      width: double.infinity,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&q=80&w=1200',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.1),
                            Colors.black.withValues(alpha: 0.75),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 20,
                      right: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'THE CITY IN MOTION / VOL. 01',
                            style: TextStyle(
                              color: Color(0xFF93C5FD),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'MOVE OFF\nSCRIPT.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Performance made for everywhere.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 20,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_outward_rounded,
                          color: Color(0xFF2555FF),
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Section Header: The daily rotation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'The daily rotation (${filteredProducts.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Shop all',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2555FF),
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.arrow_outward_rounded, size: 14, color: Color(0xFF2555FF)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Product Grid
            filteredProducts.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(
                      child: Text(
                        'No products found in this category.',
                        style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredProducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(product: product),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

            const SizedBox(height: 20),

            // Promo Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        'A better pace. Join the club for 10% off.',
                        style: TextStyle(
                          color: Color(0xFF1E3A8A),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_rounded, color: Color(0xFF2555FF), size: 20),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2555FF),
        unselectedItemColor: const Color(0xFF64748B),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.favorite_border_rounded),
                if (wishlistProvider.itemCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Wishlist',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_bag_outlined),
                if (cartProvider.itemCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2555FF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Bag',
          ),
        ],
      ),
    );
  }
}
