Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB5245F136
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 17:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351390AbhKZQEz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 11:04:55 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:60261 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344571AbhKZQCz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Nov 2021 11:02:55 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 7C1B33201C28;
        Fri, 26 Nov 2021 10:59:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 26 Nov 2021 10:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=dmgaTP58NH4ePLiMzG6Qj5sblT+
        /q5Jgks1Y7IsxJ78=; b=lmXs7FQqFmEbxO4q8ojSaE+MkGKchooj7FD+9YAJenI
        cBvdhtXOIlid4c4USb4QSldF6nIIheabMZR4jOXoFoX0JiXPiJ/wHDx7Lv4Y7dvX
        oHW3KIq+4JBhCBnlJYBZUisllOMC2AgnTvlpVxc7fohBDnm8pKW7C9Td05+26XoM
        Y5Ws1IK1O+177LTj+Wqgus6YrNSoekUhBk/qd5IfXTgu4BkHcM4QSgfw3ntLQkfF
        Kn3uGGYRhBM7DDrpQ45/ysVMRvxeZa2J3qKjoNL3bqswu/tDO95MyMg+WCjFgBW4
        OAxDyPUdJNS+MgJU6oIEknZ4UPiUr3fmdOQrdJVtVPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dmgaTP
        58NH4ePLiMzG6Qj5sblT+/q5Jgks1Y7IsxJ78=; b=kF3ABcUMu12eLzyYnO7l+a
        D0Igwxzy5bB4Cq+QwbP16bPPgKw0cdPH5maJPKcNAq3yEY2/mHgHgrIghT156SQn
        zgUYJHCrdjmvIOhkfDgZbkv+DDXv/BgD7/cViXcPt0r3lrkt9WKHSpVxn16LSwLA
        GabdZiYxo92KnT4MypRKbQRGPGN3muO6fxXiLNmu8BZI9RCE8kg/KTSZCiMYreaS
        E+ISpsqJGTupc+E1I71q7QzsSdzUnC0XifTL6AAeMzK8C8IsPSyCCWdLG/6aKegB
        9OPqhljg0kwpejWpYGtztkUv4DYqhh8K1S1QeBfkQ4aP7Ttg5UzkT6WZyL3d8iKQ
        ==
X-ME-Sender: <xms:agShYYS69Y-YjA4CnQBLdwsmGl6J3ZVM0beT_DjtC--IQFz8bx3CPw>
    <xme:agShYVwe2cJxBHOikUagDSyKmxOr5yMC6SfKL8lIjiNaVXNez9e6QaOgeKwhFkCPW
    jV3LUPSDNPdAt0kuZk>
X-ME-Received: <xmr:agShYV3t6MMgzNimVdsaHWC_T07bLfJDzYVAZWFRtlpeeFj8rJMopA9ZuwWpz7rRSvdUHtLJ33mlxnD5lEAz7VvgoB6IRc2QJw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:agShYcAKDmz8_16VpNidQG_JQ-YxPST4YXo8VKIQNcAPRsOaaVMXhw>
    <xmx:agShYRjY5kTYQ7v0sht9mlkf-8buJ1vqGH3zM8ZzElCu_1oGp6iREw>
    <xmx:agShYYoudkPAGFAa5FxrV5lRH-gype9Os8Y89D5jiMqAJhfkRD85HA>
    <xmx:agShYSXn0TWmxg1aPemRas7vbQG6qaqGtSVZJcmklBfOzv27o3LB4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Nov 2021 10:59:37 -0500 (EST)
Date:   Fri, 26 Nov 2021 16:59:35 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: sun50i-r329: New driver for the R329/D1 LED
 controller
Message-ID: <20211126155935.2zagoe6gfkh5pi22@houat>
References: <20211119054044.16286-1-samuel@sholland.org>
 <20211119054044.16286-2-samuel@sholland.org>
 <20211119082850.lrfq2wuyzhyvczdi@gilmour>
 <fd4d08ee-3048-a54a-58d2-9510413c166f@sholland.org>
 <20211123163945.xj2xmqymj3dkba55@gilmour>
 <e753c12a-d586-18fc-7f4a-01a9f6df1750@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ff7kew5vgfu2vnrs"
Content-Disposition: inline
In-Reply-To: <e753c12a-d586-18fc-7f4a-01a9f6df1750@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ff7kew5vgfu2vnrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 09:26:15AM -0600, Samuel Holland wrote:
> >>>> +	ret =3D sun50i_r329_ledc_resume(dev);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>
> >>> You seem to fill the runtime_pm hooks, but only call them directly and
> >>> never enable runtime_pm on that device, is that intentional?
> >>
> >> Yes. I did not want to delay the initial version by adding runtime PM
> >> (and debugging the refcounts) when the driver already works now.
> >> However, I had runtime/system PM in mind while writing the driver.
> >>
> >> If you think it is too confusing, I could rename the functions to
> >> something like sun50i_r329_ledc_hw_init / sun50i_r329_ledc_hw_exit.
> >=20
> > It's not really the functions themselves that are confusing but rather
> > that you set them as runtime_pm hooks.
>=20
> I do not set these functions as runtime PM hooks. SIMPLE_DEV_PM_OPS only =
sets
> the system PM hooks, for "suspend to RAM and hibernation." Maybe you are
> thinking of SET_RUNTIME_PM_OPS, which I do not use?

Ah, right, it's all good then, sorry for the noise

Maxime

--ff7kew5vgfu2vnrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaEEZwAKCRDj7w1vZxhR
xfsMAP4rc4xw/hAxBA7YrYauzpDFwW6NfMfLg7G896MyXDz7TAEAiMcCp2cjEa9O
WDUvlMV0RLyF7t54wrMybSVPFw/73gk=
=OiNf
-----END PGP SIGNATURE-----

--ff7kew5vgfu2vnrs--
