Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3DC456BAA
	for <lists+linux-leds@lfdr.de>; Fri, 19 Nov 2021 09:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhKSIby (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Nov 2021 03:31:54 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41995 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229502AbhKSIby (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Nov 2021 03:31:54 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9C3E45C016A;
        Fri, 19 Nov 2021 03:28:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 19 Nov 2021 03:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=iS7cE1gW2mBMFfCjW5Ez9oB5u7/
        vJ30EAF725C8DnrA=; b=GdXcxUKD6D+IcW21HhRgQMVTyqmwLvqrZ9Mqr4Mi9Ld
        27SQYd4SbuVb+LpM8kU79Jyc8Ht0DHNPyRJ5ZjVelrOmUZe1g6I6J2Jy3wausk4z
        6HcS+zb+imFDf+BFDFuRcOqOw/tLfJ+jtMcz6sC6AeN06FeIksroz4ztofu0lXSZ
        QmdTjaUHEuk8mLVxfSt7t+4b7gKHr05Z4nDcn/cZ3m4Dv+h7W/4SYUurT8LZ+fEk
        +bYDim54sk47vxyrpc5wwxOJsh2muxzsm20ILsR/ymmYXvE3Y88JJ+qZg3Sh++C/
        //zNZt4jfWDzbH3VzMeswEPPbkqDKoCM4bdWo9rrE9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iS7cE1
        gW2mBMFfCjW5Ez9oB5u7/vJ30EAF725C8DnrA=; b=TkFnVC0Ojv2Xpz7fK6ame0
        6RgtB7o6JG97CJ1mW/1kq9iMxnys9AJTbJlblh6JkzteLLykilc70cEYN/3WEmx7
        x4sjziVI1/PchBZ6DAnQjjLVhy9M38+9iugvlspp3RTBgMnxQJHWKe9Lo+XW8zOK
        BE+7h9xGWx+PVyEPsXt7lFml9bErAUbvZzAenyT/eUfc8LizL/9RXpGKmf4U/h7f
        D67UVtZgwKcsvvq46ZiE6k+lLj/GRt5SZQKgdzEG3ccCubW43qVS2quDXtoQCVSi
        f3q3fD2mvy7bu84j4nKouyT4/L35J5qOsBphWLLdKWaOXaztRZE6qq5XSgRCjrnQ
        ==
X-ME-Sender: <xms:RGCXYTaFYioXMEcVX2AK34_fi_z5RbsWDiHy7y34Y3jQ5jVAeagJUA>
    <xme:RGCXYSZYX3n1zh7hJrLHbfKO7FAaTKIi1cMh2gZCcLdg5AXkVSR4JltHtXySb51uz
    SLlgRz3D04I8p5ykYk>
X-ME-Received: <xmr:RGCXYV8EM4Xr3no5Ab4Vn1f73RLIXwpgDzF4wacWk5G4D-nen7Iy5t7Nw7dz8qcxfYPNusbPwm_AivW9LmAG1QD7nZIQ25jGudm-acd_u6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RGCXYZqiHTvCkR54wVs_rF236Dj6T1CjG0-Ax92UTJolFiognWrkDg>
    <xmx:RGCXYepb8Hni8A9nZE375ZMPfHQFCYtLgy1FefovSlCiwxHAPPe6bg>
    <xmx:RGCXYfT6iQa-sAJbA4G4iu0uP6-vLqvH1-VeVxRN6JeWW55vLhkisQ>
    <xmx:RGCXYafCtwo3vHA2iPGGFwvekIyJFSJyYWE4SiyeB1pIt9UuLBGqLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:28:51 -0500 (EST)
Date:   Fri, 19 Nov 2021 09:28:50 +0100
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
Message-ID: <20211119082850.lrfq2wuyzhyvczdi@gilmour>
References: <20211119054044.16286-1-samuel@sholland.org>
 <20211119054044.16286-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hooeodtfjz3dgf55"
Content-Disposition: inline
In-Reply-To: <20211119054044.16286-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--hooeodtfjz3dgf55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Nov 18, 2021 at 11:40:43PM -0600, Samuel Holland wrote:
> +static const struct sun50i_r329_ledc_timing sun50i_r329_ledc_default_timing = {
> +	.t0h_ns = 336,
> +	.t0l_ns = 840,
> +	.t1h_ns = 882,
> +	.t1l_ns = 294,
> +	.treset_ns = 300000,
> +};

This should be mentioned in the binding as well (using the default keyword)

> +static int sun50i_r329_ledc_parse_timing(const struct device_node *np,
> +					 struct sun50i_r329_ledc *priv)
> +{
> +	struct sun50i_r329_ledc_timing *timing = &priv->timing;
> +
> +	*timing = sun50i_r329_ledc_default_timing;
> +
> +	of_property_read_u32(np, "allwinner,t0h-ns", &timing->t0h_ns);
> +	of_property_read_u32(np, "allwinner,t0l-ns", &timing->t0l_ns);
> +	of_property_read_u32(np, "allwinner,t1h-ns", &timing->t1h_ns);
> +	of_property_read_u32(np, "allwinner,t1l-ns", &timing->t1l_ns);
> +	of_property_read_u32(np, "allwinner,treset-ns", &timing->treset_ns);
> +
> +	return 0;
> +}
> +
> +static void sun50i_r329_ledc_set_timing(struct sun50i_r329_ledc *priv)
> +{
> +	const struct sun50i_r329_ledc_timing *timing = &priv->timing;
> +	unsigned long mod_freq = clk_get_rate(priv->mod_clk);
> +	u32 cycle_ns = NSEC_PER_SEC / mod_freq;
> +	u32 val;
> +
> +	val = (timing->t1h_ns / cycle_ns) << 21 |
> +	      (timing->t1l_ns / cycle_ns) << 16 |
> +	      (timing->t0h_ns / cycle_ns) <<  6 |
> +	      (timing->t0l_ns / cycle_ns);
> +	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
> +
> +	val = (timing->treset_ns / cycle_ns) << 16 |
> +	      (priv->num_leds - 1);
> +	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
> +}
> +
> +static int sun50i_r329_ledc_resume(struct device *dev)
> +{
> +	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	ret = reset_control_deassert(priv->reset);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(priv->bus_clk);
> +	if (ret)
> +		goto err_assert_reset;
> +
> +	ret = clk_prepare_enable(priv->mod_clk);
> +	if (ret)
> +		goto err_disable_bus_clk;
> +
> +	sun50i_r329_ledc_set_format(priv);
> +	sun50i_r329_ledc_set_timing(priv);
> +
> +	/* The trigger level must be at least the burst length. */
> +	val = readl(priv->base + LEDC_DMA_CTRL_REG);
> +	val &= ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
> +	val |= LEDC_FIFO_DEPTH / 2;
> +	writel(val, priv->base + LEDC_DMA_CTRL_REG);
> +
> +	val = LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
> +	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
> +	writel(val, priv->base + LEDC_INT_CTRL_REG);
> +
> +	return 0;
> +
> +err_disable_bus_clk:
> +	clk_disable_unprepare(priv->bus_clk);
> +err_assert_reset:
> +	reset_control_assert(priv->reset);
> +
> +	return ret;
> +}
> +
> +static int sun50i_r329_ledc_suspend(struct device *dev)
> +{
> +	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(priv->mod_clk);
> +	clk_disable_unprepare(priv->bus_clk);
> +	reset_control_assert(priv->reset);
> +
> +	return 0;
> +}
> +
> +static void sun50i_r329_ledc_dma_cleanup(void *data)
> +{
> +	struct sun50i_r329_ledc *priv = data;
> +	struct device *dma_dev = dmaengine_get_dma_device(priv->dma_chan);
> +
> +	if (priv->buffer)
> +		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
> +			    priv->buffer, priv->dma_handle);
> +	dma_release_channel(priv->dma_chan);
> +}
> +
> +static int sun50i_r329_ledc_probe(struct platform_device *pdev)
> +{
> +	const struct device_node *np = pdev->dev.of_node;
> +	struct dma_slave_config dma_cfg = {};
> +	struct led_init_data init_data = {};
> +	struct device *dev = &pdev->dev;
> +	struct device_node *child;
> +	struct sun50i_r329_ledc *priv;
> +	struct resource *mem;
> +	int count, irq, ret;
> +
> +	count = of_get_available_child_count(np);
> +	if (!count)
> +		return -ENODEV;
> +	if (count > LEDC_MAX_LEDS) {
> +		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
> +		return -EINVAL;
> +	}
> +
> +	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->num_leds = count;
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	ret = sun50i_r329_ledc_parse_format(np, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = sun50i_r329_ledc_parse_timing(np, priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->bus_clk = devm_clk_get(dev, "bus");
> +	if (IS_ERR(priv->bus_clk))
> +		return PTR_ERR(priv->bus_clk);
> +
> +	priv->mod_clk = devm_clk_get(dev, "mod");
> +	if (IS_ERR(priv->mod_clk))
> +		return PTR_ERR(priv->mod_clk);
> +
> +	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->reset))
> +		return PTR_ERR(priv->reset);
> +
> +	priv->dma_chan = dma_request_chan(dev, "tx");
> +	if (IS_ERR(priv->dma_chan))
> +		return PTR_ERR(priv->dma_chan);
> +
> +	ret = devm_add_action_or_reset(dev, sun50i_r329_ledc_dma_cleanup, priv);
> +	if (ret)
> +		return ret;
> +
> +	dma_cfg.dst_addr	= mem->start + LEDC_DATA_REG;
> +	dma_cfg.dst_addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	dma_cfg.dst_maxburst	= LEDC_FIFO_DEPTH / 2;
> +	ret = dmaengine_slave_config(priv->dma_chan, &dma_cfg);
> +	if (ret)
> +		return ret;
> +
> +	priv->buffer = dma_alloc_wc(dmaengine_get_dma_device(priv->dma_chan),
> +				    LEDS_TO_BYTES(priv->num_leds),
> +				    &priv->dma_handle, GFP_KERNEL);
> +	if (!priv->buffer)
> +		return -ENOMEM;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, sun50i_r329_ledc_irq,
> +			       0, dev_name(dev), priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = sun50i_r329_ledc_resume(dev);
> +	if (ret)
> +		return ret;

You seem to fill the runtime_pm hooks, but only call them directly and
never enable runtime_pm on that device, is that intentional?

Maxime

--hooeodtfjz3dgf55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZdgQgAKCRDj7w1vZxhR
xZmwAP4xVZ39e5diYhbwWmOEd4xuzaWvuNy+gQykaU3To75UTgEAhz3gEAH3IVkf
uNw5tXipLptJ+GSL4qovS0dRgIn3NQY=
=/rh6
-----END PGP SIGNATURE-----

--hooeodtfjz3dgf55--
