Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B08388C66
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 13:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346131AbhESLMb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 07:12:31 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41728 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240482AbhESLM2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 07:12:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 369961C0B7F; Wed, 19 May 2021 13:11:08 +0200 (CEST)
Date:   Wed, 19 May 2021 13:11:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210519111107.GC24621@duo.ucw.cz>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <cover.1621349813.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Some models come with single colored or dual-colored LEDs, but high end m=
odels=20
> have RGB LEDs.
>=20
> Programming them can ether be done via BIOS or by the OS, however, BIOS s=
ettings
> are limited. So, the vendor offers a Windows application that allows to f=
ully use the
> functionality provided by the firmware/hardware.

I'm not sure why you are submitting v2 in the middle of interface
discussion.

Marek and I are saying the same thing -- this needs to use close to
existing APIs.

If you want to get something merged quickly, please submit basic
functionality only (toggling the LED on/off) that completely fits
existing APIs. We can review that.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYKTySwAKCRAw5/Bqldv6
8t0cAJoCU8GzAVKo37yIvGKE0RyFawcMggCdF0Thm9f8RaqTsT8FqaEqEpRf2oM=
=BSEL
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
