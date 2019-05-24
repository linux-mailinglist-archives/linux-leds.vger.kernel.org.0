Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25EE297B8
	for <lists+linux-leds@lfdr.de>; Fri, 24 May 2019 13:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391371AbfEXL5O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 May 2019 07:57:14 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45226 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391195AbfEXL5O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 May 2019 07:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UUh+8+/lF5nObSY6PMVsFDBwtwtanNqftEqtZfrQEdA=; b=fdEgooYjTAmXswwglf48pIJR6
        ZQ7B7c4QM1ozuwpsECe0pIi71lEJ/8A0C2Yb47VHfeuEn8OVA0/c6IBZ07CHXx+lMEUENPzV87h39
        I470Cf8gXp3CxeKnbTNJ2GMcv3bPm5y3JLu8I0s1enm9saaivtXRhCcFYf5cHxq5XC/tc=;
Received: from [176.12.107.140] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hU8om-0003BY-U5; Fri, 24 May 2019 11:57:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id E912B440046; Fri, 24 May 2019 12:56:59 +0100 (BST)
Date:   Fri, 24 May 2019 12:56:59 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
Message-ID: <20190524115659.GC2456@sirena.org.uk>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell>
 <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
 <20190523083129.GH4574@dell>
 <e7f332a3-ce4b-a058-74b3-3dfd8bccfbc8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline
In-Reply-To: <e7f332a3-ce4b-a058-74b3-3dfd8bccfbc8@gmail.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2019 at 10:07:35PM +0200, Jacek Anaszewski wrote:
> On 5/23/19 10:31 AM, Lee Jones wrote:

> > Once an immutable branch is created, it should never, ever change.  I
> > think this is the second pull-request I've had from you [0] and the
> > second one you've wanted to retract.  That should not happen!

> This is life - it is always possible that some problems will be
> detected in linux-next later in the cycle, either by bots or by other
> people.

If you've created an immutable branch that other people might have
merged you should be doing incremental fixes on top of it and not
changing it unless you've confirmed that nobody else merged it, that's
the whole immutable thing.  If you rebase the commits are still going to
be in other people's trees and will still end up getting merged which
makes a mess.

> Some time ago I referred to Linus' message from 2017 discouraging
> maintainers from cross-merging their trees, which you didn't find
> applicable to existing MFD workflow.

> Recently Linus put stress on that again [0].

There's a difference between just grabbing someone's whole tree and
pulling in a targetted topic branch with only specific overlapping
stuff.  There's also no requirement on people to immediately merge=20
such a topic branch, they can always just keep it on file until it=20
does become important for dependencies.  A lot of the MFD cross tree
merges are happening because constants introduced in the MFD tree
become build dependencies for other trees.

Historically there were maintainers who just randomly merged people's
entire trees which does cause lots of problems, this isn't that.

> So please, if you find it reasonable to proceed with these immutable
> branches workflow, I would first prefer to see Linus' approval for that.

This is nothing new.

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzn3AsACgkQJNaLcl1U
h9CzPQf/XQWXb/SlOinfwRA5a0iVYS+aE687fICb19kdMNAglAUAXsOe9FQTLaqU
Jd48YIZ2UyPm4Noa1d3p+dnReu/WBqtq+7m5tjIXIblan+0r39xmpuwIm+t/zh71
fSjUCaYXW/4T/0mXxWr0G4pXOR57O30TgmR9Lr0NVg5jOVxpyzz9Ein/wfeOpPq/
HUAujAljW4pIYcJzQS3LO7svmUwtVakxzfWLIgqI27UfaMto6ANJpW/Ib0fpJYnR
ruErQB2EtDvZz4KqH/MxuzAOIYPhy/InAx3UkOg9nO1hMGGgfntaWB3Eu4H5GC9Z
+ep3ZXv7fhqamBL/Y0tk0RynfarR5g==
=EqwU
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
