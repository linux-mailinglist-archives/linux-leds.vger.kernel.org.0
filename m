Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C6527D8C
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 15:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730081AbfEWNEO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 09:04:14 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54462 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729430AbfEWNEN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 09:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5TYoJa8qGNDFzR8pNwZLSjd7Y/DoFCH7IpM2KwwYzwM=; b=MoGaf52XL4YvGHNKDnMTptjqz
        xwGZdC5AnoqqvBz52wghmHsQnyK/LmnMgq/ZH1jmyJA6XDWfsf9soVKVT3eIEx25qI83ROs3SI3Pj
        hUeJn8iX3zW2Py0VdEhTXvguF4s+q2wPj7udyo+ZLMGqcDemaBb4mkVbjx+Xx7EmNY6Gk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTnOF-00009p-2x; Thu, 23 May 2019 13:04:11 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 829A11126D24; Thu, 23 May 2019 14:04:07 +0100 (BST)
Date:   Thu, 23 May 2019 14:04:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 4/6] regulator: lm363x: Add support for LM36274
Message-ID: <20190523130407.GB17245@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-5-dmurphy@ti.com>
X-Cookie: I brake for chezlogs!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 02:27:31PM -0500, Dan Murphy wrote:
> Adding regulator support for the LM36274 backlight driver.
> This device can leverage this existing code as the functionality
> and registers are common enough between the LM36274 and the LM363x
> series of devices.

Acked-by: Mark Brown <broonie@kernel.org>

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmmkYACgkQJNaLcl1U
h9DJZQf/TjFmZ+I430hKts/otevTynVR0fRisQdOLf0dUH4n8JiiTpcFOVI2DSco
HFKZ9hEb+NQZLf84yh4YNLLb+DY0hlq9gkxYSmlOruPUiBLnbNRdF/hBFTc8N8Uj
GGsW63lGjGDufRX+Ld4fk4Cvn0YaYfm0SQOs6a9y8MvYYtq9Qelz7+hy3I0PgNgW
MOyqx7qRxRWkR/OvgdEFBZOP8DjxOlNUHSTMmliOGurAln7hGi4cy9QmmTapR0tS
eAAWhxgvgrL8EkniUWeFcUtpcsbpYzzvZFUk2ypYvdVsxvW8DBQNttWVs5kkF3TN
6XN9hDJDISOlFhSm/LBfhXcJoYfunA==
=rrTw
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
