Return-Path: <linux-leds+bounces-4267-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965BCA60EDE
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E329F3B3E6C
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 10:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6181F4631;
	Fri, 14 Mar 2025 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o4eRqpN2"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8B1F4175
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948210; cv=none; b=k6NTW2LznmmAH76nHiBckT4uojhNk3R1tjqwMWmP/dtv3tlbeFppWCeUJGy70ShJR9Ayyijc7GpsRlLnKmdMFQKmmVLjNVgBceMEw003dROuL3PBuOatQ6Xi5NgnZkpYaYmGNgZLg3k0Lm0AWBYw3coQ1XlLAoGMZ4G17Db+dlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948210; c=relaxed/simple;
	bh=zPIgBFSapNqBCcFoAq12Ai3B92XuRKLjXyEQXIA3a58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOxXJ9Gx0ywpsc/Iu5QyWrYKuHfowfLL47FRPnGZr3h4SgH0JU0ZHRK+XshjQtApVnDk5a38kFvdvDWxC5rGiTnXtFkvhPIpJMidzVKm26/3dYS/3I9TZu28B9wtwwQkEnW8Yl1xOravFL9+qnTV5a6jmmzQRA/S1gquKu5p/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o4eRqpN2; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 14 Mar 2025 11:29:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741948204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0UfVeEDY0MoHgV6nzLZ3BSMFI3hnBpyEIRUD+grXzCM=;
	b=o4eRqpN2hQ2wkENpB5K2IMaa+2Iylkz9eXD2wbfKkcc4Nl20AoWo62lZUbR17K90pj3Hc1
	2/Gl58hsPC9WJkWZpRJTgkbZHkQBCx8WoK4ug2rPWsmgdzOUBj/VTVIzrAPEEW0b8HzB/I
	7KQs5DcMD0gq9MLpJPfZhLP2/ZjNdbQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Lee Jones <lee@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/8] media: v4l2-flash: add support for flash/stobe
 duration
Message-ID: <dunceutcslebyflqj5vgo3hfxwyyar3puvp7dr5awpiemvb4za@birq5hmjkoot>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-2-14d7a281342d@linux.dev>
 <20250314095146.GB3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314095146.GB3890718@google.com>
X-Migadu-Flow: FLOW_OUT

Hi Lee,
thanks for your quick feedback!

On Fri, Mar 14, 2025 at 09:51:46AM +0000, Lee Jones wrote:
> On Fri, 14 Mar 2025, Richard Leitner wrote:
> 
> > Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
> > led flash class.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/leds/led-class-flash.c                 | 15 +++++++++++++++
> >  include/linux/led-class-flash.h                | 16 ++++++++++++++++
> 
> This should be a separate patch.
> 
> Then Mauro and I will have to come up with a merge-plan for the series.

Sure. Will create a separate patch for this in v3.

> 
> >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 13 +++++++++++++
> >  3 files changed, 44 insertions(+)
> 
> -- 
> Lee Jones [李琼斯]

Thanks!
Richard

