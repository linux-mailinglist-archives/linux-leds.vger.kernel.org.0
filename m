Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5B961250F
	for <lists+linux-leds@lfdr.de>; Sat, 29 Oct 2022 21:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJ2TSb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 Oct 2022 15:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJ2TSb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 Oct 2022 15:18:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8E85A8CE
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1667071107; bh=ghfVNpIoDRXOGPpcBaWZ5UxSddO2IwfhlmrkEx6QHYY=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=aDGT8ysOpBumU3tCo3RTu4q4V+wa6zTIL01kShQ/kqH41rWIDggDkBzFF0xImK/4e
         10tYDBxE1Xc6zpLVd7aCtj0k1E3pf3VL7ZWMZSJH9NYLaffSNFFXz04g4jdJTLzmQ5
         IenJ4pH17qim5qQZQP25l3Q8mGe/AMWClarn4NGxns5gRKaEaT0YIcsE0Cpwu2w7al
         7jn0uS/JGMhfCV+BrJp+ZHYiAfBxsZSwydYmMF2gdo/sa3GPt5iGp1D2vTfKSoBVAz
         YmxolQDU76AwD4bfCk/sHunWF7WujPNPWobMuvz7L51cUvX70ApTpTS9Nwd2aLYvwq
         OnyGPpCUETJoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f48.google.com ([209.85.218.48]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHXFx-1osvxq3ISv-00DWMh for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022
 21:18:27 +0200
Received: by mail-ej1-f48.google.com with SMTP id t25so20366824ejb.8
        for <linux-leds@vger.kernel.org>; Sat, 29 Oct 2022 12:18:27 -0700 (PDT)
X-Gm-Message-State: ACrzQf2cgIcyytRvHhOFDSt71RucFM0K5A78kzXh1kOrQxeXxW76N8PQ
        PN3AUtewHHY1fVNyn4FqHZUpemYKIOeNdW2cuuU=
X-Google-Smtp-Source: AMsMyM4V+iFo6hl85FXA+KOS/yGnz3V6mFPbaLmA/cqS9AM2qhiDhu3m4tPBXaj94hsZexDXkd5+4oB8bMQx3Op3I2Q=
X-Received: by 2002:a17:907:2cd1:b0:7ad:90dc:e7f4 with SMTP id
 hg17-20020a1709072cd100b007ad90dce7f4mr5105301ejc.489.1667071107447; Sat, 29
 Oct 2022 12:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABfF9mNvf93FAxX7MWVe5KxhrBTV4_ZBzhJPs-JT+tXdyaja1g@mail.gmail.com>
 <20221029165218.GA3337@duo.ucw.cz> <CABfF9mNcem--3Yf3wZ8Pgmvq3A4AgAj1tFN9bsQOqfJLtnqhkQ@mail.gmail.com>
 <20221029183211.GA14351@duo.ucw.cz>
In-Reply-To: <20221029183211.GA14351@duo.ucw.cz>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Sat, 29 Oct 2022 21:18:16 +0200
X-Gmail-Original-Message-ID: <CABfF9mOBB10+LDX9xTdJsbBC-hRs3yPXQyt91QszRhwKNQCjpw@mail.gmail.com>
Message-ID: <CABfF9mOBB10+LDX9xTdJsbBC-hRs3yPXQyt91QszRhwKNQCjpw@mail.gmail.com>
Subject: Re: Proposal: Add color_temperature support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rGt7Tnxy466EMKw7L/NNjZ0sdoJDRTScgtDyQ6jFckjiCR0ooy4
 vJRG5d+8KsYUdRdbfw0NudLCLKMrIWedah+BZQAipnw2u0rdLCHmqAgP0L2CmjvqF7PbTeO
 zmLkR5qwMJ58jUsXJPw/RAcSh7Ye+93aPxg8CiqzDV0sQ/MgvN+Ip99DFrUXKLCJbeFOpxX
 o3VLiyQxR14v9zYXLfW7w==
UI-OutboundReport: notjunk:1;M01:P0:mXLPdPknvB8=;C7HKlIRKmvnPS0WnY3nmjKtBDa7
 27U+j0PYoSKIhaPQk15+YIM591h/hllFfiIv+mSPtOp5Rraqo5wFO8jGyih8czeHbcCSvisze
 59HOBi6GuRaBMRYPfpy/3PFv/cgq5c3mM80LpsCPvLLCeDAEHmCMuDiFz6LOQVvMj8F/I//22
 jsjZ7Rcw0/1/FOfm8JnP+Voaw+ezDWynWC2M3RV7m6BBmzPOKcC96Owfcnp7qgmv9VqQ5B0mQ
 Kr8pkfiTtLuvTZmbYnXg0RYOsTk6yyo2EIlfdxxxX0ubIw3Dgd7EF7CuRgk7QSrMlyMUyfwej
 p9v8rRr1xdseAo7riL45/ZIaeoOn5J/I6h6j3hCcexJqMz+qzieBYI80W8zO4V1CHg19MGesG
 mhzl3MB+m6CG6eLlF9CCA8gK+Qv/lgEzt8UHgkYbRsMeuc6uKw+rToUCHkHgg0r2rkYQtrPLU
 C0l4XGXGS1TyiC0m8yT/p+gmjQbCOKmbt3W0Z3D0VLWl8qqu5VrQ/PWF2IP2t4d0sCAiChV+a
 Ef6S4x64et2dJPPxElcypTIdXXTj0OKiGQtiK/ITcmAvGQ5v5k59E7AfN6zoIijH5210BDKKw
 TtDALJbS/e/S+6OMKwzNMslbzxWbqelBZ3ibAN7kJvRYX9z+xEf/Y67xDtn8OTEfu4HnPnDVb
 figQQQj5Klp/5rIWzf3C3mhEeP4t8JCJjAFpjp/C0ADfhVz02dOqEWp54zyY8V6HR0RwY6Lbd
 qwPVbfyZ/H/vI85qPr+WpYxBURoDSYPP3vmv9NELtp8FQuuExzFnWWXxYAUhUlDeIByTD/v4b
 tmgPQlc2ZAOLkIyghNjLbpEL1KzJHSFUVqtVerIwT6p1USB4pmEEkkMd/8yjv8bueUjoVH1H4
 O32iZP7Q5aEASBG5ZNTFxStcjBUlrkURQbLWKXm7EpCUK4u0CLxDC4GaAlIPBJzKM4S7MTRi+
 QlNEyS4nd2SpR6lpO3aI+kVwnrM=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 29 Oct 2022 at 20:32, Pavel Machek <pavel@ucw.cz> wrote:
> Hmm, and there are likely to be more lights like this, right?
Indeed

> I guess it makes sense to support this in LED subsystem. I believe it
> should be only supported for "white" LEDs. I believe first step is
> defining an userspace API in Documentation.

RFC:
diff --git a/Documentation/leds/leds-class.rst
b/Documentation/leds/leds-class.rst
index cd155ead8..92127336e 100644
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
