Return-Path: <linux-leds+bounces-6071-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6FC51112
	for <lists+linux-leds@lfdr.de>; Wed, 12 Nov 2025 09:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC0C14F5E0F
	for <lists+linux-leds@lfdr.de>; Wed, 12 Nov 2025 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAB42F1FCF;
	Wed, 12 Nov 2025 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F54h5VVk"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD232F291A
	for <linux-leds@vger.kernel.org>; Wed, 12 Nov 2025 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762935027; cv=none; b=fkorU4q7ux6V3aInyDunSBamE+8GbRgwhZqCYYxd05k+2Oum4VrpxkuLNnaDucAfM1mGguB/rbuJyH7VoW7LO4S0M1HwXoXQ7Xxx7u/3Y/jYGlJVeqe/iRTZAFf5lGXdv3SBtrhmiEsFmfWWkerMzuem7okF2hxEa9sUsLSyfX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762935027; c=relaxed/simple;
	bh=0x3hyexB8RN1aORyPKlDT00oHNFF/g8ktIl6ddCB0rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kao/LIb00v42TIR/dOfJeb2JZsd09R4W0NpDioyArLPaF47SE1YQW4JYGOLa3EyTvyMTtoNWJmt4qwuyJEFwSI9I5Tz36M+bYLalL8lUHdxuwLbfWXTgGu3TWnpIPfMo4Uy5wfkBkvyQcPCSeOShk51oGvWc5zUtMnKzO+IsIV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F54h5VVk; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 12 Nov 2025 09:10:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762935022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjA5G/w0hn6tSkNzMJ7TQLqDnTKycMpelEMAQRKSY3U=;
	b=F54h5VVkGptEPuFFm5q4LVc3c0MS/iaqVvcqKW9bWq2CrJBG0uhU6Chihdg6THP6lmrCvG
	AYSszUDVaswGW8iwTuE01LDjjnGp551W325W/7fvCQODjyC3l1rsXYJ1MBGg1NTxcHyluk
	xaaftVv8JOU86Yejq85mKNXiQyJLO6Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v8 8/8] media: i2c: ov9282: dynamic flash_duration maximum
Message-ID: <4ypovtmginw3ptunolxylxh7xhgfqf2ubhqqrxmywbukwspomx@gw6rnprfq6vx>
References: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
 <20251104-ov9282-flash-strobe-v8-8-b91dfef1c65a@linux.dev>
 <aRGat_G74zT1zaS0@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRGat_G74zT1zaS0@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Mon, Nov 10, 2025 at 09:56:39AM +0200, Sakari Ailus wrote:
> On Tue, Nov 04, 2025 at 03:30:59PM +0100, Richard Leitner wrote:
> > This patch sets the current exposure time as maximum for the
> > flash_duration control. As Flash/Strobes which are longer than the
> > exposure time have no effect.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 30 ++++++++++++++++++++++++++----
> >  1 file changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 7aa74feb3ee44..df7beedba0b9e 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -198,6 +198,7 @@ struct ov9282_mode {
> >   * @exp_ctrl: Pointer to exposure control
> >   * @again_ctrl: Pointer to analog gain control
> >   * @pixel_rate: Pointer to pixel rate control
> > + * @flash_duration: Pointer to flash duration control
> >   * @vblank: Vertical blanking in lines
> >   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
> >   * @cur_mode: Pointer to current selected sensor mode
> > @@ -220,6 +221,7 @@ struct ov9282 {
> >  		struct v4l2_ctrl *again_ctrl;
> >  	};
> >  	struct v4l2_ctrl *pixel_rate;
> > +	struct v4l2_ctrl *flash_duration;
> >  	u32 vblank;
> >  	bool noncontinuous_clock;
> >  	const struct ov9282_mode *cur_mode;
> > @@ -611,6 +613,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >  					mode->vblank_max, 1, mode->vblank);
> >  }
> >  
> > +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> > +{
> > +	/* calculate exposure time in µs */
> > +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +	u32 trow_us = frame_width * 1000000UL / ov9282->pixel_rate->val;
> 
> This can overflow.

Good catch. Thank you! I will fix this by dividing the pixel_rate->val
by 1000000UL instead of multiplying frame_width.

> 
> > +
> > +	return exposure * trow_us;
> > +}
> > +
> >  /**
> >   * ov9282_update_exp_gain() - Set updated exposure and gain
> >   * @ov9282: pointer to ov9282 device
> > @@ -622,9 +633,10 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >  {
> >  	int ret;
> > +	u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
> >  
> > -	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
> > -		exposure, gain);
> > +	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> > +		exposure, exposure_us, gain);
> >  
> >  	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
> >  	if (ret)
> > @@ -635,6 +647,12 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >  		goto error_release_group_hold;
> >  
> >  	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> > +	if (ret)
> > +		goto error_release_group_hold;
> > +
> > +	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> > +				       0, exposure_us, 1,
> > +				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
> >  
> >  error_release_group_hold:
> >  	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> > @@ -1423,6 +1441,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	const struct ov9282_mode *mode = ov9282->cur_mode;
> >  	struct v4l2_fwnode_device_properties props;
> >  	u32 hblank_min;
> > +	u32 exposure_us;
> >  	u32 lpfr;
> >  	int ret;
> >  
> > @@ -1495,8 +1514,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> >  			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
> >  
> > -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > -			  0, 13900, 1, 8);
> > +	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> > +	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
> > +						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > +						   0, exposure_us,
> > +						   1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> >  
> >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >  	if (!ret) {
> > 
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

regards;rl

