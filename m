Return-Path: <linux-leds+bounces-7898-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFGnMWTt8WmalQEAu9opvQ
	(envelope-from <linux-leds+bounces-7898-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 13:37:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF34939F3
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 13:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0B7B3023A74
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A807F3A1A5B;
	Wed, 29 Apr 2026 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbojCgyx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A226B2D2;
	Wed, 29 Apr 2026 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462621; cv=none; b=iuha/JTHPdhv6TSrf9ToGdBFYJEhZpZ1nQ334YD056hG857ywEmPxiyb0pDtZnpoeqroCnm3DDsoSy3XtCjYSgoc0G2j0b6/WPwNhuMc8Fx1d0p8sKSO4tvftPpe1bxucRwBfmPTdwH+hTahlOMyTOjSU39P2OsEH1eDPe6rvek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462621; c=relaxed/simple;
	bh=+CtpYDWRU0lzlDz1A8KTGZXFMUfWoyOh9Y7j+aS8jhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTMldanPfuYAPalDkjIYWBGe/YjV/DISkCcwOBMDw2VUwJiBuAM0BOXGpGCWCCX28LQuyXri1ZLCqIyMsNlOe7B98/mKN8YQvk2MHB+LYSWYnpwxLvclH4oYF5tZoUsu7a60/aHizf+JyraPwmnG4S7sjrNGxGQ9alQxN241h7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbojCgyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCB1C19425;
	Wed, 29 Apr 2026 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777462621;
	bh=+CtpYDWRU0lzlDz1A8KTGZXFMUfWoyOh9Y7j+aS8jhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbojCgyxsFkSlSjhr5AXlFoBenS47F6oVAIN3Xm7ZJfN0ZzBYwMoKSorlCmrrDPtw
	 E1IcZMlI//74Z8mvN6HWvcWQzV62xy1A+LYvauL92GDs+/LbujErKq/bPgId0gYBXk
	 x79/Hr6nXiv1Avdj9r/higuZNZfkCMTj3qb+D8TtiRyBf0NzbfCC4BKT+ys4pusWRs
	 AX2/u5H4q7TemSriKduaWWx5MgQ6yXcrTgWFfYgUflk8DB99Pu2rxenG0ELWaGV/q2
	 yEPpWPtdvmYNoXCYqawY9caTKS+Ku3g441OQTFoszjF83ah9IKLiHMRzM/ZkOlTp0a
	 SccALby2VvG8w==
Date: Wed, 29 Apr 2026 12:36:56 +0100
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: rgb: lp5860: add enable-gpio
Message-ID: <20260429113656.GA1806155@google.com>
References: <20260408-v6-19-topic-ti-lp5860-enable-gpio-v3-1-da59a9005386@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-v6-19-topic-ti-lp5860-enable-gpio-v3-1-da59a9005386@pengutronix.de>
X-Rspamd-Queue-Id: 6ADF34939F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7898-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:email]

On Wed, 08 Apr 2026, Steffen Trumtrar wrote:

> The VIO_EN pin can either be connected with VIO power supply or GPIO.
> Get the GPIO from DT if provided and set it on chip enable and disable.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes in v3:
> - remove unnecessary validation checks
> - update dep to newer lp5860 series
> - Link to v2: https://lore.kernel.org/r/20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-0-3fcc617fe03a@pengutronix.de
> 
> Changes in v2:
> - add acked-by
> - updated deps to newer lp5860 series
> - rebased to v7.0-rc1
> - Link to v1: https://lore.kernel.org/r/20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de
> ---
>  drivers/leds/rgb/leds-lp5860-core.c | 9 +++++++++

I'm confused.

Why are you sending me patches for files that don't exist?

>  drivers/leds/rgb/leds-lp5860.h      | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index 31eebaf0269ab..5bccca47b20a1 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -5,6 +5,7 @@
>   * Author: Steffen Trumtrar <kernel@pengutronix.de>
>   */
>  
> +#include <linux/gpio/consumer.h>
>  #include <linux/led-class-multicolor.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> @@ -59,6 +60,8 @@ static int lp5860_set_mc_brightness(struct led_classdev *cdev,
>  
>  static int lp5860_chip_enable(struct lp5860 *lp, bool enable)
>  {
> +	gpiod_direction_output(lp->enable_gpiod, enable);
> +
>  	return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);
>  }
>  
> @@ -189,6 +192,12 @@ int lp5860_device_init(struct device *dev)
>  	struct lp5860 *lp = dev_get_drvdata(dev);
>  	int ret;
>  
> +	lp->enable_gpiod = devm_gpiod_get_optional(lp->dev, "enable", GPIOD_ASIS);
> +	if (IS_ERR(lp->enable_gpiod))
> +		return PTR_ERR(lp->enable_gpiod);
> +
> +	gpiod_set_consumer_name(lp->enable_gpiod, "LP5860 VIO enable");
> +
>  	ret = lp5860_chip_enable(lp, LP5860_CHIP_ENABLE);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/leds/rgb/leds-lp5860.h b/drivers/leds/rgb/leds-lp5860.h
> index b3ad8c46720cd..48a6afc4227d6 100644
> --- a/drivers/leds/rgb/leds-lp5860.h
> +++ b/drivers/leds/rgb/leds-lp5860.h
> @@ -257,6 +257,7 @@ struct lp5860_led {
>  struct lp5860 {
>  	struct device *dev;
>  	struct regmap *regmap;
> +	struct gpio_desc *enable_gpiod;
>  	unsigned int leds_count;
>  
>  	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
> 
> ---
> base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
> change-id: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
> prerequisite-message-id: <20260403-v6-14-topic-ti-lp5860-v8-1-e127e80e875a@pengutronix.de>
> prerequisite-patch-id: 2fc7123c98bf6c53d946af75269ecb1a7b421f14
> 
> Best regards,
> --  
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> 

-- 
Lee Jones

