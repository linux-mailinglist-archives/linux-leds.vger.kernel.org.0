Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0F232271F
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 09:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhBWIfd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 03:35:33 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47094 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbhBWIfd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 03:35:33 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 57E661C0B82; Tue, 23 Feb 2021 09:34:50 +0100 (CET)
Date:   Tue, 23 Feb 2021 09:34:49 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
Message-ID: <20210223083449.GA9750@amd>
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <20210223081732.9362-2-noltari@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2021-02-23 09:17:31, =C1lvaro Fern=E1ndez Rojas wrote:
> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in bcm2835-r=
ng
> and bcmgenet drivers.
> Both should also be inline functions.



> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -	iowrite32be(data, reg);
> -#else
> -	writel(data, reg);
> -#endif
> +	/* MIPS chips strapped for BE will automagically configure the
> +	 * peripheral registers for CPU-native byte order.
> +	 */

Bad comment style.

> +	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> +		__raw_writel(data, reg);
> +	else
> +		writel_relaxed(data, reg);
>  }

Code does not match comment (still need to do conversion on
non-MIPS?), and it certainly should not be here (do all mipsen behave
like that?!), and it really should not be converting to _relaxed at
the same time.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA0vikACgkQMOfwapXb+vKMTACgugzKKrfnyzgFO2G+yCZsdLh2
i8oAn006G+WWIcArR+LjGWMnqfAdofio
=VWQL
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
