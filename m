Return-Path: <linux-leds+bounces-3931-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14644A3105E
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 16:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4A43A16FD
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 15:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8405E25332A;
	Tue, 11 Feb 2025 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYnWKefi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C543230D0E;
	Tue, 11 Feb 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289379; cv=none; b=UIdN2ZAf8tvnNE2civ5UKcdX/m6dd8zCdigZdN/grSzU0dy88QQ9QrxzoMrZWFIgcUvl23qCMBW5Ag8Y+FH+2Gy8rvaBzZXLS6RSpeOFg6UsgNiyTMqDHHlH7i70p1xAKNKe8dp46zwbhL61BEIoEsN1FmeQOBkuzpCgYJPOKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289379; c=relaxed/simple;
	bh=xCkuiK9sporzJv0UQOxvidc/JxORGu6AgU8vrdMnfKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS7ZVzPe4XVtYby/E8v+k/nPj1GgN4/Bgy1lJyNPZl2Mz1yqA5vdw2m3NxT5mz2kIA0mvDyGB2Un5jy/1DN0X+4LH0J0rs2zUbPyCRTypjCN00Bh/i/kpcT9z1cxo0vi+NI3IHlj9CPuXv/EQnNfYzEltTeYJmi4kSw5mK+WGuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYnWKefi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE877C4CEDD;
	Tue, 11 Feb 2025 15:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289378;
	bh=xCkuiK9sporzJv0UQOxvidc/JxORGu6AgU8vrdMnfKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYnWKefiHIkP8bChjln8pQ/Jwhx8BZ0nXQpm+MMsLt4GfMKgwe7HxHkVW9/x1H17w
	 i57BMDzNdAaZo7RMCzee4dwFggt8zUw068JwkYck7iqj7wu546vuJWYUjpGRyyAxxO
	 UfGTTKX7nJ31Q/AbNldq1DWMM0CNBvRIIkRvSQMd1Pypfi8BoSqsQ/E6aFgNzZc7dA
	 XCWg18tiblQVp6YqhYO3hdn7G4+2j4qULkQGrdlzhRT3Mq9CTr1/y9/CwY7/3FqfJB
	 4aUjDB63wuNk5EpHVIvXETlyvXl/GSeuMeZKlTGpdD0JqkWbtCoKKw13LyMvE+EiIl
	 UdJvj/PJ6cN0w==
Date: Tue, 11 Feb 2025 15:56:14 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>,
	rafael@kernel.org, linux-leds@vger.kernel.org
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <20250211155614.GY1868108@google.com>
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
 <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>

On Tue, 11 Feb 2025, Linus Torvalds wrote:

> On Tue, 11 Feb 2025 at 06:11, Lee Jones <lee@kernel.org> wrote:
> >
> > I'm struggling to apply this.
> 
> Well, it turns out I already applied it as commit 511121a48bbd
> ("MAINTAINERS: Move Pavel to kernel.org address"), so no worries.

Thanks.

Out of interest, how did you apply it?  b4 was playing up for me.

-- 
Lee Jones [李琼斯]

