Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147DB17001D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 14:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgBZNdk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 08:33:40 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37974 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBZNdk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 08:33:40 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 57C391C2103; Wed, 26 Feb 2020 14:33:38 +0100 (CET)
Date:   Wed, 26 Feb 2020 14:33:37 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: Convert gpio-leds to DT schema
Message-ID: <20200226133337.GB4080@duo.ucw.cz>
References: <20200108001738.8209-1-robh@kernel.org>
 <20200108001738.8209-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20200108001738.8209-2-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-01-07 18:17:38, Rob Herring wrote:
> Convert the gpio-leds binding to DT schema format.
>=20
> Drop the last example as the node name collides when built, and it doesn't
> add much value.
>=20
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

It seems it is already in tree, as of Linux 5.6-rc2...?

So, sorry for delay but nothing for me to do here?

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZzsQAKCRAw5/Bqldv6
8lRUAJ0S+0Av9iihCNs1f1F4GAzLN7gz+gCgwciZWHfC9HsapXWfAjtrzt6Zh7U=
=wnnJ
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
