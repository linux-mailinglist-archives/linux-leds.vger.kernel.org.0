Return-Path: <linux-leds+bounces-6070-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D3C5109A
	for <lists+linux-leds@lfdr.de>; Wed, 12 Nov 2025 09:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B6A63A30DE
	for <lists+linux-leds@lfdr.de>; Wed, 12 Nov 2025 08:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC332BEC23;
	Wed, 12 Nov 2025 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="boheI7Y2"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312C62749C7
	for <linux-leds@vger.kernel.org>; Wed, 12 Nov 2025 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934512; cv=none; b=IsZMqYn9/IXO3CXhiorzjtB4CQZMzeZFxpZA7Wr2cCcGkmq1wYGj+NEbrlosyZ9UU/F33B9wRUlMnC1Zx0G11CQKtYU53iwm+78tLbP0jSiHYxKejqkXM40UHQdFonh3gMeT5L/IAq3W/Ics6d7HX6d4/BmjNsdoIj/EyOsLX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934512; c=relaxed/simple;
	bh=0vF6KhIn3Cvkwwcjn+2j4pUJIymOdHjjvc5LdfgS0qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIlhmS1AAh8dzHZgv0A+WuZkxM/ZWAaSyYY6nWtUCYxpdps84Oc/sIK5dBfHbAhJDf7qgyKHRtPGFPFzM76IOKko0EDXh0jaqdfE+6UnXNkL1KXBNWDm0ciQxgnnTnGHKVxETKTGqwdpxf5Gu8PcD8RceHl8YtXs4p62cDQEhBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=boheI7Y2; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 12 Nov 2025 09:01:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762934498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xf1qxNrgdbhX2Mku9WovogGly5J1GezkFOBe58AnDCw=;
	b=boheI7Y2pdw/dWP/Wgt9vPeN88Q4Onbt90JSu/VSTOV9/G6zp4KiHD+1U2o4msSzMxCDGL
	VSWB8091wavHutroS/NiyFFKOgrkGkasL+otEgMloZ2fCAgP4yg9Og+sZUg2JiDRe0G44/
	uH3c/6AuqKdc9w0pnTCHL+25WadN9B4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v8 7/8] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Message-ID: <vcrbxvgco2vuhkdzlbcbirl67otjav26wv4gf6btjd7vkzdyhd@qcrpbdd54p2z>
References: <20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev>
 <20251104-ov9282-flash-strobe-v8-7-b91dfef1c65a@linux.dev>
 <aRGaZptpBRq_iga-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRGaZptpBRq_iga-@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks for the quick feedback!

On Mon, Nov 10, 2025 at 09:55:18AM +0200, Sakari Ailus wrote:
> Hi Richard,
> 
> On Tue, Nov 04, 2025 at 03:30:58PM +0100, Richard Leitner wrote:
> > As the granularity of the hardware supported values is lower than the
> > control value, implement a try_ctrl() function for
> > V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
> > µs strobe duration for the given value and returns it back to the
> > caller.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 55 +++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 52 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 26296dc1d1b95..7aa74feb3ee44 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -128,6 +128,8 @@
> >  #define OV9282_REG_MIN		0x00
> >  #define OV9282_REG_MAX		0xfffff
> >  
> > +#define OV9282_STROBE_SPAN_FACTOR	192
> > +
> >  static const char * const ov9282_supply_names[] = {
> >  	"avdd",		/* Analog power */
> >  	"dovdd",	/* Digital I/O power */
> > @@ -691,9 +693,8 @@ static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
> >  	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
> >  }
> >  
> > -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> > +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> >  {
> > -	int ret;
> >  	/*
> >  	 * Calculate "strobe_frame_span" increments from a given value (µs).
> >  	 * This is quite tricky as "The step width of shift and span is
> > @@ -703,7 +704,28 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> >  	 * The formula below is interpolated from different modes/framerates
> >  	 * and should work quite well for most settings.
> >  	 */
> > -	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
> > +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +
> > +	return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> > +}
> > +
> > +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > +{
> > +	/*
> > +	 * As the calculation in ov9282_us_to_flash_duration uses an integer
> > +	 * divison calculate in ns here to get more precision. Then check if
> > +	 * we need to compensate that divison by incrementing the µs result.
> > +	 */
> > +	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +	u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
> > +
> > +	return DIV_ROUND_UP(ns, 1000);
> 
> Can ns even exceed U32_MAX? It doesn't seem to be useful to multiply and
> then divide by 1000.

You're right. That multiply/divide by 1000 is obsolete. I will get rid
of it by calculating directly using DIV_ROUND_UP().

This will make the largest value "value * frame_width", which shouldn't
exceed U32_MAX in any real-world use-case IMHO...

> 
> I guess this warrants v9, please fix the other issue for that, too.
> 

Sure. Will send a v9 with both fixes later today. Thanks!

> > +}
> > +
> > +static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
> > +{
> > +	int ret;
> > +	u32 val = ov9282_us_to_flash_duration(ov9282, value);
> >  
> >  	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
> >  			       (val >> 24) & 0xff);
> > @@ -798,9 +820,36 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	return ret;
> >  }
> >  
> > +static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct ov9282 *ov9282 =
> > +		container_of_const(ctrl->handler, struct ov9282, ctrl_handler);
> > +
> > +	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
> > +		u32 us = ctrl->val;
> > +		u32 fd = ov9282_us_to_flash_duration(ov9282, us);
> > +
> > +		/* get nearest strobe_duration value */
> > +		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
> > +		u32 us1 = ov9282_flash_duration_to_us(ov9282, fd + 1);
> > +
> > +		if (abs(us1 - us) < abs(us - us0))
> > +			ctrl->val = us1;
> > +		else
> > +			ctrl->val = us0;
> > +
> > +		if (us != ctrl->val)
> > +			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
> > +				ctrl->val, us);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /* V4l2 subdevice control ops*/
> >  static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
> >  	.s_ctrl = ov9282_set_ctrl,
> > +	.try_ctrl = ov9282_try_ctrl,
> >  };
> >  
> >  /**
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

regards;rl

