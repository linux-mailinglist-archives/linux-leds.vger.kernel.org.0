Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D19D3DAB02
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 20:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhG2Sfr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 14:35:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36352 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhG2Sfq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 14:35:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F14121C0B79; Thu, 29 Jul 2021 20:35:41 +0200 (CEST)
Date:   Thu, 29 Jul 2021 20:35:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH 0/8] Add configurable block device LED triggers
Message-ID: <20210729183541.GA6772@duo.ucw.cz>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729085413.GA16945@amd>
 <b108799e-24a2-d5ec-e18e-b7ae8bded085@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <b108799e-24a2-d5ec-e18e-b7ae8bded085@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-07-29 12:03:04, Ian Pilcher wrote:
> On 7/29/21 3:54 AM, Pavel Machek wrote:
> > We normally have a trigger ("block device activity") which can then
> > expose parameters ("I watch for read" and "I monitor sda1").
> >=20
> > Is there a reason normal solution can not be used?
>=20
> This big difference is that this allows different devices to drive
> different LEDs.  For example, my NAS has 5 drive bays, each of which
> has its own activity LED.  With these patches, I can create a
> separate trigger for each of those LEDs and associate the drive in each
> bay with the correct LED:

Yes, and I'd like to have that functionality, but I believe userland
API should be similar to what we do elsewhere. Marek described it in
more details.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYQL0/QAKCRAw5/Bqldv6
8mF+AJ0WfDSWeTOfpy+dRFuYGXEO4Bl98gCfWa1EIMy+vpCphwJ2PRXsqEqniOc=
=foRg
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
