Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE29259C0
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 23:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfEUVPI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 17:15:08 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52772 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfEUVPI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 17:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KYBKlxoa1sINRmneqO9GunMZAQxM3BVpbfIs3gwRekk=; b=Hyh/QqyW6gm/ZvtpAA0kQ0FNY
        nywkrGXqqugS17c2o9lnaRil2o/kT1bQDpLO+N2bXEzlnFiC9sGi2+UsggAgdOBXHmeAoHhHU1QbS
        +69wrtJ9yGZ3vA0KjAf4qri6RbIj9M00gExKG6Ctn+jaeLrTbKlsSoy53qSVXojLD4D0A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTC6D-0002Fn-Ka; Tue, 21 May 2019 21:15:05 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id A8BB41126D13; Tue, 21 May 2019 22:15:04 +0100 (BST)
Date:   Tue, 21 May 2019 22:15:04 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, lgirdwood@gmail.com
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Message-ID: <20190521211504.GD1580@sirena.org.uk>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline
In-Reply-To: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
X-Cookie: Klatu barada nikto.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:

>       regulator: lm363x: Make the gpio register enable flexible
>       regulator: lm363x: Add support for LM36274

Why have these been applied, I haven't reviewed them?  As far as I can
tell they were sent before the merge window so I'd expect a resend at
this point...

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkalcACgkQJNaLcl1U
h9BlRwf+OowE+CdFlxbWt3HLQBvc54GQXEQ2ajoYZncSe2xdPPagNorAvTKL+rjZ
tMczSL65OCpn+RB5BKg6DkdP7YiQXrUxNZMhnLrjfTf+B5dBthidtv6b0fd47BQH
tYfEK4nWsjsIqxLJiIW8V5GfvUB3IbQz/sXRzGzPKwNyPWI9J+oJVNwY+P225QUu
bURSz0LjcQmsyz+a9foTTlAPvWHzY67AMXztiFhIt9wSJiqyfrDLaKnadMFhfJgB
5X/uJA6ilusZ9xmp8Ldxp6j9D3nlm5pKprGtyvME0S5j66xai/sJTSyj7ENZF7R6
Omjia+6STpP+tguogsvvHevdNgpALw==
=jmUm
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
