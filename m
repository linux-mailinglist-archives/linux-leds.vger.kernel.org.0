Return-Path: <linux-leds+bounces-7097-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG9QB7VGqWl53gAAu9opvQ
	(envelope-from <linux-leds+bounces-7097-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 10:02:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340220DE1D
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 10:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1292330F05FA
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 08:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0476375F8E;
	Thu,  5 Mar 2026 08:57:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62437649D
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701078; cv=none; b=IXczsoeHKztdZKkVbCikVA2HaC57MAtaTnRCojWLh4l7UgdKdptWJdz7B6GvcoFzENIsiGTFzuxXI5nIeIwXtDS9Nya1/ei48CxL5gUISndnwjEmFLwaeK1u1wJE4aFf1Ir6Ctiz/yAQ60KpJqqyzf0QTK93UOeulagfNCjOeuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701078; c=relaxed/simple;
	bh=bLGA4IFBz1X5TGkhPBLxdl7O8KUi2Ao/Rn+mO3u3nSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sqqBMQvkGUznDagPhcqyAIuiiYJrMqFGOKJC5HJtNI/Kv0Upp8118uRwui/7QsLtLGKud6XmsIfvaGk61iAyBA1zNfypfQHRoyffq5LhxdQWARSK8mcoGMr+8HcoDfID0zBry0kUxitrylS+pkDKM8e4A+XSbyHegRr3EJeeObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vy4Wm-0007bk-VL; Thu, 05 Mar 2026 09:57:53 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Steffen Trumtrar <kernel@pengutronix.de>,
  linux-leds@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: rgb: lp5860: add enable-gpio
In-Reply-To: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-2-f5e8edeb5d74@pengutronix.de>
	(Steffen Trumtrar's message of "Tue, 17 Feb 2026 16:35:17 +0100")
References: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
	<20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-2-f5e8edeb5d74@pengutronix.de>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Thu, 05 Mar 2026 09:57:52 +0100
Message-ID: <875x7avejz.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 7340220DE1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-7097-lists,linux-leds=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,pengutronix.de:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-02-17 at 16:35 +01, Steffen Trumtrar <s.trumtrar@pengutronix.de> wrote:

Hi!

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

Is this okay? Anything needs to be done here?


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

