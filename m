Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348F91BAE72
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 21:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgD0TuI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 15:50:08 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:53132 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgD0TuI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 15:50:08 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 2477BC4D5F; Mon, 27 Apr 2020 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1588017006; bh=Tp5K0z6qXk66LE+x4u+qGGY18uOXh/OQIqEnu5hZFXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XgxUF9Vyf52xMS3BxfBY340LUDK+q6P4zfeGyNkRPGJKJQRuEZGKkmG0IywjstE1d
         YVcJ9+L4y5alvyz8HYnMnGGK4DFZbOaBEAlB4W4a5FkUo1+pKkTPrO74965c1gSPvB
         CzMwQ+WPAlGueZT+gRjdaruDvji8BV4n3DcFcQBY=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 78112C4C9D;
        Mon, 27 Apr 2020 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1588016997; bh=Tp5K0z6qXk66LE+x4u+qGGY18uOXh/OQIqEnu5hZFXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=pbNz3UCZ4ArCYHMDrSstU3Ei+42CwaW2E6sA6fEd4B3Ds5xdLdg87gkkHJ9EOuxWv
         mS2RG4rD+ZiBT0uF6/g0Pg0aaIWZ2wXShtqffynnT1izO8Y+ukVdAv2nsgM/fFDyHa
         qmOYcX/5wTQ3Uo/gIOWSwWoN0t/79F4nq+fL/Pzs=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/2] leds: add sgm3140 driver
Date:   Mon, 27 Apr 2020 21:49:54 +0200
Message-ID: <318932736.Jt2qlLCP7m@g550jk>
In-Reply-To: <20200427095102.GA21572@duo.ucw.cz>
References: <20200421191354.1443017-1-luca@z3ntu.xyz> <20200421191354.1443017-3-luca@z3ntu.xyz> <20200427095102.GA21572@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4979951.K97e9W9pSL"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

--nextPart4979951.K97e9W9pSL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 27. April 2020 11:51:02 CEST Pavel Machek wrote:
> Hi!
> 
> > Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
> > 
> > This device is controlled by two GPIO pins, one for enabling and the
> > second one for switching between torch and flash mode.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> 
> Thanks, applied, but... I may remove it again.
> 
> > +++ b/drivers/leds/leds-sgm3140.c
> > @@ -0,0 +1,320 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Would you consider GPL-2+?

I don't really have a preference either way but GPL-2.0-or-later is fine for 
me.

> 
> > +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> > +static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> 
> Ok.
> 
> > +static int sgm3140_probe(struct platform_device *pdev)
> > +{
> 
> ...
> 
> > +	led_cdev->brightness_set_blocking = sgm3140_brightness_set;
> > +	led_cdev->max_brightness = LED_ON;
> 
> Don't do this, unless you really have 255 levels of brightness.

LED_ON is 1, so the brightness available is 0 - 1.

> 
> > +	/* Create V4L2 Flash subdev */
> > +	priv->v4l2_flash = v4l2_flash_init(&pdev->dev,
> > +					   child_node,
> > +					   fled_cdev, NULL,
> > +					   &v4l2_sd_cfg);
> > +	if (IS_ERR(priv->v4l2_flash)) {
> 
> Does this need some #ifdef guards?

v4l2_flash_init has a NULL-returning version when CONFIG_V4L2_FLASH_LED_CLASS 
is not defined (see https://elixir.bootlin.com/linux/latest/source/include/
media/v4l2-flash-led-class.h#L166 )

> 
> > +		ret = PTR_ERR(priv->v4l2_flash);
> > +		goto err;
> > +	}
> > +
> > +	return ret;
> 
> Should this return 0?

ret should be 0 here, so it shouldn't matter much.

> 
> > +err:
> > +	fwnode_handle_put(child_node);
> > +	return ret;
> > +}
> 
> Does non-error path needs handle_put, too?

I don't think so, I'm passing child_node to v4l2_flash_init which then saves 
the pointer to v4l2_subdev->fwnode. 

The devm_led_classdev_flash_register_ext function also seems to store the 
pointer (led_cdev->dev->fwnode = init_data->fwnode; in 
led_classdev_register_ext)

> 
> Best regards,
> 								
	Pavel

Regards,
Luca
--nextPart4979951.K97e9W9pSL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEObrSLwgs2pG6FY/6cthDuJ1N11YFAl6nN2IACgkQcthDuJ1N
11aAZBAA0i4n3JlvsQXSwCK/Fm8tiPmVsJPyFwa/Pt2f4xSUnBtjbBxnkdEt6MhK
SnYIfBNZAjnTcNQeIObdGMjJ6nhMVk3zqXD8P2QfxQJL3I9izpjQv0cDsMzmFrsk
JKjWeBCayt/AjhOU5pF48nOe6MDAzNNP+Eg1He2HMzJi43klsuRBtqadn6AzTgWz
xaCX+BcZDdMZv+ZaJOfUkRkWVEjN2OvIRBSj3uIZMZ09+fTMSUgy26aWyxWMjMYX
N+jqlBzVfp+UBBHcE3vwTqwlVfn4f5cNlhIAN+g9QtTAZ5/1gH7uMzIAaqZamvJp
5ckBQvoz07051RkHmlbc5RrJf1rMuVJvnSlFw+MI5jGg7q0GmL6qTE9E8d46KT/8
L9FV3uHJzeaos5DkGAZ40T0UmB130RzfvIpXcnq6r8dpTatduGHae1Rli8+bsTuL
CFMywEMutthCiC9ql+FVByTlysTNRZO9V8ca3CwTFVDy90AxfjkZg5Wclo4wkE+o
3Pj106n1C8jqfRX9dhO79LlcnG6+DOzim0+V+S78pHBPrvzQMVBLExC+VWZiia2a
Ptk0vbKes2A6BRWWjSNFPun0X1aryXDl3gk3YAeBAN14tjMpepx8JrnzPGRpMD3a
7rm2xshmhiGC1ncqGW8WUosoEc61IOHXZPN1Pz6osY1RXCm2zzY=
=y4oW
-----END PGP SIGNATURE-----

--nextPart4979951.K97e9W9pSL--



