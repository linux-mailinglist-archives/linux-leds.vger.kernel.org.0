Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB43A2419FD
	for <lists+linux-leds@lfdr.de>; Tue, 11 Aug 2020 12:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgHKKye (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Aug 2020 06:54:34 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57818 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgHKKyc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2020 06:54:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AEC7C1C0BD8; Tue, 11 Aug 2020 12:54:28 +0200 (CEST)
Date:   Tue, 11 Aug 2020 12:54:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v32 2/6] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
Message-ID: <20200811105413.r2m2f7bubuz55rrt@duo.ucw.cz>
References: <20200722153146.8767-1-dmurphy@ti.com>
 <20200722153146.8767-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5gd3rgzruht2t34x"
Content-Disposition: inline
In-Reply-To: <20200722153146.8767-3-dmurphy@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5gd3rgzruht2t34x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +/* LP5009 and LP5012 registers */
> +#define LP5012_BNK_BRT		0x03
> +#define LP5012_BNKA_CLR		0x04
> +#define LP5012_BNKB_CLR		0x05
> +#define LP5012_BNKC_CLR		0x06
> +#define LP5012_LED0_BRT		0x07
> +#define LP5012_LED1_BRT		0x08
> +#define LP5012_LED2_BRT		0x09
> +#define LP5012_LED3_BRT		0x0a
> +#define LP5012_OUT0_CLR		0x0b
> +#define LP5012_OUT1_CLR		0x0c
> +#define LP5012_OUT2_CLR		0x0d
> +#define LP5012_OUT3_CLR		0x0e
> +#define LP5012_OUT4_CLR		0x0f
> +#define LP5012_OUT5_CLR		0x10
> +#define LP5012_OUT6_CLR		0x11
> +#define LP5012_OUT7_CLR		0x12
> +#define LP5012_OUT8_CLR		0x13
> +#define LP5012_OUT9_CLR		0x14
> +#define LP5012_OUT10_CLR	0x15
> +#define LP5012_OUT11_CLR	0x16
> +#define LP5012_RESET		0x17
> +
> +/* LP5018 and LP5024 registers */
> +#define LP5024_BNK_BRT		0x03
> +#define LP5024_BNKA_CLR		0x04
> +#define LP5024_BNKB_CLR		0x05
> +#define LP5024_BNKC_CLR		0x06
> +#define LP5024_LED0_BRT		0x07
> +#define LP5024_LED1_BRT		0x08
> +#define LP5024_LED2_BRT		0x09
> +#define LP5024_LED3_BRT		0x0a
> +#define LP5024_LED4_BRT		0x0b
> +#define LP5024_LED5_BRT		0x0c
> +#define LP5024_LED6_BRT		0x0d
> +#define LP5024_LED7_BRT		0x0e
> +
> +#define LP5024_OUT0_CLR		0x0f
> +#define LP5024_OUT1_CLR		0x10
> +#define LP5024_OUT2_CLR		0x11
> +#define LP5024_OUT3_CLR		0x12
> +#define LP5024_OUT4_CLR		0x13
> +#define LP5024_OUT5_CLR		0x14
> +#define LP5024_OUT6_CLR		0x15
> +#define LP5024_OUT7_CLR		0x16
> +#define LP5024_OUT8_CLR		0x17
> +#define LP5024_OUT9_CLR		0x18
> +#define LP5024_OUT10_CLR	0x19
> +#define LP5024_OUT11_CLR	0x1a
> +#define LP5024_OUT12_CLR	0x1b
> +#define LP5024_OUT13_CLR	0x1c
> +#define LP5024_OUT14_CLR	0x1d
> +#define LP5024_OUT15_CLR	0x1e
> +#define LP5024_OUT16_CLR	0x1f
> +#define LP5024_OUT17_CLR	0x20
> +#define LP5024_OUT18_CLR	0x21
> +#define LP5024_OUT19_CLR	0x22
> +#define LP5024_OUT20_CLR	0x23
> +#define LP5024_OUT21_CLR	0x24
> +#define LP5024_OUT22_CLR	0x25
> +#define LP5024_OUT23_CLR	0x26
> +#define LP5024_RESET		0x27
> +
> +/* LP5030 and LP5036 registers */
> +#define LP5036_LED_CFG1		0x03
> +#define LP5036_BNK_BRT		0x04
> +#define LP5036_BNKA_CLR		0x05
> +#define LP5036_BNKB_CLR		0x06
> +#define LP5036_BNKC_CLR		0x07
> +#define LP5036_LED0_BRT		0x08
> +#define LP5036_LED1_BRT		0x09
> +#define LP5036_LED2_BRT		0x0a
> +#define LP5036_LED3_BRT		0x0b
> +#define LP5036_LED4_BRT		0x0c
> +#define LP5036_LED5_BRT		0x0d
> +#define LP5036_LED6_BRT		0x0e
> +#define LP5036_LED7_BRT		0x0f
> +#define LP5036_LED8_BRT		0x10
> +#define LP5036_LED9_BRT		0x11
> +#define LP5036_LED10_BRT	0x12
> +#define LP5036_LED11_BRT	0x13
> +
> +#define LP5036_OUT0_CLR		0x14
> +#define LP5036_OUT1_CLR		0x15
> +#define LP5036_OUT2_CLR		0x16
> +#define LP5036_OUT3_CLR		0x17
> +#define LP5036_OUT4_CLR		0x18
> +#define LP5036_OUT5_CLR		0x19
> +#define LP5036_OUT6_CLR		0x1a
> +#define LP5036_OUT7_CLR		0x1b
> +#define LP5036_OUT8_CLR		0x1c
> +#define LP5036_OUT9_CLR		0x1d
> +#define LP5036_OUT10_CLR	0x1e
> +#define LP5036_OUT11_CLR	0x1f
> +#define LP5036_OUT12_CLR	0x20
> +#define LP5036_OUT13_CLR	0x21
> +#define LP5036_OUT14_CLR	0x22
> +#define LP5036_OUT15_CLR	0x23
> +#define LP5036_OUT16_CLR	0x24
> +#define LP5036_OUT17_CLR	0x25
> +#define LP5036_OUT18_CLR	0x26
> +#define LP5036_OUT19_CLR	0x27
> +#define LP5036_OUT20_CLR	0x28
> +#define LP5036_OUT21_CLR	0x29
> +#define LP5036_OUT22_CLR	0x2a
> +#define LP5036_OUT23_CLR	0x2b
> +#define LP5036_OUT24_CLR	0x2c
> +#define LP5036_OUT25_CLR	0x2d
> +#define LP5036_OUT26_CLR	0x2e
> +#define LP5036_OUT27_CLR	0x2f
> +#define LP5036_OUT28_CLR	0x30
> +#define LP5036_OUT29_CLR	0x31
> +#define LP5036_OUT30_CLR	0x32
> +#define LP5036_OUT31_CLR	0x33
> +#define LP5036_OUT32_CLR	0x34
> +#define LP5036_OUT33_CLR	0x35
> +#define LP5036_OUT34_CLR	0x36
> +#define LP5036_OUT35_CLR	0x37
> +#define LP5036_RESET		0x38

