Return-Path: <linux-leds+bounces-7849-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CChgBv537mkGuQAAu9opvQ
	(envelope-from <linux-leds+bounces-7849-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 22:39:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C546B153
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 22:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 386953021708
	for <lists+linux-leds@lfdr.de>; Sun, 26 Apr 2026 20:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1755138C2D0;
	Sun, 26 Apr 2026 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DZt2ERlL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F2390231
	for <linux-leds@vger.kernel.org>; Sun, 26 Apr 2026 20:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777235911; cv=none; b=TG/Vdt/62FJIOSjdzn6ouCP+84Fk6Vt+mPKFLR+YQToVJjWhE3IuLxussL1HTRpmM6JUYB0fkJAtslnk0MrEUk6KGsbwsJ9k4V75EFOQl72rZExH+EZfZ5hF68ZpjiQsuE41nOLi3nPb4Qmnp/bk60mnUr2pLPaZiX0gnckwOZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777235911; c=relaxed/simple;
	bh=vhIqbUdv4595pfGZ0r1BCSrtI+d5+f71OXeW7HFEL7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRM3+avob4s8umGsVM6pyh2kC51GqSr36OTenmqE9OInM5t5WKu/SEX9XYmCrBWSoBUAp6WNBENLUOor2lDn6LhsuauVeV6fmIG5Q2IZL5u4qd0wXrWA6q2d8sIZyElWT52BEcfcsemUku8XwGB6/tO3MyxDt1RXSJZAyd6y/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=DZt2ERlL; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662] ([10.65.86.53])
	by smtp.orange.fr with ESMTP
	id H6EAwd89ZFywtH6EAw9gFk; Sun, 26 Apr 2026 22:37:18 +0200
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id H6E1wlaVCPPElH6E1wZ6pU; Sun, 26 Apr 2026 22:37:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1777235830;
	bh=dpSb/V5MnjDzQ2Iuwgc4ruJLtguDARugkMy+ZbUbnDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DZt2ERlLZ8GixYw1Q2FI5NAn048uiRletnSzioPwZxoODjDi6yllUPlequW8fYDOI
	 wm94GPJKKCPP2Zn5Y2gSC0VRjVFXxb7b0EmZOLuhxDcXu8/edbEz421uPTj26ZZtEA
	 DoikVL7If4BZ9eXYEC/6ds2oo6kBYYcdtz4WQcr8FB8EhXylyZy2jvianSheuW45/x
	 7hElyrM3o14gVtQuttiJVjywuih668e2p++U/IPSazZnoPchCEeP7l/0mn27DXo5tv
	 336lN4u06KDdu4dyD7oBMUefWxq+gb1MPlGsdwrsfUbKAfI1eTYkyNSCQubhWE77J/
	 7ZHy9znNWJrnQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Apr 2026 22:37:10 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <9bd95631-a783-475d-b046-63bc93d713d9@wanadoo.fr>
Date: Sun, 26 Apr 2026 22:37:08 +0200
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
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 660C546B153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7849-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,kernel.org];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]

Le 24/04/2026 à 15:28, Steffen Trumtrar a écrit :
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

Hi,

> +static int lp5860_init_dt(struct lp5860 *lp)
> +{
> +	struct led_init_data init_data = {};
> +	struct led_classdev *led_cdev;
> +	struct mc_subled *mc_led_info;
> +	struct lp5860_led *led;
> +	int led_index = 0;
> +	int chan;
> +	int ret;
> +
> +	device_for_each_child_node_scoped(lp->dev, multi_led) {
> +		led = &lp->leds[led_index];
> +
> +		init_data.fwnode = multi_led;
> +
> +		/* Count the number of channels in this multi_led */
> +		chan = fwnode_get_child_node_count(multi_led);
> +		if (!chan || chan > LP5860_MAX_LED_CHANNELS)
> +			return -EINVAL;
> +
> +		led->mc_cdev.num_colors = chan;
> +
> +		mc_led_info = devm_kcalloc(lp->dev, chan, sizeof(*mc_led_info), GFP_KERNEL);
> +		if (!mc_led_info)
> +			return -ENOMEM;
> +
> +		led->chip = lp;
> +		led->mc_cdev.subled_info = mc_led_info;
> +		led_cdev = &led->mc_cdev.led_cdev;
> +		led_cdev->max_brightness = LP5860_MAX_BRIGHTNESS;
> +		led_cdev->brightness_set_blocking = lp5860_set_mc_brightness;
> +
> +		ret = lp5860_iterate_subleds(led, &init_data);
> +		if (ret)
> +			continue;
> +
> +		ret = lp5860_set_mc_brightness(&led->mc_cdev.led_cdev, led->brightness);
> +		if (ret) {
> +			dev_err_probe(lp->dev, ret, "%pfwP: Failed to set Multi-Color brightness\n",
> +				      multi_led);
> +			return ret;

This could be return dev_err_probe();
This is slightly less verbose and saves the { }

> +		}
> +
> +		ret = devm_led_classdev_multicolor_register_ext(lp->dev, &led->mc_cdev, &init_data);
> +		if (ret) {
> +			dev_err_probe(lp->dev, ret, "%pfwP: Failed to register Multi-Color LEDs\n",
> +				      multi_led);
> +			return ret;

This could be return dev_err_probe();
This is slightly less verbose and saves the { }

> +		}
> +		led_index++;
> +	}
> +
> +	return 0;
> +}



