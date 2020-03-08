Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2418117D3B8
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 13:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCHMcG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 08:32:06 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:42964 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgCHMcG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Mar 2020 08:32:06 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 253A3C31E8; Sun,  8 Mar 2020 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583670723; bh=mLurXVykufiOO8ATtz8pmXNp3Pf/P0sqXUpoGUYvyI8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=H/NYrjA7ZVhsXUwaPet+Nih/LC/AS72MhacB9jeR0dnLdIutscb05rnH8KU2Jg4O6
         LRXy0/yaik+1X8w8uEC48ycot1+1Et3+asABrufrki9LpQ/VfHr/xPyw3IDpH2W9w6
         MAr3IqBNgE6ZsWkp6aKNG864GkZPBLbY6zJ+Ysq4=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 690C8C23CC;
        Sun,  8 Mar 2020 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583670719; bh=mLurXVykufiOO8ATtz8pmXNp3Pf/P0sqXUpoGUYvyI8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Mg3njot1Q0kmYH/EGW1/KE/P4Ou9TSl/+gbvCCEUPQA+T1EPm52ISdENolncI9UIo
         taX2+NdUCa6K7r2BBatfiR01ODc6bXlY6uOafiDrueoDAp5lBoZQIEcV9EkhYTiGSU
         AFUoVCQocZb3Pv+SK5oYLr9KhK1LjaPCwJlQaOn4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
Date:   Sun, 08 Mar 2020 13:31:58 +0100
Message-ID: <1813739.PYKUYFuaPT@g550jk>
In-Reply-To: <20200308120855.GA29321@duo.ucw.cz>
References: <20200227185015.212479-1-luca@z3ntu.xyz> <20200308120855.GA29321@duo.ucw.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel

On Sonntag, 8. M=E4rz 2020 13:08:55 CET Pavel Machek wrote:
> Hi!
>=20
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>=20
> That's pinephone, right?

Yes

>=20
> > This device is controller by two GPIO lines, one for enabling the LED
> > and the second one for switching between torch and flash mode.
> >=20
> > The device will automatically switch to torch mode after being in flash
> > mode for about 250-300ms, so after that time the driver will turn the
> > LED off again automatically.
>=20
> I don't quite see how this is supposed to work.
>=20

The sgm3140 works like this:

Set EN pin to low  -> off
Set EN pin to high and FLASH pin low -> torch mode
Set EN pin to high and FLASH pin high -> flash mode for 200-300ms, then it=
=20
switches automatically to torch mode

If it's still unclear, here's the datasheet which explains it nicely imo:
http://www.sg-micro.com/uploads/soft/20190626/1561535688.pdf

=46or strobe/flash operation the driver from this patch sets up a timer (us=
ing=20
mod_timer) in sgm3140_strobe_set to turn off the flash completely after 250=
ms so=20
that it doesn't remain in torch mode after these 200-300ms. In case the str=
obe=20
is disabled earlier, the timer is cancelled (del_timer_sync). That's=20
essentially what the driver is doing.

> > Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
> > in Documentation/leds/leds-class-flash.rst).
> >=20
> > The following is possible:
> >=20
> > # Torch on
> > echo 1 > /sys/class/leds/white\:flash/brightness
> > # Torch off
> > echo 0 > /sys/class/leds/white\:flash/brightness
> > # Activate flash
> > echo 1 > /sys/class/leds/white\:flash/flash_strobe
>=20
> So.. "activate flash" will turn the LED on in very bright mode, then
> put it back to previous brightness after a timeout?
>=20
> What happens if some kind of malware does flash_strobe every 300msec?
>=20

Then the LED will essentially be in torch mode until the sgm3140 determines=
=20
that it can use flash mode again.

> > # Torch on
> > v4l2-ctl -d /dev/video1 -c led_mode=3D2
> > # Torch off
> > v4l2-ctl -d /dev/video1 -c led_mode=3D0
> > # Activate flash
> > v4l2-ctl -d /dev/video1 -c strobe=3D1
> >=20
> > Unfortunately the last command (enabling the 'flash' via v4l2 results in
> >=20
> > the following being printed and nothing happening:
> >   VIDIOC_S_EXT_CTRLS: failed: Resource busy
> >   strobe: Resource busy
> >=20
> > Unfortunately I couldn't figure out the reason so I'm hoping to get some
> > guidance for this. iirc it worked at some point but then stopped.
>=20
> Actually, LED flash drivers are getting quite common. Having common
> code (so we could just say this is led flash, register it to both v4l
> and LED) might be quite interesting.
>=20
> Unfortunately, some LED flashes also have integrated red LED for
> indication, further complicating stuff.
>=20

See https://www.kernel.org/doc/html/latest/leds/leds-class-flash.html ? Tha=
t's=20
what I am using in this driver.

> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 2da39e896ce8..38d57dd53e4b 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+=3D leds-
lm3601x.o
> >=20
> >  obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+=3D leds-ti-lmu-common.o
> >  obj-$(CONFIG_LEDS_LM3697)		+=3D leds-lm3697.o
> >  obj-$(CONFIG_LEDS_LM36274)		+=3D leds-lm36274.o
> >=20
> > +obj-$(CONFIG_LEDS_SGM3140)		+=3D leds-sgm3140.o
>=20
> I would not mind "flash" drivers going to separate directory.
>=20

That would apply to these existing drivers as well at least:
* drivers/leds/leds-aat1290.c
* drivers/leds/leds-as3645a.c
* drivers/leds/leds-max77693.c
* drivers/leds/leds-lm3601x.c (probably should be made to use v4l2_flash_in=
it=20
as well)

> > +int sgm3140_brightness_set(struct led_classdev *led_cdev,
> > +			   enum led_brightness brightness)
> > +{
> > +	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
> > +	struct sgm3140 *priv =3D flcdev_to_sgm3140(fled_cdev);
> > +
> > +	if (brightness =3D=3D LED_OFF)
> > +		gpiod_set_value_cansleep(priv->enable_gpio, 0);
> > +	else
> > +		gpiod_set_value_cansleep(priv->enable_gpio, 1);
> > +
> > +	return 0;
> > +}
>=20
> Umm. So this cancels running strobe?
>=20

Setting brightness to 0 here turns off the flash, yes.

> > +static void sgm3140_powerdown_timer(struct timer_list *t)
> > +{
> > +	struct sgm3140 *priv =3D from_timer(priv, t, powerdown_timer);
> > +
> > +	gpiod_set_value_cansleep(priv->enable_gpio, 0);
> > +	gpiod_set_value_cansleep(priv->flash_gpio, 0);
> > +}
>=20
> And this does not return to previous brightness.
>=20

There's no real "brightness" level, it's either on or off. Or do you mean t=
hat=20
when the torch is on and the strobe is activated it should go back to torch=
=20
mode instead of being turned off?

> Do we want to provide the "strobe" functionality through sysfs at all?
> Should we make it v4l-only, and independend of the LED stuff?
>=20

I've just followed=20
https://www.kernel.org/doc/html/latest/leds/leds-class-flash.html , but I l=
ike=20
the simple sysfs interface for simple uses and for more advanced applicatio=
ns=20
(e.g. camera apps) the v4l2 interface.

> Best regards,
> 							=09
	Pavel

Regards
Luca


