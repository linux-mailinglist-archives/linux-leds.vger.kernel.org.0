Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89ED726A6D
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 21:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbfEVTCd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 15:02:33 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44832 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbfEVTCd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 15:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9B8U3iqfxSIvyPWHXlqH8b3N5v5U2m5E4u+F+RrSRvo=; b=bnz2FssI+h0Va04qsA8s8eWL9
        oDiga0Y1Y5PSIXQ4wdHLpzsEv/sDm9u/S8PFuh6H2s7FX6hJranqYP8hGGPcI1lIBzibbBWa6IwgT
        zqBDjeGJ8vyZ7dKZSyNDiV5X9WsiThtnuEKkyhuqvulFc2i5Xrrm7tXACJ0pTgQm4SVMU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTWVR-00053O-LA; Wed, 22 May 2019 19:02:29 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id A2E0C11226BC; Wed, 22 May 2019 20:02:25 +0100 (BST)
Date:   Wed, 22 May 2019 20:02:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, lgirdwood@gmail.com
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Message-ID: <20190522190225.GH8582@sirena.org.uk>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
 <0340dce2-87fb-938d-615e-376e29f37b54@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline
In-Reply-To: <0340dce2-87fb-938d-615e-376e29f37b54@gmail.com>
X-Cookie: Does the name Pavlov ring a bell?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 08:27:32PM +0200, Jacek Anaszewski wrote:
> On 5/21/19 11:15 PM, Mark Brown wrote:
> > On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:

> > >        regulator: lm363x: Make the gpio register enable flexible
> > >        regulator: lm363x: Add support for LM36274

> > Why have these been applied, I haven't reviewed them?  As far as I can
> > tell they were sent before the merge window so I'd expect a resend at
> > this point...

> The patch set have been floating around for some time and besides

Most of that time as far as I can tell they weren't being posted to
subsystem maintainers, you can't expect people to be aware of patches
that they are not being sent and single postings get missed or dropped
for all sorts of reasons.

> the v2 you were cc'ed by Dan, I also poked you a week ago for v4 [1].

That post from a week ago was you copying me into a thread I wasn't CCed
on saying I should have been sent the patches.  My expectation would
therefore be that someone would send me the patches, I'm obviously going
to prioritize patches that actually get sent to me over ones where I
have to go searching to try to turn up copies.

> Don't be surprised that I assumed you simply don't care.

You have unreasonable expectations here.  At the very least I would have
expected something along the lines of "hey, you don't seem to have
looked at these" before you just applied things, and ideally ensuring
that the patches had actually been sent to everyone with a reasonable
lead time so there was a good chance that review could happen.

> Still, we're awaiting your comments

If someone sends me the patches...

> [0] https://lkml.org/lkml/2019/4/10/547
> [1] https://lkml.org/lkml/2019/5/14/717

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlnMAACgkQJNaLcl1U
h9A7/Af7BW6/ntmrX58R5eFypYlE09SLmBNBg+a4IISELqaWA0OV3d5EmEWxL013
UtOTyvz1JbEfYkXUIOl+jlSScl639zYNnFZKw4UzqUTMevABc21Qq6uAA6kzhX2q
X30wiQmtjq2ytsooyk1I+1gIhPJ9kUnlQ4UsdGqAx3oE9f51jV0BCAvCApiSijLw
WDUNmuRBmdoIw3qOHcX9U0dAqrpWgLyJT1TOOBrOpO3YGFgeWbBZY99ERGw+lUNA
jHHEdKYnXaZm4pjFs263gUHlqx7+UYhH+2TTqNOmfdtltWmkECHXCXlAiB8Q/2u2
8hnzlwtfFXQIJRfLIQSUIdEWRXYmGg==
=5wSb
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
