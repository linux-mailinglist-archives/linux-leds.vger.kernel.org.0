Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1C61302E9
	for <lists+linux-leds@lfdr.de>; Thu, 30 May 2019 21:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfE3TkK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 May 2019 15:40:10 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33113 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfE3TkK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 May 2019 15:40:10 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 314F780337; Thu, 30 May 2019 21:39:57 +0200 (CEST)
Date:   Thu, 30 May 2019 21:40:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
Message-ID: <20190530194006.GA22367@amd>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
 <20190527103355.GA5287@amd>
 <522728b0-147b-3708-fea1-88a895491e05@ti.com>
 <34dbfab0-0dd4-cf9a-ed86-a74363981077@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <34dbfab0-0dd4-cf9a-ed86-a74363981077@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-05-28 06:34:47, Dan Murphy wrote:
> Pavel
>=20
> On 5/27/19 7:45 PM, Dan Murphy wrote:
> >Pavel
> >
> >On 5/27/19 5:33 AM, Pavel Machek wrote:
> >>On Thu 2019-05-23 14:08:12, Dan Murphy wrote:
> >>>Add a documentation of LED Multicolor LED class specific
> >>>sysfs attributes.
> >>>
> >>>Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>>---
> >>>=A0 .../ABI/testing/sysfs-class-led-multicolor=A0=A0=A0 | 57
> >>>+++++++++++++++++++
> >>>=A0 1 file changed, 57 insertions(+)
> >>>=A0 create mode 100644
> >>>Documentation/ABI/testing/sysfs-class-led-multicolor
> >>>
> >>>diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor
> >>>b/Documentation/ABI/testing/sysfs-class-led-multicolor
> >>>new file mode 100644
> >>>index 000000000000..2f102ede258b
> >>>--- /dev/null
> >>>+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> >>>@@ -0,0 +1,57 @@
> >>>+What:=A0=A0=A0=A0=A0=A0=A0 /sys/class/leds/<led>/colors/sync_enable
> >>>+Date:=A0=A0=A0=A0=A0=A0=A0 April 2019
> >>I believe I suggested more reasonable interface. Why not use that?
> >>
> >
> >Can you please provide the reference to your interface?
> >
> I think I found the suggestion [0].=A0 Assuming that was the suggestion it
> violates the kernel 1 value/file and there was agreement that this interf=
ace
> had value. In testing the interface, it made sense to be able to

1 value/file is actually slightly more complex rule:

Attributes should be ASCII text files, preferably with only one value
per file. It is noted that it may not be efficient to contain only one
value per file, so it is socially acceptable to express an array of
values of the same type.

See sysfs.txt. Proposed "sync_enable" is ugly enough, and the values
really are array of values of same type, so we should be ok with nicer
interface.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzwMZYACgkQMOfwapXb+vI8kACeI37r0eiFv/mgu7wPB7ylJwT3
vpwAn3CQPq9ECn9UTVYgiTl947hx0+zO
=nQ/Y
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
