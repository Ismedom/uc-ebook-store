import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uc_ebook_store/pages/account_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> exploreImages = [
    'https://m.media-amazon.com/images/I/51WMIz-aCtL._SL500_.jpg',
    'https://i5.walmartimages.com/seo/Book-of-The-Book-of-Amazing-History-Hardcover-9781450807456_fa365337-cc2b-44c4-937c-683a0fffd5a4.d786a2f0b45d42926d830c13b4e9655f.jpeg',
    'https://uncpress-us.imgix.net/covers/9781469658773.jpg?auto=format&h=648',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPwNfUqsR1rtrfuJtfGHSWklh2aJhi3eiCA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLpfpDnfeIhjvFP56W1ffJwuKbnSuTJEThYg&s',
  ];

  final List<String> bestsellerImages = [
    'https://uncpress-us.imgix.net/covers/9781469633862.jpg?auto=format&h=648',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEcKDo9AcnovlRyGfp2frPIl9Z6hYDN__zNg&s',
    'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1470421195i/28789711.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0A8JRGSyDpdviUtQkEdUpnVDNHlQgkRFl5w&s',
  ];

  final String designImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXU44sBTQIGkBBDbTd1rWLB-EDiExIe0Byug&s';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Home'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.person_crop_circle_fill,
            size: 30,
            color: CupertinoColors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountScreen()),
            );
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'More to Explore',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < exploreImages.length; i++)
                        Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              exploreImages[i],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                    CupertinoIcons.exclamationmark_circle);
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'True-Love All-Time Bestsellers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  for (int i = 0; i < bestsellerImages.length; i += 2)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            margin: const EdgeInsets.only(bottom: 16, right: 8),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                bestsellerImages[i],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                      CupertinoIcons.exclamationmark_circle);
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        if (i + 1 < bestsellerImages.length)
                          Expanded(
                            child: Container(
                              height: 200,
                              margin:
                                  const EdgeInsets.only(bottom: 16, left: 8),
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  bestsellerImages[i + 1],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                        CupertinoIcons.exclamationmark_circle);
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CupertinoActivityIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Design & Prototype',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    designImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(CupertinoIcons.exclamationmark_circle);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
