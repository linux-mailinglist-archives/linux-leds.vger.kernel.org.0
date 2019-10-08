Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE91ECFD01
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 17:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfJHPAz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 11:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbfJHPAz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 8 Oct 2019 11:00:55 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0A4421721;
        Tue,  8 Oct 2019 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570546854;
        bh=2ILkLKJMhVewO7YXPjwi7ITxE09NkLitzKFS8RD6cF4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tgsldvaDL9BYjWvesGpBQdKUHkXWUfUNX+B0iMBaUqel0roQOkSEgNAZhwOqEiPSa
         E8rOkfJShI3VACodadJjlGAY8fTsEoUcmpYyc7WynBzEu5Z/9M9ttZxu9M4zD1+IjN
         5LL5pYehh5+K356nhgf1xEvSRLHAdpRoPkkgvwEw=
Received: by mail-qt1-f174.google.com with SMTP id w14so25707137qto.9;
        Tue, 08 Oct 2019 08:00:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUJM+nfZPI35b1DEVRMHN8b95U9yi9LbqWkfwLZrBiCy6xN8VQ4
        UjZ6Mu5KEaQG96xxIhkT0OIb1VF499eo6att4A==
X-Google-Smtp-Source: APXvYqxP6OYtmivflGW5PuW6N5u1AFSfWfw65nZu7DiCXNvZAX3yzN9B4FocPVaxRPLAuQbbqjyQg6ezZktfviQ4t/8=
X-Received: by 2002:a0c:9792:: with SMTP id l18mr32776173qvd.79.1570546852893;
 Tue, 08 Oct 2019 08:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com> <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com> <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
In-Reply-To: <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 8 Oct 2019 10:00:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
Message-ID: <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
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

On Tue, Oct 8, 2019 at 8:30 AM Jean-Jacques Hiblot <jjhiblot@ti.com> wrote:
>
> Rob,
>
> On 08/10/2019 14:51, Jean-Jacques Hiblot wrote:
> > Hi Rob,
> >
> > On 07/10/2019 18:15, Rob Herring wrote:
> >> Please send DT bindings to DT list or it's never in my queue. IOW,
> >> send patches to the lists that get_maintainers.pl tells you to.
> >>
> >> On Mon, Oct 7, 2019 at 7:45 AM Jean-Jacques Hiblot <jjhiblot@ti.com>
> >> wrote:
> >>> Add DT binding for led-backlight.
> >>>
> >>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> >>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>> ---
> >>>   .../bindings/leds/backlight/led-backlight.txt | 28
> >>> +++++++++++++++++++
> >>>   1 file changed, 28 insertions(+)
> >>>   create mode 100644
> >>> Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >> Please make this a DT schema.
> >
> > OK.
> >
> > BTW I used "make dt_binding_check" but had to fix a couple of YAMLs
> > file to get it to work. Do you have a kernel tree with already all the
> > YAML files in good shape ? Or do you want me to post the changes to
> > devicetree@vger.kernel.org ?
> >
> >
> >>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >>> b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >>> new file mode 100644
> >>> index 000000000000..4c7dfbe7f67a
> >>> --- /dev/null
> >>> +++
> >>> b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >>> @@ -0,0 +1,28 @@
> >>> +led-backlight bindings
> >>> +
> >>> +This binding is used to describe a basic backlight device made of
> >>> LEDs.
> >>> +It can also be used to describe a backlight device controlled by
> >>> the output of
> >>> +a LED driver.
> >>> +
> >>> +Required properties:
> >>> +  - compatible: "led-backlight"
> >>> +  - leds: a list of LEDs
> >> 'leds' is already used as a node name and mixing is not ideal.
> >>
> >> We already have 'flash-leds' in use and with the same definition, so
> >> lets continue that and use 'backlight-leds'.
> > OK
>
> I am taking that back. I have added of_get_led() and devm_of_get_led()
> to the LED core to make it easier to get a LED from the DT. I modeled
> the interface like it is done for PWM, PHYs or clocks. The property
> containing list/array of phandle  is always named the same. To get one
> particular PWM/PHY/clock, a identifier (name or integer) must be provided.

It can be done as we do support that with '-gpios', but yes, it is a
bit more painful to deal with.

> So unless there is a strong incentive to do otherwise I's rather keep
> this name here.

In that case, this needs to be documented as a common LED binding, not
something hidden away in this binding.

Rob
