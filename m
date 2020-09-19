Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7D2270CF7
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 12:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgISKYK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 06:24:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46766 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKYK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 06:24:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DED531C0B85; Sat, 19 Sep 2020 12:24:07 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:24:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Riku Voipio <riku.voipio@iki.fi>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] leds: pca9532 - simplify the return expression of
 pca9532_remove
Message-ID: <20200919102407.GE16109@duo.ucw.cz>
References: <20200919100853.1639215-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <20200919100853.1639215-1-liushixin2@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-09-19 18:08:53, Liu Shixin wrote:
> Simplify the return expression.

Thanks, applied.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XcRwAKCRAw5/Bqldv6
8t/OAJ9vDLHVN5taNr4s4eTZBrXlzwuJCACfV9Te+3hcR2Wn2xa3JGo3RDn3FTw=
=jDcG
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
