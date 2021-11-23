Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AAE45A87D
	for <lists+linux-leds@lfdr.de>; Tue, 23 Nov 2021 17:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhKWQnA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Nov 2021 11:43:00 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53103 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhKWQm5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Nov 2021 11:42:57 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 251DA5C0183;
        Tue, 23 Nov 2021 11:39:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 23 Nov 2021 11:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=DqKiH80SmKDpWn7GfxtaEYlMlLh
        8S4gQFuzGT1W1fr8=; b=U/TFpeI7JZvyXBix7hg4DWZUYTAQ4BUFUbRvKcTXl6o
        Qzij/YrjlvCd6xdQOa8Ro5N1flXZgMhxWanLmsKRwFE0ptqazmCf6bhxGaQ5SHiD
        R8NNgzynfkuAiuu+Ng9/0mL/+Pxlk6y3pbPs+T+jNaeifXWXTiU+fhzJPC+Hhp1T
        0ipOZZ39Yvy0aew2XuJw0jwIq4FtH2+caLc8A/iEYA3cLVCQ2IkIJuZjQT9sz4/y
        6UJc4MgfujBTVZOIFrOYfPI4ApDFkJVqsoIDdCrx9l4iEFIu9+RBlMLhr+6O/u7z
        XCRzThDAkHzqDgvkJeIa6qgBhtnYvqg45AH/SOM3bhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DqKiH8
        0SmKDpWn7GfxtaEYlMlLh8S4gQFuzGT1W1fr8=; b=Tg7J9d+SjUjiGH3ob7XnO+
        Uj3sV/mDBX4RNxwWY9ZLgzY764iTN079KeasFhrZGpJTR5dLlShmNxhuTZEF5eVB
        XHlX9qBursQyrcF6WTpvOY1tlJ1zYvhugz/m8oiS0378+S7W+eUUAl9fVlGLtb1w
        7ZtbgmuamHPkzRUgiiuYz4cB3UxVA8gXAR58p/oHFJTrattvwVsjpMNy43C51sml
        PXIC7nQKxdUboOAke+izqb7E0oa6EOqv/kAfk/zjunD+CdH4M6PhIRtagciHz7HZ
        FaMkIjFhR99+co8skyA5YC3UjIVyRLYyr3j1BQN2Wc1wESRyjDDvyznL4AvXGtcA
        ==
X-ME-Sender: <xms:UxmdYUKHsDSSl-Sd9A308saqWVWfTlw-j9yFcIcBDXqmni5JeKGP8A>
    <xme:UxmdYUL_fD1o1jeRpqA1hrFykUJNiilISW5fiae0iDhw6laVwlnb8FaunK3H8xPjG
    QZshixdDhmMnMwqNFE>
X-ME-Received: <xmr:UxmdYUtTxv8qChQjjyEWd_TO3Q2i55mcLo3Wjvl4oVTW_ldHrQbeyaAmMg3kYNQD2tJ5cof79IibNczP5mwhNubkDikrJ2Enw4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeigdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UxmdYRZFTi659-YHklB1TryhWd1undaLnMGEI1EMitqorMdNfKmMZQ>
    <xmx:UxmdYbby8AkfS02hXePbNSluVyMZwt5LKQRFBqscuyR-dzBKLwb_sw>
    <xmx:UxmdYdB3Vcr1wPl7TQvkDlbvd-3nJJBVK8UQ4NM1WZBualmWTpC8RQ>
    <xmx:VBmdYZOkrJNLO5dfizTB_OzsJYB8vCiK2YgPUobgXLxqpQqvjegoyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Nov 2021 11:39:47 -0500 (EST)
Date:   Tue, 23 Nov 2021 17:39:45 +0100
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
Message-ID: <20211123163945.xj2xmqymj3dkba55@gilmour>
References: <20211119054044.16286-1-samuel@sholland.org>
 <20211119054044.16286-2-samuel@sholland.org>
 <20211119082850.lrfq2wuyzhyvczdi@gilmour>
 <fd4d08ee-3048-a54a-58d2-9510413c166f@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nwidnpvmer74tu3y"
