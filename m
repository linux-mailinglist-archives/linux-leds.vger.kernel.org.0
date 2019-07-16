Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B610D6AFCB
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 21:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfGPT2I (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 15:28:08 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47311 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPT2I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 15:28:08 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7C66D80593; Tue, 16 Jul 2019 21:27:54 +0200 (CEST)
Date:   Tue, 16 Jul 2019 21:28:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH 5/6] leds: apu: fix error on probing failure
Message-ID: <20190716192805.GE10400@amd>
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-6-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline
In-Reply-To: <1563202653-20994-6-git-send-email-info@metux.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 16:57:32, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
>=20
> The current error message on failed probing tends to be a bit
> misleading. Fix it to tell exactly that an APU v1 was not found.
>=20
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/leds/leds-apu.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
> index 451cb9f..892fea7 100644
> --- a/drivers/leds/leds-apu.c
> +++ b/drivers/leds/leds-apu.c
> @@ -170,13 +170,9 @@ static int __init apu_led_init(void)
>  	struct platform_device *pdev;
>  	int err;
> =20
> -	if (!dmi_match(DMI_SYS_VENDOR, "PC Engines")) {
> -		pr_err("No PC Engines board detected\n");
> -		return -ENODEV;
> -	}
> -	if (!(dmi_match(DMI_PRODUCT_NAME, "APU"))) {
> -		pr_err("Unknown PC Engines board: %s\n",
> -				dmi_get_system_info(DMI_PRODUCT_NAME));
> +	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
> +	      dmi_match(DMI_PRODUCT_NAME, "APU"))) {
> +		pr_err("No PC Engines APUv1 board detected\n");

You may want to add here: "For APUv2,3 support, enable CONFIG_xxx".

If you have any APUv2 users (and you may), this si chance to get their
attention.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0uJUUACgkQMOfwapXb+vITAQCgpmLDfopl+tqzT8H7ZJndlrxD
m54An1S+GSHoiMWyLP9MPPyxcJEVzmt2
=dx8m
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
