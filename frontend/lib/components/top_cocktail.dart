import 'package:capstone/components/animated_button.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/utils/expansions.dart';
import 'package:capstone/domain/top_cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopCocktailItem extends HookConsumerWidget {
  const TopCocktailItem({super.key, required this.cocktail});

  final TopCocktail cocktail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = context.isMobile;

    final page = useState(_Page.ingredients);

    return isMobile
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  cocktail.image,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                      const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cocktail.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 1,
                    child: AnimatedButton(
                      onTap: () => page.value = _Page.ingredients,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: page.value == _Page.ingredients
                                ? Colors.white
                                : Colors.white.withOpacity(0.45),
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              "Ingredients",
                              style: TextStyle(
                                color: page.value == _Page.ingredients
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.45),
                                fontStyle: FontStyle.italic,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: AnimatedButton(
                      onTap: () => page.value = _Page.recipe,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: page.value == _Page.recipe
                                ? Colors.white
                                : Colors.white.withOpacity(0.45),
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Text(
                                  "Ingredients",
                                  style: TextStyle(
                                    color: Colors.transparent,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Recipe",
                                  style: TextStyle(
                                    color: page.value == _Page.recipe
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.45),
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: page.value == _Page.ingredients
                          ? Column(
                              children: cocktail.ingredients
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 5,
                                            height: 5,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${item[0]} ${item[1]}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Text(
                              "${cocktail.recipe}\nGarnish: ${cocktail.garnish}\n",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        cocktail.image,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) =>
                            const Padding(
                          padding: EdgeInsets.all(100),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      cocktail.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              Flexible(
                flex: 30,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 1,
                          child: AnimatedButton(
                            onTap: () => page.value = _Page.ingredients,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: page.value == _Page.ingredients
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.45),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    "Ingredients",
                                    style: TextStyle(
                                      color: page.value == _Page.ingredients
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.45),
                                      fontStyle: FontStyle.italic,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: AnimatedButton(
                            onTap: () => page.value = _Page.recipe,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: page.value == _Page.recipe
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.45),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Text(
                                        "Ingredients",
                                        style: TextStyle(
                                          color: Colors.transparent,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 30,
                                        ),
                                      ),
                                      Text(
                                        "Recipe",
                                        style: TextStyle(
                                          color: page.value == _Page.recipe
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.45),
                                          fontStyle: FontStyle.italic,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: page.value == _Page.ingredients
                                ? Column(
                                    children: cocktail.ingredients
                                        .map(
                                          (item) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 5,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "${item[0]} ${item[1]}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                : Text(
                                    "${cocktail.recipe}\nGarnish: ${cocktail.garnish}\n",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

enum _Page { ingredients, recipe }
