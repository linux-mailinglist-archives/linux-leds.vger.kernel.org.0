Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89D21B9FB8
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgD0JVy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 05:21:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgD0JVy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 05:21:54 -0400
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D23A82075E;
        Mon, 27 Apr 2020 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587979313;
        bh=jKyA/Qjkmcdo4y/kF2F0R19weTj2X0wKUsAjpoDrwrA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qvjI3693uqXiyrz1pqnm09s+lMplQHHaPmABgh2Z4nWsmJgEbhO3H/67Qgj4bOGFV
         foiwHBi8Rpl68csholnG9+7Q0X70q3relP8nRyYR44jzf5AndCgj2LMH/b4Qe2pEmU
         Pus41UVX3ahsNGo3RFtIXM5j0qTTHA7TGjGkMzXw=
Received: by mail-lj1-f174.google.com with SMTP id g4so16810859ljl.2;
        Mon, 27 Apr 2020 02:21:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuYwDXmRPnwPBbwyvCZPsxvh+dmnHytO1yBA3myEFmbj/1IdqQsF
        XVMpLtPpXMmtADEP8vt+gn51SDyv3IMn8zbLOEI=
X-Google-Smtp-Source: APiQypLonALPqCCxEkhgKW6hPj0VMnhh8js9Nzmi3hS5n1MUW4IMs8k0s21bp3PJw4RUgY/Fx25darDkQTSoNMmnPCw=
X-Received: by 2002:a2e:910e:: with SMTP id m14mr12450836ljg.141.1587979310912;
 Mon, 27 Apr 2020 02:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200427073132.29997-2-wens@kernel.org> <4044214d-5385-94b6-d985-e1f824a60c5e@gmail.com>
In-Reply-To: <4044214d-5385-94b6-d985-e1f824a60c5e@gmail.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 27 Apr 2020 17:21:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v645WU9mFeB83DvJcbfJ0xJswb3gq0NJLXwkVnPz8kcYNQ@mail.gmail.com>
Message-ID: <CAGb2v645WU9mFeB83DvJcbfJ0xJswb3gq0NJLXwkVnPz8kcYNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: common: Drop enumeration for linux,default-triggers
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        devicetree <devicetree@vger.kernel.org>, dmurphy@ti.com,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        jacek.anaszewski@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 27, 2020 at 4:33 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The bindings currently list a very small subset of valid triggers for
> > LEDs. Since many drivers or subsystems in Linux register custom
> > triggers, the list would become very hard to maintain.
> >
> > Instead, just drop the list and allow free form strings.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  .../devicetree/bindings/leds/common.yaml      | 21 +------------------
> >  1 file changed, 1 insertion(+), 20 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index 4c270fde4567..3b3cdab3fc15 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -79,26 +79,7 @@ properties:
> >      description:
> >        This parameter, if present, is a string defining the trigger assigned to
> >        the LED.
> > -    allOf:
> > -      - $ref: /schemas/types.yaml#definitions/string
> > -    enum:
> > -        # LED will act as a back-light, controlled by the framebuffer system
> > -      - backlight
> > -        # LED will turn on (but for leds-gpio see "default-state" property in
> > -        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> > -      - default-on
> > -        # LED "double" flashes at a load average based rate
> > -      - heartbeat
> > -        # LED indicates disk activity
> > -      - disk-activity
> > -        # LED indicates IDE disk activity (deprecated), in new implementations
> > -        # use "disk-activity"
> > -      - ide-disk
> > -        # LED flashes at a fixed, configurable rate
> > -      - timer
> > -        # LED alters the brightness for the specified duration with one software
> > -        # timer (requires "led-pattern" property)
> > -      - pattern
> > +    $ref: /schemas/types.yaml#definitions/string
>
> This makes it free form, but deletes the documentation of options that
> are standard available for people without custom driver.
> Where should that info go?

As far as I know, there is no canonical list of standard triggers.
In addition, what triggers are available also depend on the kernel
configuration, so there really is no "standard".

Since this is also configurable via sysfs, maybe it should be part
of the sysfs ABI document? Either way I believe this will be up to
the LED subsystem maintainers.

ChenYu

> >
> >    led-pattern:
> >      description: |
> > --
> > 2.26.0
>
