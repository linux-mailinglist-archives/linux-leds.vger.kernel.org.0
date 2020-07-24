Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB23022C4BD
	for <lists+linux-leds@lfdr.de>; Fri, 24 Jul 2020 14:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgGXMIg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Jul 2020 08:08:36 -0400
Received: from lists.nic.cz ([217.31.204.67]:53654 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgGXMIc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 24 Jul 2020 08:08:32 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 48FFA14095F;
        Fri, 24 Jul 2020 14:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595592510; bh=ufnLcS5Ekdi2R+BuKHmsyG0vKYqeKn9XEqIIstMmAEE=;
        h=Date:From:To;
        b=P9UfZy0hA+CwRmZrjTS/L0MwW5Z4wlZziljvAuot8AxwdcjBE6VzfFldv5oTPD2rX
         QDoQ21utidiwoHlziZLa3MpnySMo1zXArWRl2SZAtsWlfi6BCoy3ylpBnCAD23+ev4
         pLj9eYRVxNsskPHNgYg/67cvL8EIb/2J6mwZ+0mQ=
Date:   Fri, 24 Jul 2020 14:08:29 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 2/3] leds: initial support for Turris Omnia LEDs
Message-ID: <20200724140829.74167055@dellmb.labs.office.nic.cz>
In-Reply-To: <20200724105825.wyorw3jr2kaa3ucr@duo.ucw.cz>
References: <20200723125320.3572-1-marek.behun@nic.cz>
        <20200723125320.3572-3-marek.behun@nic.cz>
        <20200724105825.wyorw3jr2kaa3ucr@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

On Fri, 24 Jul 2020 12:58:25 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> > This adds basic support for LEDs on the front side of CZ.NIC's
> > Turris Omnia router.
> >=20
> > There are 12 RGB LEDs. The controller supports HW triggering mode
> > for the LEDs, but this driver does not support it yet, and sets all
> > the LEDs defined in device-tree into SW mode upon probe.
> >=20
> > This driver uses the multicolor LED framework.
> >=20
> > Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> > Reviewed-by: Dan Murphy <dmurphy@ti.com>
> > ---
> >  drivers/leds/Kconfig             |  11 ++
> >  drivers/leds/Makefile            |   1 +
> >  drivers/leds/leds-turris-omnia.c | 295
> > +++++++++++++++++++++++++++++++ 3 files changed, 307 insertions(+)
> >  create mode 100644 drivers/leds/leds-turris-omnia.c =20
>=20
> Whoever told you to use defines here was evil:

I think it was that way when it was first proposed, sometime last year,
but Dan complained about magic numbers, so I changed it to macros :D

> > +#define OMNIA_CMD_LED_COLOR_LED		1
> > +#define OMNIA_CMD_LED_COLOR_R		2
> > +#define OMNIA_CMD_LED_COLOR_G		3
> > +#define OMNIA_CMD_LED_COLOR_B		4
> > +#define OMNIA_CMD_LED_COLOR_LEN		5 =20
>=20
> > +static int omnia_led_brightness_set_blocking(struct led_classdev
> > *cdev,
> > +					     enum led_brightness
> > brightness) +{
> > +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> > +	struct omnia_leds *leds =3D
> > dev_get_drvdata(cdev->dev->parent);
> > +	struct omnia_led *led =3D to_omnia_led(mc_cdev);
> > +	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
> > +	int ret;
> > +
> > +	mutex_lock(&leds->lock);
> > +
> > +	led_mc_calc_color_components(&led->mc_cdev, brightness);
> > +
> > +	buf[OMNIA_CMD] =3D CMD_LED_COLOR;
> > +	buf[OMNIA_CMD_LED_COLOR_LED] =3D led->reg;
> > +	buf[OMNIA_CMD_LED_COLOR_R] =3D
> > mc_cdev->subled_info[0].brightness;
> > +	buf[OMNIA_CMD_LED_COLOR_G] =3D
> > mc_cdev->subled_info[1].brightness;
> > +	buf[OMNIA_CMD_LED_COLOR_B] =3D
> > mc_cdev->subled_info[2].brightness; =20
>=20
> Aha, it is LED vs LEN, but please don't obscure code with macros like
> that. It is important to see that buf[] is fully initialized, macros
> hide that.
>=20
> > +	state =3D CMD_LED_STATE_LED(led->reg);
> > +	if (buf[OMNIA_CMD_LED_COLOR_R] ||
> > buf[OMNIA_CMD_LED_COLOR_G] || buf[OMNIA_CMD_LED_COLOR_B])
> > +		state |=3D CMD_LED_STATE_ON; =20
>=20
> I'd make this conditional on mc_cdev->subled_info[0].brightness[x],
> not buf, but...
>=20
>=20
> > +	int ret, count;
> > +
> > +	count =3D of_get_available_child_count(np);
> > +	if (!count) {
> > +		dev_err(dev, "LEDs are not defined in device
> > tree!\n");
> > +		return -ENODEV;
> > +	} else if (count > OMNIA_BOARD_LEDS) {
> > +		dev_err(dev, "Too many LEDs defined in device
> > tree!\n");
> > +		return -EINVAL;
> > +	} =20
>=20
> Should count be unsigned?
>=20
> Or better, should we check it is _exactly_ OMNIA_BOARD_LEDS as we only
> support this known hardware?

I think it shouldn't be an error when fewer than OMNIA_BOARD_LEDS are
in device tree...

> [I suppose I'll apply it anyway; these can be fixed post-merge].

As you wish. I can sent follow-up patch afterwards for to remove those
macros...

> Best regards,
> 									Pavel