> +static const struct reg_default lp5012_reg_defs[] =3D {
=2E..
> +	{LP5012_OUT1_CLR, 0x00},
> +	{LP5012_OUT2_CLR, 0x00},
> +	{LP5012_OUT3_CLR, 0x00},
> +	{LP5012_OUT4_CLR, 0x00},
> +	{LP5012_OUT5_CLR, 0x00},
> +	{LP5012_OUT6_CLR, 0x00},
> +	{LP5012_OUT7_CLR, 0x00},
> +	{LP5012_OUT8_CLR, 0x00},
> +	{LP5012_OUT9_CLR, 0x00},
> +	{LP5012_OUT10_CLR, 0x00},
> +	{LP5012_OUT11_CLR, 0x00},
> +	{LP5012_RESET, 0x00}
> +};
> +
> +static const struct reg_default lp5024_reg_defs[] =3D {
=2E..
> +	{LP5024_OUT1_CLR, 0x00},
> +	{LP5024_OUT2_CLR, 0x00},
> +	{LP5024_OUT3_CLR, 0x00},
> +	{LP5024_OUT4_CLR, 0x00},
> +	{LP5024_OUT5_CLR, 0x00},
> +	{LP5024_OUT6_CLR, 0x00},
> +	{LP5024_OUT7_CLR, 0x00},
> +	{LP5024_OUT8_CLR, 0x00},
> +	{LP5024_OUT9_CLR, 0x00},
> +	{LP5024_OUT10_CLR, 0x00},
> +	{LP5024_OUT11_CLR, 0x00},
> +	{LP5024_OUT12_CLR, 0x00},
> +	{LP5024_OUT13_CLR, 0x00},
> +	{LP5024_OUT14_CLR, 0x00},
> +	{LP5024_OUT15_CLR, 0x00},
> +	{LP5024_OUT16_CLR, 0x00},
> +	{LP5024_OUT17_CLR, 0x00},
> +	{LP5024_OUT18_CLR, 0x00},
> +	{LP5024_OUT19_CLR, 0x00},
> +	{LP5024_OUT20_CLR, 0x00},
> +	{LP5024_OUT21_CLR, 0x00},
> +	{LP5024_OUT22_CLR, 0x00},
> +	{LP5024_OUT23_CLR, 0x00},
> +	{LP5024_RESET, 0x00}
> +};
> +
> +static const struct reg_default lp5036_reg_defs[] =3D {
> +	{LP5036_OUT1_CLR, 0x00},
> +	{LP5036_OUT2_CLR, 0x00},
> +	{LP5036_OUT3_CLR, 0x00},
> +	{LP5036_OUT4_CLR, 0x00},
> +	{LP5036_OUT5_CLR, 0x00},
> +	{LP5036_OUT6_CLR, 0x00},
> +	{LP5036_OUT7_CLR, 0x00},
> +	{LP5036_OUT8_CLR, 0x00},
> +	{LP5036_OUT9_CLR, 0x00},
> +	{LP5036_OUT10_CLR, 0x00},
> +	{LP5036_OUT11_CLR, 0x00},
> +	{LP5036_OUT12_CLR, 0x00},
> +	{LP5036_OUT13_CLR, 0x00},
> +	{LP5036_OUT14_CLR, 0x00},
> +	{LP5036_OUT15_CLR, 0x00},
> +	{LP5036_OUT16_CLR, 0x00},
> +	{LP5036_OUT17_CLR, 0x00},
> +	{LP5036_OUT18_CLR, 0x00},
> +	{LP5036_OUT19_CLR, 0x00},
> +	{LP5036_OUT20_CLR, 0x00},
> +	{LP5036_OUT21_CLR, 0x00},
> +	{LP5036_OUT22_CLR, 0x00},
> +	{LP5036_OUT23_CLR, 0x00},
> +	{LP5036_OUT24_CLR, 0x00},
> +	{LP5036_OUT25_CLR, 0x00},
> +	{LP5036_OUT26_CLR, 0x00},
> +	{LP5036_OUT27_CLR, 0x00},
> +	{LP5036_OUT28_CLR, 0x00},
> +	{LP5036_OUT29_CLR, 0x00},
> +	{LP5036_OUT30_CLR, 0x00},
> +	{LP5036_OUT31_CLR, 0x00},
> +	{LP5036_OUT32_CLR, 0x00},
> +	{LP5036_OUT33_CLR, 0x00},
> +	{LP5036_OUT34_CLR, 0x00},
> +	{LP5036_OUT35_CLR, 0x00},
> +	{LP5036_RESET, 0x00}
> +};

Actually... This is quite impressive ammount of code to
zero-initialize few registers. Could the regmap be told to set the
range to zero, or use loops to reduce ammount of code?

Thanks,
								Pavel


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5gd3rgzruht2t34x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzJ41QAKCRAw5/Bqldv6
8oD4AJ4ge2UwqpDybUf3vNQHCmAQL7JpNwCfbZMmXUCfubO2TUMRquAKgYI85LE=
=E0YK
-----END PGP SIGNATURE-----

--5gd3rgzruht2t34x--
