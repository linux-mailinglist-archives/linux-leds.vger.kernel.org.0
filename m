Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3640C283D53
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 19:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgJERca (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 13:32:30 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54042 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbgJERca (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 13:32:30 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C4C771C0B76; Mon,  5 Oct 2020 19:32:27 +0200 (CEST)
Date:   Mon, 5 Oct 2020 19:32:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     ultracoolguy@tutanota.com
Cc:     Alexander Dahl <post@lespocky.de>, Dmurphy <dmurphy@ti.com>,
        Marek Behun <kabel@blackhole.sk>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005173227.GA6431@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com>
 <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
 <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
 <MItOR9Z--3-2@tutanota.com>
 <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
 <MItjEho--3-2@tutanota.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <MItjEho--3-2@tutanota.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Agh. I added the Signed-off-by in an earlier non-published version of the=
 commit, but forgot to add it back. But that doesn't really excuses me.
>=20
> I attached the (hopefully) final version of this patch.=A0 Pavel, I'll se=
nd the struct rename separately after I submit this.=20
>

Thanks, I applied it with ... some tweaks. I hope I did not break it,
and would not mind testing.

Best regards,
								Pavel
							=09

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3tYqwAKCRAw5/Bqldv6
8mEcAKC6dPmboFy3vCmp1wUQGscDmLUoywCgkRW+rAF96cPV2rQ6MA0RQpUXisI=
=GS5y
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
