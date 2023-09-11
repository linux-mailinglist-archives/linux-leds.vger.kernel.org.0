Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F33A79ADE4
	for <lists+linux-leds@lfdr.de>; Tue, 12 Sep 2023 01:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjIKVrO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Sep 2023 17:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235660AbjIKJSN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Sep 2023 05:18:13 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3885CD7
        for <linux-leds@vger.kernel.org>; Mon, 11 Sep 2023 02:18:07 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d7b91422da8so3656965276.2
        for <linux-leds@vger.kernel.org>; Mon, 11 Sep 2023 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694423887; x=1695028687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW6YKdiguD7VHOKXxQu1gxDdGm/d8SqD6g51/GtMMmg=;
        b=Oaeecpxs5IJ3SpxewW/SElSm4NIO3XZrNiZpdO0bdpocU+sNdUfGbXNCNFTn+hpnZ8
         LnTKQ+mVlRJRlbtC1h6QBA1UQZg0QfQeUbJRITU3v/78uVC/woMrmQdl1uM2Unpho07v
         rkPCqv4bVWnxkCnZiLZRn0yw7gtrAFGNdzWTjKCay4ZjdIiABsUAOOyU0ASGbTKXH2TQ
         2TIpnzLQcE5bQe/7LoK58UJnX9LAm5n5/Fjbafc5Roc4KJzaBTYIFxUwdZ2A/3rbQzHP
         h3ZjWW7UflTs48jSKxn2WluEqkO6dZaQj7O0+BL9Kl8uVQPp0B3MRzBqNXZ4Ph38T664
         Qoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694423887; x=1695028687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW6YKdiguD7VHOKXxQu1gxDdGm/d8SqD6g51/GtMMmg=;
        b=bE/Sb0vwEmbw0iG+cIwrpTDuR1+yJgMikp1i9AIejwvO13JzbMvlkiuAmAtlPHIap4
         7mo5OyrE4dJkVsT2Nrh/l17+ty1FPMLwQzVsNhklJxmb/3u4SmvqW0bAkb4KbUuUlnLy
         hkOcePPi3btBhVxiaBmqi+E/Cqh+Q5g9gBVUNOOXdrLG1OmGf+R3EbmJ1y7+g+UHFM3s
         7f9WeLzqXc6CD+HOj1VmIAvP7dMMRRjSEo+BFw//q+PGvDHGZcPsmo8pWf6bQua4nTxF
         bg6bHK/7B80SWNy0rKH57zKhVUM82Oll/TZD5zTy7R9WuWJi2t8LQqJ0GlMdR4vq4IE0
         oaTQ==
X-Gm-Message-State: AOJu0YyQ0Oqdl9vvCOjvFhjouSK5vrMMnMDU/YydjrPE+I+aAIyVEfzj
        hkkL0tK5kg1niZom39Je3axEqVmjpaB30JuDTu+3sh4q6jvCtyy9aJc=
X-Google-Smtp-Source: AGHT+IGOdtTO3nq2CqOS8Fe/BVRV113m66vWiq1vxCAykGrR7V7ezGwZ0RvYBUzLau7Cmu+4Z78LgVVp6+SUT6E2A0k=
X-Received: by 2002:a25:29c2:0:b0:d44:351c:8ac2 with SMTP id
 p185-20020a2529c2000000b00d44351c8ac2mr8693867ybp.35.1694423887130; Mon, 11
 Sep 2023 02:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230314210059.419159-1-linus.walleij@linaro.org> <1d11e190-df52-4941-946e-209238dd3e99@cesnet.cz>
In-Reply-To: <1d11e190-df52-4941-946e-209238dd3e99@cesnet.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 11:17:55 +0200
Message-ID: <CACRpkdZAvE5ZwVN=G57t_+aMMZ25OBKTgsf9=rRnk3-LnNEqUg@mail.gmail.com>
Subject: Re: [PATCH v2] leds: Mark GPIO LED trigger broken
To:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Felipe Balbi <balbi@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Aug 24, 2023 at 8:32=E2=80=AFPM Jan Kundr=C3=A1t <jan.kundrat@cesne=
t.cz> wrote:

> > I want to know that this trigger has active users that
> > cannot live without it if we are to continue to support it.
>
> We're using this feature. Our use case is a LED at the front panel which
> shows whether a signal is present at an input LC optical connector (DWDM
> network stuff). Here's how we're setting it up:
>
> https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/6570b5=
71bbf3f53cf24ef2be3079bc282c445b9e/package/czechlight-clearfog-leds/init-le=
ds-edfa.sh

Interesting!

> I understand that the GPIO numeric namespace is racy, but it's never been=
 a
> problem for us in the past 5 years since this script runs much later duri=
ng
> boot than any driver probing.

Hm OK that does make sequential sense in a way.

> > Option if this is really needed: I can develop a new trigger
> > that can associate GPIOs with LEDs as triggers using device
> > tree, which should also remove the use of userspace custom
> > scripts to achieve this and be much more trustworthy, if
> > someone with the Nokia n810 or a device with a similar need
> > is willing to test it.
>
> I'll be happy to test a patch like that.

OK let's just do it. I'll cook something up.

> However, the GPIO in question on our board is connected to a MCP23S18, an=
d
> we have a pair of these. When used in this configuration (two chips at th=
e
> same SPI CS, differing by a chip-specific "HW address" on a HW level),
> there are some impedance mismatches because it's essentially two
> independent pinctrl instances on the same SPI address. This causes
> problems, e.g. the debugfs pinctrl instance won't be created for the seco=
nd
> chip because of a naming conflict. We also carry this out-of-tree patch t=
o
> make the GPIO labels work when set from DTS:
>
> https://patchwork.ozlabs.org/project/linux-gpio/patch/517dcdda21ea0b0df88=
4bc6adcba1dadb78b66b1.1551966077.git.jan.kundrat@cesnet.cz/
>
> (Feedback on how to solve that problem is welcome, btw.)

Instead of using the of_* prefixed device tree traversal
functions, use the fwnode API because we have Intel ACPI
users of this driver, so we need to use the right abstraction.
Just use the similar functions from include/linux/property.h
and grep around for some example that does this already.

Use the bits in spi-present-mask =3D <0x05>; to iterate perhaps?
Like use for_each_set_bit() from <linux/bitmap.h> and
then we should in theory make the YAML description warn
if that bitmask and the nodes don't match up (yeah...)
since the kernel is not a device tree (or other HW description)
validator.

Then I think you should just split up that patch in one DT binding patch
and one patch for the driver and send it out in a series
"support line names on MCP23S18" or somthing, the MCP
expander is really popular so this is highly desired.

I hope the DT people don't randomly ask you to rewrite the
bindings in YAML. It could happen that they do.

> Since I am not that much familiar with pinctrl/gpio stuff in kernel, I
> wanted to bring this up to make sure that your future trigger works even =
on
> a setup like ours. Here's how it's used via DTS in case it's relevant:
>
> https://gerrit.cesnet.cz/plugins/gitiles/CzechLight/br2-external/+/6570b5=
71bbf3f53cf24ef2be3079bc282c445b9e/board/czechlight/clearfog/sdn-roadm-clea=
rfog.dtsi#151

Looks reasonable to me.

Yours,
Linus Walleij
