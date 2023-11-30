Return-Path: <linux-leds+bounces-215-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4F7FEDF9
	for <lists+linux-leds@lfdr.de>; Thu, 30 Nov 2023 12:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616B51C20F37
	for <lists+linux-leds@lfdr.de>; Thu, 30 Nov 2023 11:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5693C47F;
	Thu, 30 Nov 2023 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCkfYk3B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605F13C09C
	for <linux-leds@vger.kernel.org>; Thu, 30 Nov 2023 11:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C525DC433C9;
	Thu, 30 Nov 2023 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701343978;
	bh=qTJ5CJoxngZ864cBMLPrwV2wlcGmJbDNuq1mr3WFzDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCkfYk3BAuIpqcud4Kmfw1Fx39QPJWDeDBsra1dQTnHY6brJEnvEYpA6/MZ8G6Nd2
	 Sv2el6DGy5OpqqXy6SLuKb5C2wm3436zKFc63hJyce/JI8mYd2Xar50vEU1+5cgFBa
	 ZpkN/J1G1wgUuo5Nyd+hMvnMwxRYCPS5JOltj34FONnRKPKPdDUjYR6jteNsS80HBA
	 38xz5mScgMzM+TRUy1BOTeO5oG5Pc55LLRWs+btNGkyichuFl2A1tMi/mpA1EOX2na
	 DZdkwT2/A+I4KD1c+FSnhh0kdspa78Q6CK20bk/Vr0jtn4XIX56xkY+jjIfm0ljLI6
	 34IwxDWnEvM2w==
Date: Thu, 30 Nov 2023 11:32:54 +0000
From: Lee Jones <lee@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: Expand led_colors[] array
Message-ID: <20231130113254.GI1470173@google.com>
References: <20231030054757.3476-1-jszhang@kernel.org>
 <20231123105620.GG1184245@google.com>
 <ZWS80c/ZQvaGIM96@xhacker>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWS80c/ZQvaGIM96@xhacker>

On Mon, 27 Nov 2023, Jisheng Zhang wrote:

> On Thu, Nov 23, 2023 at 10:56:20AM +0000, Lee Jones wrote:
> > On Mon, 30 Oct 2023, Jisheng Zhang wrote:
> > 
> > > commit 472d7b9e8141 ("dt-bindings: leds: Expand LED_COLOR_ID
> > > definitions") expands LED_COLOR_ID definitions for dt-binding. However,
> > > it doesn't expand the led_colors[] array in leds core, so if any of
> > > the newly expaned LED_COLOR_ID definitions is used, the sysfs will
> > > emit null in the led's name color part. Let's expand the led_colors[]
> > > array too.
> > > 
> > > Before the commit:
> > > /sys/class/leds # ls
> > > (null):indicator-0
> > > 
> > > After the commit:
> > > /sys/class/leds # ls
> > > orange:indicator-0
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  drivers/leds/led-core.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > 
> > This already exists as:
> > 
> >   a067943129b4e leds: core: Add more colors from DT bindings to led_colors
> 
> well, my patch was sent earlier than this one... When I sent out the
> patch there's neither fix in mailist nor in your repo.

What makes you think that?

The applied patch was submitted 8th October.

https://lore.kernel.org/all/20231008144014.1180334-1-megi@xff.cz/

Yours was submitted 30th October, 3 weeks later.

https://lore.kernel.org/all/20231030054757.3476-1-jszhang@kernel.org/

-- 
Lee Jones [李琼斯]

