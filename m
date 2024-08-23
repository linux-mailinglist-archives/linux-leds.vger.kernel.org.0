Return-Path: <linux-leds+bounces-2517-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F8D95C21F
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 02:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 108B91C21C4F
	for <lists+linux-leds@lfdr.de>; Fri, 23 Aug 2024 00:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774B71FA1;
	Fri, 23 Aug 2024 00:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1eH4Sa4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEBEDC;
	Fri, 23 Aug 2024 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724372057; cv=none; b=mBMBNIlPB7aDvAc67wnwMc4PvLRTVCjQhX8GW0UTYGcG5A1bcObJ+N0VNUn5TUoNHq4YFuYlGe+Nn36hxMNpegSqI5HhnTHSwb1OCi0rwq0/YPTdh00aWBJBhqgJv3pm+KjEVOAJX6NHubMm3RqIBX9ExaL5vKId8v+k606JfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724372057; c=relaxed/simple;
	bh=meO8NYG/0DI1pJK9vfEpszXIYCnr9inA4xoCf3jcfXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhQbwGm75yBvFx+AydimHHyBLETKZv/c1xwlZD+Eu5F/6Rme7mIq5lWprawnmr8MVMXifgz9E4+22KUjvwSJkF/x5rd6eM78olGiCByLWG7zXyGdb2pm357Xrx1o8DzPtYnDW93xoApDR/huAd/Nc6XrcIquwEgNl8jN12rll6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1eH4Sa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3118C4AF09;
	Fri, 23 Aug 2024 00:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724372056;
	bh=meO8NYG/0DI1pJK9vfEpszXIYCnr9inA4xoCf3jcfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1eH4Sa4L+UzeLInQKU4pRBhyc+98WZAR36gCuvWkt9NUmTRzfyzvwgjfbwMBYeto
	 To2mimmiFyMWLLu6okO5gp+hqWza/f1hbG1xsL2lvFlisv82N7chnOnK7n4FXuwlQQ
	 SITPe9Ahjrdo+8hBTNZDuYX7MixksxdbgPxeXQ4rZ7Kvgbw9ctg0xv55fwFVTulKmc
	 PyjkieTRtr/2pu7HI8J9iXeIXIq9JuCAB5pD0V1ES58aa/5fChFyoiC6GVBlI4xY5y
	 5AXJG8RTo+B8eH3Wa/GtAJ3/K/pvMNUcfMdHB9TVCr13Lt3gaT7BvrALXfM1vZ42rg
	 M497XnzNC9fEg==
Date: Thu, 22 Aug 2024 17:14:16 -0700
From: Kees Cook <kees@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] leds: gpio: Set num_leds after allocation
Message-ID: <202408221713.77EF78D1@keescook>
References: <20240716212455.work.809-kees@kernel.org>
 <c16715ff-1e47-4a73-8fcb-87462069b5ca@embeddedor.com>
 <20240725102240.GE501857@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725102240.GE501857@google.com>

On Thu, Jul 25, 2024 at 11:22:40AM +0100, Lee Jones wrote:
> On Tue, 16 Jul 2024, Gustavo A. R. Silva wrote:
> 
> > 
> > 
> > On 16/07/24 15:24, Kees Cook wrote:
> > > With the new __counted_by annotation, the "num_leds" variable needs to
> > > valid for accesses to the "leds" array. This requirement is not met in
> > > gpio_leds_create(), since "num_leds" starts at "0", so "leds" index "0"
> > > will not be considered valid (num_leds would need to be "1" to access
> > > index "0").
> > > 
> > > Fix this by setting the allocation size after allocation, and then update
> > > the final count based on how many were actually added to the array.
> > > 
> > > Fixes: 52cd75108a42 ("leds: gpio: Annotate struct gpio_leds_priv with __counted_by")
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> > 
> > Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > 
> > Thanks
> > -- 
> 
> Using the signature tag in the middle of an email turns the remainder of
> the body into a signature block, which is odd to say the least.  By all
> means sign-off in the middle of a mail, but please refrain from
> converting the rest of the mail.

Ping. Shall I take this via the hardening tree?

-Kees

-- 
Kees Cook

