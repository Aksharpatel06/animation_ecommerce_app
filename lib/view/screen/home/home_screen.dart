import 'package:animation_ecommerce_app/view/modal/product_modal.dart';
import 'package:animation_ecommerce_app/view/screen/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../controller/home_controller.dart';
import 'componects/card_short_view.dart';
import 'componects/cart_details_view.dart';
import 'componects/header.dart';
import 'componects/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    void _onVerticalGesture(DragUpdateDetails details) {
      if (details.primaryDelta! < -0.7) {
        controller.changeHomeState(HomeState.cart);
      } else if (details.primaryDelta! > 12) {
        controller.changeHomeState(HomeState.normal);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                cartBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            cartBarHeight -
                            headerHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding,
                            ),
                            itemCount: demoProducts.length,
                            itemBuilder: (context, index) {
                              ProductModal product = demoProducts[index];
                              return productCard(
                                product: product,
                                context: context,
                                press: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailsScreen(
                                          onProductAdd: () {
                                            controller.addProductToCart(
                                                demoProducts[index]);
                                          },
                                          product: product,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: panelTransition,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              color: const Color(0xFFEAEAEA),
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(defaultPadding),
                              child: AnimatedSwitcher(
                                duration: panelTransition,
                                child: controller.homeState == HomeState.normal
                                    ? cardShortView(context, controller)
                                    : cartDetailsView(context, controller),
                              ),
                            )),
                      ),
                      AnimatedPositioned(
                        duration: panelTransition,
                        left: 0,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        right: 0,
                        height: headerHeight,
                        child: homeHeader(context),
                      ),
                    ],
                  );
                });
              }),
        ),
      ),
    );
  }
}
