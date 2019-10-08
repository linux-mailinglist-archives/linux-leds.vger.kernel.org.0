Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFC9CF42B
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 09:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbfJHHre (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 03:47:34 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60429 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730209AbfJHHre (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 03:47:34 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 0165380477; Tue,  8 Oct 2019 09:47:16 +0200 (CEST)
Date:   Tue, 8 Oct 2019 09:47:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH 1/2] leds: Add flag to keep trigger always
Message-ID: <20191008074731.GB633@amd>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
 <20190810071322.GA13760@amd>
 <20190930133902.GA2249614@kroah.com>
 <20190930172239.GA26107@amd>
 <20190930172743.GA2409822@kroah.com>
 <20191004200932.GA28140@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20191004200932.GA28140@codeaurora.org>
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

> > > > I don't understand.  The original commit broke userspace operations.
> > > > Shouldn't it be reverted, or fixed this way in order to have usersp=
ace
> > > > work properly again?
> > >=20
> > > So, what it is exactly that is not working? :-). Yes, root can
> > > disconnect LED from v4l2 interface; he can also connect it
> > > back. Documentation says that happens.
> > >=20
> > > Yes, root can do stupid things.
> > >=20
> > > Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 is from 2008. I'd
> > > prefer we did not apply it in 2008, but...
> >=20
> > Ah, my fault, I thought this was a new commit.
> >=20
> > Guru, what are you doing here that this is required all of a sudden?  No
> > other kernel seems to need these changes, what is different in your
> > Android userspace that requires this patch series?
> >=20
> > thanks,
> >=20
> > greg k-h
>=20
> Hi Greg,
>=20
> Our camera flash driver first requests the available current from the
> flash LED before setting its brightness. It passes a trigger as argument
> to the function that determines the available current. This function
> uses trigger_to_lcdev() to look up the led_classdev associated with that
> trigger as a first step. This lookup will fail if the trigger has been
> dissociated from its led_classdev as a result of a user setting that
> led_classdev's brightness to zero manually through sysfs.=20
>=20
> Why would the user set the brightness to zero? The user does this as
> part of camera and LED testing activities which include, amongst other
> things, visual inspection of the operation of various onboard LEDs. The
> user uses sysfs to manually turn on and off the LEDs by setting their
> brightness to max and then to zero in order to verify that they are
> working as expected.

Yes, so you should really set trigger to none before changing
brightness manually and restore it back to whatever it was when you
are done with manual testing.

Thanks,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2cPxMACgkQMOfwapXb+vK+0wCfbggq9YJMl4GKAkrHg3LbJdu+
1ggAoJ2ZqAt2XqJvPsCjsdv/ac8rlt0v
=gqzV
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
