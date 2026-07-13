Return-Path: <linux-leds+bounces-9057-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KNYmCyCAVGrCmgMAu9opvQ
	(envelope-from <linux-leds+bounces-9057-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 08:05:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1DA7476CF
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 08:05:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=my62gzNZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9057-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9057-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E8123014C6A
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 06:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE48C2D9ECD;
	Mon, 13 Jul 2026 06:05:17 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481719C54E
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 06:05:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922717; cv=none; b=kSmeug/gZswpC69meCfS8TH2A6G6bFeYyy/rdG3JT7W4k7M6M73sJonZ+dWzuWBzxxUcNQ3SJjWWLR0xJ6Y7MThgjriGKoggjf890faQuZro6xIkPsMPvJjIYlSuvlfWoP/0leCtc69XaESkEHosh7Kar3IgJG46zxqkroPgUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922717; c=relaxed/simple;
	bh=flEC5Ib+ShYRRZAKyDmkHSQa6rdc8AN5rChY3nfWyBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arAkL5ttjusA7y3Ko2mpdG/JtQUZlMX1U8NcV/2lX5+J2IZFx2S5OWOyJn969MtW7Z31ItSKt8iZB6rfbRtKph7sATSa5swHXNqAX/w3H2zyUiHkDoFXx1FxLmXc5mFFQZS8BiV/rhJscCZ2xUJPTLJ1iWsKcrgnRrs4XTaVeMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=my62gzNZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5F21F000E9;
	Mon, 13 Jul 2026 06:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783922716;
	bh=0VkWRSlZs2iDfuZBauVtbOAkMjb/rfAyvrzBNMOcoMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=my62gzNZItqM2dGEJK+9NEYx9LldUyu5whiu6+IZ8o8sBjoNd59zt75vQ1Fh/5AEX
	 yoqnkapsFPuRwGTDcQcxFS0O96ZOtVDf+KGidXtQQdpbuCoGu6kjFJNK/cNRj5xMVB
	 VDjQShHGwq/2EqbuyAvootkL2l23Cg2r/dnOguGTMNJ5mbm4812OZzoPETznipqxDg
	 xyRgrJsc2XfukjdXrlraxTGvOk9fEXWOru+oe4Ze6p+8RdX6VSCIzs42teMAVsP2OG
	 Eas9apho5UGtDRTI3FyUOwnuctWopvS4EAS7i4WnPOo+2mbKp0nqhVGdVE380WEr6t
	 uCXcswIbdR6mA==
Message-ID: <20b639b7-ba2a-4c06-bfef-970ab2ad3f9b@kernel.org>
Date: Mon, 13 Jul 2026 08:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: Texas Instruments LP5816 driver
To: Alistair Bell <dev@alistairbell.org>, linux-leds@vger.kernel.org
Cc: lee@kernel.org, pavel@kernel.org
References: <20260712184318.78852-1-dev@alistairbell.org>
 <20260712184318.78852-2-dev@alistairbell.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260712184318.78852-2-dev@alistairbell.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9057-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dev@alistairbell.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,siemens.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A1DA7476CF

On 12/07/2026 20:43, Alistair Bell wrote:
> Add support for Texas Instruments LP5816 4-channel I2C device,
> the driver provides:
> 
> - Independent 4-channel control via the multicolor sysfs class
> - Configurable fade effects, duration, fade profile and maximum
>   operating current via sysfs
> 
> Signed-off-by: Alistair Bell <dev@alistairbell.org>
> ---
>  MAINTAINERS                |   8 +
>  drivers/leds/Kconfig       |  12 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-lp5816.c | 443 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 464 insertions(+)
>  create mode 100644 drivers/leds/leds-lp5816.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f37a81950..b6a8c812a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26761,6 +26761,14 @@ F:	drivers/leds/rgb/Makefile
>  F:	drivers/leds/rgb/leds-lp5812.c
>  F:	drivers/leds/rgb/leds-lp5812.h
>  
> +TEXAS INSTRUMENTS' LP5816 RGBW LED DRIVER
> +M:	Alistair Bell <dev@alistairbell.org>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	drivers/leds/Kconfig
> +F:	drivers/leds/Makefile
> +F:	drivers/leds/leds-lp5816.c
> +
>  TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
>  M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
>  L:	linux-leds@vger.kernel.org
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c..ce3776adf 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -541,6 +541,18 @@ config LEDS_LP8864
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called leds-lp8864.
>  
> +config LEDS_LP5816
> +    tristate "LED driver for LP5816 chip"
> +    depends on I2C
> +    depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> +	select REGMAP_I2C
> +    help
> +      Say Y to enable support for the Texas Instruments LP5816
> +      RGBW LED connected via I2C.
> +
> +      To compile this driver as a module, choose M here:
> +      the module will be called lp5816.

Messed indentation. Please be sure you are sending consistent code, not
something written completely different than the rest.

> +
>  config LEDS_CLEVO_MAIL
>  	tristate "Mail LED on Clevo notebook"
>  	depends on LEDS_CLASS && BROKEN
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 7db376891..5ba7de099 100644
> --- a/drivers/leds/Makefile


...

> +
> +static ssize_t max_current_store(struct device *dev,
> +				 struct device_attribute *attr,
> +								const char *buf, size_t count)
> +{
> +	struct led_classdev *cdev;
> +	struct lp5816 *chip;
> +	int res, val;
> +
> +	cdev = dev_get_drvdata(dev);
> +	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
> +
> +	res = kstrtoint(buf, 0, &val);
> +	if (res < 0)
> +		return res;
> +	if (val < 0 || val > 1)
> +		return -EINVAL;
> +
> +	res = lp5816_multi_lock_write(chip, (const struct reg_sequence[]) {
> +		{ .reg = REG_DEV_CONFIG0, .def = val },
> +		{ .reg = REG_UPDATE_CMD, .def = UPDATE_CMD } }, 2);
> +	return (res < 0) ? res : count;
> +}


You cannot introduce own ABI duplicating existing sysfs interface.


> +
> +static int lp5816_probe(struct i2c_client *client)
> +{
> +	struct lp5816 *chip;
> +	char *name;
> +	int res;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return dev_err_probe(&client->dev, -ENOMEM,
> +			"failed to allocate lp5816 internal structure\n");

Since when any driver has such error message?

Please look at most recently addedd and reviewed drivers and learn from
them how typical code looks like.


Best regards,
Krzysztof

