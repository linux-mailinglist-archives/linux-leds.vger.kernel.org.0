Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E399936A7A1
	for <lists+linux-leds@lfdr.de>; Sun, 25 Apr 2021 15:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhDYOAK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 10:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhDYOAJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 10:00:09 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008FCC061574
        for <linux-leds@vger.kernel.org>; Sun, 25 Apr 2021 06:59:27 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p6-20020a05600c3586b029014131bbe5c7so445622wmq.3
        for <linux-leds@vger.kernel.org>; Sun, 25 Apr 2021 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pGpF8czBf6xIAa6634iFqyIMzxF6giVe20xV3PGT4hk=;
        b=o/ABScUct8uvKrPex0o8405XMdnAloj0zkOoGm9/wq89m0QnzGH6v/iqXDmAAKe3ii
         DN+LpBJspcG9c8OzBIWXB7nu8TchVrPIJxyqr4Yena0c/ultO03dTHH3sZO4OdybHFv0
         E7GESewe11vFNlmcKIOL/CSsmdApby6FME/ckQxhyVTJ97VfX0ti6ca716iJHVqmSNew
         9iFSE1x91mPd9S4cRnctQAeb5w+zKbu58pShdOP+ldMhqR0ji28LRercCAohCU6GifLg
         +IvOazZWoRtsLejvbZpy1EvJWS+1Lh0HvOhdoQg0IKauZJUco51g3cB+ANqxmgIi/dwL
         OLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pGpF8czBf6xIAa6634iFqyIMzxF6giVe20xV3PGT4hk=;
        b=rja77cRMSvdhyXlt9/cFSGi9uSpsaOCuVMnf8TMX2kv/JBvHPv2wCE+TlVtI4OS/G4
         PmmwteFdtBcRY7PdjQSmg32WHn26CmHKuj0tzkgVtdmE+TyoYw8iLJ2GAHHbJ5t9h2J6
         Ox941CQE1vgO4AQaLdM8e774YeMaF6wqAABlFZXqRfG10wrxjAkg0pBP2gxtjo1agfrb
         38tp2aRUMU1UAVFT30EltWN5zQ+rGhWiaQjGnvvtew48dGhxwIKTQZyczt08nQ3ULuNM
         OZrcL+2q3iP0YX/AKilr4m4qHa2lVUSByWhLXWfTxSum8gocxKGhjyePW4Utoqg7z3ia
         hObA==
X-Gm-Message-State: AOAM530VTcv36Idiy+rzNwF274dMRVvoqlXkxX9vAuzQh+kQA7rKgwQ5
        ypTj+NMERKQEucMO0uIb/9W9NaJ3+p0=
X-Google-Smtp-Source: ABdhPJwkagVjNfL3q4qujg+e3APZnx6vVSZT9J02Tp4Y5wL4iW1He4FxASc7JnOsbOjlYAmfU/da2Q==
X-Received: by 2002:a05:600c:24c:: with SMTP id 12mr14884777wmj.185.1619359166780;
        Sun, 25 Apr 2021 06:59:26 -0700 (PDT)
Received: from tp440p.steeds.sam ([41.84.225.78])
        by smtp.gmail.com with ESMTPSA id z16sm16010667wrq.21.2021.04.25.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 06:59:25 -0700 (PDT)
Date:   Sun, 25 Apr 2021 15:59:21 +0200
From:   Sicelo <absicsz@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: Re: lp5523/lp5xx-common : Keyboard and RGB LEDs Not Working on Nokia
 N900
Message-ID: <YIV1uaHQwjq0CoFy@tp440p.steeds.sam>
References: <YHXOotfNMEdG9oXQ@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHXOotfNMEdG9oXQ@tp440p.steeds.sam>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi

On Tue, Apr 13, 2021 at 07:02:26PM +0200, Sicelo wrote:
> Hi
> 
> For some time now, the keyboard LEDs on Nokia N900 have not been
> working. In dmesg is the error:
>   
>     lp5523x probe of 2-0032 failed with error -22
> 
> and consequently they do not get populated under /sys/class/leds.
> 
> I have finally had time to look into this, and found that the N900 dts
> falls short of the current lp55xx binding specs. I have updated it and
> will be submitting a separate patch. However, this was not enough to

I have since realized that I should have included the adjusted dts in
the initial email. Please find it attached in this follow-up email and
sincere apologies for this ommission.

