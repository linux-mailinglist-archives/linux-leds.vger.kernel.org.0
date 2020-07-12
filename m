Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFE921C800
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 10:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgGLIHA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 04:07:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49404 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgGLIG7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 04:06:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 002381C0BDD; Sun, 12 Jul 2020 10:06:56 +0200 (CEST)
Date:   Sun, 12 Jul 2020 10:06:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jan Kiszka <jan.kiszka@web.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: gpio: Avoid warning on update of inverted
Message-ID: <20200712080656.GF8295@amd>
References: <d560d3eb-774d-8d9f-a8e3-09c371fc03eb@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Content-Disposition: inline
In-Reply-To: <d560d3eb-774d-8d9f-a8e3-09c371fc03eb@web.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-06-13 09:15:06, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> If the GPIO has not been configured yet, writing to inverted will raise
> a kernel warning.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Thanks, applied.
							Pavel
						=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KxKAACgkQMOfwapXb+vL8nQCfV8g91PicAOhlEzC9f9TFMa8M
KxIAn2fuk/1BltVvoHuBmfN5ACyMFaEv
=Kus2
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
