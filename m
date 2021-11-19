Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C01D4579C4
	for <lists+linux-leds@lfdr.de>; Sat, 20 Nov 2021 00:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhKTAAG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Nov 2021 19:00:06 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49983 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230361AbhKTAAG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Nov 2021 19:00:06 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 654155C00F8;
        Fri, 19 Nov 2021 18:57:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Nov 2021 18:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=4
        r1TwomY0SX8SoZkyJ6j+G4eQP4mIUCD9MxFGJHWyAY=; b=Kq9t69W0IKmCaZAy/
        pvaaq39QhMdb+V+zHEcR5O/90CYkXtGtnSssf1UKYha+MzTfEnVds+8EzXUD3EGW
        yg9A6H4/4yDaGVSOQdj4VrkZWQeLmabx9pOij/wiOfW83N3NGjAX2lo5/zZM/+0f
        uS+LYADdoDTn35mHC23WofhzUDKMy1JDrAHtLwEtZuyl+TFA4w6c9jNKtAJxbOxZ
        iNYf39yaoTBwRYvuQITsaj4dHOTwJC1J/gUqAfUCsp0UvDAG9tobyXMUK0I7yfjg
        MMdpV334i3S+RmXZbL8xOzdXynye3UdUYsWQdAZPBJA5p7emPD4D038OD9X8rs/I
        jSrug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=4r1TwomY0SX8SoZkyJ6j+G4eQP4mIUCD9MxFGJHWy
        AY=; b=DTjtD0dC2LYC6sgWef8NHsiiSe3T+3xkmgSD8XIcE25tnMHGGXGMhCndU
        IoS3kQQhde24WomjynK9exSjyjzFh2CkA3BpPWw2C3CTvBL/0e+LL3xyRgx/lunN
        M7j229uVXDeLzsgaVq/Y9UEXyDWEGdueqF3ZL2H8n+rBUU62u14m7kU8RuxDMId4
        W9IkYJuEMtEyXYfzqD1L3j39sAwKvMFpxdjpKX5MetcVKsa4TxCL0r9mR2NvTjcn
        HYpML/1LFqb5KOgf1xE4QW6G/xeh5JLZUxZGjSaLIaNh3/grTZB5Ahy6HoRYira7
        ZNxGZRQ4il4jIN7+1YkC47rm3I5OQ==
X-ME-Sender: <xms:zjmYYaxbKi0MS-lDtaOIYJ7yg1GPF8QEYUma1lcvtSW8Dq6121aWeA>
    <xme:zjmYYWSs6zuAEQWiGPQWzZgtOmIKo8hPr7ODjq92Fb0k3bAf-0GkAWpDn4dSMQTU-
    iC6NJOVVmTev1oxlA>
X-ME-Received: <xmr:zjmYYcWWytsAzsFHLSLo4fYb3zGilJfkpZCLTQOqVuC9gobCOu4thDGUklxvICwDiwAviasJVh6mWeXWdddPEV8Dfe7ABM2zxzKwTcuhldIUJU7tfO8c1EUfew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeelgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeehnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeehjeeghfdufeefteelieeggfehteevieetueffhefhffekuedvffev
    ffevtedufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:zjmYYQicNrGpXsrweQ-qG9zr_hgQg37N6AGuKjAY7B98gvzxCPqB7Q>
    <xmx:zjmYYcBjE4hcWgRHYsRJ9PaeU9pA0WEgt0krkXyO1bwNzmNj9f2jWQ>
    <xmx:zjmYYRKVxlFcxUXFTalXntujFXNZM76l9lnFh_gEbFT5_TY4JObZSw>
    <xmx:zzmYYY26kMzGU2-cjpqCKf6Gn-8uexvmQmeZ8Oo0rGp8JpJeoAKt4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 18:57:02 -0500 (EST)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211119054044.16286-1-samuel@sholland.org>
 <20211119054044.16286-2-samuel@sholland.org>
 <20211119082850.lrfq2wuyzhyvczdi@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 2/2] leds: sun50i-r329: New driver for the R329/D1 LED
 controller
Message-ID: <fd4d08ee-3048-a54a-58d2-9510413c166f@sholland.org>
Date:   Fri, 19 Nov 2021 17:57:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211119082850.lrfq2wuyzhyvczdi@gilmour>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Maxime,

On 11/19/21 2:28 AM, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Nov 18, 2021 at 11:40:43PM -0600, Samuel Holland wrote:
>> +static const struct sun50i_r329_ledc_timing sun50i_r329_ledc_default_timing = {
>> +	.t0h_ns = 336,
>> +	.t0l_ns = 840,
>> +	.t1h_ns = 882,
>> +	.t1l_ns = 294,
>> +	.treset_ns = 300000,
>> +};
> 
> This should be mentioned in the binding as well (using the default keyword)

Ok, I'll do this for v4.

