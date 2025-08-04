Return-Path: <linux-leds+bounces-5198-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C6B1A366
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 15:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64454189EAB1
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 13:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5639926B74D;
	Mon,  4 Aug 2025 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ppQCFwc2"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5A262FE5
	for <linux-leds@vger.kernel.org>; Mon,  4 Aug 2025 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314438; cv=none; b=uGZSv4ngf8S1cZVSz9CZWRzLI1hsHmgSIlI5oH63/6JBoioMjaCTWupSH0+6TKXjh+pfgHByUAXXiN+j7fEpK6vRWh43aH4DKtsiW89SKWWWXXm7WveyhYZr1gyOPxQ1RxMcVq5OtS/YrFLX8VnVul3vTgjYx5Plr1NQmm9kv1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314438; c=relaxed/simple;
	bh=/hIQLH3dJF9uGlrh29QZ9uHswy0UcZ7HlGpLhUVP2nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+EV6/EYCrokfCYwlKI7hor0wdtYs0kykh74WdqZc/kUSUcWEdYiDrtU0VSNRJNLXZA80TaLS1f3hbJEvhooKHT/Q94bZIMZiJgiB9z9xTgx3klz3fHnF1FxG0aEQU+KlzvFc0krd/hIhnqqeXHvCob1LDh/DW9GyFVjDoQeSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ppQCFwc2; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 4 Aug 2025 15:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754314423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6zUScv7t4BYjICsI+KfZuOQ3Fxl+Scl3BphxUq+iJs=;
	b=ppQCFwc28Q7d/Vu7yHRY9FEPc7Jvg+s5N8ipa9Qap1miej2gq33B8gf+XbjVCWSyCmiRsl
	7KCmCBIEfLyyb8goRn4XtMw7tWB9cXYonTFTjzHYsG3IIGe6e1d5nGabc/3x2JALpu/Iok
	Yl+Z8X7T+spm9HoKXBLyo8OhW9A+eTU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 06/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <v2p627nliqi55pk3w6pjckj5ddozkbgfcam2qbvdjo2w5b6rqx@si5pxcdmt2yr>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
 <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>
 <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
 <5i6a77wbggmjjxfridurbq5mrdjksse236vwucawbi43fjv2ae@umy4fe7six5p>
 <aG92TxxIRdRES5cs@kekkonen.localdomain>
 <f4owcdddwjar6lg5f2urpaynykks4yrttto7h7qfnodmqg22ll@xl45pbhuyhmx>
 <aIqDEgrAoSkozxA3@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIqDEgrAoSkozxA3@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 30, 2025 at 08:39:46PM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> On Fri, Jul 11, 2025 at 09:41:52AM +0200, Richard Leitner wrote:
> > Hi Sakari,
> > 
> > On Thu, Jul 10, 2025 at 08:14:07AM +0000, Sakari Ailus wrote:
> > > Hi Richard,
> > > 
> > > On Thu, Jul 10, 2025 at 08:50:24AM +0200, Richard Leitner wrote:
> > > > Hi Sakari,
> > > > 
> > > > thanks for the feedback :)
> > > > 
> > > > On Wed, Jul 09, 2025 at 09:12:57PM +0000, Sakari Ailus wrote:
> > > > > Hi Richard,
> > > > > 
> > > > > Thanks for the update.
> > > > > 
> > > > > On Tue, Jun 17, 2025 at 09:31:40AM +0200, Richard Leitner wrote:
> > > > > > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > > > > > feature of the sensor. This implements following modes:
> > > > > > 
> > > > > >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> > > > > >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> > > > > 
> > > > > I really think you should use a different control for this. The sensor can
> > > > > strobe the flash but it won't control its mode.
> > > > > 
> > > > > How about calling it V4L2_FLASH_STROBE_ENABLE?
> > > > 
> > > > I agree on that. But tbh V4L2_FLASH_STROBE_ENABLE somehow sounds wrong
> > > > to me. As the strobe output in the ov9282 case goes high for the strobe
> > > > duration, what do you think about calling it V4L2_FLASH_STROBE_PULSE?
> > > 
> > > That's how the hardware strobe is supposed to work, there's nothing unusual
> > > in that. How about V4L2_FLASH_HW_STROBE_ENABLE?
> > 
> > Ah. Sorry. I believe I completely misunderstood your previous point.
> > You're not referring to a new menu entry in V4L2_CID_FLASH_LED_MODE,
> > but rather proposing a completely new boolean control, correct?
> 
> Correct.
> 
> > 
> > As this would be separating the V4L2_CID's of "strobe signal source"
> > (aka sensor) and "strobe signal consumer" (aka flash device/LEDs), that
> > makes perfect sense to me now! :)
> > 
> > What are your thoughts on naming it V4L2_FLASH_HW_STROBE_SIGNAL?
> 
> Seems reasonable.

Thanks again for your response. I already sent out a v6 with that
control name. I hope that's fine.

> 
> In order to use the control, the user space would need to know when to use
> it, i.e. when the latching point would be in order to hit a particular
> frame. If the strobe can start before the exposure (and presumably it needs
> to), the latching point is before that point of time. I wonder if pixels
> (as in the pixel array) would be reasonable unit for this as well.
> 
> Does the sensor datasheet shed any light on this? It might be good to add a
> control for that as well.

I'm not sure if pixels is a good unit for that. The strobe duration and
strobe timeout are both defined as µs. Therefore I would prefer to also
use µs for the strobe shift/offset.

The sensor features a control named "strobe shift" which allows to move the
point of time when the strobe starts before/after the start of the exposure.

I've named it V4L2_FLASH_HW_STROBE_SIGNAL_SHIFT in my downstream tree.
What do you think about it?

I have had planned to submit support for the strobe shift/offset control
as soon as this series got accepted. Mainly to keept the series smaller
and easier to handle (at least for me). Tbh I still want to stick to that
approach. Is that fine with you? Or should I include those patches
in this series?

> 
> > 
> > The main reason behind removing the "ENABLE" suffix is that none of
> > the V4L2_CID_FLASH_* controls currently include "ENABLE" in their
> > names. Altough, for example, V4L2_CID_FLASH_CHARGE performs a
> > similar function (en-/disabling the charging of the capacitor).
> > 
> > On the other hand, adding "SIGNAL" to the control name, in my opinion,
> > makes it clearer that it only enables a signal and not some kind of
> > flash device or LED.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

Thanks again for reviewing the series!

regards;rl

