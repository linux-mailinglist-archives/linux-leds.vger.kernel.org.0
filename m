Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EA5185C02
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2020 11:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgCOKnG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Mar 2020 06:43:06 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:60264 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728234AbgCOKnG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 15 Mar 2020 06:43:06 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 61B09C436C; Sun, 15 Mar 2020 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1584268983; bh=QoX2eClLDj6E3ejT/S4be6kJFX/4POmeEkxt248YjgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Lo+MyjWZQUBlNbW++K0BNc9N9KPGWsulodG8MkzdScOC2d0GwReJUrAcie+16bUr8
         PvuW7Dx7npSWmGgSUZXO/AuPSwjFEjXKvaKXVep9HOofaZKo69d2BBf/b8qvNRao1X
         gMsNDUwghDqUdRCXtw/CDkeiXr0G4fX7KZzdmn+E=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id E3FF7C3EBC;
        Sun, 15 Mar 2020 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1584268978; bh=QoX2eClLDj6E3ejT/S4be6kJFX/4POmeEkxt248YjgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IhW9IHxdiU9QoY4zJtXMs9rpSd4+7zyFwDViz81llLtiJJIWNhKgrNdl9qiyjgTwv
         LcCl6NHveGQU2FCxw7xp1+J4o9MLkI7WwUFOyqJsTFeetUVJ2OojoZH/PHHoOD4UhC
         icTDGHRM5NlQukdFINHrz+0s3rj4M5lCDhELZ1bM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] leds: add sgm3140 driver
Date:   Sun, 15 Mar 2020 11:42:57 +0100
Message-ID: <2023791.irdbgypaU6@g550jk>
In-Reply-To: <22341236-8298-dc97-217b-46071a362207@ti.com>
References: <20200309203558.305725-1-luca@z3ntu.xyz> <20200309203558.305725-4-luca@z3ntu.xyz> <22341236-8298-dc97-217b-46071a362207@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On Mittwoch, 11. M=E4rz 2020 14:02:44 CET Dan Murphy wrote:
> Luca
>=20
> On 3/9/20 3:35 PM, Luca Weiss wrote:
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> >=20
> > This device is controlled by two GPIO pins, one for enabling and the
> > second one for switching between torch and flash mode.
>=20
> How does one enable torch and one enable flash?
>=20
> Is the flash-gpio control this or does the enable-gpio enable the flash?

Enabling torch mode means making EN pin high and FLASH pin low.
Enabling flash mode means making EN pin high and FLASH pin high.

The users of this driver can just use standard v4l2 apis or sysfs so I=20
wouldn't say this is relevant for the users.

>=20
> The DT binding did not indicate what the GPIOs are really going to contro=
l.

I'm not sure if this is relevant in the dt bindings because how the device=
=20
works is described in the datasheet and not really relevant for users of th=
e=20
binding? I also didn't necessarily want to copy-paste the datasheet into th=
e=20
dt bindings because of copyright.

>=20
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > Changes since RFC:
> >=20
> > - address review comments from Jacek Anaszewski:
> >    - implement strobe_get op
> >    - implement timeout_set op
> >    - init v4l2_sd_cfg variable
> >    - remove init_data.devicename assignemnt
> >    - use devm_ version of led_classdev_flash_register_ext
> >    - release child_node in case of success
> >  =20
> >   drivers/leds/Kconfig        |   9 ++
> >   drivers/leds/Makefile       |   1 +
> >   drivers/leds/leds-sgm3140.c | 260 ++++++++++++++++++++++++++++++++++++
> >   3 files changed, 270 insertions(+)
> >   create mode 100644 drivers/leds/leds-sgm3140.c
> >=20

> SNIP

> > +	if (!child_node) {
> > +		dev_err(&pdev->dev, "No DT child node found for=20
connected LED.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +
> > +	ret =3D of_property_read_u32(child_node, "flash-max-timeout-us",
> > +				   &priv->max_timeout);
>=20
> Please use the device_property api's to retrieve DT settings.  Then
> there is no need to release the "of" child node.
>=20

I'm guessing you mean

device_property_read_u32(&pdev->dev, "flash-max-timeout-us", &priv-
>max_timeout);

?

I still need the child_node for "init_data.fwnode" and v4l2_flash_init so I=
=20
still have to call of_node_put, right?

> > +	if (ret < 0) {
>=20
> if (ret)

Ack

> SNIP

> > +	/* Create V4L2 Flash subdev */
> > +	priv->v4l2_flash =3D v4l2_flash_init(&pdev->dev,
> > of_fwnode_handle(child_node), +				=09
   fled_cdev, NULL,
> > +					   &v4l2_sd_cfg);
> > +	if (IS_ERR(priv->v4l2_flash)) {
> > +		ret =3D PTR_ERR(priv->v4l2_flash);
> > +		goto err;
>=20
> Do you need to jump here?  This should just fall out and go through err
> anyway.

Should I just do

if (IS_ERR(priv->v4l2_flash))
	ret =3D PTR_ERR(priv->v4l2_flash);

?

I thought about removing the goto but I decided to keep it in case code is=
=20
added below that statement so that the goto wouldn't be forgotten. But I ca=
n=20
change it of course if wanted.

>=20
> Dan

Regards
Luca


