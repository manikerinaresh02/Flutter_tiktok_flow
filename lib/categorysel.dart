import 'package:flutter/material.dart';
import 'package:tiktok_flow/finalscreen.dart';
import 'package:tiktok_flow/resuable_components.dart';
// Screen 5: Category Selection
class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  String? selectedCategory;

  final List<String> categories = [
    "Art & Crafts",
    "Automotive & Transportation", 
    "Baby",
    "Beauty",
    "Clothing & Accessories",
    "Education & Training",
    "Electronics",
    "Finance & Investing",
    "Food & Beverage",
    "Media & Entertainment",
    "Personal Blog",
    "Pets",
    "Professional Services",
    "Public Administration",
    "Real Estate",
    "Restaurants & Bars",
    "Shopping & Retail",
    "Software & Apps",
    "Sports, Fitness & Outdoors",
    "Travel & Tourism",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TikTokAppBar(title: ""),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Text(
              "Choose a category",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "Select the category that best describes your account. This category won't be displayed publicly.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ),
          
          // Category list
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFFFF2B5C) : const Color(0xFFE1E1E1),
                              width: 2,
                            ),
                            color: isSelected ? const Color(0xFFFF2B5C) : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Bottom section with Next button
          Container(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              text: "Next",
              enabled: selectedCategory != null,
              onPressed: selectedCategory != null ? () {
                // TODO: Save selected category and proceed to next step
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessSuccessScreen(selectedCategory: selectedCategory!),
                  ),
                );
              } : null,
            ),
          ),
        ],
      ),
    );
  }
}