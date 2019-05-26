Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABCE22A9C6
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2019 14:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfEZMsw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 26 May 2019 08:48:52 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54792 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfEZMsv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 26 May 2019 08:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6zgWbrZCatruS6U0cRn/mz67ZNTBDqWHlZXO65j6CD0=; b=lX0gb4WieEikt7XGVfntiny+o
        Fb0KjWM/GhznWZLrMfA5KfGgg984tOM5zGE/C+VaZI6dvmeRDpMUbmV71Offh8t/AKqIjDwF/80F+
        buPt0N44elY+JQKZFeIzV+t7RMdRLRCAvXF16nz3eUiF2oW/vKX3tqnXuJfdRQVz5QzuE=;
Received: from 92.40.249.190.threembb.co.uk ([92.40.249.190] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hUsZw-0002cN-Mp; Sun, 26 May 2019 12:48:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 83189440046; Sun, 26 May 2019 13:48:38 +0100 (BST)
Date:   Sun, 26 May 2019 13:48:38 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Message-ID: <20190526124838.GH2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Content-Disposition: inline
In-Reply-To: <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 08:50:20AM -0500, Dan Murphy wrote:
> On 5/23/19 8:03 AM, Mark Brown wrote:
> > On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:

> > Is it guaranteed that the bitmask for enabling the use of the GPIO is
> > going to be the same for all regulators?  The bitmasks for the regulator
> > enable look to be different, and it also looks like this setting might
> > affect multiple regulators since it seems there are multiple enable bits
> > in the same register.  If this affects multiple regulators then how's
> > that working at the minute?

> Yes for the 3632 and 36274 bit0 is the EXT_EN for LCM on these chips.
> LM3631 does not have LCM GPIO control so there is no setting and this should not be called.
> If it is then the developer implemented the DT wrong.

This feels fragile - it works for the current users but it's just
assuming that the placement of this bit will always be in the same
position in the same register as the enable and will silently fail if a
new chip variant does things differently.  Either storing the data
separately somewhere driver specific or just having explicit switch
statements would be more robust.

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzqiyUACgkQJNaLcl1U
h9DtKwgAgwYVujK+ai00tAc8vMnYP77hZtQP9CqqTq6PKk5xDoaPXdedWl0j84c6
4cf103WBzETd4ECf09dnm5ssZQBw/KQCjspYm20+oQdMqVytCdxRzq3nhC3YBbpy
Wg2Bg550H8KDNNvHLwoFn7H1FdMtpD98mdJJ7vTXuLFx14vdKZ4Ya5oDEqHXAI4u
ed5a4UPMTW7ptNb2jk2Mo5vDYP+9K7Z1+pLaCBo7EWUMlYkTKfHk1gnXea/6zCKa
A6AZtafNbxcsToTsVoWBML7bw3FLH8oyWkm79NFIUZuGB+Zw0Ms98pR63gJXihLf
rm1njloC7RIodeEOcKIzPVqSKwsjcg==
=wc2b
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--
