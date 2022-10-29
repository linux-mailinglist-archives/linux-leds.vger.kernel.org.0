Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3228361220C
	for <lists+linux-leds@lfdr.de>; Sat, 29 Oct 2022 11:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiJ2Jyo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 Oct 2022 05:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJ2Jyh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 Oct 2022 05:54:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3DD10B783
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 02:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1667037254; bh=9sZ2S19e7PyWsMM2dxOOA9UEQHeNkIUm4TPk2z08ejc=;
        h=X-UI-Sender-Class:From:Date:Subject:To;
        b=jvLksWmt1JZrtcPETbL2vZ6udS76FfZqcRDFHblvDGHqi77k83VAwA/BIZ5cChWg8
         eBB62oxUyyiEvZ6AL5/JIUK8s1tXCkO4Mba21IS3s3EScBkGcmSG+ScQ6mPlcX/DDi
         /Xcz+GcHEQ+FoQyND6yN+ZtY8cs7uTGdPKs4/VhniZ3GN8Q8sheQgz+bKrONDDH2y9
         nBA/xJMcZLaYBgC+vSuyn1zYEmtnD6dUI9uQ+5J72rKH55BqabzphpB4vDESxAk17x
         2B0Q74uBUsTiK8nDsinbsUZCWS0AFSTZOgnuPkyptx5m2NpH5woarutOd6RzDcBCSC
         yg+DL4nIvNCwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f45.google.com ([209.85.218.45]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDywo-1owO3O29Ce-009uuF for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022
 11:54:14 +0200
Received: by mail-ej1-f45.google.com with SMTP id y14so18313289ejd.9
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 02:54:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf240DZ677oQl+0ezaCyUsHumpO1u/+I53RS5LVbRgn3TqOf3aRU
        0FqePcxz0kJDiq4/ld5HBNWHnCYXtA1EhPNu0Co=
X-Google-Smtp-Source: AMsMyM4YTkg2VyK1YblxdcSWxQ3RphH3xtX+ZKXwaEpXFGHzlDpH68fRoe/mmFUvySFYzwR9AxWOBKjCqR9IdPZxCk8=
X-Received: by 2002:a17:907:7244:b0:78d:cedc:7a9e with SMTP id
 ds4-20020a170907724400b0078dcedc7a9emr3231374ejc.600.1667037254141; Sat, 29
 Oct 2022 02:54:14 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Sat, 29 Oct 2022 11:54:03 +0200
X-Gmail-Original-Message-ID: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
Message-ID: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
Subject: Proposal: Add color_temperature support
To:     linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BQ6VlRXDkOOVLU7J85limTARO/JvQfhRT4xWRaUIs40fBRv8jeT
 //gucO7w1pvkeF/iajUZhGMNdyq1herrryr6UQXhh0zJfnli9azZ/GG6mkZGZEYv38tdvVV
 aKFVAsZztsIhNflRCZiuFVu4+9WYE756ilksFJaVTRB5hOj/5MjdklpYVJ8C2sQxotaBE5x
 E/bAgqRpWgmoiscINAwYg==
UI-OutboundReport: notjunk:1;M01:P0:IahkcIvt44Q=;uwIgiV1KuIEt7Qt6uc3e0j/NrQZ
 M++Ga5G1hvOse8py0b9oQnTfm5SrofGQk1dDGv2yfwc0fgoc7qSLwOVf0E7FRkR/VdV5nLAYU
 PhwU0dl+FvG2qnxyjdopkGkNqPKe2xy7X0twbqY5w0FSMtmMPwVqTPKW04Tt5ZmPUwbbIFpOr
 lBiij+1lRsUNRFNMxRw6X5kvLqlaFlTZYdaTyFRNzP3LF+7Uj6TJ+unnBskYtC9EIaJOPZcTf
 LFqaxrq98NIYIC/mQVo4czNKuZjTED0TXHkWU6VZx17RN2yevV5CKCRrHTMM9PoLweRKfXln4
 I0uioJuklJJh44Fv4+x0rWhoRuEXKxYu7QAbRcgd/kobZF6v9acjyuqY8tlMwp9N+20FvCIl+
 yoYtfygsweBkjiVrY7Z0IWxij/Lz/3VMimffLLayJtvC8F6rXiztz0dpFY28g0RQz8JKtUDlk
 gNmvW9iJpfTkzhJ2NKmc6AA/xiC2gGSJx3OGrY4Hyro+I6qo64QKbq+DUFLUtiPDbbe/EqW9D
 Uk5ZrLEH/uIAspUxImOz5vTeT4ulornrXr24WoaiWc7IvIi9odDmNQRf+5Bn6szmeesw2lzjk
 WNXxTvO/5q9wyXYnF1sU5HPRkLfZiZzdVpqIHoxhpeSU92QOy2H4dT2EqfCMSKPsEBJyEL8C9
 XHNLgIKlFTJejfh+ZnnRFYZw/SciSrh+jnb+A3w05jYUrx0aPxkSJpOEepctGhwRGWCUTr6JH
 5TFkyaTreVTycpv+1AP5URVQgFBt8R9h4vPp1dQIcSmglWWm6S8D4f0GjALOKE8NwWwlLS3h6
 37G7ZzwO8iLKtOwPNriSEASqhHZ27TPPkFhknmGJNX5icAopfBgUboqlP4KDHL4mPIvBfvPS6
 T7bI4sPW32gN6T3DiXP4zz3fMdd6CK0lkqNDeB+XTLl0+R9r60OnPWpWzKFnIHfQsrnq3D2hM
 eDihlqW8yjx+vbJ9v6EFfg/RBJ4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On the device Logitech Litra Glow it is possible to set not only the
brightness but also the color temperature (both via usb as well as via
hardware).
I am currently trying to add support for the device - and expose it
via LED - into the kernel.
So to support all device capabilities I am proposing to extend LEDs by
color temperature:
And initial patch for the headers:

 diff --git a/include/linux/leds.h b/include/linux/leds.h
index ba4861ec7..494eab49b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -72,6 +72,9 @@ struct led_classdev {
unsigned int brightness;
unsigned int max_brightness;
int flags;
+ unsigned int color_temperature;
+ unsigned int min_color_temperature;
+ unsigned int max_color_temperature;
/* Lower 16 bits reflect status */
#define LED_SUSPENDED BIT(0)
@@ -123,6 +126,21 @@ struct led_classdev {
unsigned long *delay_on,
unsigned long *delay_off);
+ /* Set LED color temperature
+ * Must not sleep. Use color_temperature_set_blocking for drivers
+ * that can sleep while setting color temperature.
+ */
+ void (*color_temperature_set)(struct led_classdev *led_cdev,
+ unsigned int color_temperature);
+ /*
+ * Set LED color temperature immediately - it can block the caller for
+ * the time required for accessing a LED device register.
+ */
+ int (*color_temperature_set_blocking)(struct led_classdev *led_cdev,
+ unsigned int color_temperature);
+ /* Get LED color temperature */
+ unsigned int (*color_temperature_get)(struct led_classdev *led_cdev);
+
int (*pattern_set)(struct led_classdev *led_cdev,
struct led_pattern *pattern, u32 len, int repeat);
int (*pattern_clear)(struct led_classdev *led_cdev);
@@ -140,6 +158,7 @@ struct led_classdev {
void (*flash_resume)(struct led_classdev *led_cdev);
struct work_struct set_brightness_work;
+ struct work_struct set_color_temperature_work;
int delayed_set_value;
#ifdef CONFIG_LEDS_TRIGGERS
@@ -160,6 +179,10 @@ struct led_classdev {
int brightness_hw_changed;
struct kernfs_node *brightness_hw_changed_kn;
#endif
+#ifdef CONFIG_LEDS_COLOR_TEMPERATURE_HW_CHANGED
+ int color_temperature_hw_changed;
+ struct kernfs_node *color_temperature_hw_changed_kn;
+#endif
/* Ensures consistent access to the LED Flash Class device */
struct mutex led_access;
@@ -574,6 +597,14 @@ void led_classdev_notify_brightness_hw_changed(
static inline void led_classdev_notify_brightness_hw_changed(
struct led_classdev *led_cdev, enum led_brightness brightness) { }
#endif
+#ifdef CONFIG_LEDS_COLOR_TEMPERATURE_HW_CHANGED
+void led_classdev_notify_color_temperature_hw_changed(
+ struct led_classdev *led_cdev, unsigned int color_temperature);
+#else
+static inline void led_classdev_notify_color_temperature_hw_changed(
+ struct led_classdev *led_cdev, unsigned int color_temperature) { }
+#endif
+
/**
* struct led_pattern - pattern interval settings

What do you think?
Cheers
