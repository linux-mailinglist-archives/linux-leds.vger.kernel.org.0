Return-Path: <linux-leds+bounces-4450-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99FA83F3B
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 11:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F583B9516
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 09:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D509F25E82A;
	Thu, 10 Apr 2025 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfJPXZNj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBBF25A332;
	Thu, 10 Apr 2025 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278068; cv=none; b=C8spnlUZpwJj/Ejkczv6vDp2oXQs9drkcUWPGmHvpBbALdWupoh8pb+SNMUL6EMNr1PH+Ry22jgT+wnWaTgPjbB/sLfpmivmMk9A0ZpQm2BBj3RunWlonU5oNmvW++nrPkvxUIoFqN7zWaZJ/ksGruEYUYDtU+MSh3+E2eJGXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278068; c=relaxed/simple;
	bh=6AJS6CuDOL5YXoCyhgTDKqDfnzqEc5Se4QRNrdUe/4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1Glqgq3NLvH2GlcgYKknSrJUkE5S7QamWhaJ4q1gHQKiqJXgJp/TlNZmeVLbf832eKtYmHD/uxiqB6NZ+Jd/P43UBPsWQE/1NJZenxLjjmbwep4AAoprbROuClV8vKEOzvTIs3aVovzkObyOfQbUoz5B1M6n3c1JyFdUmsNDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfJPXZNj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E227C4CEE3;
	Thu, 10 Apr 2025 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744278068;
	bh=6AJS6CuDOL5YXoCyhgTDKqDfnzqEc5Se4QRNrdUe/4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfJPXZNjcSj1Lf/TdyaCrgIZF2DqCbSqV40QNs/Tld1Rnqa35LrOaC8AAHelkTEgy
	 YNWTzpFuSJ+5NA2quiRLTgz7dIi4K7AVhk49vGskH+V4WMzydwuoVZnEB2Fw8O1GAU
	 jhGiamgI6LM6o5x2hGpr63BqkuIxdMhXX6SyYbwTQ2cwldrBid2dx3ZivfngPOSzRu
	 Pr4zdS1Ep2dlfDT9e7263UjxSwLAQL3i9ZzGg8IUL2f0NPssvUZ9mBSRNTR9w9AeCQ
	 eQMHOt6Hd+XEzk2LVCojIVLbOroKOirSURQYz+6Rv77T1vHzlbwtLxMQoLPgpzc6TN
	 seOxR9L+GPalg==
Date: Thu, 10 Apr 2025 10:41:03 +0100
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <20250410094103.GS372032@google.com>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <174427796227.1683312.16355490136227829122.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174427796227.1683312.16355490136227829122.b4-ty@kernel.org>

On Thu, 10 Apr 2025, Lee Jones wrote:

> On Fri, 21 Mar 2025 10:53:53 +0100, Thomas Zimmermann wrote:
> > This series removes the remaining dependencies on fbdev from the
> > backlight, lcd and led subsystems. Each depends on fbdev events to
> > track display state. Make fbdev inform each subsystem via a dedicated
> > interface instead.
> > 
> > Patches 1 to 3 make fbdev track blank state for each display, so that
> > backlight code doesn't have to.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/11] fbdev: Rework fb_blank()
>         commit: 93e41f968d7c6ea1cedc6b365917cbb787ef08f6
> [02/11] fbdev: Track display blanking state
>         commit: 7e3711eb87c584ed224a7ad7000eba36e6fa3a51
> [03/11] fbdev: Send old blank state in FB_EVENT_BLANK
>         commit: dfb4bf1ac40162ff5ea3715a10f6af2dcf3030c5
> [04/11] backlight: Implement fbdev tracking with blank state from event
>         commit: 726491f2038ec71122d45700f3abf36fdb277aaa
> [05/11] backlight: Move blank-state handling into helper
>         commit: 4bfb77f3381627640e97e0e423c93a2ea93e7de7
> [06/11] backlight: Replace fb events with a dedicated function call
>         commit: b01beb2f1f6bcda17634a5b529865ffc5a9b795f
> [07/11] backlight: lcd: Move event handling into helpers
>         commit: e98696cea7e289447a5d2328546b947629301616
> [08/11] backlight: lcd: Replace fb events with a dedicated function call
>         commit: bc70cc84f5a2ebfd7e7112e9b8837e0c7954fc65
> [09/11] leds: backlight trigger: Move blank-state handling into helper
>         commit: 28f8bab711c0984005a6dd4cc980b4ba8409b817
> [10/11] leds: backlight trigger: Replace fb events with a dedicated function call
>         commit: dc2139c0aa3283e5749109641af1878ed7bf7371
> [11/11] fbdev: Remove constants of unused events
>         commit: d32a0b567a8a8b6e677d35c4f8eb8bd32b7029a0

Okay, these have been submitted for build testing.

Once complete, I'll send out a PR.

Note to self: ib-backlight-leds-fbdev-6.16

-- 
Lee Jones [李琼斯]

