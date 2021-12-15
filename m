Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E5747637B
	for <lists+linux-leds@lfdr.de>; Wed, 15 Dec 2021 21:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbhLOUkC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Dec 2021 15:40:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47170 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbhLOUkC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Dec 2021 15:40:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 279741C0B98; Wed, 15 Dec 2021 21:40:01 +0100 (CET)
Date:   Wed, 15 Dec 2021 21:39:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        simon.guinot@sequanux.org, kabel@kernel.org
Cc:     linux-leds@vger.kernel.org, j.anaszewski@samsung.com
Subject: Re: [bug report] leds: ns2: Remove work queue
Message-ID: <20211215203955.GG28336@duo.ucw.cz>
References: <20211210135249.GA16777@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline
In-Reply-To: <20211210135249.GA16777@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Hello LED devs,
>=20
> The patch c29e650b3af2: "leds: ns2: Remove work queue" from Nov 20,
> 2015, leads to the following Smatch static checker warning:
>=20
> 	drivers/leds/leds-ns2.c:96 ns2_led_set_mode()
> 	warn: sleeping in atomic context

Yup, this looks wrong.

Plus, the code is quite crazy.

Not sure what the write_lock in that function is supposed to protect
against. Perhaps it can be just removed?

Hmm. led_set_mode uses custom interface for hardware accelerated
LED. Ideally there's more fixing to be done there :-(.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYbpSmwAKCRAw5/Bqldv6
8j6VAJsFKh50j00S4SQ5t+ttUvk8P5csmACfdG0uZKXNcfquPGPzqOW5p2emzeM=
=+vxs
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
