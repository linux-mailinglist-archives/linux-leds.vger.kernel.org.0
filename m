Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF01C2787
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2019 22:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731955AbfI3U6q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Sep 2019 16:58:46 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59095 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbfI3U6q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Sep 2019 16:58:46 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7F4998039B; Mon, 30 Sep 2019 19:22:25 +0200 (CEST)
Date:   Mon, 30 Sep 2019 19:22:39 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH 1/2] leds: Add flag to keep trigger always
Message-ID: <20190930172239.GA26107@amd>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
 <20190810071322.GA13760@amd>
 <20190930133902.GA2249614@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20190930133902.GA2249614@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-09-30 15:39:02, Greg KH wrote:
> On Sat, Aug 10, 2019 at 09:13:22AM +0200, Pavel Machek wrote:
> > On Fri 2019-08-09 17:52:46, Guru Das Srinagesh wrote:
> > > From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> > >=20
> > > Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 ("leds: disable trigg=
ers
> > > on brightness set") removes the trigger on an LED class device when
> > > brightness is set to 0. However, there are some LED class devices whi=
ch
> > > need the trigger not to be removed. In a use case like camera flash,
> > > camera flash driver passes in a trigger device to LED class driver. If
> > > the trigger is removed when the brightness is set to 0, this will aff=
ect
> > > the clients using those triggers. Hence add a flag to always keep the
> > > trigger even when brightness is set to 0.
> >=20
> > No.
> >=20
> > Yes, it would affect those clients. Don't do it, then. It is
> > root-only operation.
>=20
> I don't understand.  The original commit broke userspace operations.
> Shouldn't it be reverted, or fixed this way in order to have userspace
> work properly again?

So, what it is exactly that is not working? :-). Yes, root can
disconnect LED from v4l2 interface; he can also connect it
back. Documentation says that happens.

Yes, root can do stupid things.

Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 is from 2008. I'd
prefer we did not apply it in 2008, but...

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2SOd8ACgkQMOfwapXb+vJoOgCdHKr+waTJVpku+UyfUeLaPdZK
xtUAoI4RZXK+j08cnq5Vo90aQXCmUM3J
=Styd
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
