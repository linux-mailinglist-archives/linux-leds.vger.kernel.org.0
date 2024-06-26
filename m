Return-Path: <linux-leds+bounces-2121-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA667917C69
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 11:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646A81F211B9
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B24316A949;
	Wed, 26 Jun 2024 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFvXqrTv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056A16A92E;
	Wed, 26 Jun 2024 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394069; cv=none; b=rDtWKWEFG8J3K2UC88s04DI1STOaMGRXutinP4nrE8ZLwkiirtUw3c82i+ixbLxsljxTVTWC4ApV5GQPxFGAE+ZCLxL7MRY9/uqcMCdz++J5QQZmcE1mbD7yuAWqQsFwP5DoNEFILT4x3wnxyCH6dDsxMQcBsLm5D8zyIu4acko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394069; c=relaxed/simple;
	bh=aLRXocu55V76TV2CG6N3YPo8u4yjwzMj06cYXsd/7I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPJLDvR3v+I6r1WQPbznY6at7q2RGpmVZAJQB9uoHiCDgfzcp4QjE7/NG0wW6fXGXmRe7pymMd4FSbiirJeacLydCh1lS7UtiR3WJFtRhujG2drxSAb0zbZ9KAICNoOX1rXEKbVHm6ybKlYhpGKHBt46xi9BtcH/XkVVLqVdlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFvXqrTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5B5C2BD10;
	Wed, 26 Jun 2024 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719394068;
	bh=aLRXocu55V76TV2CG6N3YPo8u4yjwzMj06cYXsd/7I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFvXqrTv8brLTiQz77kxxFX+GVaCDu7PjuXc3i8cqAmr/iT5L4lzOXuj+fC12Mzk7
	 lLqAcVBnaEoQbsZhWtjSsmHbH5QQUo8f2CyeB+Q/kQDTNp9MOicCYigP+aKmCuYPj0
	 jxfqjJQ9bDes0b3FAhoR1wLzN6K9WfsLK23abb27SSs5b0wjDzOs//qVY/qDCITCec
	 u5hjyW1z/JpE6iGUA/GASP1HHBR2tRFpaDxh6PiooP6xE3WB1tihDwC0OFOkRSg/NF
	 +q7o/Iq0yDs/Co3gV7YvbMuSoHXYZkDW2YsjoTQtqOwEBdMgzXIDPjpIJGs4Nfwg8w
	 KczeeFaJMUz8g==
Date: Wed, 26 Jun 2024 10:27:44 +0100
From: Lee Jones <lee@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: Add LED1202 I2C driver
Message-ID: <20240626092744.GY1318296@google.com>
References: <ZnGMAK9bd3pZjWmG@admins-Air>
 <20240620175543.GC1318296@google.com>
 <ZnmDUNgwu_1LYMzw@admins-Air>
 <20240625071610.GW1318296@google.com>
 <Zns7tih4M2y3SX6B@admins-Air>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zns7tih4M2y3SX6B@admins-Air>

On Tue, 25 Jun 2024, Vicentiu Galanopulo wrote:

> On Tue, Jun 25, 2024 at 08:16:10AM +0100, Lee Jones wrote:
> > No idea.  I use NeoVim (with kickstart.nvim).
> > 
> > https://dev.to/lico/set-up-neovim-with-kickstartnvim-on-mac-as-a-vimginner-53f5
> 
> Thanks for the pointer.
> 
> > 
> > Please strip out review comments that you agree with.
> Hopefully like I did for the rest of comments?
> 
> > 
> > Numbers should be easily identifiable/readable by humans.
> Ok, will do my best 

What does the comment above say?

If you agree with a review comment, you don't need to reply to it.

> > > I reused some naming. Should it be led1202_ for all?
> > 
> > st1202_?
> st1202 will be in v3
> 
>  
> > > If this is not appropiate or custom practice I can redo it, but I need some pointers
> > > on where to look as "good" examples.
> > 
> > Google: "Linux Error Codes"
> > 
> > `git grep "return " -- drivers`
> My concern was mostly with how I'm extracting the channel(LED number).
> ll1202_get_channel is called inside functions where only struct device is available.
> So, I extract the device_node to have access to the device tree "label".
> I'm char compairing label value and dev->kobj.name, and if they're the same, I use the

That seems wrong.

I haven't looked at what you're doing in detail, but dev_name() is
usually used to fetch the name of the device.

See include/linux/device.h for more generic APIs.

> "reg" value property from the device tree to get the LED number.
> 
> For most if not all of the functions I did see some similar setup in other drivers files,
> but I might be doing something the wrong way...


> > > A dump of all the registers with their values. I didn't add show/get functions for
> > > all the registers.
> > > Remove it?
> > 
> > How often are people going to need that after initial authorship, really?
> >
> No idea. I'll just remove it.
>  
> > > > 
> > > > Space out the code properly - this is really tough to read.
> > > > 
> > > Ok.. with or without the help of the IDE, it shall be done
> > 
> > I mean new lines between functional groups.
> >
> Understood.
>  
> > > > > +}
> > > > > +
> > > > > +static int ll1202_channel_activate(struct ll1202_led *led)
> > > > > +{
> > > > > +	struct ll1202_chip *chip;
> > > > > +	uint8_t reg_chan_low, reg_chan_high;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	chip = led->chip;
> > > > > +	if (led->is_active) {
> > > > 
> > > > Reverse this logic and unindent this block.
> > > > 
> > > Sorry, I need some more details on what I need to do here.
> > 
> > 	if (!led->is_active)
> > 		return ret;
> > 
> 
> Thanks for explaining this.
> 
> > > > 
> > > > We already have global helpers for this type of thing.
> > > > 
> > > Ok, could you please point me to the file/link?
> > 
> > I suggest you pull as much of this out to another _normal_ function as
> > you can, then have the fewest lines possible inside the macro instead.
> >
> Ok. Will do.
> 
>  
> > -- 
> > Lee Jones [李琼斯]
> Thanks Lee.
> 
> May I now push a v3?

No one will stop you. :)

-- 
Lee Jones [李琼斯]

