Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E921A2220A8
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 12:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGPKck (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 06:32:40 -0400
Received: from lists.nic.cz ([217.31.204.67]:49938 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726515AbgGPKcj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 16 Jul 2020 06:32:39 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 774DE140A70;
        Thu, 16 Jul 2020 12:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594895557; bh=TaXKVkgqKbqROzk9vdJWLwjlS+WfbaS8e9zsr2mquLM=;
        h=Date:From:To;
        b=vKSGpgwh2wVjqU73K/5b2ksElrOz8jq1+iYQaLtuwlpSMBjX3SHby+a4GWRG2aYdk
         bklDE2mZ2xegiM5zxXLeFJw7YM4FDd8OpjjACY65/WMhy/4dSj1d24kOoVTZQnCDWw
         XJuR5haJlauQMynu5xBFOb8p950z3XHEGDjVrUog=
Date:   Thu, 16 Jul 2020 12:32:36 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 2/2] leds: initial support for Turris Omnia LEDs
Message-ID: <20200716123236.5f10ee6f@dellmb.labs.office.nic.cz>
In-Reply-To: <2c1470ae-5a5a-5f75-b08b-4fb47afe02ca@ti.com>
References: <20200715124034.9804-1-marek.behun@nic.cz>
        <20200715124034.9804-3-marek.behun@nic.cz>
        <e274c075-c630-6217-1124-b207c6f67bac@ti.com>
        <20200715210358.567e0df5@dellmb.labs.office.nic.cz>
        <2c1470ae-5a5a-5f75-b08b-4fb47afe02ca@ti.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On Wed, 15 Jul 2020 14:10:34 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> >>> +	cdev->max_brightness =3D 255; =20
> >> This is not needed.=C2=A0 It is defaulted to LED_FULL in led_class =20
> > This was discussed last year and resulted in LED_FULL being
> > declared obsolete in the header file. =20
>=20
> No I am referring to setting the max_brightness to 255 the LED class=20
> sets this to 255 if the value is not set.

I'll rather have this value here, since this is a controller specific
constant. The LED class sets this to LED_FULL, which is obsolete. It
could be changed to 255 there, but but I think that having this value
here says to the reader that it is controller specific.

> >>> +/*
> >>> + * On the front panel of the Turris Omnia router there is also a
> >>> button which can be used to control
> >>> + * the intensity of all the LEDs at once, so that if they are too
> >>> bright, user can dim them.
> >>> + * The microcontroller cycles between 8 levels of this global
> >>> brightness (from 100% to 0%), but this
> >>> + * setting can have any integer value between 0 and 100.
> >>> + * It is usable to be able to change this value from software, so
> >>> that it does not start at 100% =20
> >> This does not make sense. =20
> > It does. The user changes the brightness of all 12 LEDs with the
> > button to his liking and wants to have the same setting after
> > powering the router on again. =20
>=20
> No the english does not make sense
>=20
> " It is usable to be able to change this value from software, so
> that it does not start at 100%"
>=20
> "It is usable" is not really clear.

OK I'll change it to "It is convenient to be able to change this
setting from software."

> >>> + * after every power on and annoy the user.
> >>> + * We expose this setting via a sysfs attribute file called
> >>> "brightness". This file lives in the
> >>> + * device directory of the LED controller, not an individual LED,
> >>> so it should not confuse users.
> >>> + */ =20
> >> Sorry if this has been discussed already
> >>
> >> This seems a bit wonky.=C2=A0 You are overriding the brightness set by
> >> the LED class. =20
> > I am not. Pressing the button does not change the brightness read
> > from the /sys/class/leds/<LED>/brightness file. This is different
> > brightness, it is above the classic brightnes in the PWM hierarchy
> > in the microcontroller. I discussed this with Pavel and he said we
> > can call this file brightness as well (since it is brightness of
> > the whole panel), and the file does not reside in
> > /sys/class/leds/<LED> directory. =20
>=20
> OK then there needs to be some ABI documentation no?

You are right, I'll add this for v5.

Thx
