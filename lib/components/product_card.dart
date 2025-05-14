// product_card.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final String? oldPrice;

  const ProductCard({
    required this.title,
    required this.price,
    required this.imagePath,
    this.oldPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            bottom: 40,
            child: Container(
              height: 150,
              width: 175,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: SaveItemButton(),
                      // child: Image.asset('assets/images/home_screen/icons/HeartForSave.png'),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          if (oldPrice != null) ...[
                            Text(
                              oldPrice!,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                          Text(
                            price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaveItemButton extends StatefulWidget {
  const SaveItemButton({
    super.key,
  });

  @override
  State<SaveItemButton> createState() => _SaveItemButtonState();
}

class _SaveItemButtonState extends State<SaveItemButton> {
  Icon iconData = Icon(CupertinoIcons.heart);
  Icon icon = Icon(CupertinoIcons.heart);
  Icon filledIcon = Icon(CupertinoIcons.heart_fill, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            iconData = (iconData == icon)
                ? (iconData = filledIcon)
                : (iconData = icon);
          });
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: iconData,
        ));
  }
}
