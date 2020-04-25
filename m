Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A141B8970
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgDYUs2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:48:28 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59870 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUs1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:48:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4BFFD1C0239; Sat, 25 Apr 2020 22:48:26 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:48:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 00/17] Multicolor Framework (array edition)
Message-ID: <20200425204825.GG23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AGZzQgpsuUlWC1xT"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--AGZzQgpsuUlWC1xT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This is the multi color LED framework.   This framework presents clustered
> colored LEDs into an array and allows the user space to adjust the bright=
ness
> of the cluster using a single file write.  The individual colored LEDs
> intensities are controlled via a single file that is an array of
> LEDs

Thanks for the series.

I believe 6/, 11/, 15/, 16/ could be applied now. Should I do that?

8..10/ might be ready, too... but I'm not relevant maintainer, so
you'll need to push them separately. I added my acks.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AGZzQgpsuUlWC1xT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6kohkACgkQMOfwapXb+vLpywCgtnFlcDBg/pxDI0KMk2G36Aqn
m+wAn39TLf6iQqWHndo1xzZbd/hCybVK
=r30Z
-----END PGP SIGNATURE-----

--AGZzQgpsuUlWC1xT--
