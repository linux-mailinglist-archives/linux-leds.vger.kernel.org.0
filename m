Return-Path: <linux-leds+bounces-7848-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5QK8M/AH7mm5qAAAu9opvQ
	(envelope-from <linux-leds+bounces-7848-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 14:41:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C5469CFB
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 14:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 584613011763
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 12:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30E335836B;
	Sun, 26 Apr 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eex8Y6UG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220C0286D73
	for <linux-leds@vger.kernel.org>; Sun, 26 Apr 2026 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207277; cv=none; b=EsL72JT8RlFyR963V3VEvSoPYG+LaS9TeWhxSvZRYGkOEetmMgmMNRKkIp8St9NqCG2mNQjEZqVGaER5x+0Fz+zYvhhwrlpXf/QG00K9nMD0OJ6Xywel0fKbvIBua4URKIGs8qsHvkSH8sxhXHXtm3pBYJUKo9mLco2vpZEtK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207277; c=relaxed/simple;
	bh=8uZqWib87JQKwK1IbPwHjUWI4NthwEGaeUn5EZlIdWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPCMoKmQiovw39lV+ZXyjSeGvdv9thqoW+k5EdokuD7czMWRhRCl5DPel11iL/QKNOzs8aRRX2n7sroXk0ql+C40MSEtAGhOz4hkdJug5te2L8UzfWsig/e0TENBTkBh6XmBrI9HOkCP7f6M11WOVQ/z3osxJE3TYoKWQVr65TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eex8Y6UG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so11615859e87.1
        for <linux-leds@vger.kernel.org>; Sun, 26 Apr 2026 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777207274; x=1777812074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSMTNREp3Te6IScbhyBWeT+VZwwFBx8bmgCfL3Le1MM=;
        b=eex8Y6UGmzz9hHsowEjju77Dpf2D4Wv0qn54Lif1ceCJzqLR3B6+0EhiiqNmfgVyMO
         MGBH5ZGV+sRygNakktqK5pwqmPwtRh/TwvGhZqxpqy162fGCYkKPJcGKDOaqg0Av9tQd
         UDhC1AaLltPR+Q8WM689uwCCLeqfRJyP87gzpDa0CIAZmZ8bMn+7adCdLPEdr/G2TWeL
         LbYoeDOFxgBFRs3Yttg7XEhlKTYvqmWxQt00h6rr/BfZNHI6ufcY5h9t+TtjokkrHs9R
         1w6kAF/+8lw6UjTqM0Mu8IQ1lqxmP9r37aaeYwgBIMdS4dvFsBw9Eq2fSvLsho876nYT
         zKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777207274; x=1777812074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSMTNREp3Te6IScbhyBWeT+VZwwFBx8bmgCfL3Le1MM=;
        b=bhv3Nnitb+Bl7BvuKrTfBMNqQ6iUcKt2h4k8zYEPev+KecDgeZwAhRN1TUb3VHqpKu
         G7oXSc9qFcKBnRi9Sxei07QIKbXQYVhAB305t5m7GY10K3TOw32KTaEpRTODHauylgUw
         KL5Xn/wxCaUQX5UfZkxN64cBYMVaPMAsN4zjb5/HF2ztST6R1jnjdul1HfUDIeoVlGmJ
         +HrTvA8IXYMXXqObZBKNf5pTxiEllReVHIn9V2I73w59noRJ1PozX/pHLCfoJeZkO2dj
         cSM4y3tt43OOIywkduuC1tBt8UDExkl1ndUT5SOfyfPFVn5PYeO1Ihr+oY4b/UbzuSsK
         eEdw==
X-Forwarded-Encrypted: i=1; AFNElJ9OHVJkCqZ0ZOfxmPstxEbdgmdC0wTucqdwBk+eSDp8EHEIhVJfF3efGpfCtzREPPsMTrK1OaFnUoMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7KsKkklIMdoKODXVQxrMRk9kxGHJAl9EikQTPf3Vbf/la082C
	/FoNrgxARwrlR1J1y+6418R459BiiuZKWAWzCSS2m4lCHehKSwml2xqW
X-Gm-Gg: AeBDietFB/EL7nFGBMBcnvHD1wpBmC/c+CJPZ9ay14nh/0KZnJRjDOU/N/DIgK1WHuN
	/62oO00cY69I+jRbE7NJSBp40bDL7GN/zR0habCWISdHUPpGRb3mt9Te76FX+Tks0OTcNVeqmr4
	4SW6fb+G0IrlYznJMwSos9woifjuTxFF7x/QNgxLM2Gtr+i0r031BAtbCS578l7DSL3pfHcdnf6
	PDxF4h6h7D4UhaYoe0fGohXIuh1tLvMN4q54NQHnBN5TdA8jLB2zxgLyQ5rstjvC2AAK0ubmdkA
	sxH0wKSnICPjvutdSnOZLNYZmhL4ty755eKTtH4bG/AmICGso76ty04AHOMmKJ1BlCPU91Jv4Jg
	Q209Iniv5CU15q3+QFr5cX3fxc1rT1BbWFfm5epUPWTWazhCc9xlE+jrLrEhFljUDfdt5+DjtV/
	Wt2aSbg3I1HJl3602mVAuYeuJ96guZBrhSLK/NZulN9cc4tQ==
X-Received: by 2002:a05:6512:3196:b0:5a2:843f:5800 with SMTP id 2adb3069b0e04-5a4172e7c8fmr14687683e87.23.1777207273986;
        Sun, 26 Apr 2026 05:41:13 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a57sm7319133e87.57.2026.04.26.05.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 05:41:12 -0700 (PDT)
Message-ID: <aae0901b-ebfd-4d40-9880-116b881c9a90@gmail.com>
Date: Sun, 26 Apr 2026 14:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] leds: add support for TI LP5860 LED driver chip
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2B2C5469CFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7848-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]

Hi Steffen,

On 4/24/26 3:28 PM, Steffen Trumtrar wrote:
> Add support for the Texas Instruments LP5860 LED driver chip
> via SPI interfaces.
> 
> The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> short and open detection of the individual channel select lines.
> 
> It can be connected to SPI or I2C bus. For now add support for SPI only.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
[...]
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> new file mode 100644
> index 0000000000000..648bf168f94bf
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Pengutronix
> + *
> + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> + */
> +
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#include "leds-lp5860.h"
> +
> +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
> +{
> +	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
> +}
> +
> +static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
> +{
> +	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> +	unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
> +
> +	if (dot > LP5860_MAX_LED)
> +		return -EINVAL;
> +
> +	return regmap_update_bits(led->chip->regmap,
> +				  LP5860_REG_DOT_ONOFF_START + offset, mask,
> +				  enable ? LP5860_DOT_ALL_ON : LP5860_DOT_ALL_OFF);
> +}
> +
> +static int lp5860_set_mc_brightness(struct led_classdev *cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct lp5860_led *led = mcled_cdev_to_led(mc_cdev);

You need mutex locking while accessing hw to avoid leaving the
device in an inconsistent state in case of two parallel requests from
different processes.

> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	for (int i = 0; i < led->mc_cdev.num_colors; i++) {
> +		unsigned int channel = mc_cdev->subled_info[i].channel;
> +		unsigned int led_brightness = mc_cdev->subled_info[i].brightness;
> +		int ret;
> +
> +		ret = lp5860_set_dot_onoff(led, channel, !!led_brightness);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_write(led->chip->regmap,
> +				   LP5860_REG_PWM_BRI_START + channel, led_brightness);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lp5860_chip_enable(struct lp5860 *lp, bool enable)
> +{
> +	return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);


-- 
Best regards,
Jacek Anaszewski


