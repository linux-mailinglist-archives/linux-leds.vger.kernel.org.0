Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6677E6CD10
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 13:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfGRLD4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jul 2019 07:03:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56194 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfGRLD4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jul 2019 07:03:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 49CFB80280; Thu, 18 Jul 2019 13:03:42 +0200 (CEST)
Date:   Thu, 18 Jul 2019 13:03:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com,
        linux@roeck-us.net, dmurphy@ti.com
Subject: Re: [PATCH v5 26/26] leds: Document standard LED functions
Message-ID: <20190718110352.GB3859@amd>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-27-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20190609190803.14815-27-jacek.anaszewski@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add a documentation for standard LED functions with regard
> to differences in meaning between cases when devicename section
> of LED name is present or not.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  Documentation/leds/led-functions.txt | 223 +++++++++++++++++++++++++++++=
++++++
>  Documentation/leds/leds-class.txt    |   3 +
>  2 files changed, 226 insertions(+)
>  create mode 100644 Documentation/leds/led-functions.txt
>=20
> diff --git a/Documentation/leds/led-functions.txt b/Documentation/leds/le=
d-functions.txt
> new file mode 100644
> index 000000000000..003b6b6271d1
> --- /dev/null
> +++ b/Documentation/leds/led-functions.txt
> @@ -0,0 +1,223 @@
> +This file presents standardized LED functions and their meaning.
> +
> +Each LED function is described using below template:
> +
> +- LED function name
> +    NDEV : <function meaning when LED devicename section is absent>
> +    DEV  : <function meaning when LED devicename section is present>
> +    DEVICENAME : <expected LED devicename for DEV case>
> +    TRIGGER: <matching LED trigger>
> +
> +/* LED functions with corresponding trigger support */
> +
> +- activity
> +    NDEV : system activity
> +    DEV  : n/a
> +    TRIGGER : "activity"
> +
> +- backlight
> +    NDEV : n/a
> +    DEV  : backlight of a frame buffer device
> +    DEVICENAME : associated frame buffer device, e.g. fb0
> +    TRIGGER: "backlight"

ndev: if there's single one on the platform?

> +- capslock
> +    NDEV : n/a
> +    DEV  : keyboard capslock state related to the specified input device
> +    DEVICENAME : associated input device, e.g. input1
> +    TRIGGER : "kbd-capslock"
> +

> +- disk
> +    NDEV : rw activity on any disk in the system
> +    DEV  : rw activity on specified disk
> +    DEVICENAME : associated disk, e.g.: hda, sdb
> +    TRIGGER : "disk-activity", applies only to NDEV case

I'd sort this file according to the places where these leds are
usually are present, to make it simpler for user to find the
labels. capslock should go near scrollock etc.

Plus I guess explanation in which systems such LED is found would be
good.

Global "disk" LED is very common on the PCs, and we should make sure
such LEDs have consistent labeling everywhere.

> +- disk-read
> +    NDEV : read activity on any disk in the system
> +    DEV  : read activity on specified disk
> +    DEVICENAME : associted disk, e.g.: hda, sdb
> +    TRIGGER : "disk-read", applies only to NDEV case
> +
> +- disk-write
> +    NDEV : write activity on any disk in the system
> +    DEV  : write activity on specified disk
> +    DEVICENAME : associated disk, .e.g" hda, sdb
> +    TRIGGER : "disk-write", applies only to NDEV case

I don't see separated read/write LEDs very often. To keep the file
size down, I'd list is at "disk-read, disk-write".

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0wUhgACgkQMOfwapXb+vKGYACgs2TuWOfYBCe91uiqc/tYeaw8
BIQAoML1uUIEDAHJbWxeawy91zzmNzQA
=plXe
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
