Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4177189819
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2020 10:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgCRJnU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Mar 2020 05:43:20 -0400
Received: from mail.v3.sk ([167.172.186.51]:51288 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726586AbgCRJnT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 18 Mar 2020 05:43:19 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id C0912DF366;
        Wed, 18 Mar 2020 09:43:37 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id PNxsq3bcxbEJ; Wed, 18 Mar 2020 09:43:36 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id C3B08E00AB;
        Wed, 18 Mar 2020 09:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0FSLYgTsW8M8; Wed, 18 Mar 2020 09:43:36 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 67387DF366;
        Wed, 18 Mar 2020 09:43:36 +0000 (UTC)
Date:   Wed, 18 Mar 2020 10:43:14 +0100
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: ariel: Add driver for status LEDs on Dell Wyse 3020
Message-ID: <20200318094314.GA5052@furthur.local>
References: <20200314105652.351708-1-lkundrak@v3.sk>
 <20200315084230.GA1996@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315084230.GA1996@amd>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Mar 15, 2020 at 09:42:30AM +0100, Pavel Machek wrote:
> Hi!
> 
> > This adds support for controlling the LEDs attached to the Embedded
> > Controller on a Dell Wyse 3020 "Ariel" board.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> Does not look bad.
> 
> > +static int ariel_led_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct ariel_led *leds;
> > +	struct regmap *ec_ram;
> > +	int ret;
> > +
> > +	leds = devm_kcalloc(dev, 3, sizeof(*leds), GFP_KERNEL);
> > +	if (!leds)
> > +		return -ENOMEM;
> > +
> > +	ec_ram = dev_get_regmap(dev->parent, "ec_ram");
> > +	if (!ec_ram)
> > +		return -ENODEV;
> > +
> > +	leds[0].ec_ram = ec_ram;
> > +	leds[0].ec_index = EC_BLUE_LED;
> > +	leds[0].led_cdev.name = "ariel:blue:power",
> > +	leds[0].led_cdev.brightness_get = ariel_led_get;
> > +	leds[0].led_cdev.brightness_set = ariel_led_set;
> > +	leds[0].led_cdev.blink_set = ariel_blink_set;
> > +	leds[0].led_cdev.default_trigger = "default-on";
> 
> Move common settings to a loop?
> 
> Definitely delete "ariel:" prefix.
> 
> > +	leds[1].led_cdev.name = "ariel:amber:status",
> > +	leds[2].led_cdev.name = "ariel:green:status",
> 
> Do the LEDs have some label, or some kind of common function? Calling
> it ":status" is not too useful...

No label there. This is what it looks like:
https://people.freedesktop.org/~lkundrak/ariel-leds.jpeg

The green and amber, despite being packaged separately, can be
controlled independently (they are not connected to the same inputs in
reverse).

What does the machine do with stock firmware & ThinOS:
* On power on, EC lights up the Amber one & Blue one
* As soon as the firmware takes control, it turns off Amber and turns on
  Green
* Just before passing control to the OS, firmware turns the Green LED to
  blinking
* As soon as OS initializes, it turns Green back to always-on

Therefore the functionality generally is as follows:
* Amber is always off (only on for a short time between CPU on and
  firmware running)
- Green blinking means "loading OS", otherwise always on when CPU is on
- Blue is always on when the CPU is on

> > +	ret = devm_led_classdev_register(dev, &leds[2].led_cdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_info(dev, "Dell Wyse 3020 LEDs\n");
> > +	return 0;
> > +}
> 
> Just return ret; no need to print anything into the syslog.

Thanks for the comments -- I'll address them in the next version.

Take care!
Lubo

> Thanks!
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


