Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5858460419
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 12:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfGEKJE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 5 Jul 2019 06:09:04 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47066 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfGEKI7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Jul 2019 06:08:59 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D2DE9805FF; Fri,  5 Jul 2019 12:08:46 +0200 (CEST)
Date:   Fri, 5 Jul 2019 12:08:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
Message-ID: <20190705100851.zn2jkipj4fxq5we6@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
 <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
 <20190702130434.frbx7jkec27ejbpo@holly.lan>
 <72c45311-c710-dc2d-a6de-68e44ea8436a@ti.com>
 <20190703094457.etmbbjhhssbdkveo@holly.lan>
 <a8886ae9-31ec-de4c-0a83-5f681582a0b9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <a8886ae9-31ec-de4c-0a83-5f681582a0b9@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> > > > Also still relevant is whether the LED device is being correctly
> > > > modelled if the act of turning on the LED doesn't, in fact, turn the LED
> > > > on. Is it *really* a correct implementation of an LED device that
> > > > setting it to LED_FULL using sysfs doesn't cause it to light up?
> > > What I understood from the discussion between Rob and Tomi is that the
> > > child-node of the LED controller should be considered a backlight device,
> > > not a simple LED. I'm not sure if the sysfs interface is still relevant in
> > > that case. Maybe it should just be disabled by the backlight driver
> > > (possible with led_sysfs_disable())
> > led_sysfs_disable() sounds like a sensible change but that's not quite
> > what I mean.
> > 
> > It is more a thought experiment to see if the power control *should* be
> > implemented by the backlight. Consider what happens if we *don't*
> > enable CONFIG_BACKLIGHT_LED in the kernel: we would still have an LED
> > device and it would not work correctly.
> > 
> > In other words I naively expect turning on an LED using the LED API
> > (any of them, sysfs or kernel) to result in the LED turning on.
> > Implementing a workaround in the client for what appears to be
> > something missing in the LED driver strikes me as odd. Why shouldn't
> > the regulator be managed in the LED driver?
> 
> I see your point. Indeed having the regulator handled in the LED-core makes
> sense in a lot of situations
> 
> I'll think about it.

For the record, I also believe regulator and enable gpio should be
handled in the core.

									Pavel
PS please trim down the quoted text.									
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
