Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B36230F57A
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236971AbhBDOzF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:55:05 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44336 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbhBDOxw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Feb 2021 09:53:52 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D68541C0B79; Thu,  4 Feb 2021 15:53:08 +0100 (CET)
Date:   Thu, 4 Feb 2021 15:53:08 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Message-ID: <20210204145308.GC14305@duo.ucw.cz>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <20210204143738.28036-1-schuchmann@schleissheimer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-02-04 14:37:38, Sven Schuchmann wrote:
> In order to use a multicolor-led together with a trigger
> the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
>=20
> This patch adds the ability to set the default intensity
> of each multi-led node so that it is turned on from DT.
> If no intensity is given the led will be initialized
> with full intensity.



> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index f13117eed976..4b40bf66483c 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -267,7 +267,6 @@ struct lp50xx_led {
>  	struct led_classdev_mc mc_cdev;
>  	struct lp50xx *priv;
>  	unsigned long bank_modules;
> -	int led_intensity[LP50XX_LEDS_PER_MODULE];
>  	u8 ctrl_bank_enabled;
>  	int led_number;
>  };

? Does not make sense and changelog does not help.
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBwKVAAKCRAw5/Bqldv6
8oCFAJ9k4DUcckX7+8MT0vDnApXzxdtzBgCfQkZntDCEehkBwZ3s3XF5XDAmPoA=
=LhYK
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
