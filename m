Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1272B45DD6B
	for <lists+linux-leds@lfdr.de>; Thu, 25 Nov 2021 16:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhKYPba (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Nov 2021 10:31:30 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33801 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235890AbhKYP33 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 25 Nov 2021 10:29:29 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id CE6E73200F3B;
        Thu, 25 Nov 2021 10:26:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 25 Nov 2021 10:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
        +7aXymX+OvNAWPqZKdKw7dHRhKL3aCN2haZQvkSoBs=; b=JBYwTBol24XKHt6IW
        sVu0kDobb336a4kGmUVRXeOA+KXboiai8gDMfl0sv1nuTjflYvF5sWNSv3exeUAU
        ygIrCoiUgTY8JvntbIDDgZj33xmsjd5R6yp2vlHzudZhPlWH3nvLqDsOQz0f/Y6p
        2zPqyq0maNjBYAo/WpcIZ7v9Vr22Tfg8RgLcs2KHEzaNyQhqCohHd5yGviSfiiCY
        Z4JtoHs5DpgAUot1rswW/vwpq76kY3zKo39xKsguWF2Z5Srn5zee3OEITH98jard
        Cnne2s3sLIDd/VGehuRw3QG7vEhbmh+97Y//OFMgRjaDtMgJoRHPQ0SOJOemdNKP
        +PRdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=p+7aXymX+OvNAWPqZKdKw7dHRhKL3aCN2haZQvkSo
        Bs=; b=HOyWAR6V7d+6nH0qQkKaQqcQLnqnAvBbOcREb+yVG5gR2+MMxSKG1+h8v
        laUdfS6sIxYlBy2AuRd0Tv0+0bh/yLVEio9yO3ebzZbUEf3T1QZ8m8hV27mRtu+C
        399MOgqEmOsHxQFY59vg8elfVSblT/UJN8kw0IM0/GpcdwcSvjEjKOgfqtraooe+
        P7Hs4gCmM7tm8BYMwCATJvzN9YLYKpTUcE/8CfjVXu2/3jGyM6ldjFvsZeKt3qZa
        UMzMRtLJ2I8fiHEibdoHtPeXaZEPbi1vPivrpBoX2IhuazJPJ7lg0bqMTjE2zHoG
        CqtNT6C+ZTeffAWKK74IKZ8tYj0Wg==
X-ME-Sender: <xms:F6ufYfMERb_oAJyvSJVmd7eLxY03StY6jv_8isx8D55hCApf0zQ-0g>
    <xme:F6ufYZ-JzwQ5prGqIFBo12PTzivXJZD6HMX3Y-Cvn_FqyDmIYBMby4VaJWQnkv2Qz
    tPmupAImeqrnuFZFg>
X-ME-Received: <xmr:F6ufYeTK9jnJKws3ZRSxIb1VNtkxtyqHWY9poSPot77xc4Mwa2fCJhq9kAxnfWHP5sMYfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedtgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:F6ufYTuncG_sC-pktEWIsQdtvOpmTP8yhwTXkn4mv23iIEjLsUeOxQ>
    <xmx:F6ufYXf63TmuA4hXz-ZISAWQ6oyacFzXj9FzPTnTT1Bl-sAGV_Kocg>
    <xmx:F6ufYf0qJav5pBxwuEfhvTBtkdj4UtabWzQP9nAjDgQ83OxZuLBd3w>
    <xmx:GKufYWw0PkxViULeHvapP1KnrvASV3TBwcqcdF1kvV-DHeDZFgcO0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 10:26:14 -0500 (EST)
Subject: Re: [PATCH v3 2/2] leds: sun50i-r329: New driver for the R329/D1 LED
 controller
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
 <fd4d08ee-3048-a54a-58d2-9510413c166f@sholland.org>
 <20211123163945.xj2xmqymj3dkba55@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <e753c12a-d586-18fc-7f4a-01a9f6df1750@sholland.org>
Date:   Thu, 25 Nov 2021 09:26:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20211123163945.xj2xmqymj3dkba55@gilmour>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/23/21 10:39 AM, Maxime Ripard wrote:
> On Fri, Nov 19, 2021 at 05:57:01PM -0600, Samuel Holland wrote:
>> Hi Maxime,
>>
>> On 11/19/21 2:28 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Thu, Nov 18, 2021 at 11:40:43PM -0600, Samuel Holland wrote:
>>>> +static const struct sun50i_r329_ledc_timing sun50i_r329_ledc_default_timing = {
>>>> +	.t0h_ns = 336,
>>>> +	.t0l_ns = 840,
>>>> +	.t1h_ns = 882,
>>>> +	.t1l_ns = 294,
>>>> +	.treset_ns = 300000,
>>>> +};
>>>
>>> This should be mentioned in the binding as well (using the default keyword)
>>
>> Ok, I'll do this for v4.
>>
>>>> +static int sun50i_r329_ledc_parse_timing(const struct device_node *np,
>>>> +					 struct sun50i_r329_ledc *priv)
>>>> +{
>>>> +	struct sun50i_r329_ledc_timing *timing = &priv->timing;
>>>> +
>>>> +	*timing = sun50i_r329_ledc_default_timing;
>>>> +
>>>> +	of_property_read_u32(np, "allwinner,t0h-ns", &timing->t0h_ns);
>>>> +	of_property_read_u32(np, "allwinner,t0l-ns", &timing->t0l_ns);
>>>> +	of_property_read_u32(np, "allwinner,t1h-ns", &timing->t1h_ns);
>>>> +	of_property_read_u32(np, "allwinner,t1l-ns", &timing->t1l_ns);
>>>> +	of_property_read_u32(np, "allwinner,treset-ns", &timing->treset_ns);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void sun50i_r329_ledc_set_timing(struct sun50i_r329_ledc *priv)
>>>> +{
>>>> +	const struct sun50i_r329_ledc_timing *timing = &priv->timing;
>>>> +	unsigned long mod_freq = clk_get_rate(priv->mod_clk);
>>>> +	u32 cycle_ns = NSEC_PER_SEC / mod_freq;
>>>> +	u32 val;
>>>> +
>>>> +	val = (timing->t1h_ns / cycle_ns) << 21 |
>>>> +	      (timing->t1l_ns / cycle_ns) << 16 |
>>>> +	      (timing->t0h_ns / cycle_ns) <<  6 |
>>>> +	      (timing->t0l_ns / cycle_ns);
>>>> +	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
>>>> +
>>>> +	val = (timing->treset_ns / cycle_ns) << 16 |
>>>> +	      (priv->num_leds - 1);
>>>> +	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
>>>> +}
>>>> +
>>>> +static int sun50i_r329_ledc_resume(struct device *dev)
>>>> +{
>>>> +	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
>>>> +	u32 val;
>>>> +	int ret;
>>>> +
>>>> +	ret = reset_control_deassert(priv->reset);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = clk_prepare_enable(priv->bus_clk);
>>>> +	if (ret)
>>>> +		goto err_assert_reset;
>>>> +
>>>> +	ret = clk_prepare_enable(priv->mod_clk);
>>>> +	if (ret)
>>>> +		goto err_disable_bus_clk;
>>>> +
>>>> +	sun50i_r329_ledc_set_format(priv);
>>>> +	sun50i_r329_ledc_set_timing(priv);
>>>> +
>>>> +	/* The trigger level must be at least the burst length. */
>>>> +	val = readl(priv->base + LEDC_DMA_CTRL_REG);
>>>> +	val &= ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
>>>> +	val |= LEDC_FIFO_DEPTH / 2;
>>>> +	writel(val, priv->base + LEDC_DMA_CTRL_REG);
>>>> +
>>>> +	val = LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
>>>> +	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
>>>> +	writel(val, priv->base + LEDC_INT_CTRL_REG);
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_disable_bus_clk:
>>>> +	clk_disable_unprepare(priv->bus_clk);
>>>> +err_assert_reset:
>>>> +	reset_control_assert(priv->reset);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int sun50i_r329_ledc_suspend(struct device *dev)
>>>> +{
>>>> +	struct sun50i_r329_ledc *priv = dev_get_drvdata(dev);
>>>> +
>>>> +	clk_disable_unprepare(priv->mod_clk);
>>>> +	clk_disable_unprepare(priv->bus_clk);
>>>> +	reset_control_assert(priv->reset);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void sun50i_r329_ledc_dma_cleanup(void *data)
>>>> +{
>>>> +	struct sun50i_r329_ledc *priv = data;
>>>> +	struct device *dma_dev = dmaengine_get_dma_device(priv->dma_chan);
>>>> +
>>>> +	if (priv->buffer)
>>>> +		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
>>>> +			    priv->buffer, priv->dma_handle);
>>>> +	dma_release_channel(priv->dma_chan);
>>>> +}
>>>> +
>>>> +static int sun50i_r329_ledc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	const struct device_node *np = pdev->dev.of_node;
>>>> +	struct dma_slave_config dma_cfg = {};
>>>> +	struct led_init_data init_data = {};
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct device_node *child;
>>>> +	struct sun50i_r329_ledc *priv;
>>>> +	struct resource *mem;
>>>> +	int count, irq, ret;
>>>> +
>>>> +	count = of_get_available_child_count(np);
>>>> +	if (!count)
>>>> +		return -ENODEV;
>>>> +	if (count > LEDC_MAX_LEDS) {
>>>> +		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	priv->dev = dev;
>>>> +	priv->num_leds = count;
>>>> +	spin_lock_init(&priv->lock);
>>>> +	dev_set_drvdata(dev, priv);
>>>> +
>>>> +	ret = sun50i_r329_ledc_parse_format(np, priv);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = sun50i_r329_ledc_parse_timing(np, priv);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
>>>> +	if (IS_ERR(priv->base))
>>>> +		return PTR_ERR(priv->base);
>>>> +
>>>> +	priv->bus_clk = devm_clk_get(dev, "bus");
>>>> +	if (IS_ERR(priv->bus_clk))
>>>> +		return PTR_ERR(priv->bus_clk);
>>>> +
>>>> +	priv->mod_clk = devm_clk_get(dev, "mod");
>>>> +	if (IS_ERR(priv->mod_clk))
>>>> +		return PTR_ERR(priv->mod_clk);
>>>> +
>>>> +	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
>>>> +	if (IS_ERR(priv->reset))
>>>> +		return PTR_ERR(priv->reset);
>>>> +
>>>> +	priv->dma_chan = dma_request_chan(dev, "tx");
>>>> +	if (IS_ERR(priv->dma_chan))
>>>> +		return PTR_ERR(priv->dma_chan);
>>>> +
>>>> +	ret = devm_add_action_or_reset(dev, sun50i_r329_ledc_dma_cleanup, priv);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	dma_cfg.dst_addr	= mem->start + LEDC_DATA_REG;
>>>> +	dma_cfg.dst_addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>> +	dma_cfg.dst_maxburst	= LEDC_FIFO_DEPTH / 2;
>>>> +	ret = dmaengine_slave_config(priv->dma_chan, &dma_cfg);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	priv->buffer = dma_alloc_wc(dmaengine_get_dma_device(priv->dma_chan),
>>>> +				    LEDS_TO_BYTES(priv->num_leds),
>>>> +				    &priv->dma_handle, GFP_KERNEL);
>>>> +	if (!priv->buffer)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	irq = platform_get_irq(pdev, 0);
>>>> +	if (irq < 0)
>>>> +		return irq;
>>>> +
>>>> +	ret = devm_request_irq(dev, irq, sun50i_r329_ledc_irq,
>>>> +			       0, dev_name(dev), priv);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = sun50i_r329_ledc_resume(dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>
>>> You seem to fill the runtime_pm hooks, but only call them directly and
>>> never enable runtime_pm on that device, is that intentional?
>>
>> Yes. I did not want to delay the initial version by adding runtime PM
>> (and debugging the refcounts) when the driver already works now.
>> However, I had runtime/system PM in mind while writing the driver.
>>
>> If you think it is too confusing, I could rename the functions to
>> something like sun50i_r329_ledc_hw_init / sun50i_r329_ledc_hw_exit.
> 
> It's not really the functions themselves that are confusing but rather
> that you set them as runtime_pm hooks.

I do not set these functions as runtime PM hooks. SIMPLE_DEV_PM_OPS only sets
the system PM hooks, for "suspend to RAM and hibernation." Maybe you are
thinking of SET_RUNTIME_PM_OPS, which I do not use?

Regards,
Samuel

> If you plan on submitting it later on, I guess the easiest would just be
> to remove the sun50i_r329_ledc_pm structure, and then you'll just have
> to introduce it back with a call to pm_runtime_enable when it's ready
> 
> Maxime
> 