> make them work, and a new error appeared:
> 
>     [11363.247375] lp5523x 2-0032: GPIO lookup for consumer enable
>     [11363.254394] lp5523x 2-0032: using device tree for GPIO lookup
>     [11363.254455] of_get_named_gpiod_flags: can't parse 'enable-gpios' property of node '/ocp@68000000/i2c@48072000/lp5523@32[0]'
>     [11363.254547] of_get_named_gpiod_flags: parsed 'enable-gpio' property of node '/ocp@68000000/i2c@48072000/lp5523@32[0]' - status (0)
>     [11363.254638] gpio gpiochip1: Persistence not supported for GPIO 9
>     [11363.254669] gpio-41 (enable): no flags found for enable
>     [11363.295959] lp5523x 2-0032: device detection err: -121
>     [11363.303710] lp5523x: probe of 2-0032 failed with error -121
> 
> 
> This is because the chip does not get enabled even though dts contains:
> 
>     enable-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */
> 
> which is correct for this board.
> 
> 
> I came up with this patch (against 5.12-rc6), which makes it work again.
> 
> 
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 81de1346bf5d..9af84fc335b3 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -694,7 +694,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>         of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
> 
>         pdata->enable_gpiod = devm_gpiod_get_optional(dev, "enable",
> -                                                     GPIOD_ASIS);
> +                                                     GPIOD_OUT_HIGH);
>         if (IS_ERR(pdata->enable_gpiod))
>                 return ERR_CAST(pdata->enable_gpiod);
> 
> 
> However, I am not sure if this is a proper way to fix the issue, or if
> it is a dirty hack. It looks like all the chips handled by this driver
> (lp5521, lp5523, lp5562, and lp8501) get enabled by pulling their ENable
> pin high, so I suppose it is fine, but would like to get some feedback
> before submitting a cleaned up patch. It is also possible that this
> should be defined via dts elsewhere, although at this point I am not
> sure how.
> 
> Looking forward to your help.

---

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 32335d4ce478..d40c3d2c4914 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -8,6 +8,7 @@

 #include "omap34xx.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>

 /*
  * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
@@ -630,63 +631,92 @@ indicator {
        };

        lp5523: lp5523@32 {
+               #address-cells = <1>;
+               #size-cells = <0>;
                compatible = "national,lp5523";
                reg = <0x32>;
                clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
-               enable-gpio = <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */
+               enable-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */

-               chan0 {
+               led@0 {
+                       reg = <0>;
                        chan-name = "lp5523:kb1";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_WHITE>;
+                       function = LED_FUNCTION_KBD_BACKLIGHT;
                };

-               chan1 {
+               led@1 {
+                       reg = <1>;
                        chan-name = "lp5523:kb2";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_WHITE>;
+                       function = LED_FUNCTION_KBD_BACKLIGHT;
                };

-               chan2 {
+               led@2 {
+                       reg = <2>;
                        chan-name = "lp5523:kb3";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_WHITE>;
+                       function = LED_FUNCTION_KBD_BACKLIGHT;
                };

-               chan3 {
+               led@3 {
+                       reg = <3>;
                        chan-name = "lp5523:kb4";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_WHITE>;
+                       function = LED_FUNCTION_KBD_BACKLIGHT;
                };

-               chan4 {
+               led@4 {
+                       reg = <4>;
                        chan-name = "lp5523:b";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_BLUE>;
+                       function = LED_FUNCTION_STATUS;
                };

-               chan5 {
+               led@5 {
+                       reg = <5>;
                        chan-name = "lp5523:g";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_GREEN>;
+                       function = LED_FUNCTION_STATUS;
                };

-               chan6 {
+               led@6 {
+                       reg = <6>;
                        chan-name = "lp5523:r";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_RED>;
+                       function = LED_FUNCTION_STATUS;
                };

-               chan7 {
+               led@7 {
+                       reg = <7>;
                        chan-name = "lp5523:kb5";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_WHITE>;
+                       function = LED_FUNCTION_KBD_BACKLIGHT;
                };

-               chan8 {
+               led@8 {
+                       reg = <8>;
                        chan-name = "lp5523:kb6";
                        led-cur = /bits/ 8 <50>;
                        max-cur = /bits/ 8 <100>;
+                       color = <LED_COLOR_ID_WHITE>;
+                       function = LED_FUNCTION_KBD_BACKLIGHT;
                };
        };

