Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B69B262A6
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 13:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbfEVLAB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 07:00:01 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53500 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728743AbfEVLAB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 07:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=eFWOq9fyCjbeZsGZQ8qpdpB5CCC8q3sEkswLrHrTb+A=; b=Pe0s4MnXPtcrSOYwHiISkC0ld
        DzpFBaINeiJAXZ4B1+fwnEBCzicdZuAGphPWVDjd+rFx8WB1l5vTqbyGYGzQrcF5FSgWO5vCqUC/2
        dcd35VobthGmu729tKYRe5x8bpBYZr+eSQUUURMlf9kHxcZB7ZVbOteZifWjGj2asewpA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTOyU-00042z-Ol; Wed, 22 May 2019 10:59:58 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 1FC891126D0E; Wed, 22 May 2019 11:59:58 +0100 (BST)
Date:   Wed, 22 May 2019 11:59:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, lgirdwood@gmail.com
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Message-ID: <20190522105958.GA8582@sirena.org.uk>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
 <151079e6-4ae3-3b95-2dc1-c57927b0425f@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <151079e6-4ae3-3b95-2dc1-c57927b0425f@ti.com>
X-Cookie: Does the name Pavlov ring a bell?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 07:48:18PM -0500, Dan Murphy wrote:
> On 5/21/19 4:15 PM, Mark Brown wrote:
> > On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:

> >>       regulator: lm363x: Make the gpio register enable flexible
> >>       regulator: lm363x: Add support for LM36274

> > Why have these been applied, I haven't reviewed them?  As far as I can
> > tell they were sent before the merge window so I'd expect a resend at
> > this point...

> You and Liam were cc'd on April 10,2019 for v2 of this patch set.  So I am not sure why the review was missed.

> My apologies for not cc'ing you on v4 but there were no change since that time.

Perhaps I was busy, perhaps I saw that the series had other problems and
needed a rework as it was so I just waited for the resend in case they
had knock on effects on the regulator patches.

> I cannot find v3 of this patchset.

> The initial patches were sent on April 5, 2019

And not CCed to maintainers...  AFAICT I got at most one copy of this
ages ago that needed revisions.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlK6sACgkQJNaLcl1U
h9DIxwf/elASizg6DnbC1WJHknM3Px/oCI41SFbyGi9xneuPmdbhCz8Nww6n0jGS
E7nidc60vg2h46WDkL6UWKeoMcYV37TAtb8nQXFvW7gb83q5qiCYgVtXDWhUASv1
Dmtd1FSzIuMuIZ9a3+iB53oyeSIgJvKYDJhkk/uC2yoMspBEdTan+pGjoRcIoe5W
jciG+nb/O+me09wsgY+gGGCAl3wBsm5cS40a9Cxn1Healyo+R4MQg0LV5GYPFaK1
hXO1SSc3F4EN+nP2pTElID7ALNZigiL7eDa6eJXcXhJCU9/1IKQQTPw8Z4/MXYLZ
KF0EsXThXq9Fq/Fil2HkAs67jOrAmw==
=DPu1
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
