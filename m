Return-Path: <linux-leds+bounces-7389-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO0dJKHPu2k4owIAu9opvQ
	(envelope-from <linux-leds+bounces-7389-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 11:27:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB612C976A
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 11:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50D0E3026BFA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BEA377EC6;
	Thu, 19 Mar 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuVbuLOr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35BF36D500;
	Thu, 19 Mar 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915211; cv=none; b=RLkh9757KRpg269REjic+GlOKF92lavw/SE3cb6B9uOiWsIew37B9u62jEhSMlpM4aIHlW/SkJxpNCJ6AuZomgUVjl+TB801pCc2bT5Ep5Jqi8QFTQrFtHF6jxxnOyu7aQew+pFF4WqcWC4Qkn8wU6ndXMOJy9w7ELRxkcVWdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915211; c=relaxed/simple;
	bh=/PNS8zMSnFp8b2AyP8r+LdPCLmEHr5rxK3iBDnxZxAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpElTi1fVtpREN1FTiUlLDgFgRYxiDAZWVA1OeAyb4uQm+0t899AekS+m89xZCVHuQzZpHndh/cA6mhbZ+DERMSYAdJ2W/GekxoF8PHlv5lu1oxybR3ggqVCtAp9dBUSQYO/vXS5fmnI9DwpkHkAq+pA9no+d6zj6WtitvYiyZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuVbuLOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AA6C19424;
	Thu, 19 Mar 2026 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773915211;
	bh=/PNS8zMSnFp8b2AyP8r+LdPCLmEHr5rxK3iBDnxZxAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuVbuLOrte3lAaloniaouYU5BCbMyUlWBiW1ShQj33xbfraKMZ0lsAaecOFRxpgjf
	 HYOb9wIz8AtiWv/X5PSivD66QdXmbDDc9s2ZQsKVYDVMW3rXVIAGxDfiR2xSm1CiOf
	 lgRh7CnVOgF0fNau3wAu2McvfjfE4KvkGdKu0P07wjpi4xEuPzSLDDMRos3GsoRyCK
	 +vP7qaTj6KmybDQTkhgbldkH3edXh+D2iM1Quh4xtlmfY7S0aFc83oyjy8z3s/BPXz
	 WCAmM0Og9AAGOdWFJvxhtqq0yrz7yisclxNxgSktAJNOv5NJmYcw/oyqZVbkMQNg/g
	 PlnrWrQ5R98bw==
Date: Thu, 19 Mar 2026 10:13:27 +0000
From: Lee Jones <lee@kernel.org>
To: Bevan Weiss <bevan.weiss@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] leds: syscon: Add tristate option
Message-ID: <20260319101327.GH554736@google.com>
References: <20260308015824.2318366-1-bevan.weiss@gmail.com>
 <20260308015824.2318366-2-bevan.weiss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308015824.2318366-2-bevan.weiss@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7389-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: CBB612C976A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 08 Mar 2026, Bevan Weiss wrote:

> This reverts commit f7d98a65d031 ("leds: syscon: Make the driver
> explicitly non-modular").
> 
> OpenWrt builds with a single .config for a given subtarget, whilst boards
> below that subtarget may not want to carry the disk usage of all options.
> So there is a preference to have all functionality not required on all
> boards as modules that can simply not be included in a given board rootfs
> to reduce disk usage.
> 
> Additional changes:
> - (int)(struct platform_device *pdev) => void return

Please rephrase into a human parseable sentence.

> - Add MODULE_DESCRIPTION and MODULE_LICENSE macros
> - Add tristate option to Kconfig
> 
> Signed-off-by: Bevan Weiss <bevan.weiss@gmail.com>
> ---
>  drivers/leds/Kconfig       |  4 ++--
>  drivers/leds/leds-syscon.c | 20 +++++++++++++++++---
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 597d7a79c988..ea3afc76a9c6 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -903,8 +903,8 @@ config LEDS_POWERNV
>  	  will be called leds-powernv.
>  
>  config LEDS_SYSCON
> -	bool "LED support for LEDs on system controllers"
> -	depends on LEDS_CLASS=y
> +	tristate "LED support for LEDs on system controllers"
> +	depends on LEDS_CLASS
>  	depends on MFD_SYSCON
>  	depends on OF
>  	help
> diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
> index d633ad519d0c..bc968e8a326d 100644
> --- a/drivers/leds/leds-syscon.c
> +++ b/drivers/leds/leds-syscon.c
> @@ -6,7 +6,7 @@
>   * Author: Linus Walleij <linus.walleij@linaro.org>
>   */
>  #include <linux/io.h>
> -#include <linux/init.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/stat.h>
> @@ -121,17 +121,31 @@ static int syscon_led_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void syscon_led_remove(struct platform_device *pdev)
> +{
> +	struct syscon_led *sled = platform_get_drvdata(pdev);
> +
> +	led_classdev_unregister(&sled->cdev);

The driver uses devm_led_classdev_register() in probe, which automatically
handles unregistering the LED class device when the driver is detached.
Calling it here manually will result in a double-unregister.

> +	/* Turn it off */

Turn what off?

> +	regmap_update_bits(sled->map, sled->offset, sled->mask, 0);

If 0 was defined, as it should be, then you can drop the comment.

> +}
> +
>  static const struct of_device_id of_syscon_leds_match[] = {
>  	{ .compatible = "register-bit-led", },
>  	{},
>  };
>  
> +MODULE_DEVICE_TABLE(of, of_syscon_leds_match);
> +
>  static struct platform_driver syscon_led_driver = {
>  	.probe		= syscon_led_probe,
> +	.remove		= syscon_led_remove,
>  	.driver		= {
>  		.name	= "leds-syscon",
>  		.of_match_table = of_syscon_leds_match,
> -		.suppress_bind_attrs = true,
>  	},
>  };
> -builtin_platform_driver(syscon_led_driver);
> +module_platform_driver(syscon_led_driver);
> +
> +MODULE_DESCRIPTION("SYSCON LED driver");
> +MODULE_LICENSE("GPL");

The MODULE_LICENSE() string should match the SPDX identifier at the top
of the file.

-- 
Lee Jones [李琼斯]

