import 'package:boklo_mart/features/home/presentation/widgets/search/search_card.dart';
import 'package:boklo_mart/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.mainContext});

  final BuildContext mainContext;


  @override
  Type get runtimeType {
    super.runtimeType;

    return super.runtimeType;

  }

  /// clear button
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  /// back button
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  /// search results
  @override
  Widget buildResults(BuildContext context) {
    final homeBloc = HomeBloc.get(mainContext);

    /// check if the search term is less than 3 characters
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: CustomText(text: 'Please enter at least 3 characters'),
          )
        ],
      );
    }

    /// filter the products
    homeBloc.add(SearchProducts(searchQuery: query));
    return BlocProvider.value(
      value: homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // check if the state is loading
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else
            // check if the state is success
          if (state is SearchSuccess) {
            return ListView.builder(
              itemCount: homeBloc.filterdProducts.length,
              itemBuilder: (context, index) {
                return ListCard(
                  product: homeBloc.filterdProducts[index],
                  index: index,
                );
              },
            );
          } else
            // check if the state is empty
          if (state is SearchEmpty) {
            return const Center(
              child: CustomText(text: 'No results found'),
            );
          } else {
            return const Center(
              child: CustomText(text: 'Something went wrong'),
            );
          }
        },
      ),
    );
  }

  /// todo : search suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }



}
