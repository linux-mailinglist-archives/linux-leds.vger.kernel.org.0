Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D4D40B656
	for <lists+linux-leds@lfdr.de>; Tue, 14 Sep 2021 19:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhINSAC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 14:00:02 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:35873 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229526AbhINSAB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 14 Sep 2021 14:00:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C24F7320094F;
        Tue, 14 Sep 2021 13:58:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 14 Sep 2021 13:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=LhzSpa+97zP8ZGUG79FRf2Dqxh6
        pStxDAoPaePah9j0=; b=sbN3yffByMddQTL5CzQSg6CkbtGNFy/kEeyMXFfOdgi
        ZMkmR2WuqGHWae/sdzLQ4laeITUPkYomu53+E6X1ctNAxEZCBUsqbwChNf/GC0V1
        RLolwdhiHy2mVGsfNIflCFySEH6clmc18s5pV0qAYdameTbuM/0qwA4iPLVWDDv9
        oXCOBCXGPYyQHSOgzwbM0mgAZqcTczz4rquH/7aBRjH73pnkTmKk07ePngh0aACA
        kpuXdZK++lQ7YWB5KF88YMpWnCHGTJ8aYtXkXLyY/6s2GBpKTI+CIVExX1rWSOpA
        9EvwYn+gc//iPrhdzLvnMAaxq30TegzEa8leUHkTRig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LhzSpa
        +97zP8ZGUG79FRf2Dqxh6pStxDAoPaePah9j0=; b=h+cMP35wI/tuwupi55Sa7c
        doyk1BGSOja6a+o01BS41JvNX6vpYD4mHmBc+3TOQLNJzL2Nu0nZztGvc8N+scyH
        l/PQvmW19LG69IEh3yAT1d+J24DchVqRZJZkH2p51mrDicn2PLESsepSXQgM2dWM
        6tIhlIcFFpvwY5uKo9ANtxK2/qxMkpScrp6MeRU+BrZINg1IaXV0Kj7ZGOpjFxVL
        +XHhq65Xs5W5otm3UZFqx9WnwT/9VZAggNCLqtGR7Rhlvb2lDgVsCp1w97ZrIu+x
        y9u3IAqNEpzdpdDy2V7G5ics5IyTn1st2YkjOe84s4QEtIOrNKSl84x9o65o8OAQ
        ==
X-ME-Sender: <xms:0eJAYVRmb7Q-WWRSHXVgZPON0bPoFnNFQnBmIDmIV6TTeUuhLa4iFw>
    <xme:0eJAYewlxF6q80SJMH8nndiFStyEDNKPxCC54CaJ9ceZkV7HHB9X7Eqs2QMwvy-uZ
    KTPrV7AcTzjY_PFcBU>
X-ME-Received: <xmr:0eJAYa2FhigR3O89xeZkAW_AiC7YM2uS4hVdVUBC8qsJLEC-z_V3Gol3l1KKkZo3HaZ0oULXgmwZdKCI3sT1GHXd00RcETIh5-XM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0eJAYdDEv6PuzjEeT9guWk7IwDNKroPGpoN49ZxTJ7R7-Wjmt1LrNw>
    <xmx:0eJAYehwfQ-WY6gqZuYJ6hoT_-vcRWJT3tW1DqUmjdufoFRJcm73AA>
    <xmx:0eJAYRofoBJhJj0FQRiZV6X92u9x6iunZnVRh8O8tp9OI43Xz7z9tw>
    <xmx:0uJAYXUzRgGUUn61Fh6Cw6yvc-JvDGtDl3XrelOPCghk2f08YTwYZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 13:58:40 -0400 (EDT)
Date:   Tue, 14 Sep 2021 19:58:38 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: sunxi: New driver for the R329/D1 LED
 controller
Message-ID: <20210914175838.r4mzvdx4j7b2ou5y@gilmour>
References: <20210902234228.32223-1-samuel@sholland.org>
 <20210902234228.32223-2-samuel@sholland.org>
 <20210903103638.5yhuvkyf62i3rp6a@gilmour>
 <70c76fe4-41e4-7232-c961-785193a68859@sholland.org>
 <20210909113628.ojbtbao7jlb6ophy@gilmour>
 <a890e40a-7fed-de1f-ef6a-6fab414fd7ca@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kda6v5ais3xdvzlp"
