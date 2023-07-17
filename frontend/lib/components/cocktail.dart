import 'dart:math';

import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/clickable_text.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/utils/expansions.dart';
import 'package:capstone/domain/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class CocktailItem extends HookConsumerWidget {
  const CocktailItem({
    super.key,
    required this.cocktail,
    this.image,
    this.fillImageWithPlaceholder = true,
    this.height,
  });

  final Cocktail cocktail;
  final Image? image;
  final bool fillImageWithPlaceholder;
  final double? height;

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
                child: fillImageWithPlaceholder
                    ? Image.asset(
                        Assets.placeholder,
                        fit: BoxFit.fill,
                      )
                    : image == null
                        ? const Padding(
                            padding: EdgeInsets.all(50),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: image!.image,
                              fit: BoxFit.fill,
                            ),
                          ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cocktail.name,
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
                    child: page.value == _Page.ingredients
                        ? Column(
                            children: cocktail.ingredients
                                .map(
                                  (item) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                        ClickableText(
                                          "${item.amount.toString()} ${item.measure} ${item.name}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          onTap: (text) => launchUrl(
                                            Uri.https(
                                              'www.google.com',
                                              '/search',
                                              {'q': item.name},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : Text(
                            cocktail.recipe,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
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
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: height == null
                            ? 500
                            : min(
                                constraints.maxWidth,
                                max(
                                    height! -
                                        _textSize(
                                            cocktail.name,
                                            const TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontFamily: Fonts.carterOne,
                                            ),
                                            constraints.maxWidth) -
                                        10,
                                    0)),
                        width: height == null
                            ? 500
                            : min(
                                constraints.maxWidth,
                                max(
                                    height! -
                                        _textSize(
                                            cocktail.name,
                                            const TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontFamily: Fonts.carterOne,
                                            ),
                                            constraints.maxWidth) -
                                        10,
                                    0)),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: fillImageWithPlaceholder
                            ? Image.asset(
                                Assets.placeholder,
                                fit: BoxFit.fill,
                              )
                            : image == null
                                ? const Padding(
                                    padding: EdgeInsets.all(50),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      image: image!.image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cocktail.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: Fonts.carterOne,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }),
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
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      height: height == null
                          ? null
                          : height! -
                              _textSize(
                                "Ingredients",
                                const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 30,
                                ),
                                double.infinity,
                              ) -
                              20,
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
                          child: SingleChildScrollView(
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
                                                ClickableText(
                                                  "${item.amount.toString()} ${item.measure} ${item.name}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  onTap: (text) => launchUrl(
                                                    Uri.https(
                                                      'www.google.com',
                                                      '/search',
                                                      {'q': item.name},
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                : Text(
                                    cocktail.recipe,
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

  double _textSize(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size.height;
  }
}

enum _Page { ingredients, recipe }
