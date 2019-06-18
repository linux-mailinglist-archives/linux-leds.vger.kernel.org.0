Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D404AA75
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2019 20:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbfFRS53 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Jun 2019 14:57:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:37492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730142AbfFRS53 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 Jun 2019 14:57:29 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93F632147A;
        Tue, 18 Jun 2019 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560884247;
        bh=LoWEnCUvmWoWMa7txdFu4c+Z+4gNxRdZ37FjATvmnKQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=grAWLsP6m4r9LqF3Z1j1nDbnuzWJTm/DFwWVJtbKTKMJTipQTZaYEi1ZSWptTKZea
         GVp7nrB9b3CB0GUkwfBkiBWX2XDM8BxBUrIViJtDncHaQVWdYUpyr7JDNexWyiha9S
         +QvqDwJhJNMf/03gGgbVIh3oTzkI6wZ1xxGVnRxU=
Received: by mail-qt1-f176.google.com with SMTP id p15so16748373qtl.3;
        Tue, 18 Jun 2019 11:57:27 -0700 (PDT)
X-Gm-Message-State: APjAAAWktppb80ufURJ1+ZxNbvbh5ObKHhpXmkTSraB/hIdQ+4NETwRc
        H5Pl5kl84a1y3ybJtg1YshA6Z1Tvd0kjeD7ZIg==
X-Google-Smtp-Source: APXvYqy2SEPoa0fxv79dQlv7hTm9mW9AXRTHf1i7buiIA7q5nDwdLD5eiQBUBkiLJzwPvnlu2j3dMmZ685hhNSUAhg0=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr29154803qve.148.1560884246832;
 Tue, 18 Jun 2019 11:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190523190820.29375-1-dmurphy@ti.com> <20190523190820.29375-3-dmurphy@ti.com>
 <20190614170011.GA3277@bogus> <c234361e-f5f7-f8d7-18c6-9cc8ef74ac99@ti.com>
 <CAL_JsqK7u1xXNmwtHjUd7Z5ewHd9_d51quH4zMXxEd63egd28w@mail.gmail.com> <afc7f11f-7f8d-7680-aef3-58c26e8b34fa@gmail.com>
In-Reply-To: <afc7f11f-7f8d-7680-aef3-58c26e8b34fa@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 18 Jun 2019 12:57:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKRLZmZ5uCKWh_tpaYu7eSdYatsymzy+L-D=sesd81w+Q@mail.gmail.com>
Message-ID: <CAL_JsqKRLZmZ5uCKWh_tpaYu7eSdYatsymzy+L-D=sesd81w+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt: bindings: Add multicolor class dt bindings documention
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        devicetree@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 18, 2019 at 12:20 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> On 6/18/19 5:36 PM, Rob Herring wrote:
> > On Fri, Jun 14, 2019 at 11:18 AM Dan Murphy <dmurphy@ti.com> wrote:
> >>
> >> Rob
> >>
> >> Thanks for the review
> >>
> >> On 6/14/19 12:00 PM, Rob Herring wrote:
> >>> On Thu, May 23, 2019 at 02:08:13PM -0500, Dan Murphy wrote:
> >>>> Add DT bindings for the LEDs multicolor class framework.
> >>>>
> >>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>>> ---
> >>>>    .../bindings/leds/leds-class-multicolor.txt   | 97 +++++++++++++++++++
> >>>>    1 file changed, 97 insertions(+)
> >>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> >>>> new file mode 100644
> >>>> index 000000000000..e2a2ce3279cb
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> >>>> @@ -0,0 +1,97 @@
> >>>> +* Multicolor LED properties
> >>>> +
> >>>> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
> >>>> +can be grouped together and also provide a modeling mechanism so that the
> >>>> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
> >>>> +
> >>>> +The nodes and properties defined in this document are unique to the multicolor
> >>>> +LED class.  Common LED nodes and properties are inherited from the common.txt
> >>>> +within this documentation directory.
> >>>> +
> >>>> +Required LED Child properties:
> >>>> +    - color : For multicolor LED support this property should be defined as
> >>>> +              LED_COLOR_ID_MULTI and further definition can be found in
> >>>> +              include/linux/leds/common.h.
> >>>> +
> >>>> +led-controller@30 {
> >>>> +    #address-cells = <1>;
> >>>> +    #size-cells = <0>;
> >>>> +    compatible = "ti,lp5024";
> >>>> +    reg = <0x29>;
> >>>> +
> >>>> +    multi-led@4 {
> >>> Typically we sort by address order.
> >>
> >> These are not addresses these end up being the "module" number that the
> >> LEDs below are associated to.
> >
> > 'reg' (and the unit-address) is an address in the sense that is how
> > you identify a device or sub-device. It doesn't matter what type of
> > 'address' it is, DT practice is to sort node in unit-address numerical
> > order.
> >
> > 'module' is a h/w thing, right? A bank or instance within the device?
> > If not, using 'reg' here is not appropriate.
>
> In this case reg represents LEDn_BRIGHTNESS register which controls
> a group of three LEDs. The thing is that those registers' addresses
> start from 0x07, i.e. the formula for calculating the RGB LED module
> address is: LEDn_BRIGHTNESS = 0x07 + n.
>
>  From the above it seems that we should have multi-led@7 and reg = 0x07
> for LED0_BRIGHTNESS register governing the brightness of RGB LED
> module 0, right?

Use whatever makes the most sense from a h/w perspective. If 'module
N' is something that I'd read about in the datasheet, then I'd stick
with 'N'.

>
> And regarding sorting by address order I think that Rob was asking for
> placing whole multi-led@4 sub-node after multi-led@2 (here sticking to
> the numeration from the patch).

Right.

Rob
