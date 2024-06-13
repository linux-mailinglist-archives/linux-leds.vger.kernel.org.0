Return-Path: <linux-leds+bounces-1907-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5199075F2
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 17:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6926B2397B
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AA61494A2;
	Thu, 13 Jun 2024 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZ0i2pg+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC114900F;
	Thu, 13 Jun 2024 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290970; cv=none; b=ZnbhlLEKlRQ61h8LOdi5d8XQo7gpPBHC7cOWaJevg1u4B2xIK7mn864C71KQh0n21CWacfFiPhJF9ShRqkejqR8W9z9gv5uGww0RnF83vkwqV1nbEUrlMR7JvNrVBHx/7wK6X5R31+VDY14lxKYRwP3oKaFen8PcvQ4jKmVKPg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290970; c=relaxed/simple;
	bh=V+fe5XWMSFww4qgqdxA2gm8RTgqpG9cYDlZuGZBpm6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEJEgUm8TEV8YsYvDua+3u8eL9CeQ0Qk8Rjcp39jc2S0p8eTxiD4nNcU5p1+NFG+U+zOVvD/9f8orcZnPZvNF5uYNwjl9MA9jGJd+dKru+dTfeO30vro20QH+xdDqYs+r+z83aO158gONIqhc0kohXi9FxpIfmpsmC0U76YCxrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZ0i2pg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060D6C4AF1C;
	Thu, 13 Jun 2024 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718290970;
	bh=V+fe5XWMSFww4qgqdxA2gm8RTgqpG9cYDlZuGZBpm6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZ0i2pg+nV3+QOCvt7vH2GCl59/M9Fjl4GZ3z/n4vB81JNpgmmTbqhdK26Q1k5Tfg
	 GFTz3X0TAIz3jwQL3mEZ7xRh9uycEknDSpPyKk7LiJtd8/YLAa3Aqp32L37JtUNs8r
	 JQKOC6nqkWNgsLB1C+nZIPoNFXGjg0qigBrHK9uNBOoTIkSFbiFWy1JxX4o6VxwA44
	 EoBpurwB3aTenl5tttvexEoY4SoEIYM92GXgvo4UIM4UlK2e8QxabZmRyUgYNjHGqb
	 EOJF+cBbzMrbdxNS6ZsFwKeAzcRcQDv6KmlxqMU1V4jqX69FrhQmM5AmS3Hu2ayOFJ
	 XLbI0oASwiSMg==
Date: Thu, 13 Jun 2024 16:02:46 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>
Subject: Re: [PATCH] leds: triggers: flush pending brightness before
 activating trigger
Message-ID: <20240613150246.GI2561462@google.com>
References: <20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net>

On Mon, 03 Jun 2024, Thomas Weißschuh wrote:

> The race fixed in timer_trig_activate() between a blocking
> set_brightness() call and trigger->activate() can affect any trigger.
> So move the call to flush_work() into led_trigger_set() where it can
> avoid the race for all triggers.
> 
> Fixes: 0db37915d912 ("leds: avoid races with workqueue")
> Fixes: 8c0f693c6eff ("leds: avoid flush_work in atomic context")
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Dustin, could you validate that this fixes the issue you encountered in
> the cros_ec led driver?
> ---
>  drivers/leds/led-triggers.c          | 10 ++++++++--
>  drivers/leds/trigger/ledtrig-timer.c |  5 -----
>  2 files changed, 8 insertions(+), 7 deletions(-)

This patch clashes with:

  https://lore.kernel.org/all/20240531120124.75662-1-hdegoede@redhat.com/

Please rebase and ensure that your solution doesn't conflict.

-- 
Lee Jones [李琼斯]

