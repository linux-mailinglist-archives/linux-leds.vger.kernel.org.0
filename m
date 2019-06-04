Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE8934C52
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2019 17:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbfFDPdN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jun 2019 11:33:13 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49456 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbfFDPdM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jun 2019 11:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lDhEtQ5urTIN82cju7KPD+FlP735c86tqDddhdSuQH8=; b=O1PgNVxGadUWGHVQq1LTcdbe2
        Z3KdWU7T1Z6qeJk5u5q9XqeDlxOgbITNeeCh6amfH9Up43elj71uLCDt95u3HBJErYfeCeeo8gKX/
        EiFYKxiwsbyxU7O8ypFMe/XOugG0OtJvcXNIaO1L7CuIMcBE9uatLWipKOfEOs9vaMK4s=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYBQy-0006Jg-LB; Tue, 04 Jun 2019 15:33:08 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id B7636440046; Tue,  4 Jun 2019 16:33:07 +0100 (BST)
Date:   Tue, 4 Jun 2019 16:33:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Message-ID: <20190604153307.GG2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
 <20190529151000.GP2456@sirena.org.uk>
 <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
 <20190530152643.GS2456@sirena.org.uk>
 <f9ad6600-3060-65c5-6f87-8a167c75f8b0@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oSWi0jal9INzEBQ4"
Content-Disposition: inline
In-Reply-To: <f9ad6600-3060-65c5-6f87-8a167c75f8b0@ti.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oSWi0jal9INzEBQ4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 10:14:42AM -0500, Dan Murphy wrote:

> I am going to introduce this update in patch 4 of this series when the
> LM36274 is introduced to the regulator driver.

> It makes more sense to add it there as in patch 1 there is not really a n=
eed
> to extend the value or mask as it only supports the LM3632 device.=A0 It =
makes
> sense to add the condition when adding another device to support

Sure, add it along with the rest of the support for the new device.

--oSWi0jal9INzEBQ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz2jzIACgkQJNaLcl1U
h9BepAf+LfzMTtI0Fzd0fRSTevF4dwL9HwaAjcw3MnuMeqfJOtp4p9UJn98FfEKo
TN5y7zHRbObnaEZHniSsoyLj1SFw6SmVPcj4QjFezETEEugYpPu3LHSK2NT96a90
oZqa1rrD43ned4XfwMdNzhupU1mD2233V/J43B37eoLfovfxeqoVlRWOWZGRR+5M
o89QlDLRAVwQwjyxkvl+BO84joYEKkZEpjdUIZ0qhkFjwjo4ZnxvEO2V7pa0Y6EZ
lPHN1+8BQ4BdIF2aihTu8MC4EyqjQ/UslkWqBw0Pwbl1TJMiWmxY1Ito8AjRzBed
DDlHyaKNeV4B+d4gUugodeJxw2eu7w==
=z7wn
-----END PGP SIGNATURE-----

--oSWi0jal9INzEBQ4--