Content-Disposition: inline
In-Reply-To: <fd4d08ee-3048-a54a-58d2-9510413c166f@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nwidnpvmer74tu3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 05:57:01PM -0600, Samuel Holland wrote:
> Hi Maxime,
>=20
> On 11/19/21 2:28 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Nov 18, 2021 at 11:40:43PM -0600, Samuel Holland wrote:
> >> +static const struct sun50i_r329_ledc_timing sun50i_r329_ledc_default_=
timing =3D {
> >> +	.t0h_ns =3D 336,
> >> +	.t0l_ns =3D 840,
> >> +	.t1h_ns =3D 882,
> >> +	.t1l_ns =3D 294,
> >> +	.treset_ns =3D 300000,
> >> +};
> >=20
> > This should be mentioned in the binding as well (using the default keyw=
ord)
>=20
> Ok, I'll do this for v4.
>=20
> >> +static int sun50i_r329_ledc_parse_timing(const struct device_node *np,
> >> +					 struct sun50i_r329_ledc *priv)
> >> +{
> >> +	struct sun50i_r329_ledc_timing *timing =3D &priv->timing;
> >> +
> >> +	*timing =3D sun50i_r329_ledc_default_timing;
> >> +
> >> +	of_property_read_u32(np, "allwinner,t0h-ns", &timing->t0h_ns);
> >> +	of_property_read_u32(np, "allwinner,t0l-ns", &timing->t0l_ns);
> >> +	of_property_read_u32(np, "allwinner,t1h-ns", &timing->t1h_ns);
> >> +	of_property_read_u32(np, "allwinner,t1l-ns", &timing->t1l_ns);
> >> +	of_property_read_u32(np, "allwinner,treset-ns", &timing->treset_ns);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void sun50i_r329_ledc_set_timing(struct sun50i_r329_ledc *priv)
> >> +{
> >> +	const struct sun50i_r329_ledc_timing *timing =3D &priv->timing;
> >> +	unsigned long mod_freq =3D clk_get_rate(priv->mod_clk);
> >> +	u32 cycle_ns =3D NSEC_PER_SEC / mod_freq;
> >> +	u32 val;
> >> +
> >> +	val =3D (timing->t1h_ns / cycle_ns) << 21 |
> >> +	      (timing->t1l_ns / cycle_ns) << 16 |
> >> +	      (timing->t0h_ns / cycle_ns) <<  6 |
> >> +	      (timing->t0l_ns / cycle_ns);
> >> +	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
> >> +
> >> +	val =3D (timing->treset_ns / cycle_ns) << 16 |
> >> +	      (priv->num_leds - 1);
> >> +	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
> >> +}
> >> +
> >> +static int sun50i_r329_ledc_resume(struct device *dev)
> >> +{
> >> +	struct sun50i_r329_ledc *priv =3D dev_get_drvdata(dev);
> >> +	u32 val;
> >> +	int ret;
> >> +
> >> +	ret =3D reset_control_deassert(priv->reset);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret =3D clk_prepare_enable(priv->bus_clk);
> >> +	if (ret)
> >> +		goto err_assert_reset;
> >> +
> >> +	ret =3D clk_prepare_enable(priv->mod_clk);
> >> +	if (ret)
> >> +		goto err_disable_bus_clk;
> >> +
> >> +	sun50i_r329_ledc_set_format(priv);
> >> +	sun50i_r329_ledc_set_timing(priv);
> >> +
> >> +	/* The trigger level must be at least the burst length. */
> >> +	val =3D readl(priv->base + LEDC_DMA_CTRL_REG);
> >> +	val &=3D ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
> >> +	val |=3D LEDC_FIFO_DEPTH / 2;
> >> +	writel(val, priv->base + LEDC_DMA_CTRL_REG);
> >> +
> >> +	val =3D LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
> >> +	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
> >> +	writel(val, priv->base + LEDC_INT_CTRL_REG);
> >> +
> >> +	return 0;
> >> +
> >> +err_disable_bus_clk:
> >> +	clk_disable_unprepare(priv->bus_clk);
> >> +err_assert_reset:
> >> +	reset_control_assert(priv->reset);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int sun50i_r329_ledc_suspend(struct device *dev)
> >> +{
> >> +	struct sun50i_r329_ledc *priv =3D dev_get_drvdata(dev);
> >> +
> >> +	clk_disable_unprepare(priv->mod_clk);
> >> +	clk_disable_unprepare(priv->bus_clk);
> >> +	reset_control_assert(priv->reset);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void sun50i_r329_ledc_dma_cleanup(void *data)
> >> +{
> >> +	struct sun50i_r329_ledc *priv =3D data;
> >> +	struct device *dma_dev =3D dmaengine_get_dma_device(priv->dma_chan);
> >> +
> >> +	if (priv->buffer)
> >> +		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
> >> +			    priv->buffer, priv->dma_handle);
> >> +	dma_release_channel(priv->dma_chan);
> >> +}
> >> +
> >> +static int sun50i_r329_ledc_probe(struct platform_device *pdev)
> >> +{
> >> +	const struct device_node *np =3D pdev->dev.of_node;
> >> +	struct dma_slave_config dma_cfg =3D {};
> >> +	struct led_init_data init_data =3D {};
> >> +	struct device *dev =3D &pdev->dev;
> >> +	struct device_node *child;
> >> +	struct sun50i_r329_ledc *priv;
> >> +	struct resource *mem;
> >> +	int count, irq, ret;
> >> +
> >> +	count =3D of_get_available_child_count(np);
> >> +	if (!count)
> >> +		return -ENODEV;
> >> +	if (count > LEDC_MAX_LEDS) {
> >> +		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	priv =3D devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNE=
L);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	priv->dev =3D dev;
> >> +	priv->num_leds =3D count;
> >> +	spin_lock_init(&priv->lock);
> >> +	dev_set_drvdata(dev, priv);
> >> +
> >> +	ret =3D sun50i_r329_ledc_parse_format(np, priv);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret =3D sun50i_r329_ledc_parse_timing(np, priv);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	priv->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> >> +	if (IS_ERR(priv->base))
> >> +		return PTR_ERR(priv->base);
> >> +
> >> +	priv->bus_clk =3D devm_clk_get(dev, "bus");
> >> +	if (IS_ERR(priv->bus_clk))
> >> +		return PTR_ERR(priv->bus_clk);
> >> +
> >> +	priv->mod_clk =3D devm_clk_get(dev, "mod");
> >> +	if (IS_ERR(priv->mod_clk))
> >> +		return PTR_ERR(priv->mod_clk);
> >> +
> >> +	priv->reset =3D devm_reset_control_get_exclusive(dev, NULL);
> >> +	if (IS_ERR(priv->reset))
> >> +		return PTR_ERR(priv->reset);
> >> +
> >> +	priv->dma_chan =3D dma_request_chan(dev, "tx");
> >> +	if (IS_ERR(priv->dma_chan))
> >> +		return PTR_ERR(priv->dma_chan);
> >> +
> >> +	ret =3D devm_add_action_or_reset(dev, sun50i_r329_ledc_dma_cleanup, =
priv);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	dma_cfg.dst_addr	=3D mem->start + LEDC_DATA_REG;
> >> +	dma_cfg.dst_addr_width	=3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> >> +	dma_cfg.dst_maxburst	=3D LEDC_FIFO_DEPTH / 2;
> >> +	ret =3D dmaengine_slave_config(priv->dma_chan, &dma_cfg);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	priv->buffer =3D dma_alloc_wc(dmaengine_get_dma_device(priv->dma_cha=
n),
> >> +				    LEDS_TO_BYTES(priv->num_leds),
> >> +				    &priv->dma_handle, GFP_KERNEL);
> >> +	if (!priv->buffer)
> >> +		return -ENOMEM;
> >> +
> >> +	irq =3D platform_get_irq(pdev, 0);
> >> +	if (irq < 0)
> >> +		return irq;
> >> +
> >> +	ret =3D devm_request_irq(dev, irq, sun50i_r329_ledc_irq,
> >> +			       0, dev_name(dev), priv);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret =3D sun50i_r329_ledc_resume(dev);
> >> +	if (ret)
> >> +		return ret;
> >=20
> > You seem to fill the runtime_pm hooks, but only call them directly and
> > never enable runtime_pm on that device, is that intentional?
>=20
> Yes. I did not want to delay the initial version by adding runtime PM
> (and debugging the refcounts) when the driver already works now.
> However, I had runtime/system PM in mind while writing the driver.
>=20
> If you think it is too confusing, I could rename the functions to
> something like sun50i_r329_ledc_hw_init / sun50i_r329_ledc_hw_exit.

It's not really the functions themselves that are confusing but rather
that you set them as runtime_pm hooks.

If you plan on submitting it later on, I guess the easiest would just be
to remove the sun50i_r329_ledc_pm structure, and then you'll just have
to introduce it back with a call to pm_runtime_enable when it's ready

Maxime

--nwidnpvmer74tu3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZ0ZUAAKCRDj7w1vZxhR
xcdeAQCvPy9SiSH/Y7VJ6IhQponGjRSkn2R6FQPh8eAiTW9u3wD/X8zFlTD2q7zL
etZ4zF6mnpnVs18o1Lb0mgI44ClMTg0=
=/9wd
-----END PGP SIGNATURE-----

--nwidnpvmer74tu3y--
