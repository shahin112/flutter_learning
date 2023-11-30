import 'package:flutter/material.dart';


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Catalog App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor

            ),
          ),
          Text(
            'Trending Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

              color: Theme.of(context).primaryColor.withOpacity(0.5)

            ),
          ),
        ],
      ),
    );
  }
}
