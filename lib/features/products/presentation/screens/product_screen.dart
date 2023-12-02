import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/products/presentation/providers/providers.dart';

class ProductScreen extends ConsumerStatefulWidget {

  final String productId;

  const ProductScreen({ 
    super.key,
    required this.productId
  });

  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends ConsumerState<ProductScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(productProvider(widget.productId).notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear un nuevo producto'),
      ),
      body: Center(
        child: Text('Product screen'),
      ),
    );
  }
}