Return-Path: <linux-leds+bounces-7397-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EoHBf4QvGnbrwIAu9opvQ
	(envelope-from <linux-leds+bounces-7397-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 16:06:38 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2744A2CD643
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 16:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8750532592CD
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 15:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408B23E1CF5;
	Thu, 19 Mar 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJMRTh6w"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F313D6694;
	Thu, 19 Mar 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932537; cv=none; b=FwxqT6KIt75ycaYiRhUFk3+LswGbXVPm7kT2G2ojovFfRvpfuQYfAD80UXVlX5zf8CYzb+jv+ZfqN+Ibkh7V/QaprGQG7DTRnfuoZSeFI8Vk6vX8H2D05fpvIsgVieBbxalfR8Er66GPlIfy84EPfrTG9UB5S7JT8/sAuSIsjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932537; c=relaxed/simple;
	bh=Tk+7MqRbg1rN/hTtmp+QAGUuOzujmsKIhS89zPp9YJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oyd7pLImTWgGWW01trw24UlnDGjX8GmMy11I1UDZemLxlIpf17g131VgHgy59GS7HH7G2nVOxaJX2O3cCduE4PPgisPGFTRpjIxkK3jdaxPqYKPlVE2WZS2LToXPINC5Ywp8lLnNxfHBPp+TWrxcoC139Jv/qAuNbZHoW2V2UtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJMRTh6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D18C19425;
	Thu, 19 Mar 2026 15:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932536;
	bh=Tk+7MqRbg1rN/hTtmp+QAGUuOzujmsKIhS89zPp9YJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJMRTh6w5n4nuekTX2apd//n6UlUZPiRPCTPtPFXPolcaWHg1kJ/m5TLv5fQNG8WO
	 O3XVtwmJfBtbee7gR2ekIW8aq36+cxcCV4dy38bERTS1N3eMwoOdN7KRmuaPiICZ8D
	 uKXXr1xfeO0mVNwSHVGOJInIe1DjpCVMuga6SyRfEWxpqOnQUsRAyUFZbsMxwJDv4M
	 G/6Y+HDTxmhVqDcPSemJKpmraa7Ouc/Pzi8DJ2wV80xwSg1Hci2iuPbjaaJteS+Fvv
	 /DxWpC7Emh+sUVsXgUVB3KlpU5QGTCOfxUFujNoHZbTefcCpTHOM5eHR44x/HqmeL8
	 pas+B+WG/teOA==
Date: Thu, 19 Mar 2026 15:02:07 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: rgb: lp5860: add enable-gpio
Message-ID: <20260319150207.GK554736@google.com>
References: <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-0-3fcc617fe03a@pengutronix.de>
 <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-2-3fcc617fe03a@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-2-3fcc617fe03a@pengutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7397-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 2744A2CD643
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026, Steffen Trumtrar wrote:

> The VIO_EN pin can either be connected with VIO power supply or GPIO.
> Get the GPIO from DT if provided and set it on chip enable and disable.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/leds/rgb/leds-lp5860-core.c       | 10 ++++++++++
>  include/linux/platform_data/leds-lp5860.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index 28b4d86e11f1a..1f349aa53f7a9 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -61,6 +61,9 @@ static int lp5860_set_mc_brightness(struct led_classdev *cdev,
>  
>  static int lp5860_chip_enable_toggle(struct lp5860 *led, int enable)
>  {
> +	if (led->enable_gpiod)

gpiod_direction_output() validates this for you.

> +		gpiod_direction_output(led->enable_gpiod, enable);
> +
>  	return regmap_write(led->regmap, LP5860_REG_CHIP_EN, enable);
>  }
>  
> @@ -170,6 +173,13 @@ int lp5860_device_init(struct device *dev)
>  	struct lp5860 *lp = dev_get_drvdata(dev);
>  	int ret;
>  
> +	lp->enable_gpiod = devm_gpiod_get_optional(lp->dev, "enable", GPIOD_ASIS);
> +	if (IS_ERR(lp->enable_gpiod))
> +		return PTR_ERR(lp->enable_gpiod);
> +
> +	if (lp->enable_gpiod)

gpiod_set_consumer_name() validates this for you.

> +		gpiod_set_consumer_name(lp->enable_gpiod, "LP5860 VIO enable");
> +
>  	ret = lp5860_chip_enable_toggle(lp, LP5860_CHIP_ENABLE);
>  	if (ret)
>  		return ret;
> diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h
> index 7bc69a7a550dd..7258d0674ce59 100644
> --- a/include/linux/platform_data/leds-lp5860.h
> +++ b/include/linux/platform_data/leds-lp5860.h
> @@ -257,6 +257,7 @@ struct lp5860_led {
>  struct lp5860 {
>  	struct device *dev;
>  	struct regmap *regmap;
> +	struct gpio_desc *enable_gpiod;
>  	unsigned int leds_count;
>  
>  	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
> 
> -- 
> 2.51.0
> 
> 

-- 
Lee Jones [李琼斯]

