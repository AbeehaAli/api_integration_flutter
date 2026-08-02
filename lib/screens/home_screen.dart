import 'package:flutter/material.dart';

import 'package:flutter_api_integration/models/book_model.dart';
import 'package:flutter_api_integration/services/api_services.dart';
import 'package:flutter_api_integration/widgets/category_list.dart' show CategoryList;
import 'package:flutter_api_integration/widgets/featured_books.dart' show FeaturedBooks;
import 'package:flutter_api_integration/widgets/recommended_book.dart' show RecommendedBooks;
import 'package:flutter_api_integration/widgets/search_bar_widget.dart' show SearchBarWidget;



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: SafeArea(
        child: FutureBuilder<List<BookModel>>(
          future: apiService.fetchBooks(),

          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }

            final books = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 30),

                  const Text(
                    "Hello, Abeeha 👋",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Find your next favorite book",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const SearchBarWidget(),

                  const SizedBox(height: 15),

                  const CategoryList(),

                  const SizedBox(height: 20),

                  FeaturedBooks(books: books),

                  const SizedBox(height: 30),

                  RecommendedBooks(books: books),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}