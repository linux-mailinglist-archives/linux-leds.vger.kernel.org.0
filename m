Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9AA36154
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 18:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbfFEQbZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 12:31:25 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52354 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfFEQbZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 12:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0gkwr/F7+Rrmms8V/ILU7byci3uqX6ktmxQ4kbGefNU=; b=GwINskzBFe5/BFRa7R9Im1GXK
        Ehxf1W4hvXZQBy0lDPUgVF7rHRrXjX2+jlVIUm6i4aD3eqzBsRUfHnpuTF3ONQCi6DYTGITDUsW6+
        Gepa/EE3TovjkAeYyzaNtzTwHQ7JwiQYGeW8dv7Vrlj336J45UxGyO4f64URlKRqFjJYU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYYos-0000xK-4z; Wed, 05 Jun 2019 16:31:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id D0DFC440046; Wed,  5 Jun 2019 17:31:20 +0100 (BST)
Date:   Wed, 5 Jun 2019 17:31:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable
 flexible
Message-ID: <20190605163120.GR2456@sirena.org.uk>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-2-dmurphy@ti.com>
 <20190605100132.GL2456@sirena.org.uk>
 <7ba7a633-1a39-adcc-e942-12c0eb7c3b16@ti.com>
 <054c3715-e85f-e052-faf1-057bf3a67d45@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8+74qwmUvVX309i6"
Content-Disposition: inline
In-Reply-To: <054c3715-e85f-e052-faf1-057bf3a67d45@ti.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8+74qwmUvVX309i6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 07:47:50AM -0500, Dan Murphy wrote:
> On 6/5/19 7:02 AM, Dan Murphy wrote:

> > I can squash patch 1 into 4.

> > Also not sure what you mean by new validation.

> Disregard I understand.=A0 The patch is missing the validation code.

Ah, some git add issues I guess :)  Squashing would help but it's not
essential I think.

--8+74qwmUvVX309i6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz37lYACgkQJNaLcl1U
h9D24Qf+LRTcByTN28sK2Y77cBUVbJQhwJeOJMTaOFPF2SDpJRBmU2oQZncg72xA
iMwJgZcDDd1gjQuyDsxRL23e8guALeRL3rQ/MyHT22BhFEGUFJd7Ka0hyOgOpxwv
R9Y7Gn8jo+Qt3AEcxn4HvHvq6zF/3FjUxUDbSquNchsjrv/flOp0uTbCuc1RQrcZ
d7I/uj3KhYIWmzN8w/E3wLzLYqfVFoZZ/9/FuSXMXS6BdTsaOwzoQ/VJmQ0IxEhe
FhFF2TWmvf84nAxKD6rYesFiuMXpM0Ok+v+5E2aI9/odBwHir8mcrMBWdOn3TDBT
eEUXC5JLELCEeXJdm8Ep+dsNdaSOEw==
=9Dl3
-----END PGP SIGNATURE-----

--8+74qwmUvVX309i6--
