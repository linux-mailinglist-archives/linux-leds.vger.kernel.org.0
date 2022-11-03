Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E316189A5
	for <lists+linux-leds@lfdr.de>; Thu,  3 Nov 2022 21:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKCUhW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Nov 2022 16:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiKCUhV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Nov 2022 16:37:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD94201B6
        for <linux-leds@vger.kernel.org>; Thu,  3 Nov 2022 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1667507834; bh=1LP8ioBEilvsapHqbnxmNv9j4o6mp3WmM+fx8WAKxjY=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=Tyt4P4d5JsNhBI572qZb1MDmZBx2uTSRoDdiB/iLRD6HGDqO4RQT/KVt+5DfJIGIf
         ALamwHardXrtFCOWJ6ZS669bt/OcWOdhnwBpvx9u0I99L6KgOp6kfFM67J8RMFUCx0
         KiUdlZrKmErS+KTQU62KJEppbxmMcM2k1vqOF1tdum09aTPdPCzb8Dj9VMPOB196Nn
         HcroJPR+XVHx5wA93k/NJc1JiEjJh1tjejOf/01rMVsDQP0YEjAQkh/ph660w0SPPu
         qxJ/X5z2NKXD3errEllWgDBZ0ZaAfmia5bvgCzaE2XV6U9XaCmNv9PGR8Jce6zSs/1
         YritKSurxr/kw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f44.google.com ([209.85.218.44]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M26vB-1otAzz2jl3-002WLH for <linux-leds@vger.kernel.org>; Thu, 03 Nov 2022
 21:37:14 +0100
Received: by mail-ej1-f44.google.com with SMTP id 13so8496833ejn.3
        for <linux-leds@vger.kernel.org>; Thu, 03 Nov 2022 13:37:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf3cBjL1BGrS1tBcX0KHxySViW/3Ob4E7kJduzkv8TI1IHylc4mk
        y6dhhPmSQz3hTolOT7NrkmS5awPBB21Vw4Uwd4I=
X-Google-Smtp-Source: AMsMyM4kdkqtgJEBuFZ3RcG/DHrd4h1q9Eg4z1md2ndGsrMtFRCrkA8rwM3YPewKVPOIKnHu0rBVQQ689Dm7KlloGr0=
X-Received: by 2002:a17:907:7244:b0:78d:cedc:7a9e with SMTP id
 ds4-20020a170907724400b0078dcedc7a9emr30908116ejc.600.1667507834332; Thu, 03
 Nov 2022 13:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
 <20221029165218.GA3337@duo.ucw.cz> <CABfF9mNcem--3Yf3wZ8Pgmvq3A4AgAj1tFN9bsQOqfJLtnqhkQ@mail.gmail.com>
 <20221029183211.GA14351@duo.ucw.cz> <CABfF9mOBB10+LDX9xTdJsbBC-hRs3yPXQyt91QszRhwKNQCjpw@mail.gmail.com>
In-Reply-To: <CABfF9mOBB10+LDX9xTdJsbBC-hRs3yPXQyt91QszRhwKNQCjpw@mail.gmail.com>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Thu, 3 Nov 2022 21:37:03 +0100
X-Gmail-Original-Message-ID: <CABfF9mMGnrsSHOYK8oKCmCmc4qJMxsv=wTOuiGFf+kftcuNNTw@mail.gmail.com>
Message-ID: <CABfF9mMGnrsSHOYK8oKCmCmc4qJMxsv=wTOuiGFf+kftcuNNTw@mail.gmail.com>
Subject: Re: Proposal: Add color_temperature support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LFqpeCqy/K4iQIfsJ5g9RTuMAJ7eabNi2VYopVv/Ym+KuETxXPj
 s/q7IDS+uTX8QoDXZ119QGNTlcQ6H2torJVvQbskB1SzoEX02x5Kk31HOK0yGD3uvSrqwFE
 YMjmpmr757yAmz4sLQVapR8EUYlJ0PinIGFBIUM9+VAnsg5D+ONpj55sUcYqZnGHdSbePm3
 aC1bm69RvD4KU5aj4X/WQ==
UI-OutboundReport: notjunk:1;M01:P0:vS7ds2+gkUo=;jgQo/DM7Rs/O5rZ8AS36ivzuvNN
 BbZ72vNuBdIMD/W1krhnxIMsNz+CGkRso9szvc5Jqs8U4iNW8ulKjTtRmsaRSFFdLuovHCTOW
 myQP1KMT4qB8SQEeFm5xhujMYNc9fnVCNpgAhudPyTUXgbVYhpIdrQsS/ccuuBkyV5hbdkD73
 ME96Az7pBNypYAqdSxebNAaxB/TfdCk0JVaF59gr5zXXCuIMcaDN7EqOehKrg67XPCMJRbmHd
 14w99f4CgcluHZIzJbbyBmeoFi/2mfVgvU1vM7Yl5nEYBzNPznXtOecVI42fF9dkAqKYf9yiw
 a7F81UpbSVQ5+2YLFGxlpNX/NRxowaOC6iS3dFYy+pZO6s/WVlEW3iMuRIVrYTzvTqtNrdWpq
 U86vJKYyMEqU/M89aI7bP4kXYxJFAVZnuwBPbYEUFWKM2YAHX4J+lP/LbkqaUOMnd7ExeyuTl
 tiJ1SO3WqCnaze1FtpJIMpEwI5YZ91qrBEYeFuk3mDQjsw+niuJsWf8K7ql7bKOAa/KeP++2M
 IeX0B+HhJsNUhyeSQnK9qm+8umgTFNx9swArF4V3Rd1EYwMmtkZyxSrOcNdyngmPpq++ARkUc
 ISkBL5V2sn09GZDtoRRB/BoO/JyuXV1+OSReyF/9U6FjKvBwede5umKb/bwLaHTsnEpuYa5td
 bGDbvIew9IKqQTypxpqYIbUpSpeCbOlKyyw14CKj9B9/wbCbrHbFd8hcX+ynvsTqLLonCbNVJ
 BkzsNirutVC9xpAr0dqW5tgBer6LfbSd7EK+chCUUJ1rnod/JOF84GWmSi/I7Lj/xVMuik2TL
 8y0p4Q3muastpgh/hgueaDrIBnYNzAYNCK/KCRZjHo33mz1rUbARPo7I2ziW3tJ3frd/fODrp
 ZA8D4QSVRCnH8xH55viKlL35j1sc2vrPCDGwySOHC1KsRZ2iEUi7mZGd1FXaF8EAYxuX+xMNn
 BatnrpgrEAqeSkDFH52LwZnK0ZM=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

CC Benjamin

On Sat, 29 Oct 2022 at 21:18, Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
> On Sat, 29 Oct 2022 at 20:32, Pavel Machek <pavel@ucw.cz> wrote:
> > Hmm, and there are likely to be more lights like this, right?
> Indeed
>
> > I guess it makes sense to support this in LED subsystem. I believe it
> > should be only supported for "white" LEDs. I believe first step is
> > defining an userspace API in Documentation.
>
> RFC:
I refined the RFC a bit more (was missing hw changes before):

diff --git a/Documentation/leds/leds-class.rst
b/Documentation/leds/leds-class.rst
index cd155ead8703..c3645adfe12d 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -3,10 +3,13 @@ LED handling under Linux
========================
In its simplest form, the LED class just allows control of LEDs from
-userspace. LEDs appear in /sys/class/leds/. The maximum brightness of the
-LED is defined in max_brightness file. The brightness file will set
the brightness
+userspace. LEDs appear in ``/sys/class/leds/``. The maximum brightness of the
+LED is defined in ``max_brightness`` file. The ``brightness`` file
will set the brightness
of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
brightness support so will just be turned on for non-zero brightness settings.
+If setting Color Temperature is supported there will be three files:
``color_temp``,
+``lower_color_temp`` and ``upper_color_temp``. The acceptable values
for ``color_temp`` are in the
+range of (lower_color_temp-upper_color_temp).
The class also introduces the optional concept of an LED trigger. A trigger
is a kernel based source of led events. Triggers can either be simple or
@@ -121,16 +124,29 @@ Brightness setting API
LED subsystem core exposes following API for setting brightness:
- - led_set_brightness:
+ - ``led_set_brightness``:
it is guaranteed not to sleep, passing LED_OFF stops
blinking,
- - led_set_brightness_sync:
+ - ``led_set_brightness_sync``:
for use cases when immediate effect is desired -
it can block the caller for the time required for accessing
device registers and can sleep, passing LED_OFF stops hardware
blinking, returns -EBUSY if software blink fallback is enabled.
+Color Temperature setting API
+=============================
+
+LED subsystem core exposes following API for setting Color Temperature:
+
+ - ``led_set_color_temp``:
+ it is guaranteed not to sleep
+
+ - ``led_set_color_temp_sync``:
+ for use cases when immediate effect is desired -
+ it can block the caller for the time required for accessing
+ device registers and can sleep. It returns -EBUSY if
+ software blink fallback is enabled.
LED registration API
====================
@@ -138,14 +154,20 @@ LED registration API
A driver wanting to register a LED classdev for use by other drivers /
userspace needs to allocate and fill a led_classdev struct and then call
`[devm_]led_classdev_register`. If the non devm version is used the driver
-must call led_classdev_unregister from its remove function before
-free-ing the led_classdev struct.
+must call ``led_classdev_unregister`` from its remove function before
+free-ing the ``led_classdev`` struct.
If the driver can detect hardware initiated brightness changes and thus
-wants to have a brightness_hw_changed attribute then the LED_BRIGHT_HW_CHANGED
+wants to have a ``brightness_hw_changed`` attribute then the
``LED_BRIGHT_HW_CHANGED``
+flag must be set in flags before registering. Calling
+``led_classdev_notify_brightness_hw_changed`` on a classdev not registered with
+the ``LED_BRIGHT_HW_CHANGED`` flag is a bug and will trigger a WARN_ON.
+
+If the driver can detect hardware initiated color temperature changes and thus
+wants to have a ``color_temp_hw_changed`` attribute then the
``LED_COLOR_TEMP_HW_CHANGED``
flag must be set in flags before registering. Calling
-led_classdev_notify_brightness_hw_changed on a classdev not registered with
-the LED_BRIGHT_HW_CHANGED flag is a bug and will trigger a WARN_ON.
+``led_classdev_notify_color_temp_hw_changed`` on a classdev not registered with
+the ``LED_COLOR_TEMP_HW_CHANGED`` flag is a bug and will trigger a WARN_ON.
Hardware accelerated blink of LEDs
==================================
