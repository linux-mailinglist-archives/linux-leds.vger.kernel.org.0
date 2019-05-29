Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079332E09C
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 17:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfE2PKN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 11:10:13 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38516 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2PKM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 11:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=EmV3+mm8xVIYULNsB7o8Zl6HJvO8Q8TYrCH6IuDaJa4=; b=abwNwYqwKkqxBhuv7lSPID6gB
        W73kiZ0C3uC2yF5dXGapSIT0+mmfFVulFxtchgCujf/vCo6X2RD5SeUA/o6J40UK1OKTJhNyl35vn
        7XpnR9HfppDgEaa7c83zO4/AZnzktGD11wk2BNAPVvTPfxU+WQP/OYifv+iOvgrhE/Xpw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hW0DK-00050l-9k; Wed, 29 May 2019 15:10:02 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id E417A440046; Wed, 29 May 2019 16:10:00 +0100 (BST)
Date:   Wed, 29 May 2019 16:10:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com,
        lee.jones@linaro.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Message-ID: <20190529151000.GP2456@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MmQIYbZiCoQ2kDro"
Content-Disposition: inline
In-Reply-To: <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--MmQIYbZiCoQ2kDro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 06:51:32AM -0500, Dan Murphy wrote:

> Although I don't disagree with you I don't see how the interface is fragi=
le
> with only these 3 regulators defined.

> Would it not be prudent to amend this driver if/when a new regulator is
> needed that has a different enable bit/register combination?=A0=A0 And if=
 that

The fragility I'm worried about is someone forgetting to make suitable
updates, especially if they don't use the feature in their own system.

> was the case I would almost expect a different driver completely if the
> regmap did not line up correctly.=A0 I only reused this driver because the
> registers and bits lined up and did not think it was necessary to create a
> whole new driver.

This is a single register bit which is set once on startup isn't it?  It
seems like exactly the sort of thing that a hardware designer might
change incompatibly, perhaps even for good reasons like adding more
flexibility over which pins can be used to control the enable and far
=66rom something that would require a totally new driver if it was handled
differently.

--MmQIYbZiCoQ2kDro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzuoMMACgkQJNaLcl1U
h9CHOwf/UTUIOVotY6+NILgR0Cw+Y05M6AKN4cKcbuwRRwmm1J5pa51uu354zrST
lHS9DeCOTICl1VOZ4foUZ2puX0m/dClezj0InMSDzh8QYhqPJDpG8l+RBRtG1Uuo
oX+BePc+pB59jJsTM7MJixZ295Z/x5hCOMrlofwAVgN7N8a4ROG4JNki6abmidEA
FX4nfqRQICbLPYrXpMCoVqMwh8Qi0E7pD5YBrRlJ9RnG5VbVVZiKjieRUj5x4edV
aOdFllk8NGf1A6fp5q/DALioeamKiuad6Eyx8CUbxgHo6In8DnfCBKbf23cUZakA
qmg5QUork2WSm5tWHSU11Ami190r+g==
=dJBD
-----END PGP SIGNATURE-----

--MmQIYbZiCoQ2kDro--
