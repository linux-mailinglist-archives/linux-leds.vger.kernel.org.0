Return-Path: <linux-leds+bounces-4725-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B0AC6638
	for <lists+linux-leds@lfdr.de>; Wed, 28 May 2025 11:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595443B49D7
	for <lists+linux-leds@lfdr.de>; Wed, 28 May 2025 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791752135CE;
	Wed, 28 May 2025 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nCceK5O3"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35126A081
	for <linux-leds@vger.kernel.org>; Wed, 28 May 2025 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748425616; cv=none; b=ja7toU+pvYMqdBTsVuW5a8CdNvy8uq4Uqep9UtZRLn0o9Ut7d4hYeprgW9FKkAmM69eYGdhUacdJIJc03Mhsz2pkHSAO9BgOprWTbjb3k/afBpdyK+k8FVcRdGvmyY7ejgPZ2D/EgzLcv0S6ZmWaVd+6vKsqPcUIYF7Z2Fjg7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748425616; c=relaxed/simple;
	bh=ahUZkqPwadES68HTIhQm8fxXZkps7dNBsaVEhNXvlxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6L2+/mj7jHBI+J+S3+xpADhRFsmS95Ncw32GNlA8hiZqOG6M07acEe/UnZafb8tOEUOmf5UPMBQt6puciE1hUvwRG/7GFsw1megBO5zbGHuAVk4wuuuN8giozTVGi+evY0WKvKOpz+ysUxG4f0nAUCkN7mOA9kiOP+6J9a9fIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nCceK5O3; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 28 May 2025 11:46:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748425602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0a0vAQ+z6APVJCVEpoJNU8cjAHQkqm8VO7jrgFhVbN4=;
	b=nCceK5O33h6MW3MeSC6j/jdBqEBmeaoq6jiOkX1MsDGOwJTP96XsmbJp3Yfabz/U2xc5qQ
	sl0iwE8vJDlXhAx/PwyP6gtuhxXT5S4QjC9jYdK/uUKwCP1v0OtslKSwe18Ke4ta+b+dX7
	cmgsBqgDzmoCQLL+OuK074hdGKyVjYo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 09/10] media: i2c: ov9282: add strobe_source v4l2
 control
Message-ID: <jsohv4yhopqla6gvae76qqtat7ekeqxvjvxvcaxjaw2th7hq32@uupjpwho3b5d>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-9-72b299c1b7c9@linux.dev>
 <aDTOCC1wE26Md_Zo@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDTOCC1wE26Md_Zo@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

On Mon, May 26, 2025 at 08:24:40PM +0000, Sakari Ailus wrote:
> Hi Richard,

Hi Sakari,

thanks for the review!

> 
> On Wed, May 07, 2025 at 09:51:38AM +0200, Richard Leitner wrote:
> > Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
> > to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
> > strobe based on its register settings.
> 
> Is strobe source control relevant for the sensor? It's triggering the flash
> but the flash LED isn't connected to it, is it?

Exactly. The sensor is only triggering a "strobe output" pin, but no
LEDs are on the sensor module. Nonetheless at least in our use-case the LEDs
are switched directly by this output pin of the sensor (via some FET
circuit).

So to be honest I don't know if it is relevant, or not. I guess the
sensor in this case is a "external strobe source" as seen from the
kernel, isn't it?

> 
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 0bbdf08d7cda8f72e05fdc292aa69a4c821e4e03..09d522d5977ec6fb82028ddb6015f05c9328191d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1368,11 +1368,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
> >  	const struct ov9282_mode *mode = ov9282->cur_mode;
> >  	struct v4l2_fwnode_device_properties props;
> > +	struct v4l2_ctrl *ctrl;
> >  	u32 hblank_min;
> >  	u32 lpfr;
> >  	int ret;
> >  
> > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1447,6 +1448,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> >  			  0, 13900, 1, 8);
> >  
> > +	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > +				      V4L2_CID_FLASH_STROBE_SOURCE,
> > +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
> > +				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
> > +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
> > +	if (ctrl)
> > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >  	if (!ret) {
> >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

thanks & regards;rl

