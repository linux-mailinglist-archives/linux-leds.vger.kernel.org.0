Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA3718DF66
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 11:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgCUKXS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 06:23:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48306 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgCUKXS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 06:23:18 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3BD771C0320; Sat, 21 Mar 2020 11:23:16 +0100 (CET)
Date:   Sat, 21 Mar 2020 11:23:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: HW LED triggers again
Message-ID: <20200321102315.GA9324@amd>
References: <20200320204308.411f8d68@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20200320204308.411f8d68@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I want to open the discussions about HW LED triggers again.
> The last time (which was almost a year ago, sorry for that) I proposed
> an API which used the same sysfs trigger file as for regular trigger
> setting, but the HW triggers were prefixed with "hw:" (and each LED
> classdev can have different ones).
>=20
> You wrote:
=2E..
> I would still like to go this way, so my answer to this questions is:
> - IMO this is simpler for users and existing scripts
> - the idea is that it should no be possible to set a software trigger
>   and a hardware trigger at the same time (this would just end up in
>   more complications), and introducing special hw_trigger file or
>   something could make users think that you can

As usual, devil is in the details, but so far, I like the proposal.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl516xMACgkQMOfwapXb+vIoTgCePM4TM9MH4DTMUeMzSMbHwFMY
N3UAn3sYW4dEGKGzRJJoj87F3118/YlJ
=j7Bh
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
