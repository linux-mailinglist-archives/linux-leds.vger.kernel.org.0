Return-Path: <linux-leds+bounces-4361-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22835A6EB5F
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 09:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE64188EC66
	for <lists+linux-leds@lfdr.de>; Tue, 25 Mar 2025 08:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA91195FEF;
	Tue, 25 Mar 2025 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qXdzsJkg"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E990C155C87
	for <linux-leds@vger.kernel.org>; Tue, 25 Mar 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742890846; cv=none; b=LLuHytw6siSSIXpNmDQLLFDXOEUBSgXB2BuAoe4uyoELcXx+qvK6VwhYmbkyOTbrF3cRcaqvsHPL9jw+OovrV2zLWJMZEBdgS3Vyw3tMQZa/Ji+Mvwz041daUT9iK/4NQ6MV72HOP8+ouFSM6rkaULN7Uu88LjGTg12T3e1gsFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742890846; c=relaxed/simple;
	bh=Nq3LbPY8wdiuNqJ6fGg7LVfLWByG0+3+km7SMi0dLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHC0JGU9p2QvEO6ENtDx9ua0fgSACcLs79cA24Q+enGmD3I+WnhJ7mflLLF4MMY35qIcRalk8GR11YYYAskbRcHErkFLSDcTl5pgWYzEp5cpDQi7j+TMvfmxXH0SyP1yBWS9tp3X1LnEzpLBTnQGgfb68835IvGCcE+6GFkDkbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qXdzsJkg; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 25 Mar 2025 09:20:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742890832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8wlixF4pq3M+CE3IdI8vKJdp+75Qo2SsQ9Ofiyknbr0=;
	b=qXdzsJkgbONELaeQnlw8bJxeayxBB5oeWdkEpP5XxCM+SuCi+geJyhGn7SmTcZNOZ5qUev
	cbW42KOYLAv3PNEfRWc8lDjd/6l0xacQdpkIQKZFR0Ef5lBzr4woTJxIzBtWzkzlcVCyfZ
	l/lVxg3OoSAxmrMmXEHWOVzS53/A5Ys=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <4un43tc6jdwyueefqyjyk7yzh34366uhakimtoat2lhutm3myn@ero3pn22qfm7>
References: <bx4p2hycva2rqywgglqluus6o7jbmfa2jjbc4k5d6aw6wsfkxd@zrtckmwtphuq>
 <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
 <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
 <Z9l04b5ZGy877j32@kekkonen.localdomain>
 <myyn53owptzx3dm3qmudtm4pmnon7axmjks2u5adno6ywktd3t@qriiifsitqoh>
 <Z9l9-tEwHRtXnz1a@kekkonen.localdomain>
 <s76b7q2cvcuk32n3jpsijyrhxhtstk6fewb5drkxdeopvt5grj@p4mcqltiza36>
 <Z9mNKG07sJcbnk3Z@kekkonen.localdomain>
 <CAPY8ntDzA+j97XB4VUfBtSH0RgpVKSdKxS1o5LnmoNDE1h=eyw@mail.gmail.com>
 <Z9qXJE8M_BW1VIKR@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9qXJE8M_BW1VIKR@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Dave, Hi Sakari

On Wed, Mar 19, 2025 at 10:06:28AM +0000, Sakari Ailus wrote:
> Hi Dave,
> 
> On Tue, Mar 18, 2025 at 04:39:05PM +0000, Dave Stevenson wrote:
> > Hi Sakari
> > 
> > On Tue, 18 Mar 2025 at 15:11, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Richard,
> > >
> > > On Tue, Mar 18, 2025 at 03:46:18PM +0100, Richard Leitner wrote:

...

> > > > The ov9282 driver uses the sensor in global shutter mode.
> > > >
> > > > I totally agree with your statement. This pattern is only useful for
> > > > global shutter operation.
> > >
> > > I think (nearly?) all supported sensors use a rolling shutter.
> > 
> > You've got at least two other global shutter sensors supported in
> > mainline - Omnivision ov7251 and Sony imx296.
> > Patches have been posted for OnSemi ar0144 (Laurent) and ar0234
> > (Dongcheng), which are also both global shutter sensors.
> > 
> > So yes they are in the minority, but not that uncommon.
> 
> Thanks for the list. I briefly discussed this with Laurent and I agree with
> him this information would probably be best kept with userspace (libcamera)
> without trying to enumerate it from the kernel (albeit CCS might be an
> exception, but that's an entirely different discussion then). Only changing
> the global/rolling configuration would require a control.

Thanks for the feeback and clarification!

So am I understanding this correctly that the flash/strobe duration
approach in this series is basically fine?

If so I will send a v3 later today.

regards;rl

> 
> -- 
> Regards,
> 
> Sakari Ailus

