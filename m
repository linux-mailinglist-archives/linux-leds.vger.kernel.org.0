Return-Path: <linux-leds+bounces-6055-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390EC45459
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 08:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 426E14E585E
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 07:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEF12F3626;
	Mon, 10 Nov 2025 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAR1iciS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723A28CF6F;
	Mon, 10 Nov 2025 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761403; cv=none; b=UucjBKaCe4GJ9p5ZG5itbVFh+VVeQGBndEXmP8iDomoHmvvT4X8A1Zw3RpXQFYuoWRO9E2LD/N1ukfTaod7jVeP/ny9fCBq3/zBVPVKOKi3VD2oW2CwEKaE3y4GQy3eRGtIGSN1SFJ5+1pk1+hQHNhu9/Qz4N2Ah6AgVpFaTil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761403; c=relaxed/simple;
	bh=cTQpO5bxrVahx0bv9tWqnWEeRJxO+3j/q+deToJDM2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lClYlQ0AvWVq3kYp6Zc27S8PClXN1H8EmoXs2+ND/tAV51ISxUlTm4c9Hdh8SLddWl70HnPGNq3rSQVgn2O9uopQiEM2iPJOEfHvvH2+RrK3P4xodlwBwQjM7OXIk3FuCZhFMXlcRuQCh+JShuqZwww0Stex7rDukGohEUx4b4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAR1iciS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762761402; x=1794297402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cTQpO5bxrVahx0bv9tWqnWEeRJxO+3j/q+deToJDM2s=;
  b=NAR1iciSJ/JrOLyaSFHpnXh3sU4yipoQuEOVEaXh0g188liamfoxC3Zk
   L0DOjwx+DDDp1HEH2JCgMJQ80CZCc/luRaFf6hN1+lWXMTRBJtcCeGNm+
   ps9u1jdb0gfHEHS47rcyt7SFVDqrsjSSPYCnxJNdXQPjeY6zp/R5imw0Y
   dLtxipC93vO+Zx7rWr0gNFEfKTGbuTRP82Ql6Uqw9J5OUdP+uGUWo481L
   MFcma9nkNobRD8zFXxbC57BVgpwRJCjneNMPl83tzXk0Qwev0mnVO+fJy
   SqnoOnQoRLYpu15x1Low20s7D90i1vo4/H8xkDOC/pGinK2UsuMgWhLiS
   g==;
X-CSE-ConnectionGUID: 7lV1Xw6hQ0WZAnuVtNLDaA==
X-CSE-MsgGUID: zQUha+sCSTa1OE+Rs5oTFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64013205"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64013205"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:56:41 -0800
X-CSE-ConnectionGUID: 3t7HI/UJTM2iqs/l1rrjVw==
X-CSE-MsgGUID: 4geLVaW2T1CtguJ8IwRCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188445968"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.238])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 23:56:39 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 106601205FC;
	Mon, 10 Nov 2025 09:56:39 +0200 (EET)
Date: Mon, 10 Nov 2025 09:56:39 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v8 8/8] media: i2c: ov9282: dynamic flash_duration maximum
Message-ID: <aRGat_G74zT1zaS0@kekkonen.localdomain>
References: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
 <20251104-ov9282-flash-strobe-v8-8-b91dfef1c65a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104-ov9282-flash-strobe-v8-8-b91dfef1c65a@linux.dev>

On Tue, Nov 04, 2025 at 03:30:59PM +0100, Richard Leitner wrote:
> This patch sets the current exposure time as maximum for the
> flash_duration control. As Flash/Strobes which are longer than the
> exposure time have no effect.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 7aa74feb3ee44..df7beedba0b9e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -198,6 +198,7 @@ struct ov9282_mode {
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @pixel_rate: Pointer to pixel rate control
> + * @flash_duration: Pointer to flash duration control
>   * @vblank: Vertical blanking in lines
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
> @@ -220,6 +221,7 @@ struct ov9282 {
>  		struct v4l2_ctrl *again_ctrl;
>  	};
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *flash_duration;
>  	u32 vblank;
>  	bool noncontinuous_clock;
>  	const struct ov9282_mode *cur_mode;
> @@ -611,6 +613,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  					mode->vblank_max, 1, mode->vblank);
>  }
>  
> +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> +{
> +	/* calculate exposure time in µs */
> +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +	u32 trow_us = frame_width * 1000000UL / ov9282->pixel_rate->val;

This can overflow.

> +
> +	return exposure * trow_us;
> +}
> +
>  /**
>   * ov9282_update_exp_gain() - Set updated exposure and gain
>   * @ov9282: pointer to ov9282 device
> @@ -622,9 +633,10 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  {
>  	int ret;
> +	u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
>  
> -	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
> -		exposure, gain);
> +	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> +		exposure, exposure_us, gain);
>  
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
>  	if (ret)
> @@ -635,6 +647,12 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  		goto error_release_group_hold;
>  
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> +	if (ret)
> +		goto error_release_group_hold;
> +
> +	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> +				       0, exposure_us, 1,
> +				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
>  
>  error_release_group_hold:
>  	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> @@ -1423,6 +1441,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	const struct ov9282_mode *mode = ov9282->cur_mode;
>  	struct v4l2_fwnode_device_properties props;
>  	u32 hblank_min;
> +	u32 exposure_us;
>  	u32 lpfr;
>  	int ret;
>  
> @@ -1495,8 +1514,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>  			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
>  
> -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> -			  0, 13900, 1, 8);
> +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> +						   0, exposure_us,
> +						   1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
>  
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
> 

-- 
Kind regards,

Sakari Ailus

