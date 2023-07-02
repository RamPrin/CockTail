import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/domain/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CocktailItem extends ConsumerWidget {
  const CocktailItem({super.key,required this.cocktail});

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.mixUp),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                child: Image.asset(
                  Assets.placeholder,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                cocktail.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  _composeIngredientsString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  String _composeIngredientsString(){
    String str = "Ingredients:\n";
    for (var item in cocktail.ingredients) {
      String itemStr = "${item.amount.toString()} ${item.measure} ${item.name}\n";
      str +=itemStr;
    }
    return str;
  }
}