>> +static int sun50i_r329_ledc_parse_timing(const struct device_node *np,
>> +					 struct sun50i_r329_ledc *priv)
>> +{
>> +	struct sun50i_r329_ledc_timing *timing = &priv->timing;
>> +
>> +	*timing = sun50i_r329_ledc_default_timing;
>> +
>> +	of_property_read_u32(np, "allwinner,t0h-ns", &timing->t0h_ns);
>> +	of_property_read_u32(np, "allwinner,t0l-ns", &timing->t0l_ns);
>> +	of_property_read_u32(np, "allwinner,t1h-ns", &timing->t1h_ns);
>> +	of_property_read_u32(np, "allwinner,t1l-ns", &timing->t1l_ns);
>> +	of_property_read_u32(np, "allwinner,treset-ns", &timing->treset_ns);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sun50i_r329_ledc_set_timing(struct sun50i_r329_ledc *priv)
>> +{
>> +	const struct sun50i_r329_ledc_timing *timing = &priv->timing;
>> +	unsigned long mod_freq = clk_get_rate(priv->mod_clk);
>> +	u32 cycle_ns = NSEC_PER_SEC / mod_freq;
>> +	u32 val;
>> +
>> +	val = (timing->t1h_ns / cycle_ns) << 21 |
>> +	      (timing->t1l_ns / cycle_ns) << 16 |
>> +	      (timing->t0h_ns / cycle_ns) <<  6 |
>> +	      (timing->t0l_ns / cycle_ns);
>> +	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
>> +
>> +	val = (timing->treset_ns / cycle_ns) << 16 |
>> +	      (priv->num_leds - 1);
>> +	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
>> +}
>> +
>> +static int sun50i_r329_ledc_resume(struct device *dev)
>> +{
>> +	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = reset_control_deassert(priv->reset);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_prepare_enable(priv->bus_clk);
>> +	if (ret)
>> +		goto err_assert_reset;
>> +
>> +	ret = clk_prepare_enable(priv->mod_clk);
>> +	if (ret)
>> +		goto err_disable_bus_clk;
>> +
>> +	sun50i_r329_ledc_set_format(priv);
>> +	sun50i_r329_ledc_set_timing(priv);
>> +
>> +	/* The trigger level must be at least the burst length. */
>> +	val = readl(priv->base + LEDC_DMA_CTRL_REG);
>> +	val &= ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
>> +	val |= LEDC_FIFO_DEPTH / 2;
>> +	writel(val, priv->base + LEDC_DMA_CTRL_REG);
>> +
>> +	val = LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
>> +	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
>> +	writel(val, priv->base + LEDC_INT_CTRL_REG);
>> +
>> +	return 0;
>> +
>> +err_disable_bus_clk:
>> +	clk_disable_unprepare(priv->bus_clk);
>> +err_assert_reset:
>> +	reset_control_assert(priv->reset);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sun50i_r329_ledc_suspend(struct device *dev)
>> +{
>> +	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(priv->mod_clk);
>> +	clk_disable_unprepare(priv->bus_clk);
>> +	reset_control_assert(priv->reset);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sun50i_r329_ledc_dma_cleanup(void *data)
>> +{
>> +	struct sun50i_r329_ledc *priv = data;
>> +	struct device *dma_dev = dmaengine_get_dma_device(priv->dma_chan);
>> +
>> +	if (priv->buffer)
>> +		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
>> +			    priv->buffer, priv->dma_handle);
>> +	dma_release_channel(priv->dma_chan);
>> +}
>> +
>> +static int sun50i_r329_ledc_probe(struct platform_device *pdev)
>> +{
>> +	const struct device_node *np = pdev->dev.of_node;
>> +	struct dma_slave_config dma_cfg = {};
>> +	struct led_init_data init_data = {};
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *child;
>> +	struct sun50i_r329_ledc *priv;
>> +	struct resource *mem;
>> +	int count, irq, ret;
>> +
>> +	count = of_get_available_child_count(np);
>> +	if (!count)
>> +		return -ENODEV;
>> +	if (count > LEDC_MAX_LEDS) {
>> +		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->dev = dev;
>> +	priv->num_leds = count;
>> +	spin_lock_init(&priv->lock);
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	ret = sun50i_r329_ledc_parse_format(np, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = sun50i_r329_ledc_parse_timing(np, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
>> +	if (IS_ERR(priv->base))
>> +		return PTR_ERR(priv->base);
>> +
>> +	priv->bus_clk = devm_clk_get(dev, "bus");
>> +	if (IS_ERR(priv->bus_clk))
>> +		return PTR_ERR(priv->bus_clk);
>> +
>> +	priv->mod_clk = devm_clk_get(dev, "mod");
>> +	if (IS_ERR(priv->mod_clk))
>> +		return PTR_ERR(priv->mod_clk);
>> +
>> +	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
>> +	if (IS_ERR(priv->reset))
>> +		return PTR_ERR(priv->reset);
>> +
>> +	priv->dma_chan = dma_request_chan(dev, "tx");
>> +	if (IS_ERR(priv->dma_chan))
>> +		return PTR_ERR(priv->dma_chan);
>> +
>> +	ret = devm_add_action_or_reset(dev, sun50i_r329_ledc_dma_cleanup, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dma_cfg.dst_addr	= mem->start + LEDC_DATA_REG;
>> +	dma_cfg.dst_addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +	dma_cfg.dst_maxburst	= LEDC_FIFO_DEPTH / 2;
>> +	ret = dmaengine_slave_config(priv->dma_chan, &dma_cfg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->buffer = dma_alloc_wc(dmaengine_get_dma_device(priv->dma_chan),
>> +				    LEDS_TO_BYTES(priv->num_leds),
>> +				    &priv->dma_handle, GFP_KERNEL);
>> +	if (!priv->buffer)
>> +		return -ENOMEM;
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret = devm_request_irq(dev, irq, sun50i_r329_ledc_irq,
>> +			       0, dev_name(dev), priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = sun50i_r329_ledc_resume(dev);
>> +	if (ret)
>> +		return ret;
> 
> You seem to fill the runtime_pm hooks, but only call them directly and
> never enable runtime_pm on that device, is that intentional?

Yes. I did not want to delay the initial version by adding runtime PM
(and debugging the refcounts) when the driver already works now.
However, I had runtime/system PM in mind while writing the driver.

If you think it is too confusing, I could rename the functions to
something like sun50i_r329_ledc_hw_init / sun50i_r329_ledc_hw_exit.

Regards,
Samuel
