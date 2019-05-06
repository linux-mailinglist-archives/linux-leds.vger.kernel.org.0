Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A5415338
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 19:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfEFR7Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 13:59:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:49842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbfEFR7Z (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 May 2019 13:59:25 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58D9320C01;
        Mon,  6 May 2019 17:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557165563;
        bh=M3A35/Iynxv2BZiGtto3GB3IdL+AuYWt31SikluuKo8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aNJGwQBwZoFY+vxMblff7iOtjy2jozqtaL4JsO3+tIm01GEkcmJsSDyIR+rn8HNs1
         3CTXFciAjNa9Ck2R9K4mLcu/hQzWGFvtmSYrUNs+y1lZ1aG6UX/8DAQ/NDOGUN8i+f
         WP9V8kk6xmPqNNYxHFX4SmZ3s+x1IvWfAid6I++o=
Received: by mail-qk1-f175.google.com with SMTP id k189so1215848qkc.0;
        Mon, 06 May 2019 10:59:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWdukoVtEpslYHAuSyjgDnHQjKJ8g9JAEGbDC55w75iFtfJypVj
        +ZHurNiOBDvTQ3j1VaG1R37NnZ1UftWyRV/9ng==
X-Google-Smtp-Source: APXvYqwP73+D7JbR03CG7GsStZCm936MHP7fY/mRy3H1sJgDvUg3rcfBgJiLwjZ7+t2264vRkVati9lQdcwcrQdnGsI=
X-Received: by 2002:a37:4b92:: with SMTP id y140mr21286108qka.79.1557165562544;
 Mon, 06 May 2019 10:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190505200022.32209-1-oss@c-mauderer.de> <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
In-Reply-To: <4e91d5e7-a583-58d5-9c14-ad86029ed9e7@c-mauderer.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 May 2019 12:59:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGhTkdMj2Vx1U6UshGFb=iv4Rwvk5Hu-Y6vErNTw6+Ug@mail.gmail.com>
Message-ID: <CAL_JsqKGhTkdMj2Vx1U6UshGFb=iv4Rwvk5Hu-Y6vErNTw6+Ug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Christian Mauderer <oss@c-mauderer.de>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 6, 2019 at 12:03 PM Christian Mauderer <oss@c-mauderer.de> wrote:
>
> On 06/05/2019 18:21, Rob Herring wrote:
> > On Sun, May 5, 2019 at 3:00 PM <oss@c-mauderer.de> wrote:
> >>
> >> From: Christian Mauderer <oss@c-mauderer.de>
> >>
> >> This patch adds the binding documentation for a simple SPI based LED
> >> controller which use only one byte for setting the brightness.
> >>
> >> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> >> ---
> >>
> >> Changes compared to v2:
> >> - None
> >>
> >> Changes compared to v1:
> >> - rename ubnt-spi to leds-spi-byte
> >> - rename "ubnt-spi,off_bright" and "ubnt-spi,max_bright" to
> >>   "leds-spi-byte,off-value" and "leds-spi-byte,max-value" and mark them required
> >> - rename led-controller node to "led-controller"
> >> - extend description
> >> - remove SPI controller
> >> - use "white:status" for the example label
> >>
> >>
> >>  .../bindings/leds/leds-spi-byte.txt           | 47 +++++++++++++++++++
> >>  1 file changed, 47 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> >> new file mode 100644
> >> index 000000000000..1dd6ab03a56d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> >> @@ -0,0 +1,47 @@
> >> +* Single Byte SPI LED Device Driver.
> >> +
> >> +The driver can be used for controllers with a very simple SPI protocol: Only one
> >> +byte will be sent. The value of the byte can be any value between the off-value
> >> +and max-value defined in the properties.
> >> +
> >> +One example where the driver can be used is the controller in Ubiquiti airCube
> >> +ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
> >> +8F26E611LA) that has been programmed to control the single LED of the device.
> >
> > What about power control of the uC?
>
> You mean if the uC receives a reset or power cycle independent of the
> main controller? I don't think that this can happen on that board. But I
> don't have any schematics to prove that.

I was really only pointing out potential issues around "generic"
bindings. The protocol interface is not the only thing.

> >> +The controller supports four modes depending on the highest two bits in a byte:
> >> +One setting for brightness, the other three provide different blink patterns.
> >
> > This part seems in no way generic.
> >
> > How does one support the blink patterns?
>
> You are correct that this part is not generic. But a multi-purpose
> driver like the one I proposed could deliver a basic support for the
> device by controlling the brightness.
>
> It's only a basic support so the blink patterns are not supported.

Then you would have to change/extend the binding when you want to
support that. With a specific compatible, you only need a driver
change.

> I had a look at the functions in "struct led_classdev". There is a
> blink_set(..) function that expects that delay_on and delay_off can be
> set independent. That's not possible for hardware supported blinking on
> this device. The other function pattern_set(..) would allow an even more
> universal interface. All possible patterns of the LED could be covered
> in that but I don't think that this is true the other way round.
>
> So in my opinion the only thing that can be implemented in a useful way
> for that controller is the brightness.

What the OS can support evolves and should be independent of the binding.

> >
> >> +With the leds-spi-byte driver a basic support for the brightness mode of that
> >> +controller can be easily achieved by setting the minimum and maximum to the
> >> +brightness modes minimum and maximum byte value.
> >> +
> >> +Required properties:
> >> +- compatible:          Should be "leds-spi-byte".
> >
> > Generally, we don't do "generic" bindings like this. The exceptions
> > are either we have confidence they really can be generic or they where
> > created before we knew better. A sample size of 1 doesn't convince me
> > the former is true.
>
> I could construct another sample (some SPI-based digital potentiometer
> where you set values between 17 and 213) but I doubt that it would be a
> good idea to fight for the name.
>
> My original target device is a quite special one: I don't have a chip
> number. The controller Ubiquiti built here is based on a microcontroller
> that could be anything. The general device is named "Ubiquiti airCube
> ISP" or (a short form that I found at some locations) ubnt-acb-isp. I
> assume that they used the same controller in the non-ISP-version but I
> haven't checked that. So how about one of these:
>
> - ubnt,spi-byte-led
> - ubnt,spi-acb-led
> - ubnt,acb-isp-led

ubnt,acb-spi-led perhaps as the order is usually <product|soc>-<sub device>.

Or the last one if you wanted to keep 'isp'.

>
> Most likely I'll get the off-value and max-value based on the binding
> name then (0 and 63 for that device). So I'll just remove the two
> parameters then.
>
> >
> > This comment *only* applies to the binding, not the driver. Specific
> > bindings can easily be bound to generic drivers.
> >
>
> So the driver should still be called spi-byte (or something similar)?

Yes, whatever the LED maintainers want there.

Rob
