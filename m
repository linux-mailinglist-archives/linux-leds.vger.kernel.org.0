Return-Path: <linux-leds+bounces-8839-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UeiuFlRtRmoGUgsAu9opvQ
	(envelope-from <linux-leds+bounces-8839-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 15:53:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 473ED6F8918
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 15:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E4d7NAQ3;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8839-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8839-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 865B8300530B
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 13:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0989A4ADD8E;
	Thu,  2 Jul 2026 13:49:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53494ADD89;
	Thu,  2 Jul 2026 13:49:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000180; cv=none; b=o8vwcWx1NSLmFMQ2KOacaULz4qMLlwzaGy1f7zd6fboQ5uFir6mlxCQEu1WMYgbrvqtTS3dWsyAWxxSErvCbyTLM97C0oMgRLK2agAkl1Vusa9eHY2rzRftszBs+MHryiPmis35BZeFS56bApfI9rQECTirgj7FCwAI6Agwfs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000180; c=relaxed/simple;
	bh=G85VWkQ2/aPk9u2tihin6PCwG+OST33NH+bEGoH23l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6jNjgvQ8caegSV8GHyQ50PRVfcDLoo13G9v9dIuoogluTZnIjFYtysC7jBTIgknWD+KyK7RYRRXlhnrYdLFeOO28UldF4dX47xCAJsK0iVNDwxQYHgR9wA7vH6bMF1t5JvNCziKIIp6hI1X9mME0ustqFP9cDqC+THTw4FOj64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4d7NAQ3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC0C1F00A3A;
	Thu,  2 Jul 2026 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783000179;
	bh=yGeq2baMUbY7SFJzHJJI30FMkpo+octfDeH0zUu/83I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4d7NAQ3qpHqoBBOTm47ieIbLhEbHWq/zi1JxrSseLcFtg2lzOosDT0z0RrZm4bqm
	 PN7eIqXu99j13JBtG2bBklDkBGlMhk6W6HvoPCLd9C7NpO2Fr8XsNgBRths3mx3t3Q
	 svRJf1vRg6LbFJop9cnJtJIhiAMLC1EBOD9/qiTMFUFl5kHJwMlQajcbO1PiKsmo+d
	 RpWzQlG6Dcz45ZrZQtaA64u6GBGhd4Et1oXCJCoDwvekyIgJodvHn8xQN0APv/YiWk
	 fbg6nfMydOJzn1tyTlY87p9FToDUlPFdu+bD0lTImj47qLZZB6X47zX5i9V5zZk81E
	 e+HbGz6cMxqiA==
Date: Thu, 2 Jul 2026 14:49:35 +0100
From: Lee Jones <lee@kernel.org>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] leds: lp5860: Return an error for an out-of-range
 'reg' property
Message-ID: <20260702134935.GO2108533@google.com>
References: <20260618142133.27377-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618142133.27377-1-mertsftl@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8839-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,vger.kernel.org,intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 473ED6F8918

Please consider / reply to these.

/* Sashiko Automation: Reviewed (3 Findings) */

On Thu, 18 Jun 2026, Mert Seftali wrote:

> lp5860_iterate_subleds() checks the result of reading the "reg" property
> and the channel range in a single condition:
> 
> 	if (ret < 0 || channel > LP5860_MAX_LED)
> 
> When fwnode_property_read_u32() succeeds but the channel is out of range,
> ret is 0, so the error path passes 0 to dev_err_probe() and returns 0 -
> an out-of-range "reg" is silently accepted instead of rejected. The
> shared "'reg' property is missing" message is also inaccurate when the
> property is present but out of range.
> 
> Split the two cases: report a read failure with if (ret), and reject an
> out-of-range channel with -EINVAL. Each case now has its own accurate
> error message.
> 
> Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/
> Signed-off-by: Mert Seftali <mertsftl@gmail.com>
> ---
> Changes in v2 (per Lee Jones review):
> - Split the combined read/range test into separate checks: use if(ret)
>   for the read failure, and reject an out-of-range channel with -EINVAL.
> - Give each case its own accurate message instead of the shared
>   "missing" one, and drop the nested "if (ret >= 0)".
> 
>  drivers/leds/rgb/leds-lp5860-core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index fd0e2f6e6e0f..bc59be87b08f 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -114,13 +114,21 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
>  		}
>  
>  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
> -		if (ret < 0 || channel > LP5860_MAX_LED) {
> +		if (ret) {
>  			dev_err_probe(led->chip->dev, ret,
> -				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
> +				      "%pfwP: Cannot read 'reg' property. Skipping.\n", led_node);

This isn't a bug introduced by this patch, but while reviewing the driver
I noticed a double unlock in lp5860_device_init():

drivers/leds/rgb/leds-lp5860-core.c:lp5860_device_init() {
        ...
        mutex_lock(&lp->lock);
        ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, 
                                 LP5860_MODE_MASK,
                                 LP5860_MODE_1 << LP5860_MODE_SHIFT);
        if (ret)
                goto err_disable;
        mutex_unlock(&lp->lock);

        ret = lp5860_init_dt(lp);
        if (ret)
                goto err_disable;

        return 0;

err_disable:
        mutex_unlock(&lp->lock);
        ...
}



[Severity: High]
If lp5860_init_dt() fails, doesn't the jump to err_disable result in
calling mutex_unlock() on an already unlocked mutex?


This is also a pre-existing issue, but I noticed a potential
use-after-destroy involving the same mutex in the removal path:

drivers/leds/rgb/leds-lp5860-spi.c:lp5860_remove() {
        ...
        mutex_destroy(&lp5860->lock);

        lp5860_device_remove(&spi->dev);
}

Calling lp5860_device_remove() ends up taking the lock again:

drivers/leds/rgb/leds-lp5860-core.c:lp5860_device_remove() {
        ...
        lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
}

drivers/leds/rgb/leds-lp5860-core.c:lp5860_chip_enable() {
        guard(mutex)(&lp->lock);
        return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);
}



[Severity: High]
Does this sequence result in lp5860_chip_enable() locking a mutex that
was just destroyed by lp5860_remove()?

>  			fwnode_handle_put(led_node);
>  			return ret;
>  		}
>  
> +		if (channel > LP5860_MAX_LED) {
> +			dev_err_probe(led->chip->dev, -EINVAL,
> +				      "%pfwP: 'reg' %u is out of range. Skipping.\n",
> +				      led_node, channel);
> +			fwnode_handle_put(led_node);
> +			return -EINVAL;
> +		}
> +
>  		led->mc_cdev.subled_info[subled].color_index = color_index;
>  		led->mc_cdev.subled_info[subled].channel = channel;
>  		ret = lp5860_led_init(led, init_data->fwnode, channel);
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones

