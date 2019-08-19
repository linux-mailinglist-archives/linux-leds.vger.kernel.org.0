Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDB1921B6
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 12:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfHSKzV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 06:55:21 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36482 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSKzV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 06:55:21 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7B24E80B64; Mon, 19 Aug 2019 12:55:06 +0200 (CEST)
Date:   Mon, 19 Aug 2019 12:55:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] leds: lm3532: Add full scale current configuration
Message-ID: <20190819105519.GG21072@amd>
References: <20190813181154.6614-1-dmurphy@ti.com>
 <20190813181154.6614-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Content-Disposition: inline
In-Reply-To: <20190813181154.6614-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Allow the full scale current to be configured at init.
> Valid rangles are 5mA->29.8mA.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

> @@ -121,6 +125,7 @@ struct lm3532_als_data {
>   * @mode - Mode of the LED string
>   * @ctrl_brt_pointer - Zone target register that controls the sink
>   * @num_leds - Number of LED strings are supported in this array
> + * @full_scale_current - The full-scale current setting for the current =
sink.
>   * @led_strings - The LED strings supported in this array
>   * @label - LED label
>   */
> @@ -130,8 +135,9 @@ struct lm3532_led {
> =20
>  	int control_bank;
>  	int mode;
> -	int ctrl_brt_pointer;
>  	int num_leds;
> +	int ctrl_brt_pointer;
> +	int full_scale_current;
>  	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
>  	char label[LED_MAX_NAME_SIZE];
>  };

No need to move ctrl_brt_pointer... to keep order consistent with docs.=20

> +		fs_current_val =3D led->full_scale_current - LM3532_FS_CURR_MIN /
> +				 LM3532_FS_CURR_STEP;

The computation is wrong ... needs () AFAICT.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1agBcACgkQMOfwapXb+vLmlwCePMg9TFTU7TWJmlid/fNhp/+m
X/YAn2qt8myzF3DVB+yvRViZfvO8Lbc6
=fEeD
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
