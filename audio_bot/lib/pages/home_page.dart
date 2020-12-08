import 'package:audio_bot/logic/home_controller.dart';
import 'package:audio_bot/models/radio_model.dart';
import 'package:audio_bot/utils/ai_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [
                    AIColors.primaryColor1,
                    AIColors.primaryColor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
          AppBar(
            title: "AI Radio".text.xl4.white.bold.make().shimmer(
                  primaryColor: Vx.purple300,
                  secondaryColor: Colors.white,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100).p16(),
          Obx(
            () => !controller.isLoaded.value
                ? Center(child: CircularProgressIndicator())
                : VxSwiper.builder(
                    itemCount: controller.radios.length,
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    itemBuilder: (context, index) {
                      final RadioModel radio = controller.radios[index];
                      return VxBox(
                        child: ZStack(
                          [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: VStack([
                                radio.name.text.white.xl3.bold.make(),
                                5.heightBox,
                                radio.tagline.text.white.sm.semiBold.make(),
                              ]),
                            )
                          ],
                        ),
                      )
                          .bgImage(
                            DecorationImage(
                              image: NetworkImage(radio.image),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken,
                              ),
                            ),
                          )
                          .border(color: Colors.black, width: 5.0)
                          .withRounded(value: 60.0)
                          .make()
                          .p16()
                          .centered();
                    },
                  ),
          ),
        ],
        fit: StackFit.expand,
      ),
      drawer: Drawer(),
    );
  }
}
