Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B398576315
	for <lists+linux-leds@lfdr.de>; Fri, 26 Jul 2019 12:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfGZKGN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Jul 2019 06:06:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44151 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfGZKGM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jul 2019 06:06:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id p17so53780607wrf.11
        for <linux-leds@vger.kernel.org>; Fri, 26 Jul 2019 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Hjrv9ZYKJu8+kghKGHOb5+hoAyVj3/mf5z92bGiL1s=;
        b=lYz/UGbt8WDlJYVQroy8L1dI9habJK1BZbzR3fmaHoEoywC9cmqtnAJ9MKT3QtyWQL
         Ek3HiF6h5r1hgWYb3zXbc7gCi9LSq0ODyWswtsvGxCzmR4tQkwSAFS34t/ZrUi9ntojB
         3mxFYDym25DUz8RLbKTCzVicgQdJ1GPDmJI9TRPBKVRBzK166CPdkAf08id7H1Ewoqf8
         lkEJuTEftRC235Fols9XsmEjyKvSqVE8pYCJo+VEl0Kdcv//qP/eF8uS86DTiZ3/VAwh
         qlFJr9FWZiZW6MiA8TlnsWt0KOn6vWuIEg0rMdPHVZM9caXjsAza6akYhLU5BHpiwTsN
         DHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Hjrv9ZYKJu8+kghKGHOb5+hoAyVj3/mf5z92bGiL1s=;
        b=q3iUXGId8rZt5lL6uUUGHcAQ8ycSXi75x1wZlid88r7mz1nihO/q2eIsBWOphwI/lO
         LzbtM/NMSUSUED7rgs3ICgEFYzksfXV49tSL/PxsUCq7YIzz3QD/t7SZj7t6Buoo1YK8
         PQYgwMAKEJIrumn41oQNGf5552IzpIC5P2lOe0GbKAUt8IBF/bEQ4PzpGkbJyDD5zVUR
         NFhTP6sTzAKNyYKVgyegbC46NsQdchKJHIKG8fXpiYxthB1Ig2EQ6lTivYFmLl0563/x
         nAGAd1wm59FbVBB/jSLZJ6fvqo5n1RvKynT9CrjGgdEpyV3FRaV925ssoKRhpHglsKKk
         M9YQ==
X-Gm-Message-State: APjAAAWQmUYVqMFa28x9RS4SQeLuH2Oy8iPGtgooxGa8GPNqp4fHljFC
        kqT9EpQ5z2bnFQbpdf2vkz3ySw==
X-Google-Smtp-Source: APXvYqyvpbvw/+SBDxbhu5SzhvXM0cbpOSVyDtC4qDYfx8TaqUQ3+OT+m3w46EiLP53umHEa72/Ofg==
X-Received: by 2002:adf:9486:: with SMTP id 6mr69762173wrr.242.1564135569988;
        Fri, 26 Jul 2019 03:06:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id i6sm46180031wrv.47.2019.07.26.03.06.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:06:09 -0700 (PDT)
Date:   Fri, 26 Jul 2019 11:06:07 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Rob Herring <robh@kernel.org>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, mark.rutland@arm.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply"
 property
Message-ID: <20190726100607.j5bdmuuk33zpwa2r@holly.lan>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-3-jjhiblot@ti.com>
 <20190724164757.GA3723@bogus>
 <753b2c8d-e8fc-ec6e-f372-a84d4452fd33@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <753b2c8d-e8fc-ec6e-f372-a84d4452fd33@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 25, 2019 at 01:08:46PM +0200, Jean-Jacques Hiblot wrote:
> Hi Rob,
> 
> On 24/07/2019 18:47, Rob Herring wrote:
> > On Mon, Jul 08, 2019 at 12:35:47PM +0200, Jean-Jacques Hiblot wrote:
> > > Most of the LEDs are powered by a voltage/current regulator. describing in
> > > the device-tree makes it possible for the LED core to enable/disable it
> > > when needed.
> > > 
> > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > ---
> > >   Documentation/devicetree/bindings/leds/common.txt | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> > > index 70876ac11367..e093a2b7eb90 100644
> > > --- a/Documentation/devicetree/bindings/leds/common.txt
> > > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > > @@ -61,6 +61,11 @@ Optional properties for child nodes:
> > >   - panic-indicator : This property specifies that the LED should be used,
> > >   		    if at all possible, as a panic indicator.
> > > +- power-supply : A voltage/current regulator used to to power the LED. When a
> > > +		 LED is turned off, the LED core disable its regulator. The
> > > +		 same regulator can power many LED (or other) devices. It is
> > > +		 turned off only when all of its users disabled it.
> > Not sure this should be common. It wouldn't apply to cases where we have
> > an LED controller parent nor gpio and pwm LEDs and those are most cases.
> 
> It does make sense for GPIO and PWM bindings if the anode of LED is tied to
> a regulated voltage and the cathod to the control line.
> 
> The same is true for a certain class of true LED controller that do not
> deliver power but act like current sinks.
> 
> JJ
> 
> > 
> > Perhaps what makes sense here is an regulator-led binding.

You didn't comment on this alternative... and I confess I'm not quite
sure what Rob means by a regulator-led binding so I can't really comment
either.

Rob, is there any analogous example for a regulator-<something-else> binding
to compare with?


Daniel.

> > 
> > > +
> > >   - trigger-sources : List of devices which should be used as a source triggering
> > >   		    this LED activity. Some LEDs can be related to a specific
> > >   		    device and should somehow indicate its state. E.g. USB 2.0
> > > -- 
> > > 2.17.1
> > > 
