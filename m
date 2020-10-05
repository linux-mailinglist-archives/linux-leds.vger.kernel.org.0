Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6824283EE0
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 20:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgJESjy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 14:39:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34966 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbgJESjq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 14:39:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D47C11C0B77; Mon,  5 Oct 2020 20:39:43 +0200 (CEST)
Date:   Mon, 5 Oct 2020 20:39:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     ultracoolguy@tutanota.com
Cc:     Alexander Dahl <post@lespocky.de>, Dmurphy <dmurphy@ti.com>,
        Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005183943.GA12622@duo.ucw.cz>
References: <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
 <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
 <MItOR9Z--3-2@tutanota.com>
 <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
 <MItjEho--3-2@tutanota.com>
 <20201005173227.GA6431@duo.ucw.cz>
 <MIu0jNf--3-2@tutanota.com>
 <MIu12FE--3-2@tutanota.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <MIu12FE--3-2@tutanota.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-05 20:31:16, ultracoolguy@tutanota.com wrote:
> Otherwise everything works great :)
>=20
> (And sorry for sending two emails)

No problem, sorry for breaking your patch. I moved it near other
initializers.

Question: is it likely that someone will want to use your device with
-stable kernels? Should I mark this for -stable?

Thanks and best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3tobwAKCRAw5/Bqldv6
8ik+AJ99ASIfUL0KTOmxk+ElSoh6LHYiSwCffwOdAq1b5W49HVfUNdAPPSUFcvs=
=uhqM
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
