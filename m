Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECAB32C363
	for <lists+linux-leds@lfdr.de>; Thu,  4 Mar 2021 01:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbhCCX7x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Mar 2021 18:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbhCCTgH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Mar 2021 14:36:07 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [IPv6:2a00:da80:fff0:2::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D41FC061760;
        Wed,  3 Mar 2021 11:35:26 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1509A1C0B88; Wed,  3 Mar 2021 20:31:35 +0100 (CET)
Date:   Wed, 3 Mar 2021 20:31:34 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Message-ID: <20210303193134.GB8720@amd>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-3-henning.schild@siemens.com>
 <20210302205452.GA32573@duo.ucw.cz>
 <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +static struct simatic_ipc_led simatic_ipc_leds_io[] =3D {
> > > +	{1 << 15, "simatic-ipc:green:run-stop"},
> > > +	{1 << 7,  "simatic-ipc:yellow:run-stop"},
> > > +	{1 << 14, "simatic-ipc:red:error"},
> > > +	{1 << 6,  "simatic-ipc:yellow:error"},
> > > +	{1 << 13, "simatic-ipc:red:maint"},
> > > +	{1 << 5,  "simatic-ipc:yellow:maint"},
> > > +	{0, ""},
> > > +}; =20
> >=20
> > Please use names consistent with other systems, this is user
> > visible. If you have two-color power led, it should be
> > :green:power... See include/dt-bindings/leds/common.h .
>=20
> Well we wanted to pick names that are printed on the devices and would
> like to stick to those. Has been a discussion ...
> Can we have symlinks to have multiple names per LED?

No symlinks. We plan to have command line tool to manipulate LEDs,
aliases might be possible there.

> How strong would you feel about us using our names?

Strongly. :-)

Do you have a picture how the leds look like?

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA/5BYACgkQMOfwapXb+vIK9wCfQwnYrmkVRInVpriJCbZaZoMW
uVcAn0kh4wxyuJCBuz8Fi4tylz+NNX38
=INzV
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
