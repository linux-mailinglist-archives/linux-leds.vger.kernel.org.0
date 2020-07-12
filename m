Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B271E21C7F3
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 10:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgGLIAw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 04:00:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49092 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGLIAw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 04:00:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CDCD11C0BDD; Sun, 12 Jul 2020 10:00:50 +0200 (CEST)
Date:   Sun, 12 Jul 2020 10:00:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200712080050.GD8295@amd>
References: <20200423065100.2652-1-marek.behun@nic.cz>
 <20200423065100.2652-2-marek.behun@nic.cz>
 <20200511194354.GA15606@bogus>
 <20200511220151.24985832@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline
In-Reply-To: <20200511220151.24985832@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > What's the numbering here based on? Might be better to use 'reg' (and a=
=20
> > unit-address) rather than led-sources. led-sources was for cases where=
=20
> > the control interface (defined by reg) could have differing regulators=
=20
> > connected to the LEDs.
>=20
> Jacek, Pavel, it seems that it would be better if I just rewrote the
> driver into Dan's multicolor API. It would solve Rob's complaint and
> could be merged once multicolor framework is...

It would be great to try that now. Multicolor is now very close to
being merged, and having independend verification that it works would
be great.

Thank you,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KwzIACgkQMOfwapXb+vLqdwCfXLtB9FBslOwUzD7Jl8qnpPNS
C68AniBAkejpYMFX4mBvFWjVMeh83ik8
=Hpmu
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
