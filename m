Return-Path: <linux-leds+bounces-4247-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B4A5FCB5
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 17:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEFD119C16E9
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F8E26869F;
	Thu, 13 Mar 2025 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5CTubo1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA99A149C7D;
	Thu, 13 Mar 2025 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741884716; cv=none; b=kmy5qKqylP6bILtW5hzZy+GVvQ0qxFYw4/pxCQNPqBZ+lEdCQxqHZkUO5aqSG6enBpkU/eIcauzEZaMwQK2cHoa19ntccVoWX/jkZBB39yvSHEMQRdq65prmW1fFyRTmpDyet2ZXWNh2DWH705TMqtD2UD8y1F7HEAEW8DbQ2D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741884716; c=relaxed/simple;
	bh=3By9eSGkfs1OocLuxqTAkYFCwAaFekwTeLaEzkR5MFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4NRLvO8Y0mKoYhj5xAOXDpElzpCA1qAgwa1ljpUzj2G1Igj5J8nXToZkNgHDetkYdUaIvJvwQF0++27fIoLisJExShMY1W5gdQw84YT8oPCsyyFFvhcqiQxKgOYD2Hy9keiGsxHMiQlw1xaHzOO6zMaxxWdyIVi3DvWZlR/XWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5CTubo1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F2C4CEDD;
	Thu, 13 Mar 2025 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741884716;
	bh=3By9eSGkfs1OocLuxqTAkYFCwAaFekwTeLaEzkR5MFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5CTubo102Ea9x3jFPg4R2esDt5NDpMcacotXLl5Rk7XZjf7jWM0euGtmzy/VaR4h
	 owngy/DiIUS4uzNHx9R+2TztXmwI96F25Wl4Jxd3gw4BIsRdmbQNT18L9ju2TXrwZa
	 X39nB1IVa1iy31WiOojIY27Fs5wSgw1KCwJV19zt8HWPYLNMLt9IKhs+6TxoqTxw6w
	 sBr+OA2/K7XPYAH0xRlmzv09GWkiFIN5miGqC4QBcY3We4XcXtEYvY3CHMxX5uUoHC
	 khlKlMmDPUQJG3wzqZJokKIommY/DFaJEmeq8MopYrDL5jX7FVkRb3Y9hdyJVCg7dp
	 5rjgTby9aOtYA==
Date: Thu, 13 Mar 2025 16:51:51 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <20250313165151.GE3645863@google.com>
References: <20250306140947.580324-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>

On Thu, 06 Mar 2025, Thomas Zimmermann wrote:

> This series removes the remaining dependencies on fbdev from the
> backlight, lcd and led subsystems. Each depends on fbdev events to
> track display state. Make fbdev inform each subsystem via a dedicated
> interface instead.
> 
> Patches 1 to 3 make fbdev track blank state for each display, so that
> backlight code doesn't have to.
> 
> Patches 4 to 6 remove fbdev event handling from backlight code. Patches
> 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
> do the same for led's backlight trigger.
> 
> The final patch removes the event constants from fbdev.
> 
> With the series applied, the three subsystems do no longer depend on
> fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
> number of events. That mechanism has been deprecated for some time and
> converted call to dedicated functions instead.
> 
> Testing is very welcome, as I don't have the hardware to test this
> series.
> 
> v3:
> - export several symbols
> - static-inline declare empty placeholders
> v2:
> - avoid IS_REACHABLE() in source file (Lee)
> - simplify several interfaces and helpers
> - use lock guards
> - initialize global lists and mutices
> 
> Thomas Zimmermann (11):
>   fbdev: Rework fb_blank()
>   fbdev: Track display blanking state
>   fbdev: Send old blank state in FB_EVENT_BLANK
>   backlight: Implement fbdev tracking with blank state from event
>   backlight: Move blank-state handling into helper
>   backlight: Replace fb events with a dedicated function call
>   backlight: lcd: Move event handling into helpers
>   backlight: lcd: Replace fb events with a dedicated function call
>   leds: backlight trigger: Move blank-state handling into helper
>   leds: backlight trigger: Replace fb events with a dedicated function
>     call
>   fbdev: Remove constants of unused events
> 
>  drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
>  drivers/video/backlight/backlight.c      |  93 +++++--------------
>  drivers/video/backlight/lcd.c            | 108 +++++++++--------------
>  drivers/video/fbdev/core/fb_backlight.c  |  12 +++
>  drivers/video/fbdev/core/fb_info.c       |   1 +
>  drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
>  drivers/video/fbdev/core/fbsysfs.c       |   8 +-
>  include/linux/backlight.h                |  22 ++---
>  include/linux/fb.h                       |  12 +--
>  include/linux/lcd.h                      |  21 ++++-
>  include/linux/leds.h                     |   6 ++
>  11 files changed, 205 insertions(+), 208 deletions(-)

No immediately obvious issues from the LEDs side.

Still needs reviews from Backlight and fbdev.

-- 
Lee Jones [李琼斯]

