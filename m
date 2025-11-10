Return-Path: <linux-leds+bounces-6053-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0DC4543E
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 08:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 731BC188EF34
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 07:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CB42F12C1;
	Mon, 10 Nov 2025 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLfUNQRB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FCB2EDD7E;
	Mon, 10 Nov 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761324; cv=none; b=Hx7GJtEeOTlI6Cwo428SAKHk3VXnGmLYajFQdGiuzXadFEK8khDNcLy2w0i49ey4ATXxYUERtU0PBhCnWaf1zIZQ7pLA8FHWMt7VZzOre60CP1av3iGSf0RsNWU5Wv31EBWKmPc2l6uylEIEJZiDXtfuU229ch5ceTt9ipHBF00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761324; c=relaxed/simple;
	bh=xNDoA1jhzBeYlvLFMmnMNc96MK4rzhSJ2grihH7lt5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8TQ1cbmus45jiO4fGI8RUEIB2fceyZCsZ3dnjo/SFY3N335nrBOBvU13DiWg+50k48QY2MbjT27sLZ3hVjGRG3I3jQyfOaghyKW2h99EilbWgREwzVfvZIerLDuyLsnUTi37KlMuc7eIZpIDXGiELKq3u8dQIaB1aVGgl3gwFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLfUNQRB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762761323; x=1794297323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xNDoA1jhzBeYlvLFMmnMNc96MK4rzhSJ2grihH7lt5Y=;
  b=iLfUNQRBGTJTjL+xNEJtc2bpi+22FKVrOvRKThKtCsma73wUKuW1R9sz
   kfMWhv986TZyEhaV6YfhXWuA3bId10lqw/+FQep6VaCHojIZEp3BJrUuc
   j4kQq+XgLE37/9E4tLui3EBGLYlx+fIi1Z7pZvNiWCQFHdi8AO0jZAdUZ
   fXZ4WkL27mA8JK8RhXeOV8aQ+PoFF556cY0XPRYsb+eDoGbxgx73AtVE+
   jJY14vchxxJJXY+61QoE1Hmh6flTtRN4AI0FIRgZCQ0jD425rQv7CIC+n
   elpIECApl2D9jsoe/EIDdNniJ7ahzr9zJBc14D3Ee3rOrfRbe8junfwvg
   A==;
X-CSE-ConnectionGUID: EcqLsZPmQ9W8c06MFVEAaA==
X-CSE-MsgGUID: jSJoqXE8Rbu+QaU3XxjjoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64507984"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64507984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:55:21 -0800
X-CSE-ConnectionGUID: QEhJx8awRLKkbxya4bm+lg==
X-CSE-MsgGUID: 2bqcfyQ1TS+KsBlXJj/k7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188859479"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.238])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:55:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 990CF1205FC;
	Mon, 10 Nov 2025 09:55:18 +0200 (EET)
Date: Mon, 10 Nov 2025 09:55:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v8 7/8] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <aRGaZptpBRq_iga-@kekkonen.localdomain>
References: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
 <20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a@linux.dev>

Hi Richard,

On Tue, Nov 04, 2025 at 03:30:58PM +0100, Richard Leitner wrote:
> As the granularity of the hardware supported values is lower than the
> control value, implement a try_ctrl() function for
> V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
> µs strobe duration for the given value and returns it back to the
> caller.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 55 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 26296dc1d1b95..7aa74feb3ee44 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -128,6 +128,8 @@
>  #define OV9282_REG_MIN		0x00
>  #define OV9282_REG_MAX		0xfffff
>  
> +#define OV9282_STROBE_SPAN_FACTOR	192
> +
>  static const char * const ov9282_supply_names[] = {
>  	"avdd",		/* Analog power */
>  	"dovdd",	/* Digital I/O power */
> @@ -691,9 +693,8 @@ static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
>  	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
>  }
>  
> -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
>  {
> -	int ret;
>  	/*
>  	 * Calculate "strobe_frame_span" increments from a given value (µs).
>  	 * This is quite tricky as "The step width of shift and span is
> @@ -703,7 +704,28 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
>  	 * The formula below is interpolated from different modes/framerates
>  	 * and should work quite well for most settings.
>  	 */
> -	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +
> +	return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> +}
> +
> +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> +{
> +	/*
> +	 * As the calculation in ov9282_us_to_flash_duration uses an integer
> +	 * divison calculate in ns here to get more precision. Then check if
> +	 * we need to compensate that divison by incrementing the µs result.
> +	 */
> +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +	u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
> +
> +	return DIV_ROUND_UP(ns, 1000);

Can ns even exceed U32_MAX? It doesn't seem to be useful to multiply and
then divide by 1000.

I guess this warrants v9, please fix the other issue for that, too.

> +}
> +
> +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> +{
> +	int ret;
> +	u32 val = ov9282_us_to_flash_duration(ov9282, value);
>  
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
>  			       (val >> 24) & 0xff);
> @@ -798,9 +820,36 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  	return ret;
>  }
>  
> +static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov9282 *ov9282 =
> +		container_of_const(ctrl->handler, struct ov9282, ctrl_handler);
> +
> +	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
> +		u32 us = ctrl->val;
> +		u32 fd = ov9282_us_to_flash_duration(ov9282, us);
> +
> +		/* get nearest strobe_duration value */
> +		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
> +		u32 us1 = ov9282_flash_duration_to_us(ov9282, fd + 1);
> +
> +		if (abs(us1 - us) < abs(us - us0))
> +			ctrl->val = us1;
> +		else
> +			ctrl->val = us0;
> +
> +		if (us != ctrl->val)
> +			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
> +				ctrl->val, us);
> +	}
> +
> +	return 0;
> +}
> +
>  /* V4l2 subdevice control ops*/
>  static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
>  	.s_ctrl = ov9282_set_ctrl,
> +	.try_ctrl = ov9282_try_ctrl,
>  };
>  
>  /**
> 

-- 
Regards,

Sakari Ailus

