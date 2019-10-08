Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51689CFCD7
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 16:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfJHOxJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 10:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfJHOxJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 8 Oct 2019 10:53:09 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB79F20659;
        Tue,  8 Oct 2019 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570546387;
        bh=43D7mJTidNziffTuZdsS4fBLNRTISxe76SYbSUFqmEA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1m1YJESGHnrJ5kSL4SpMFlTgPgrgMebqBQkd3RuW0i5X+8TPHwI0YSPQ21+vM0+AY
         NhIgNS5NuszhMSn6uufNPKlPvus6kC1GTbwEfflVK5EdbSzCnctLe67flCF4YCcnce
         mUnJQbZCZJrDRMx+BtHHcHjGw3VUYXcRWWAQ2qD8=
Received: by mail-qk1-f176.google.com with SMTP id 201so16994579qkd.13;
        Tue, 08 Oct 2019 07:53:07 -0700 (PDT)
X-Gm-Message-State: APjAAAXmnZG2f+y5lNmmk9Q+urHikGAqoZt7ea8C8YRogA1EFitvsNlz
        811gnomMJxIHFBw05sKQWWXuKSCH+UP/zC9VoA==
X-Google-Smtp-Source: APXvYqwcuwLAT/clJ+O/meI0n2cyKwQwDkoVsvf05zAfDMSzMau5X1IcXnFIoiry9nOSZIPabNLne3OOyzFtDOAFCJA=
X-Received: by 2002:a37:be87:: with SMTP id o129mr30275734qkf.254.1570546386900;
 Tue, 08 Oct 2019 07:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com> <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com> <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
In-Reply-To: <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 8 Oct 2019 09:52:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLzi3y8hBvx9Qpx7QKPGAzq_LyuEDdi35f9k8nEfj5wCw@mail.gmail.com>
Message-ID: <CAL_JsqLzi3y8hBvx9Qpx7QKPGAzq_LyuEDdi35f9k8nEfj5wCw@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 8, 2019 at 7:51 AM Jean-Jacques Hiblot <jjhiblot@ti.com> wrote:
>
> Hi Rob,
>
> On 07/10/2019 18:15, Rob Herring wrote:
> > Please send DT bindings to DT list or it's never in my queue. IOW,
> > send patches to the lists that get_maintainers.pl tells you to.
> >
> > On Mon, Oct 7, 2019 at 7:45 AM Jean-Jacques Hiblot <jjhiblot@ti.com> wrote:
> >> Add DT binding for led-backlight.
> >>
> >> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> >> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >> ---
> >>   .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
> >>   1 file changed, 28 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> > Please make this a DT schema.
>
> OK.
>
> BTW I used "make dt_binding_check" but had to fix a couple of YAMLs file
> to get it to work. Do you have a kernel tree with already all the YAML
> files in good shape ? Or do you want me to post the changes to
> devicetree@vger.kernel.org ?

linux-next is fixed now.

> >> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >> new file mode 100644
> >> index 000000000000..4c7dfbe7f67a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >> @@ -0,0 +1,28 @@
> >> +led-backlight bindings
> >> +
> >> +This binding is used to describe a basic backlight device made of LEDs.
> >> +It can also be used to describe a backlight device controlled by the output of
> >> +a LED driver.
> >> +
> >> +Required properties:
> >> +  - compatible: "led-backlight"
> >> +  - leds: a list of LEDs
> > 'leds' is already used as a node name and mixing is not ideal.
> >
> > We already have 'flash-leds' in use and with the same definition, so
> > lets continue that and use 'backlight-leds'.
> OK
> >
> >> +
> >> +Optional properties:
> >> +  - brightness-levels: Array of distinct brightness levels. The levels must be
> >> +                       in the range accepted by the underlying LED devices.
> >> +                       This is used to translate a backlight brightness level
> >> +                       into a LED brightness level. If it is not provided, the
> >> +                       identity mapping is used.
> >> +
> >> +  - default-brightness-level: The default brightness level.
> > You can just assume these 2 get a common schema at some point. So just
> > need to define any additional constraints if possible.
>
> Maybe we should keep them until such a common schema is written ?

I'm not saying to remove them, but you can just have a description if
there are no other constraints.

Rob
