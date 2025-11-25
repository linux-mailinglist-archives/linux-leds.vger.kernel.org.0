Return-Path: <linux-leds+bounces-6312-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE0C853DF
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 14:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7FE2534ECEE
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 13:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E566257820;
	Tue, 25 Nov 2025 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cctn4wiv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D912571D4;
	Tue, 25 Nov 2025 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078522; cv=none; b=Nt9gq1khj493vwe3fgyZeScntJZnqJAB6+gPAWm+SsmS1aYCTdm8IckZ+gP0/QhL5QIG8Xy4LC+S8CmTS/HeJbrWGHBzv6Mm5SRJhB6XMv8KctCHyXNxTfDMDvhqLseHyDWfEvGaemBFqQYvK6PEDgfol5gQq++gHUxhFsJ/RQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078522; c=relaxed/simple;
	bh=qMRrDoHOcsks99zvgZZqkBP5LxJkyWPAJLlzUR7nP+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8L95kmCYhYA95P7HuON0HGjVGrGEs92ZVUum/QaBQJ4Erd9i18gmkM8IhQoir3U+ZoQe8YMKdm7EJabqfi9dp4uDudLZwZeoYtdIXc9M73ABpc5Yy7xFsrqTJHoLra+E70oQHd09JjrIcgJgqYN2vBWCg6GWJn+b9AAlIOKiuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cctn4wiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068CDC4CEF1;
	Tue, 25 Nov 2025 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078521;
	bh=qMRrDoHOcsks99zvgZZqkBP5LxJkyWPAJLlzUR7nP+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cctn4wivDT5Fe+bxp//YG1wlwcVs966fkjZwcPMXNxK/5ZjPwsTEyI4BoPcZqOiZK
	 gMSh46t7U92KDynXPlMA6pOWwJov8mWbLqe64FHlhJAlTog5ziqqLoL6aqJmVG0qcq
	 dzwTI98Hyp1iPzMpymNgQL9PTKEMPZa3GnIB7rtILd6g3EhUUEZ6TVqZaEf10uDrUB
	 JYn9dP+cG7rFpX04bYPrllH3SNxFgT8KSt2AL+yuQ2JuuGmtCbnL+/x3slNuMLW974
	 IV2GMTZiturUAthSN4RNTG0e+wDzyCvGscdMnOp0GXs7eQaWUrKDbW401djnwzI0hK
	 lsM/gY5UZTqmQ==
Date: Tue, 25 Nov 2025 13:48:36 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 2/3] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
Message-ID: <20251125134836.GC1127788@google.com>
References: <20251123191042.116917-1-trannamatk@gmail.com>
 <20251123191042.116917-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251123191042.116917-3-trannamatk@gmail.com>

On Mon, 24 Nov 2025, Nam Tran wrote:

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
> This patch adds minimal driver support for the LP5812, implementing
> only the essential functionality: I2C communication with the device,
> LED registration, brightness control in manual mode, and basic sysfs
> interfaces for LED configuration and fault monitoring.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  MAINTAINERS                    |   4 +
>  drivers/leds/rgb/Kconfig       |  13 +
>  drivers/leds/rgb/Makefile      |   1 +
>  drivers/leds/rgb/leds-lp5812.c | 646 +++++++++++++++++++++++++++++++++
>  drivers/leds/rgb/leds-lp5812.h | 172 +++++++++
>  5 files changed, 836 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-lp5812.c
>  create mode 100644 drivers/leds/rgb/leds-lp5812.h

[...]

> +static ssize_t parse_drive_mode(struct lp5812_chip *chip, const char *str)
> +{
> +	int i;
> +
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = false;
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = false;
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = false;
> +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = false;
> +
> +	if (sysfs_streq(str, LP5812_MODE_DIRECT_NAME)) {
> +		chip->u_drive_mode.s_drive_mode.led_mode = LP5812_MODE_DIRECT_VALUE;
> +		return 0;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(chip_mode_map); i++) {
> +		if (!sysfs_streq(str, chip_mode_map[i].mode_name))
> +			continue;
> +
> +		chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
> +		chip->u_scan_order.s_scan_order.scan_order_0 = chip_mode_map[i].scan_order_0;
> +		chip->u_scan_order.s_scan_order.scan_order_1 = chip_mode_map[i].scan_order_1;
> +		chip->u_scan_order.s_scan_order.scan_order_2 = chip_mode_map[i].scan_order_2;
> +		chip->u_scan_order.s_scan_order.scan_order_3 = chip_mode_map[i].scan_order_3;

Where are all of these used?

> +
> +		switch (chip_mode_map[i].selection_led) {
> +		case LP5812_MODE_MIX_SELECT_LED_0:
> +			chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = true;
> +			break;
> +		case LP5812_MODE_MIX_SELECT_LED_1:
> +			chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = true;
> +			break;
> +		case LP5812_MODE_MIX_SELECT_LED_2:
> +			chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = true;
> +			break;
> +		case LP5812_MODE_MIX_SELECT_LED_3:
> +			chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = true;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}

[...]

> +union u_scan_order {

What is 'u'?

> +	struct {
> +		u8 scan_order_0:2;
> +		u8 scan_order_1:2;
> +		u8 scan_order_2:2;
> +		u8 scan_order_3:2;
> +	} s_scan_order;
> +	u8 scan_order_val;
> +};

[...]

-- 
Lee Jones [李琼斯]

