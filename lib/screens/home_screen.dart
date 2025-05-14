// HomeScreen.dart

// 📦 Imports
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/constants/colour_constants.dart'; // If you have color constants
import 'package:furniture_ecommerce_app/components/category_item.dart';
import 'package:furniture_ecommerce_app/components/product_card.dart';
import 'package:furniture_ecommerce_app/components/room_card.dart';

class HomeScreen extends StatelessWidget {
  static String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔽 Bottom Nav Bar
      bottomNavigationBar: buildBottomNavBar(),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 1. Header Row (Title + Notification Icon)
                buildHeader(),

                SizedBox(height: 16),

                // 🔹 2. Search Field
                buildSearchBar(),

                SizedBox(height: 20),

                // 🔹 3. Categories Section
                buildSectionHeader("Categories"),
                SizedBox(height: 12),
                buildCategoriesList(),

                SizedBox(height: 20),

                // 🔹 4. Promo Banner
                buildPromoBanner(),

                SizedBox(height: 20),

                // 🔹 5. Popular Products
                buildSectionHeader("Popular"),
                SizedBox(height: 12),
                buildProductGrid(),

                SizedBox(height: 20),

                // 🔹 6. Sale Banner
                buildSaleBanner(),

                SizedBox(height: 20),

                // 🔹 7. Rooms Section
                buildSectionHeader("Rooms",
                    subtitle: "Furniture for every corners in your home"),
                SizedBox(height: 12),
                buildRoomList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ HEADER
  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Explore What\nYour Home Needs",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Image.asset('assets/images/home_screen/icons/Notification.png',
            width: 24),
      ],
    );
  }

  // ✅ SEARCH BAR
  Widget buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Image.asset('assets/images/home_screen/icons/SearchIcon.png',
              width: 24),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Chair, desk, lamp, etc",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ SECTION HEADER
  Widget buildSectionHeader(String title, {String? subtitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            if (subtitle != null)
              Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
        Row(
          children: [
            Text("See all", style: TextStyle(color: Colors.orange)),
            SizedBox(width: 4),
            Image.asset('assets/images/home_screen/icons/ColouredArrow.png',
                width: 16),
          ],
        ),
      ],
    );
  }

  // ✅ CATEGORIES LIST
  Widget buildCategoriesList() {
    final categories = ["Chair", "Sofa", "Desk"];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, index) => CategoryItem(
          label: categories[index],
          iconPath:
              'assets/images/home_screen/Category-${categories[index]}.png',
        ),
      ),
    );
  }

  // ✅ PROMO BANNER
  Widget buildPromoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset('assets/images/home_screen/Crousel-One.png'),
          Positioned(
            left: 16,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("High quality sofa\nstarted",
                    style: TextStyle(color: Colors.white)),
                Text("70% off",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                SizedBox(height: 8),
                Text("See all items →", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ PRODUCT GRID
  Widget buildProductGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.7,
      children: [
        ProductCard(
            title: "Sverom chair",
            price: "\$400",
            imagePath: 'assets/images/home_screen/ProductPic-One.png'),
        ProductCard(
            title: "Norrviken chair and table",
            price: "\$999",
            imagePath: 'assets/images/home_screen/ProductPic-Two.png'),
        ProductCard(
            title: "Ektorp sofa",
            price: "\$599",
            imagePath: 'assets/images/home_screen/ProductPic-Three.png'),
        ProductCard(
            title: "Jan Sflanaganvik sofa",
            price: "\$599",
            oldPrice: "\$899",
            imagePath: 'assets/images/home_screen/ProductPic-Four.png'),
      ],
    );
  }

  // ✅ SALE BANNER
  Widget buildSaleBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset('assets/images/home_screen/SaleBG.png'),
          Positioned(
            left: 16,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sale",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold)),
                Text("All chair up to 70% off",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ ROOMS LIST
  Widget buildRoomList() {
    final rooms = ["Dining Room", "Bed Room", "Office Room"];
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: rooms.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, index) => RoomCard(
          title: rooms[index],
          imagePath:
              'assets/images/home_screen/FastPics-Item${index + 1}.png', // customize if needed
        ),
      ),
    );
  }

  // ✅ BOTTOM NAVBAR
  Widget buildBottomNavBar() {
    final icons = [
      "SelectedHomeButton",
      "ChatButton",
      "MyCartButton",
      "MySavesButton",
      "MyProfileButton",
    ];

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: icons
            .map((icon) => GestureDetector(
                  onTap: () {}, // you can customize
                  child: Image.asset(
                      'assets/images/home_screen/icons/$icon.png',
                      width: 28),
                ))
            .toList(),
      ),
    );
  }
}
