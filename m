Return-Path: <linux-leds+bounces-187-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB57FA5C7
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 17:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3043B281240
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 16:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E4D31739;
	Mon, 27 Nov 2023 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4stbp0/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A72D623
	for <linux-leds@vger.kernel.org>; Mon, 27 Nov 2023 16:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD929C433C7;
	Mon, 27 Nov 2023 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701101497;
	bh=1eC3B85c/WTIXCxPORwzEkxtZ2OPGRmGdBSkCRXeP/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4stbp0/23OAp1nKC52N6XJrhGA+YUTis67TYG+h5O946UkapWE4UYfWhZ1z/bD+0
	 f6w864ZJ3xYwpf/2TvBd6tLimWISRUHD5EK3pX1CjO5aF3MXUf//qeMVkhQex5VxhN
	 X/oai6B7w5sh7x4peTRRYwxbH6o+3uWWn+qmLyZuvBeQlv49FiCl5CSmzUCRMjejtQ
	 eTma3mvnaMfaoGYrTsWMITtrK1q2gkCv3HnegRO9q6nek+J6AhTTUKcNg4ef1Gx8g+
	 eeCXrLR3qK1DbGWYk35/Loa6zPZulwdb8WJFURUsVjd2b/Y0gT8DaV8RfwRKo1fyGj
	 Uo0VJPx3l3e2A==
Date: Mon, 27 Nov 2023 23:59:13 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: Expand led_colors[] array
Message-ID: <ZWS80c/ZQvaGIM96@xhacker>
References: <20231030054757.3476-1-jszhang@kernel.org>
 <20231123105620.GG1184245@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123105620.GG1184245@google.com>

On Thu, Nov 23, 2023 at 10:56:20AM +0000, Lee Jones wrote:
> On Mon, 30 Oct 2023, Jisheng Zhang wrote:
> 
> > commit 472d7b9e8141 ("dt-bindings: leds: Expand LED_COLOR_ID
> > definitions") expands LED_COLOR_ID definitions for dt-binding. However,
> > it doesn't expand the led_colors[] array in leds core, so if any of
> > the newly expaned LED_COLOR_ID definitions is used, the sysfs will
> > emit null in the led's name color part. Let's expand the led_colors[]
> > array too.
> > 
> > Before the commit:
> > /sys/class/leds # ls
> > (null):indicator-0
> > 
> > After the commit:
> > /sys/class/leds # ls
> > orange:indicator-0
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/leds/led-core.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> 
> This already exists as:
> 
>   a067943129b4e leds: core: Add more colors from DT bindings to led_colors

well, my patch was sent earlier than this one... When I sent out the
patch there's neither fix in mailist nor in your repo.