Content-Disposition: inline
In-Reply-To: <a890e40a-7fed-de1f-ef6a-6fab414fd7ca@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kda6v5ais3xdvzlp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 08:54:28AM -0500, Samuel Holland wrote:
> On 9/9/21 6:36 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sun, Sep 05, 2021 at 11:17:19PM -0500, Samuel Holland wrote:
> >> Hi,
> >>
> >> On 9/3/21 5:36 AM, Maxime Ripard wrote:
> >>> On Thu, Sep 02, 2021 at 06:42:28PM -0500, Samuel Holland wrote:
> >>>> Some Allwinner sunxi SoCs, starting with the R329, contain an LED
> >>>> controller designed to drive RGB LED pixels. Add a driver for it usi=
ng
> >>>> the multicolor LED framework, and with LEDs defined in the device tr=
ee.
> >>>>
> >>>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >>>> ---
> >>>>  drivers/leds/Kconfig      |   8 +
> >>>>  drivers/leds/Makefile     |   1 +
> >>>>  drivers/leds/leds-sunxi.c | 562 +++++++++++++++++++++++++++++++++++=
+++
> >>>>  3 files changed, 571 insertions(+)
> >>>>  create mode 100644 drivers/leds/leds-sunxi.c
> >>>>
> >>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>>> index ed800f5da7d8..559d2ca0a7f4 100644
> >>>> --- a/drivers/leds/Kconfig
> >>>> +++ b/drivers/leds/Kconfig
> >>>> @@ -297,6 +297,14 @@ config LEDS_SUNFIRE
> >>>>  	  This option enables support for the Left, Middle, and Right
> >>>>  	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
> >>>> =20
> >>>> +config LEDS_SUNXI
> >>>> +	tristate "LED support for Allwinner sunxi LED controller"
> >>>> +	depends on LEDS_CLASS
> >>>> +	depends on ARCH_SUNXI || COMPILE_TEST
> >>>> +	help
> >>>> +	  This option enables support for the LED controller provided in
> >>>> +	  some Allwinner sunxi SoCs.
> >>>> +
> >>>
> >>> Same comment for the name
> >>
> >> Are you concerned about the help text only, or do you also want me to =
rename the
> >> Kconfig symbol?
> >=20
> > The driver, the driver symbols and the Kconfig symbol would be nice
> >=20
> >> I am happy to change the help text to something like: "This option ena=
bles
> >> support for the LED controller provided in the Allwinner R329 and D1 S=
oCs."
> >>
> >> But I don't know of any satisfying way to rename the Kconfig symbol. T=
here is no
> >> general category name for "R329 and D1."
> >=20
> > Yeah, this is not ideal, but the issue is that nothing is telling us
> > whether or not it will support *only* the R329 and D1. Chances are it's
> > going to be featured in a number of other SoCs in the future, so if we
> > were to have the entire list of supported SoCs in the Kconfig symbol and
> > driver name, we'd have to always change them everytime a new SoC support
> > is introduced.
>=20
> This is why I named it LEDS_SUNXI: until and unless a "v2" hardware
> block shows up, this is the LED controller in all sunxi SoCs [that have
> an LED controller at all]. And at that point, naming the new driver
> LEDS_SUNXI_V2 makes more sense to me than trying to guess the pattern
> for SoC support, where there likely is no pattern.

sunxi and sunxi_v2 doesn't mean anything though. The original A10 is
sunxi, yet it's very far from being supported by that driver. At least
putting the first SoC name has some sort of relationship to the hardware
supported.

> > It would be a pain, and it's pretty much guaranteed that someone is
> > going to forget at some point. To mitigate this, we took the approach to
> > use the same semantic than the DT compatible: the driver name doesn't
> > really define the list of all the SoCs supported but matches every SoC
> > (more or less) compatible with that SoC.
>=20
> Ok, but this still doesn't tell me what you expect the driver to be
> named. Again, there is no general name for "every SoC (more or less)
> compatible with R329".

leds-sun50i-r329?

> We tried to guess the pattern around the time H6 came out, and named a
> bunch of things "sun50i" (like the IOMMU driver) that are now showing up
> on sun8i (A50) and sun20i (D1) SoCs.

I'm not sure what's wrong with that? We name and sort things in
chronological order, and there's new SoCs from multiple families in
parallel.

> And it turns out most of the changes were not even new for H6
> (sun50iw6), but already present in the A63 (sun50iw3).

That's indeed a bit unfortunate, but it's not worth changing at this
point.

> I'm in sort of the same situation here. I know the hardware exists on
> the R329 (sun50iw11); and from looking at the A100 (sun50iw10) pinctrl
> driver, I know some LED controller exists there as well. But I don't
> have a manual for the A100 to verify that LED controller is compatible.
> So I don't even know if R329 is the first supported SoC.

Let's just stick to something we know for sure and name it after the
r329

> To be clear: do you want me to name the driver "sun50i_r329_ledc"?

Yes

Maxime

--kda6v5ais3xdvzlp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUDizgAKCRDj7w1vZxhR
xcHyAP95m22MQNozYBNkz+LoUrkCMsNyeLSdb67Ikx9e4HlXjAD/T79UJpeTwoaj
Qj6dQwPXNHDqvH+mllH0FGY3QSy3pgs=
=Biqx
-----END PGP SIGNATURE-----

--kda6v5ais3xdvzlp--
