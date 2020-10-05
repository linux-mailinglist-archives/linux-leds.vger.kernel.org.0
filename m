Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42F6283BD2
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 17:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbgJEP7z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 11:59:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43490 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgJEP7z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 11:59:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7B48B1C0B76; Mon,  5 Oct 2020 17:59:53 +0200 (CEST)
Date:   Mon, 5 Oct 2020 17:59:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     ultracoolguy@tutanota.com, Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005155953.GB28675@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com>
 <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On 10/5/20 8:57 AM, ultracoolguy@tutanota.com wrote:
> > I agree with you.
> >=20
> > Attached patch with changes.
>=20
> Nack to the patch.

No need to do that, without matching From: and Signed-off, I can't
really apply it...

> The subject says it does one thing but you also unnecessarily changed the
> name of the structure.
>=20
> Renaming the structure does not fix the underlying issue

While I can't really apply it, it is fairly good bugreport. Can I get
minimal patch to fix the problem, that can be cc-ed to stable, and
that I can just apply with git am?

And yes, I believe renaming the structures to be non-confusing is a
very good thing, but lets make it separate patch, so that stable
backporting is easier.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3tC+QAKCRAw5/Bqldv6
8jm2AKCulWw1aOg6Ey/g6EtDhy6mKjWNOQCdH7nC3kVU6wwss7/uN27gElg0BP0=
=gvlE
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
