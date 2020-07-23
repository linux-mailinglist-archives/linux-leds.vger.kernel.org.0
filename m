Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FEC22B84B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 23:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgGWVEy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 17:04:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39148 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgGWVEy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 17:04:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0FB7C1C0BF0; Thu, 23 Jul 2020 23:04:53 +0200 (CEST)
Date:   Thu, 23 Jul 2020 23:04:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723210452.c63oup3k7w4icqc6@duo.ucw.cz>
References: <20200723125751.4045-1-marek.behun@nic.cz>
 <20200723193908.GA26165@amd>
 <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
 <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
 <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
 <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
 <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
 <854ee2f0-4dd1-b665-f216-bff33ab3b571@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a2oy7q7txgwspytq"
Content-Disposition: inline
In-Reply-To: <854ee2f0-4dd1-b665-f216-bff33ab3b571@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--a2oy7q7txgwspytq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable




> > ...but really, unless there's device where there are leds of
> > yellow/orange color... it may be easier to keep the current list.
>=20
> Yellow has been available since the inception of the led_colors array,
> so if we have that, then why we should not have orange?

I fear people will confuse yellow and orange.

> > IOW "are we solving real problem by introducing orange color"?
>=20
> Yes, we allow to accurately describe LEDs available
> on the market.

That should not be our goal.

If we wanted accurate description, it would be wavelength in nm for
monochrome LEDs. (Incidentally, that's what manufacturers use and we
may want to do that for RGB LEDs).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--a2oy7q7txgwspytq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxn7dAAKCRAw5/Bqldv6
8lgqAKCoTNYHfquqssKId1IE6xIN2rC+ZwCdGuauCoODrO3jfNA/+JgwXEeFPvM=
=J8zh
-----END PGP SIGNATURE-----

--a2oy7q7txgwspytq--
