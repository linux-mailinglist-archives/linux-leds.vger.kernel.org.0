Return-Path: <linux-leds+bounces-3955-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EEA32B02
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 17:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0978E16513D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 16:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702E0256C74;
	Wed, 12 Feb 2025 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh6T1HWh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484072566D9;
	Wed, 12 Feb 2025 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376009; cv=none; b=n6UDs6YHLWt9wKJi/2w55yGa95R95y5bEBawFPvoGbidxWCtnc07iK5QUn+UMuW5t1Sv0dQOoT3UvBrYfwdJPMBgztIqkxzXjlXYXcgp+QlXxgIdFyZQGeuUCXxye/G3cHBsXcMo2VjDrO5+3vdGUkj5XP+42b8HL6ZPZgvfKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376009; c=relaxed/simple;
	bh=GEoysr+wX42HOugqLnbJxAY2bb1iPe2zxnT3Q2IzpUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQiEOQ8xMxxc93vpN9G3hNN9Jw5S8K2c8PSlxkZIhocYz9dzxBotDuMrx4uMiotpnvJZYfDyOnS8xMcAIF4k4OArDOcv3SxfSVZjH/s/0Fa+X/09tRhrAje2T2l5G1wv3VAoM7094tLVETYQ5+L/Whrs1fxBZUXfGth1Ha2qE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh6T1HWh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3D7C4CEE4;
	Wed, 12 Feb 2025 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739376008;
	bh=GEoysr+wX42HOugqLnbJxAY2bb1iPe2zxnT3Q2IzpUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dh6T1HWhUByaP9UZFNfHsTHje9+GAvqQJ7oZpD7Rw4aN01J0A+e7yN2BJBk0LMyqX
	 d9DXSHhk4VG15WZjB2A5peBCsgV/UXGKdf95my9V8eyLXVetGIPNA/1DQpTYeD5Pg8
	 8t/g3Cre7/1uxLUYQE4Y/UJcsPvHwdE9RGNS+AOKnpxbWA0lc9PYu8CnEy06jOh61q
	 Gi+I1UuVx4nyNDO9vFcg9byhzbOl9AC+Ru8iYOmLAvJQwionIG/wnCwEc7VCtmhQUs
	 tBN/2dmCC1Cf5qCpz/Ex7gUYUUOJyZc01hKiWxc7doAERQgk8WE5s1U8DI9eTNuOMa
	 xOwbHIYRWHbBA==
Date: Wed, 12 Feb 2025 16:00:04 +0000
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, tools@kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <20250212160004.GF2274105@google.com>
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
 <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
 <20250211155614.GY1868108@google.com>
 <20250211160125.GA2274105@google.com>
 <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
 <20250211-coral-copperhead-of-dignity-bcb3ce@lemur>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211-coral-copperhead-of-dignity-bcb3ce@lemur>

On Tue, 11 Feb 2025, Konstantin Ryabitsev wrote:

> On Tue, Feb 11, 2025 at 09:40:24AM -0800, Linus Torvalds wrote:
> > On Tue, 11 Feb 2025 at 08:07, Lee Jones <lee@kernel.org> wrote:
> > >
> > > > Out of interest, how did you apply it?  b4 was playing up for me.
> > 
> > So I had no issues, but I don't actually use b4 to apply the patches,
> > only to fetch them.
> > 
> > >   Fetching patch(es)
> > >   /home/lee/bin/apply-patch.sh: line 134: /tmp/<Z6Ow+T/uSv128wdR@duo.ucw.cz>.mbox: No such file or directory
> > >
> > > Where apply-patch.sh: line 134:
> > >
> > >   b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}
> > >
> > > My first guess would be the stray '/' in the Message-ID.
> > 
> > I don't know your apply-patch.sh script, so maybe the bug is there,
> > and it's your MBOX thing that you create without quoting the message
> > ID.
> 
> That would be my guess, too, as b4 itself has no trouble fetching or applying
> this series:
> 
> 	$ b4 shazam Z6Ow+T/uSv128wdR@duo.ucw.cz
> 	Grabbing thread from lore.kernel.org/all/Z6Ow%2BT%2FuSv128wdR@duo.ucw.cz/t.mbox.gz
> 	Analyzing 7 messages in the thread
> 	Analyzing 0 code-review messages
> 	Checking attestation on all messages, may take a moment...
> 	---
> 	  ✓ [PATCH] MAINTAINERS: Move Pavel to kernel.org address
> 	  ---
> 	  ✓ Signed: DKIM/ucw.cz
> 	---
> 	Total patches: 1
> 	---
> 	Applying: MAINTAINERS: Move Pavel to kernel.org address

I guess it's the fact that I create a file with the name of the
Message-ID which includes the slash.  This is the first time I've seen
this happen.  I'll investigate locally.  Thanks for your time.

-- 
Lee Jones [李琼斯]

