Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8E74F0A8
	for <lists+linux-leds@lfdr.de>; Sat, 22 Jun 2019 00:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfFUWN2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Jun 2019 18:13:28 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48239 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfFUWN2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Jun 2019 18:13:28 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2CCC2805DE; Sat, 22 Jun 2019 00:13:15 +0200 (CEST)
Date:   Sat, 22 Jun 2019 00:13:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Brian Dodge <bdodge09@gmail.com>, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Peter Bacon <pbacon@psemi.com>
Subject: Re: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Message-ID: <20190621221325.GA2343@amd>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [Sorry to those receiving this twice... had to dig this out from the
> archives and sent it to the lists from the wrong mailer]
>=20
> On 27/11/2018 00:44, Brian Dodge wrote:
> >Thank you Pavel, that is a good point.
> >
> >The chip vendor has indicated that there is no reason to maintain the
> >old/improper prefix and wishes to go forward (only) with the "arctic"
> >prefix and any existing dts files are or will be updated.
>=20
> Looks like this patch series has fallen into the cracks a little.
>=20
> I think I assumed this info would end in the description of patch v2 1/3 =
(in
> order to answer Rob's feedback) and I sat and waited for a respin. On the
> other hand... I didn't actually say that explicitly anywhere! So... I'd
> recommend a respin perhaps with a small bit of text explaining how the
> vendor can state that any existing dts files will be updated. This is a
> peripheral device so these strings are probably embedded into OEM
> devicetrees rather than exclusively under the control of the vendor.

So in next email you give good reason not to apply this :-).

Anyway, this is Doc*/devicetree/, so not my area.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0NVoUACgkQMOfwapXb+vKcPQCeMXZLMpPGhmvkuIH+olZhfCFk
CVIAoLN12wP5S77RinlmdQ/jZIZqwCWD
=7Nqr
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
