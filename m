Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4CEC9068
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 20:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfJBSG2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 14:06:28 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45259 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfJBSG2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 14:06:28 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2E31D802D9; Wed,  2 Oct 2019 20:06:11 +0200 (CEST)
Date:   Wed, 2 Oct 2019 20:06:25 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH -next 2/2] leds: add /sys/class/leds/<led>/current-trigger
Message-ID: <20191002180625.GB13492@amd>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
 <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
 <ec4d9d2c-6f8d-97a6-41d7-832a3fc1ca72@ti.com>
 <589ba4d7-31f5-c789-d5ca-c13650cf5b03@gmail.com>
 <79102915-5510-40e7-b4be-073e1c85bda6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <79102915-5510-40e7-b4be-073e1c85bda6@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>diff --git a/Documentation/ABI/testing/sysfs-class-led
> >>>b/Documentation/ABI/testing/sysfs-class-led
> >>>index 5f67f7a..fdfed3f 100644
> >>>--- a/Documentation/ABI/testing/sysfs-class-led
> >>>+++ b/Documentation/ABI/testing/sysfs-class-led
> >>>@@ -61,3 +61,16 @@ Description:
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 gpio and backlight triggers. In case of t=
he backlight trigger,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 it is useful when driving a LED which is =
intended to indicate
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 a device in a standby like state.
> >>>+
> >>>+What:=A0=A0=A0=A0=A0=A0=A0 /sys/class/leds/<led>/current-trigger
> >>>+Date:=A0=A0=A0=A0=A0=A0=A0 September 2019
> >>>+KernelVersion:=A0=A0=A0 5.5
> >>>+Contact:=A0=A0=A0 linux-leds@vger.kernel.org
> >>>+Description:
> >>>+=A0=A0=A0=A0=A0=A0=A0 Set the trigger for this LED. A trigger is a ke=
rnel based source
> >>>+=A0=A0=A0=A0=A0=A0=A0 of LED events.
> >>>+=A0=A0=A0=A0=A0=A0=A0 Writing the trigger name to this file will chan=
ge the current
> >>>+=A0=A0=A0=A0=A0=A0=A0 trigger. Trigger specific parameters can appear=
 in
> >>>+=A0=A0=A0=A0=A0=A0=A0 /sys/class/leds/<led> once a given trigger is s=
elected. For
> >>>+=A0=A0=A0=A0=A0=A0=A0 their documentation see sysfs-class-led-trigger=
-*.
> >>>+=A0=A0=A0=A0=A0=A0=A0 Reading this file will return the current LED t=
rigger name.
> >>Why do we need this new file can't we just update the current trigger
> >>file implementation?
> >We can't change existing ABI. It doesn't matter if it is documented
> >or not - it's in place for very long time and you can't guarantee there
> >are no users relying on triggers file show format.
>=20
> So if it has been in place for a very long time why do we need another ABI
> that does sorta the same thing?
>=20
> This seems to be a bit confusing and extra.

Agreed. Lets simply keep the existing ABI.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2U5yEACgkQMOfwapXb+vJIEwCfR85PLF1UbHUG4F2VpQuhPOvZ
fhgAoIMUuiNqIPLRAARGoLUOtdUfMHVO
=Pm1l
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
