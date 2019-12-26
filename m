Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D4612AB84
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 11:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfLZKIp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 05:08:45 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39980 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfLZKIp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 05:08:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 630EB1C210C; Thu, 26 Dec 2019 11:08:43 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:08:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt: bindings: lm3692x: Add led-max-microamp
 property
Message-ID: <20191226100842.GC4033@amd>
References: <cover.1577271823.git.agx@sigxcpu.org>
 <db76306346364e93a03df25a49ad4a16eb6036b2.1577271823.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline
In-Reply-To: <db76306346364e93a03df25a49ad4a16eb6036b2.1577271823.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-25 12:07:18, Guido G=FCnther wrote:
> This can be used to limit the current per led strip

"per LED strip."

Acked-by: Pavel	Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4EhqoACgkQMOfwapXb+vJLhgCdHCc2R0HpD4lT1WZZqD7Tw1rS
aW8AnjeOTSmvMiq9lBV9Nga8ZHsXZHSW
=q2ke
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
