Return-Path: <linux-leds+bounces-4046-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DEAA3EEE5
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 09:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6860B4211A6
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0341420102A;
	Fri, 21 Feb 2025 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B08O8XZt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B7C201004;
	Fri, 21 Feb 2025 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127365; cv=none; b=cMfDAETc/8WgZDIBtqfTYK7VZTQbTKdN/1v3HXKc0HoZ6ofuNbJT0bYQ9zVXbpWpMKFKKC27qiRUaiO4xIW2E5ut6W1n7c/jZr7M3Ld6xF9Tnm40lfAzoiJKMRmeuFCPWv1bFPpjvQQ6UieNI0haNTu1Ra75eaf8HpZQKDecTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127365; c=relaxed/simple;
	bh=tiSil00U2JnnP/E3p6huezKqRMcZxe+h8zlz8nw2jKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVic2l1e2zsjhwQZswLV4ZCuezoucrjVcsvbBv+WSXfjWJsyDCbMPO7GBPP27lzDNZYE6hv1imOobccwNxBUrlQwY3fyeMDa3LtGPntJF+2D+YDKboKTHqDymXFf0ytuvZceffVG1myFcdltLHmeDHnlCquNfXeEqyuydHoAb8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B08O8XZt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C868BC4CED6;
	Fri, 21 Feb 2025 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740127365;
	bh=tiSil00U2JnnP/E3p6huezKqRMcZxe+h8zlz8nw2jKs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B08O8XZtpmkFmyuZRyImuXZVPePB/tjexi6Y/rSbdFMvp/WHg67u+UOAjYf1bSSxC
	 jmuIUGF3/TIpbf6do3X9wkSaWZX33AIphlbuZn/dL3n+YujVlpVNHczq0xjqSn1VGi
	 sbI+sU/IuSxeRMo68/2GVsqJnFOzIDibdnOZtLXd53NAz3F+OXs6qIhSnZEq1XpJnn
	 CEgz09/e3ehmXX3Zs0LVt++4Q6q76Mx9Bnky5vOS7d6WH2neMBTnmzrTYXxxcAaCMy
	 aNW/iqvr0pNhEjTulukl79VeZn4Sea93fu3CLwKRyb0/D9iLWnRzUXW36V51tQjmS6
	 +q0h6tmOYkcEw==
Message-ID: <abe231fb-6891-4008-92a9-9c3525ea0bcf@kernel.org>
Date: Fri, 21 Feb 2025 09:42:41 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: add support for TI LP5860 LED driver chip
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Steffen Trumtrar <kernel@pengutronix.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de>
 <20250220-v6-14-topic-ti-lp5860-v1-2-42874bdc7513@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250220-v6-14-topic-ti-lp5860-v1-2-42874bdc7513@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2025 13:57, Steffen Trumtrar wrote:
> This adds support for the Texas Instruments LP5860 LED driver chip
> via SPI interfaces.
> 

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

....


> +
> +	return 0;
> +}
> +
> +int lp5860_device_init(struct lp5860 *lp)
> +{
> +	int ret;
> +
> +	dev_set_drvdata(lp->dev, lp);
> +
> +	ret = lp5860_enable_disable(lp, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(lp->regmap, LP5860_DEV_INITIAL,
> +				 LP5860_MODE_MASK,
> +				 LP5860_MODE_1 << LP5860_MODE_OFFSET);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sysfs_create_group(&lp->dev->kobj, &lp5860_group);


Where is ABI documentation?

> +	if (ret)
> +		return ret;
> +
> +	return lp5860_probe_dt(lp);
> +}


...

> +static const struct of_device_id lp5860_of_match[] = {
> +	{ .compatible = "ti,lp5860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lp5860_of_match);
> +
> +static struct spi_driver lp5860_driver = {
> +	.driver = {
> +		.name = "lp5860",
> +		.of_match_table = of_match_ptr(lp5860_of_match),


Drop of_match_ptr, you have a warning here.

> +	},
> +	.probe	= lp5860_probe,
> +	.remove = lp5860_remove,
> +};
> +
> +module_spi_driver(lp5860_driver);
> +
> +MODULE_DESCRIPTION("TI leds lp5860");
> +MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("spi:leds-lp5860");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.

Best regards,
Krzysztof

