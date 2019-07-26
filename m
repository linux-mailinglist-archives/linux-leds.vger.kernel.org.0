Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1D07741C
	for <lists+linux-leds@lfdr.de>; Sat, 27 Jul 2019 00:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfGZWo0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Jul 2019 18:44:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:51630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbfGZWo0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Jul 2019 18:44:26 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 264E8218B0;
        Fri, 26 Jul 2019 22:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564181065;
        bh=CLc5TFw3wuFbBkx7QqcwcsboybeIIIr82PaiAeaZURI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DCGy87YJbkmZsb/Ha+fHYv9YEbPpbBeaKdIN7CHFAiY7iURJALNMUHRxFYjpzIEdb
         EhGTU7wxeglgJy+I+sAcB11TFt0kwbVG3ZeO58yNk0sO27h6TM+2KgnGTDnbUHRYVM
         MGtBHxJ0Y9PapbGqKUv7fXI2uwDnzi0UTNXpdDfM=
Received: by mail-qt1-f179.google.com with SMTP id z4so54247907qtc.3;
        Fri, 26 Jul 2019 15:44:25 -0700 (PDT)
X-Gm-Message-State: APjAAAX/Bw5i27y/pf4ZKI9XrL4HJ/QE+9cPFCaDoaI3o9Jl0H2/hiGw
        fNNi26i2aoSxWpLvtYfgYY2G9iYuARPMn18tBw==
X-Google-Smtp-Source: APXvYqxWbAMLJC6c7Xc4QqDY6F9OJBxE9tj/Bik5yNXGhD2rsFGEjjqB0wTQ1wQTSrFO0k9ziwgLsUW6JLDmNollelA=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr71794002qvu.138.1564181064285;
 Fri, 26 Jul 2019 15:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190708103547.23528-1-jjhiblot@ti.com> <20190708103547.23528-3-jjhiblot@ti.com>
 <20190724164757.GA3723@bogus> <753b2c8d-e8fc-ec6e-f372-a84d4452fd33@ti.com> <20190726100607.j5bdmuuk33zpwa2r@holly.lan>
In-Reply-To: <20190726100607.j5bdmuuk33zpwa2r@holly.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 26 Jul 2019 16:44:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLhSKi1o-WE=02oz1__F=c5fo1FRH=qrs_1XG7jdz_9Uw@mail.gmail.com>
Message-ID: <CAL_JsqLhSKi1o-WE=02oz1__F=c5fo1FRH=qrs_1XG7jdz_9Uw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply" property
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mark Rutland <mark.rutland@arm.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jul 26, 2019 at 4:06 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Jul 25, 2019 at 01:08:46PM +0200, Jean-Jacques Hiblot wrote:
> > Hi Rob,
> >
> > On 24/07/2019 18:47, Rob Herring wrote:
> > > On Mon, Jul 08, 2019 at 12:35:47PM +0200, Jean-Jacques Hiblot wrote:
> > > > Most of the LEDs are powered by a voltage/current regulator. describing in
> > > > the device-tree makes it possible for the LED core to enable/disable it
> > > > when needed.
> > > >
> > > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > > ---
> > > >   Documentation/devicetree/bindings/leds/common.txt | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> > > > index 70876ac11367..e093a2b7eb90 100644
> > > > --- a/Documentation/devicetree/bindings/leds/common.txt
> > > > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > > > @@ -61,6 +61,11 @@ Optional properties for child nodes:
> > > >   - panic-indicator : This property specifies that the LED should be used,
> > > >                       if at all possible, as a panic indicator.
> > > > +- power-supply : A voltage/current regulator used to to power the LED. When a
> > > > +          LED is turned off, the LED core disable its regulator. The
> > > > +          same regulator can power many LED (or other) devices. It is
> > > > +          turned off only when all of its users disabled it.
> > > Not sure this should be common. It wouldn't apply to cases where we have
> > > an LED controller parent nor gpio and pwm LEDs and those are most cases.
> >
> > It does make sense for GPIO and PWM bindings if the anode of LED is tied to
> > a regulated voltage and the cathod to the control line.

Okay. Is one of those your case, or you only have regulator control?
The latter would need a new binding. If you want to use power-supply
with either GPIO and PWM LED bindings, then it should still be listed
in those as an applicable property.

> > The same is true for a certain class of true LED controller that do not
> > deliver power but act like current sinks.
> >
> > JJ
> >
> > >
> > > Perhaps what makes sense here is an regulator-led binding.
>
> You didn't comment on this alternative... and I confess I'm not quite
> sure what Rob means by a regulator-led binding so I can't really comment
> either.
>
> Rob, is there any analogous example for a regulator-<something-else> binding
> to compare with?

regulator-haptic is the only one I found in a quick search.

Rob
