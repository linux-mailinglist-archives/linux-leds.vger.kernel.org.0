Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA6E1823E5
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 22:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgCKVd0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 17:33:26 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33440 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgCKVd0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2020 17:33:26 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AD6761C031E; Wed, 11 Mar 2020 22:33:24 +0100 (CET)
Date:   Wed, 11 Mar 2020 22:33:09 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "20200309082218.13263-1-Denis.Osterland@diehl.com" 
        <20200309082218.13263-1-Denis.Osterland@diehl.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] leds: pwm: add support for default-state device
 property
Message-ID: <20200311213309.GB18398@amd>
References: <20200310123126.4709-1-Denis.Osterland@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20200310123126.4709-1-Denis.Osterland@diehl.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patch adds support for "default-state" devicetree property, which
> allows to defer pwm init to first use of led.
>=20
> This allows to configure the PWM early in bootloader to let the LED
> blink until an application in Linux userspace set something different.

"sets".

> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>

Looks good, I'll probably just apply it.

> index 6c6583c35f2f..d0f489680594 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> @@ -19,6 +19,8 @@ LED sub-node properties:
>    see Documentation/devicetree/bindings/leds/common.txt
>  - linux,default-trigger :  (optional)
>    see Documentation/devicetree/bindings/leds/common.txt
> +- default-state : (optional)
> +  see Documentation/devicetree/bindings/leds/common.yaml
> =20

Should other references be updated to common.yaml (as a separate patch)?

> diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
> index 93d101d28943..c9ef9012913d 100644
> --- a/include/linux/leds_pwm.h
> +++ b/include/linux/leds_pwm.h
> @@ -10,6 +10,7 @@ struct led_pwm {
>  	const char	*default_trigger;
>  	unsigned	pwm_id __deprecated;
>  	u8 		active_low;
> +	u8		default_state;
>  	unsigned 	max_brightness;
>  	unsigned	pwm_period_ns;
>  };

leds-pwm.c but leds_pwm.h. Hmm. This really should be leds-pwm.h.

Actually, leds-pwm.c is only user of leds_pwm.h, so that one should
just disappear...

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5pWRUACgkQMOfwapXb+vI0+QCglTSi3ENYbjGmsEnPVLDoLNJh
FooAoKaNKkuhzlCYfQuerN+1NMx7aBry
=Fb0M
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
