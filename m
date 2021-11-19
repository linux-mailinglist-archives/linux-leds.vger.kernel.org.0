Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E575456B9D
	for <lists+linux-leds@lfdr.de>; Fri, 19 Nov 2021 09:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhKSI2S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Nov 2021 03:28:18 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60481 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234457AbhKSI2Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Nov 2021 03:28:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 8468F5C0055;
        Fri, 19 Nov 2021 03:25:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 19 Nov 2021 03:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ZDos6WI2j8lKtWvd3ZgKefBicWP
        hk2jn5awU/e+rixg=; b=fC63ryhBTw4iVOkdgwJRsLXjTdP1rHJEvmg3/mF44J5
        fzjPGoPc99O8ghAEKx5iDm+fzcBjTI6PFCVH02k3zSw7yIehfCCS1ZZvuqz7F2vY
        BEw5q//zFIIlvNbRfQIamfbbpvn6Ygq/ZIxYRPfMRsCF6ajdZy5moEFAHrq0IPeH
        I42jQNtKRJWhUi9vN6bBbbw2noJG3RyuVed4EOZYzl877Kn3uuy6dKjuwTHMNVrK
        1YEcCeieB4SFTrQeDJPYJBvxl9Dmx+xXc6VeDQ1y4keZwyNHHG0D+MUkRvibAfmD
        3eAt1YYmInQhN422f60A90bgvvetuaER6QXf0bkdl1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZDos6W
        I2j8lKtWvd3ZgKefBicWPhk2jn5awU/e+rixg=; b=aSwaer6ujTAkvYwqXGMMqW
        TZ8aMllx7iEoupFnME5+5q5tnNumluWPldwpFELNdBYP5jvs0QsZAoInOltBcaBb
        MP85mlGjtlKHOuHmz7oNkUdJeBvP6Yl3RNPivGG5Z8x7zN76/IxZSlGlNY6pa/PH
        if/THUD2bF86D+dpiSaTBPgegWMbhiPjWsv/TRVXWsLtLs3VdFi2y46FUqAuz801
        fLHSi6TCnhIa6N/nGtRs/ypI0uitfIzTNLwiZanqsq3oUcAdo8m0mePBQIyXGrB/
        szTJGQcqFuwWElzCgjeWqxdRt5VRVTd8JY9Vg048tWuc1Ab6btKlxIZeYBHBUChw
        ==
X-ME-Sender: <xms:aV-XYYndGw482OUjg9h09xC-4hl4CTCAcGhfHt-IFfYHLNIghDqGcQ>
    <xme:aV-XYX2FKFtjLxX7Di_jfpsZhV-dhBRbM0Nvpm_GfTpEcjM8QQcfRV2fRUlM4wL4j
    VA3IRerbKG-rdrXnmw>
X-ME-Received: <xmr:aV-XYWp8y6SaWUMJlM08vlg_21sgWAuhrd0jMcOkK1vx1fWTnwitNl_f2MotJ_U7B-s7P1lWHlOJmfHyr4v73c4hJxxqN8Dbe1IHc0fEuyo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aV-XYUmhBt9lqcTROTl2X-UwyogeaWjzysRfTMdzVgfVULUdPjeMwg>
    <xmx:aV-XYW0GSiS_B_KtRVS4drz5zA8h57-x5vOUXu-0_aFT1BdRFH-Ptw>
    <xmx:aV-XYbtGregJsLxMu6a6Qx5ydtMxkVNy6h5yUEM052s-V2A-7t0PZw>
    <xmx:aV-XYXJTWsZOJBgRATt4ckCfkinmgPPQejzV0yp7dlSDy4NLWBEhjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:25:12 -0500 (EST)
Date:   Fri, 19 Nov 2021 09:25:11 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED
 controller
Message-ID: <20211119082511.apc7nrmc3ggxirc6@gilmour>
References: <20211119054044.16286-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5hiz3mcpk54stuw3"
Content-Disposition: inline
In-Reply-To: <20211119054044.16286-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--5hiz3mcpk54stuw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 11:40:42PM -0600, Samuel Holland wrote:
> The Allwinner R329 and D1 SoCs contain an LED controller designed to
> drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
> has configurable timing and pixel format.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--5hiz3mcpk54stuw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZdfZwAKCRDj7w1vZxhR
xSDRAQDjMUi9jltjGsD1aK7FkOoi3TFEwKQcb9nbyeBXenfkXwEArE31zniRyDpP
gq0bxx9HG5aSVaZGN8DGVt1OpGNmogY=
=mc8D
-----END PGP SIGNATURE-----

--5hiz3mcpk54stuw3--
