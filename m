Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C1D173445
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2020 10:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgB1Jj0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Feb 2020 04:39:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33602 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgB1JjZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2020 04:39:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BB4AA1C030F; Fri, 28 Feb 2020 10:39:23 +0100 (CET)
Date:   Fri, 28 Feb 2020 10:39:23 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Greg KH <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@denx.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200228093923.GC27860@amd>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
 <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz>
 <20200227124329.GA994747@kroah.com>
 <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
 <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
> >> represent a single output should be fine.
> >> thanks,
>=20
> Thank you for making this clear.
>=20
> Effectively, the way to go as I see it now is just moving from
> colors directory to channel_intensity and channel_names files.

Yes.

> Besides that, since the issue of backwards compatibility with
> LED class still remains, we need to apply the already worked out
> formula for mapping brightness to color iout values.
>=20
> This implies that color values written to channel_intensity file
> will be written unchanged to the hw only when global brightness
> is equal to max_brightness. This is because they will be multiplied
> by brightness / max_brightness ratio.
>=20
> Do you agree, Pavel?

Yes. That seems like possible solution.

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5Y38sACgkQMOfwapXb+vJHkwCgofCcau0VBti/twGZP1zeOZV+
9X4An1TLM76oJaHBTOHcUTt3MF1J5VG5
=EYF3
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
