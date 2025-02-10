Return-Path: <linux-leds+bounces-3912-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CFBA2F55B
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 18:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12A463A464D
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90A424F5A4;
	Mon, 10 Feb 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6JoZEaz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE92256C99;
	Mon, 10 Feb 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208904; cv=none; b=O9mEtMbVw5lW9hFAi5Ewpx7j1SAwbS85X0//m/a/mBJmGpUIXVQE3MtVTAMD2mC6vIXg4bD9pWTmY6ge8kbcjkzSQ700agre8Ho4Lxp1aJV4YW3oWMK7soCzUp3d9MilCxjmIOcXn3/ZtfIocH9TeL5mAEuOnNkzl1Q6jveMrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208904; c=relaxed/simple;
	bh=p8aq8zFa18JR+QUrWxfYcA1G15bcohfRpJYdfzTJQyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cYLUALgINW8VQQ/+pfCvH3jlCZIfpWXARmL5wOA7gJzx2a1mp4sxhCaVqjGdnP3a4H5btkQIFbmiPdIGub4qLxLNhpuTDNPmzR5N/X68bml/MMprroMR9SJk2yDc4kOkQ+wXKL9xtrDWovUoQVfthE8iZwTbpBYca0yhLUbbWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6JoZEaz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F59BC4CED1;
	Mon, 10 Feb 2025 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208904;
	bh=p8aq8zFa18JR+QUrWxfYcA1G15bcohfRpJYdfzTJQyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F6JoZEazfztkZvbA4yEZre+HILVGd6Wf9v2thxvJu6XPK5gi/VKIdfOmI3SCHk191
	 dGuWUv0FGaXrgPgy+4M6MhUO8ykWSUc2/MQz/NkQXLkROsGIFTJbN9zeEi2jtfrxd7
	 WmjOcb6Rawc1S42nnJSiCmBxxn/arPccl2DgfGoXnPjWMsLxPXrDcOIAfZBzmvSdto
	 0ZVlINUsX/iwjLP4Ohaiy74sUAOsPx/rKis7p0l33FbyHSanb4Ie1Owie2MJ+2GYti
	 9ATGGz45nCpfuVgpDYjpkTS46CsPvbdVQe7uucywJO72JmpjjYfkcyye08DV9BMIL7
	 mx5CglvdNYyCA==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
In-Reply-To: <20250129152659.1801420-1-andriy.shevchenko@linux.intel.com>
References: <20250129152659.1801420-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: lp8860: Drop unneeded assignment
 for cache_type
Message-Id: <173920890313.1935155.1479953783502384544.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 17:35:03 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 29 Jan 2025 17:26:59 +0200, Andy Shevchenko wrote:
> REGCACHE_NONE is the default type of the cache when not provided.
> Drop unneeded explicit assignment to it.
> 
> Note, it's defined to 0, and if ever be redefined, it will break
> literally a lot of the drivers, so it very unlikely to happen.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp8860: Drop unneeded assignment for cache_type
      commit: 59670b23bfb649b29ad185618116d522f0e7ae90

--
Lee Jones [李琼斯]


