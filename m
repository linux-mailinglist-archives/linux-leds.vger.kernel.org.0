Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98ED91EE521
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 15:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgFDNSB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 09:18:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51568 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbgFDNSB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 09:18:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 95FF41C0BD2; Thu,  4 Jun 2020 15:17:59 +0200 (CEST)
Date:   Thu, 4 Jun 2020 15:17:44 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: leds: fix macro names for pca955x
Message-ID: <20200604131744.GB7222@duo.ucw.cz>
References: <20200603091516.31907-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
In-Reply-To: <20200603091516.31907-1-f.suligoi@asem.it>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-06-03 11:15:16, Flavio Suligoi wrote:
> The documentation reports the wrong macro names
> related to the pca9532 instead of the pca955x
>=20
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtj0eAAKCRAw5/Bqldv6
8vkJAJ9sKSBTC355Gt6RY0F4iPk8CNjcKQCfTkmUqMlgMHh8db7PoMQPEEr97Os=
=RVZc
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
