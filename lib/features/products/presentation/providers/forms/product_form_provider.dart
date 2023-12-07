import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class ProductFormNotifier extends StateNotifier<ProductFormState> {
  
  final void Function( Map<String, dynamic> productLike )? onSubmitCallback;

  ProductFormNotifier({
    this.onSubmitCallback,
    required Product product
  }) : super (
    ProductFormState(
      id: product.id,
      slug: Slug.dirty(product.slug) ,
      title: Title.dirty(product.title),
      price: Price.dirty(product.price),
      inStock: Stock.dirty(product.stock),
      size: product.sizes,
      gender: product.gender,
      description: product.description,
      tags: product.tags.join(', '),
      images: product.images,
    )
  );

  void onTitleChanged( String value ) {
    state = state.copyWith(
      title: Title.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(value),
        Slug.dirty(state.slug.value),
        Price.dirty(state.price.value),
        Stock.dirty(state.inStock.value)
      ])
    );
  }

  void onSlugChanged( String value ) {
    state = state.copyWith(
      slug: Slug.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(value),
        Price.dirty(state.price.value),
        Stock.dirty(state.inStock.value)
      ])
    );
  }

  void onPriceChanged( double value ) {
    state = state.copyWith(
      price: Price.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(state.slug.value),
        Price.dirty(value),
        Stock.dirty(state.inStock.value)
      ])
    );
  }

  void onStockChanged( int value ) {
    state = state.copyWith(
      inStock: Stock.dirty(value),
      isFormValid: Formz.validate([
        Title.dirty(state.title.value),
        Slug.dirty(state.slug.value),
        Price.dirty(state.price.value),
        Stock.dirty(value)
      ])
    );
  }

}

class ProductFormState {

  final bool isFormValid;
  final String? id;
  final Title title;
  final Slug slug;
  final Price price;
  final List<String> size;
  final String gender;
  final Stock inStock;
  final String description;
  final String tags;
  final List<String> images;

  ProductFormState({
    this.isFormValid = false, 
    this.id, 
    this.title = const Title.dirty(''), 
    this.slug = const Slug.dirty(''), 
    this.price = const Price.dirty(0), 
    this.size = const[], 
    this.gender = 'men', 
    this.inStock = const Stock.dirty(0), 
    this.description = '', 
    this.tags = '', 
    this.images = const[]
  });

  ProductFormState copyWith({
    bool? isFormValid,
    String? id,
    Title? title,
    Slug? slug,
    Price? price,
    List<String>? size,
    String? gender,
    Stock? inStock,
    String? description,
    String? tags,
    List<String>? images,
  }) => ProductFormState(
    isFormValid: isFormValid ?? this.isFormValid, 
    id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    price: price ?? this.price,
    size: size ?? this.size,
    gender: gender ?? this.gender,
    inStock :inStock ?? this.inStock,
    description: description ?? this.description,
    tags: tags ?? this.tags,
    images: images ?? this.images,
  );

}