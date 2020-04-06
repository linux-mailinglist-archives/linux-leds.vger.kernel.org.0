Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509EC19FFF2
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 23:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgDFVKG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 17:10:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44690 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgDFVKG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 17:10:06 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 34C9C1C47EC; Mon,  6 Apr 2020 23:10:05 +0200 (CEST)
Date:   Mon, 6 Apr 2020 23:10:04 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200406211004.GC12611@amd.ucw.cz>
References: <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
 <20200328132729.5e628fe6@nic.cz>
 <20200328133629.79603fe3@nic.cz>
 <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
 <20200328182025.0b33200e@nic.cz>
 <7a12c510-605c-b31f-79e6-cccf3e29c682@gmail.com>
 <20200402162950.5c2847be@nic.cz>
 <f7e641a1-c113-9c33-f6bb-256a8e59b92e@gmail.com>
 <20200402225730.2e6d9154@nic.cz>
 <34c7c829-b478-1c13-ead8-12c6577febfe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline
In-Reply-To: <34c7c829-b478-1c13-ead8-12c6577febfe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> so now we have
> >>>   device:color:function
> >>> what if we made it so that there was a 4th part of LED name, ie
> >>>   group:device:color:function
> >>> ?
> >>>
> >>> Would this be a problem? =20
> >>
> >> Indeed, the device alone would not be a sufficient differentiator
> >> since it is possible to have more than one LED controller of the
> >> same type on the board.
> >>
> >> Nonetheless, I'd rather avoid the addition of a new generic section.
> >> Probably we would have to make it specific to this device.
> >>
> >=20
> > Ok, in that case I will do it so that devicename is "omnia".
> > devicename_mandatory should be set to true, yes?
>=20
> If you want to have four sections then you must compose LED
> name yourself and not use new *ext() API. But please hold on,
> since I suppose Pavel will have something to add to that.

Lets just handle global brightness outside LED subsystem.

And drop the omnia: .. it is useless. For some of your leds it should
be "ethX:...:activity".

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXouarAAKCRAw5/Bqldv6
8q3AAJwNBgJY/bEDE2Hkh1NB5NsT+FaehQCgiIsuy5UOdhkEQvjDBY8Ybavyv9g=
=wCKY
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
