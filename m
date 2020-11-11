Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364482AF705
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 17:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgKKQ4l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 11:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgKKQ4l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Nov 2020 11:56:41 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD04C0613D1
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2020 08:56:41 -0800 (PST)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 81EDF634C24;
        Wed, 11 Nov 2020 18:55:02 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kctOh-00049u-Mp; Wed, 11 Nov 2020 18:55:03 +0200
Date:   Wed, 11 Nov 2020 18:55:03 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20201111165503.GZ6899@valkosipuli.retiisi.org.uk>
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
 <20201111011417.2275501-2-linus.walleij@linaro.org>
 <20201111113848.GX6899@valkosipuli.retiisi.org.uk>
 <CACRpkdYK+X==Xm3AfymV_HEaZHOvPS-LtCLKZXc2jmzV7KUZoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYK+X==Xm3AfymV_HEaZHOvPS-LtCLKZXc2jmzV7KUZoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

On Wed, Nov 11, 2020 at 05:34:58PM +0100, Linus Walleij wrote:
> On Wed, Nov 11, 2020 at 12:40 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > On Wed, Nov 11, 2020 at 02:14:17AM +0100, Linus Walleij wrote:
> 
> > > +     } else if (brightness < RT8515_TORCH_MAX) {
> > > +             /* Step it up to movie mode brightness using the flash pin */
> > > +             rt8515_gpio_brightness_commit(rt->ent, brightness);
> >
> > What's the unit of brightness here? If you don't know the unit, you could
> > still assume something and fix it later if needed. Or the current could be
> > just measured.
> >
> > It's usually linear but if the number of steps is small then logarithmic
> > scale is also not unforeseen.
> 
> I will try to come up with something...
> 
> > > +     } else {
> > > +             /* Max torch brightness requested */
> > > +             gpiod_set_value(rt->ent, 1);
> >
> > What's the current in this case? The maximum really should come from DT to
> > avoid frying components.
> 
> The way I understand it is that this component contains its own
> current regulation electronic. You request a brightness
> between 1-100 and it will support this range (no external
> current boost). And as a user that is "all you need to know".
> 
> Isn't this problem more prevalent when you have some kind of
> external current-regulator that you need to program?
> 
> This component draws its power directly from VBAT (the main
> battery) so regulating how much of that it takes is up to the
> component.
> 
> I could think of the component brightness being a problem if
> the flash is embedded in some kind of plastic that cannot
> take the heat though, but I haven't seen any code trying to
> hold it down for this reason. I suppose the component
> datasheet (that I don't have) specifies all these things...

The LED is different from the LED driver. If you happen to have a LED with
smaller maximum current than the LED driver can provide, the software has
to limit the current the driver provides, or hardware damage will result.

This is why virtually all flash LED drivers have these properties.

I guess you could use the maximum as it is known the driver uses the
maximum current on those devices? How about the torch mode, does that use
maximum as well?

A (safe) way forward now, without knowing the current in various
configurations, could be to document the said properties in DT bindings,
but the driver would only work if it gets the maximum values from the DT.
Or use the lowest setting otherwise.

-- 
Kind regards,

Sakari Ailus
