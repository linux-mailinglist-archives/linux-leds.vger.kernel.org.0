Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00E5156CEA
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2020 23:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgBIWqS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Feb 2020 17:46:18 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:60322 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgBIWqS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Feb 2020 17:46:18 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C6C361C210C; Sun,  9 Feb 2020 23:46:16 +0100 (CET)
Date:   Sun, 9 Feb 2020 23:46:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 0/5] leds: Add DT node finding and parsing to core
Message-ID: <20200209224615.GA20238@amd>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
 <ed000cda-3138-3172-1b4c-586b5bfd8d72@metux.net>
 <946f091e79242b9e71d5ce8ad12c899feefa22cd.camel@fi.rohmeurope.com>
 <56d3a81e-f675-fd5e-06a7-8039bf02468e@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <56d3a81e-f675-fd5e-06a7-8039bf02468e@metux.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Personally, I also like to use LED subsystem as frontend for things like
> gpio-driven relais, etc, and assign semantically fitting names instead
> of "technical" ones,

Don't do that. Maybe we need "named GPIOs", but lets not abuse LED
subsystem for that. (Even if I may have made that mistake before).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5Ai7cACgkQMOfwapXb+vLgHQCfafddrU8y/Kdg15J7DBu2lXuD
MasAmwSXHhX554+vItdht3+18SK0hlg2
=chVK
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
