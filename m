Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B656F69E8
	for <lists+linux-leds@lfdr.de>; Thu,  4 May 2023 13:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjEDL32 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 May 2023 07:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjEDL31 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2023 07:29:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABF03C0F
        for <linux-leds@vger.kernel.org>; Thu,  4 May 2023 04:29:26 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-95369921f8eso57249366b.0
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2023 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683199765; x=1685791765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vqsYo7MIRkrP86lHqA4Lf+vqRfn5d5MdwlJ5hVvvQY=;
        b=J/SZXO1NW73FK0QC20Nf994YGFWWm0TCnyN0sllNKUzZztBeqmJR3Uu0WEkAxtzRXr
         95yJKUDGPaly/JCZyjIxl3RIDnH/IapfwvpBAQpYbYGy/WUdsY3+qkMN+AUL2RDwA4J8
         qcCHrfKfsTvEQPU+YZDiX2byrT+MI+o8tUVMb/fKqqaOjofTXlJO0/X71d8w2u+nQucD
         rI6wc729Lwjs7k4VYgT5zy95wFXFbgVtqzA9InATLgIkKaImZiSzFVlMOVGaA+jAIwT7
         1Uqtnyf0/GsgGmDNI7KFVQhXfX+LdaeRgO5jw8gip05Y+FUXSihUulOajiM8NEIm0HjX
         N+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199765; x=1685791765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vqsYo7MIRkrP86lHqA4Lf+vqRfn5d5MdwlJ5hVvvQY=;
        b=MNuqiutAw0Trj3gVJuKvSBqTtKWKL539WHBnlUdI+9HNtvOGr+3BdGqsviFkjXyb0O
         ExFFlhvm5jAp87MMJ3r0coQs9+MXLtM+cg+one4+ny/fYfJ4puXc8U5e0gDczRNEVZtD
         5fxK1W/mL+JI4VHIYFrtgwfXqpN0+J8siTX/vkxtevF4W2+cJ7qoWjUK3x7LamiRCg0G
         yyBABL/uRpvl6kxJlw+2QQNMNLc93WuD9dG1uqRRZ6cw1oFedQYufcVZ6T03LdGBFW2o
         c87ZLGRqz2V+lUADz0WVyZbKZHTvZpnpEmrmpGBDbTChbTTrm9RDfCO2Aa/bfILL/jto
         OWEw==
X-Gm-Message-State: AC+VfDxM2UmIJLNFth63VhERbWcf/f+zPl9P0QHI2pKGjUCofJJuaZoh
        +jmEwmvP7mK9EIHKoIKKoq3Szc9YB30+YPy+ZvRPKPISU1R+MbRM
X-Google-Smtp-Source: ACHHUZ7huNVNqhWFVQaXhAbn11YYKuMeMQqU/c4ip5KioqnaVEDbUIL5IY6jyRH2L9WRz8HBjMCMdLqRUsEjR8fLQXs=
X-Received: by 2002:a17:907:9281:b0:94f:61b2:c990 with SMTP id
 bw1-20020a170907928100b0094f61b2c990mr5675394ejc.25.1683199764710; Thu, 04
 May 2023 04:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230430195952.862527-1-hdegoede@redhat.com> <ZFNnVPXFLNVDwYSc@jeknote.loshitsa1.net>
 <e630f209-3fc3-7fb4-726a-f65125fa6b3d@redhat.com>
In-Reply-To: <e630f209-3fc3-7fb4-726a-f65125fa6b3d@redhat.com>
From:   Yauhen Kharuzhy <jekhor@gmail.com>
Date:   Thu, 4 May 2023 14:29:13 +0300
Message-ID: <CAKWEGV5s_AvM=y82H3D5C0qP0_-krH9S1b-ihWRag9n=G4QGBA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

=D1=87=D1=82, 4 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 11:56, Hans =
de Goede <hdegoede@redhat.com>:
>
> Hi Yauhen,
>
> On 5/4/23 10:05, Yauhen Kharuzhy wrote:
> > On Sun, Apr 30, 2023 at 09:59:47PM +0200, Hans de Goede wrote:
> >> Hi All,
> >>
> >> Here is v3 of the patch series to add support for the LED controller
> >> on Intel Cherry Trail Whiskey Cove PMICs.
> >>
> >> Changes in v3:
> >> - Some comment tweaks and s/LED_OFF/0/ and s/LED_ON/1/
> >> - Refuse to load on the Yoga Tab 3 as it turns out the LED1 driver out=
put
> >>   is connected to a haptic feedback motor there (and LED2 is unused)
> >>
> >> Changes in v2 (of my version of this):
> >> - Address Pavel's small remarks on patch 1/5,
> >>   see patch 1/5's commit message for details
> >> - Improve/extend pattern docs in Documentation/leds/leds-cht-wcove.rst
> >>
> >> This is based on the original patch for this from Yauhen Kharuzhy,
> >> with additional work on top by me.
> >>
> >> This addresses the review remarks on the v2 posting from Yauhen:
> >> - Since the PMIC is connected to the battery any changes we make to
> >>   the LED settings are permanent, even surviving reboot / poweroff.
> >>   Save LED1 register settings on probe() and if auto-/hw-control was
> >>   enabled on probe() restore the settings on remove() and shutdown().
> >> - Add support for the pattern trigger to select breathing mode
> >>
> >> This makes the charging LED on devices with these PMICs properly
> >> reflect the charging status (this relies on sw control on most
> >> devices) and this also allows control of the LED behind the pen
> >> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
> >> 1 models.
> >>
> >> Regards,
> >>
> >> Hans
> >
> > Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>
> >
> > Works at my Lenovo Yoga Book YB1-X91L.
>
> Thank you!
>
> I assume you have tested with my LED class/core series which avoids
> the oops/WARN() you were seeing before:
>
> https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@redha=
t.com/
>
> If yes, can you reply with your Tested-by: Yauhen Kharuzhy <jekhor@gmail.=
com>
> to that series too please ?

Yes, sure, I will reply there too.

> Regards,
>
> Hans
>
>
> p.s.
>
> I think on an earlier version of this series you mentioned that you
> are still carrying some patches locally for the yogabook ?
>
> If I remember that correctly can you share those patches with me/us ?

Of course, all my patches are in my github:
https://github.com/jekhor/yogabook-linux-kernel/commits/master

>
> Then if I can find some time I can see if I can submit them upstream
> (or find another way to achieve their goal and post that upstream).
>
> Also while on the subject of the yogabook have you looked into
> getting sound to work ?

Sound works for me with my kernel, speakers and DMIC. UCM configs are
needed to get it working:
https://github.com/jekhor/alsa-ucm-conf-yogabook/tree/main


--=20
Yauhen Kharuzhy
