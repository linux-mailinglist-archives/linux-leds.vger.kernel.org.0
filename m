Return-Path: <linux-leds+bounces-5808-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD26BEC93A
	for <lists+linux-leds@lfdr.de>; Sat, 18 Oct 2025 09:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2655A428000
	for <lists+linux-leds@lfdr.de>; Sat, 18 Oct 2025 07:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6355F2857FA;
	Sat, 18 Oct 2025 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="fUGMoXXk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-82.smtpout.orange.fr [80.12.242.82])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B5208D0;
	Sat, 18 Oct 2025 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760772182; cv=none; b=taSEC5rEXsHKNEnjlNgpsmFZpMSrsbqwFV7AlRYIvuIUDqaSaw454SNf0//xyHjF5Pso1H4Hc+3n00MCFJdghUTfskjdtwAk+ogiTn1GLHQcJopvQDZj0N5Wo1ZXZ5pZW+f2vyKU2BZ/537J+moL0zvizjSrhdvIv7vpOh2holg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760772182; c=relaxed/simple;
	bh=4uEvlBAYmsltQS176KSJnVy/MXGY8JMIEIF5qO2y3og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYPbgOEdug0X7/UnAUGXCoEwrxe+5QoN+W1SKpDQeKd7U4qZfHBvG8Qp97UVz98dO9b3W6/y1HyH+08YWropR8qfa61zZFhChvt+kVvRLf656ki5OrYBcfhIb3emuFNuBEUHp+9/R3Qq/gcLq0I1GZw/yFBAXUZhm/ubNqCmwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=fUGMoXXk; arc=none smtp.client-ip=80.12.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id A1H7v2QUeDOeWA1H7vhyXg; Sat, 18 Oct 2025 09:22:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1760772171;
	bh=Bawd82AsfuFTKM8Stm3LlRDyyfDsEkozbzB6NZp+2xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=fUGMoXXkEvq7MJkwe+cHVLCPA/7BVHf6fNaR/JgK6PadY7CVXrGjEzQF81ocx+cfA
	 DQkDQULC49ZwMKXMvunQtd3nOfy8evXHikvilxPDj8kAuXeCb8eOobJeQzh3GmD53M
	 Y2XJpFGSOC9R2xhqcDn4rb3ZbqNLTwlmDYdSp1fVj2848tn6e3Sv9F1C1E1TrZDwj+
	 ZE0B66i3a7LMn1h9sIR4bx5vVkTEc0SZ0Clzylw82N7x4m2A6kHamivFcvErO3GdhA
	 VH1Z1znws7QxAf1o4ARUcp3m2ST0HW+L29drtxT2x7UmCjrEu9s86mN6dkG/HQLoRI
	 yKACVjVrx/e2A==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Oct 2025 09:22:51 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a9aa5064-5bd8-4340-a1b6-bec6895dde57@wanadoo.fr>
Date: Sat, 18 Oct 2025 09:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/3] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251013173551.108205-1-trannamatk@gmail.com>
 <20251013173551.108205-3-trannamatk@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251013173551.108205-3-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 13/10/2025 à 19:35, Nam Tran a écrit :
> The LP5812 is a 4x3 matrix RGB LED driver with an autonomous animation
> engine and time-cross-multiplexing (TCM) support for up to 12 LEDs or
> 4 RGB LEDs. Each LED can be configured through the related registers
> to realize vivid and fancy lighting effects.
>
> This patch adds minimal driver support for the LP5812, implementing
> only the essential functionality: I2C communication with the device,
> LED registration, brightness control in manual mode, and basic sysfs
> interfaces for LED configuration and fault monitoring.
>
> Signed-off-by: Nam Tran <trannamatk@gmail.com>

Hi,

2 small nitpicks, if a v17 is need for other reasons.

...

> +static int lp5812_parse_led(struct device_node *np,
> +			    struct lp5812_led_config *cfg,
> +			    int led_index)
> +{
> +	int num_colors = 0, ret;
> +
> +	of_property_read_string(np, "label", &cfg[led_index].name);
> +
> +	ret = of_property_read_u32(np, "reg", &cfg[led_index].chan_nr);
> +	if (ret)
> +		return ret;
> +
> +	for_each_available_child_of_node_scoped(np, child) {
> +		ret = lp5812_parse_led_channel(child, cfg, led_index, num_colors);

In order to simplify lp5812_parse_led_channel() and save an argument 
here, we could pass &cfg[led_index] directly.

> +		if (ret)
> +			return ret;
> +		num_colors++;
> +	}
> +
> +	if (num_colors == 0) {
> +		ret = lp5812_parse_led_channel(np, cfg, led_index, 0);
> +		if (ret)
> +			return ret;
> +		num_colors = 1;
> +		cfg[led_index].is_sc_led = true;
> +	} else {
> +		cfg[led_index].is_sc_led = false;
> +	}
> +
> +	cfg[led_index].num_colors = num_colors;
> +
> +	return 0;
> +}

...

> +/* Chip specific configurations */
> +static struct lp5812_device_config lp5812_cfg = {

This could be const.

> +	.reg_reset = {
> +		.addr = LP5812_REG_RESET,
> +		.val  = LP5812_RESET
> +	},

CJ


