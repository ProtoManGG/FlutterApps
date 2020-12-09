import 'package:aud_bot/models/radio_model.dart';
import 'package:aud_bot/utils/ai_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => VxAnimatedBox()
                .size(context.screenWidth, context.screenHeight)
                .withGradient(
                  LinearGradient(
                    colors: [
                      AIColors.primaryColor2,
                      controller.selectedColor.value ?? AIColors.primaryColor1,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )
                .make(),
          ),
          AppBar(
            title: "AI Radio".text.xl4.white.bold.make().shimmer(
                  primaryColor: Vx.purple300,
                  secondaryColor: Colors.white,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100).p16(),
          "Start with - Hey Alan 👇".text.italic.semiBold.white.make(),
          10.heightBox,
          VxSwiper.builder(
            itemCount: controller.sugg.length,
            height: 50.0,
            viewportFraction: 0.35,
            autoPlay: true,
            autoPlayAnimationDuration: 3.seconds,
            autoPlayCurve: Curves.linear,
            enableInfiniteScroll: true,
            itemBuilder: (context, index) {
              final s = controller.sugg[index];
              return Chip(
                label: s.text.make(),
                backgroundColor: Vx.randomColor,
              );
            },
          ),
          Obx(
            () => controller.radios.isNullOrBlank
                ? Center(child: CircularProgressIndicator())
                : VxSwiper.builder(
                    itemCount: controller.radios.length,
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    onPageChanged: (index) {
                      controller.selectedRadioModel.value =
                          controller.radios[index];
                      final colorHex = controller.radios[index].color;
                      controller.selectedColor.value =
                          Color(int.tryParse(colorHex));
                    },
                    itemBuilder: (context, index) {
                      final RadioModel radio = controller.radios[index];
                      return VxBox(
                        child: ZStack(
                          [
                            Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: VxBox(
                                child: radio.category.text.uppercase.white
                                    .make()
                                    .px16(),
                              )
                                  .height(40)
                                  .black
                                  .alignCenter
                                  .withRounded(value: 10.0)
                                  .make(),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: VStack(
                                [
                                  radio.name.text.white.xl3.bold.make(),
                                  5.heightBox,
                                  radio.tagline.text.white.sm.semiBold.make(),
                                ],
                                crossAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: [
                                Icon(
                                  CupertinoIcons.play_circle,
                                  color: Colors.white,
                                ),
                                10.heightBox,
                                "Double tap to play".text.gray300.make(),
                              ].vStack(),
                            ),
                          ],
                        ),
                      )
                          .clip(Clip.antiAlias)
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
                          .onInkDoubleTap(() {
                        controller.playMusic(radio.url);
                      }).p16();
                    },
                  ).centered(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => [
                if (controller.isPlaying.value)
                  "Playing Now - ${controller.selectedRadioModel.value.name} FM"
                      .text
                      .white
                      .makeCentered(),
                Icon(
                  controller.isPlaying.value
                      ? CupertinoIcons.stop_circle
                      : CupertinoIcons.play_circle,
                  color: Colors.white,
                  size: 50.0,
                ).onInkTap(() {
                  if (controller.isPlaying.value) {
                    controller.audioPlayer.stop();
                  } else {
                    controller
                        .playMusic(controller.selectedRadioModel.value.url);
                  }
                }),
              ].vStack(),
            ),
          ).pOnly(bottom: context.percentHeight * 12)
        ],
        fit: StackFit.expand,
      ),
      drawer: Drawer(
        child: Container(
          color: controller.selectedColor ?? AIColors.primaryColor2,
          child: controller.radios != null
              ? [
                  100.heightBox,
                  "All Channels".text.xl.white.semiBold.make().px16(),
                  20.heightBox,
                  ListView(
                    padding: Vx.m0,
                    shrinkWrap: true,
                    children: controller.radios
                        .map((e) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(e.icon),
                              ),
                              title: "${e.name} FM".text.white.make(),
                              subtitle: e.tagline.text.white.make(),
                            ))
                        .toList(),
                  ).expand()
                ].vStack(crossAlignment: CrossAxisAlignment.start)
              : const Offstage(),
        ),
      ),
    );
  }
}
