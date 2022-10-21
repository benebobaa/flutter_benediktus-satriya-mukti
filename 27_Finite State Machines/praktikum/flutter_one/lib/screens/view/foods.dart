import 'package:flutter/material.dart';

import 'package:flutter_one/screens/view_model/food_view_model.dart';
import 'package:provider/provider.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<FoodViewModel>(context, listen: false);
      await viewModel.getAllFoods();
    });
  }

  ListView listView(FoodViewModel modelView) {
    return ListView.builder(
      itemCount: modelView.foods.length,
      itemBuilder: (context, index) {
        final food = modelView.foods[index];
        return ListTile(
          title: Text(food.id.toString()),
          subtitle: Text(food.name),
        );
      },
    );
  }

  Widget body(FoodViewModel viewModel) {
    final isLoading = viewModel.state == FoodViewState.loading;
    final isError = viewModel.state == FoodViewState.error;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (isError) {
      return const Center(child: Text('Error'));
    }

    return listView(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<FoodViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Foods'),
        ),
      ),
      body: listView(modelView),
    );
  }
}
