Return-Path: <linux-leds+bounces-6585-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E39D02EB2
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 14:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E33D63086E69
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 12:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B9748D65C;
	Thu,  8 Jan 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bScyhRw+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3833ECBF7;
	Thu,  8 Jan 2026 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874466; cv=none; b=q5Qs/PGwTjvTjBgQOgZ06ib/c+M7KlQdJl7FuXlxBCxL8W3krURWYX3Heam+r6m602C/w8fBXYzrWdq5HvjxzDOI7vGycvPoAhgyLmIzRzZaV3QPoLDrc8//ckECbj5saPPdY1/2I5yIp1LqT5f3MhiCvP9XzyKCZGNUxsYYbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874466; c=relaxed/simple;
	bh=5cTbQKOHlYtzkTwsrHmBHCppSyKVkBrAAr06mK9QF9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NQnwQNeIH2T9s2nsu1Wa1DIH9+W1JbHDR+rJwtS2fgNKBuqCvMrVJ29FASpJNbAz5kcCmA+n45bQpyPP1rg/6MU6UHrm9HSLzDsEiEZEWRVvxNOZmFSG2IEFzFvdEu4+xf5pj8fDfJ1p2yBXdFcy5Aunj70ymvmco20clxUyelU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bScyhRw+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7745EC116C6;
	Thu,  8 Jan 2026 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767874464;
	bh=5cTbQKOHlYtzkTwsrHmBHCppSyKVkBrAAr06mK9QF9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bScyhRw+UXHyKl1Vhv6iix4O8WNkE18B2uXb1I5lUxNHeLQm/oNa/iUh+69T7BrS5
	 rNx/w/5nO8jlWC8cjeXc2XibgZCYxoUl1Puzz09shmeK6YOBTM8eAPu3NOfziwCxSL
	 xJRlqSFZd596D06FuIATXveX8cgfTlOonAS/DYWeYqh8RagPIm869zNjiRPj7f0wkp
	 ieem7CPUjDBFu3/N7dQOFsXdyRL0axQM0OWkWhP9px2+NqUOCo11bRnFOovF+7yZ8c
	 vFrR34lGa1fUXyrl6dqbcFPPoqjWcSB1EdNMd8EjmuXqQHwaUWzL9Wi1/ic4WAYgct
	 alEaPuNLdHrGA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, 
 stable@vger.kernel.org
In-Reply-To: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
References: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: led-class: Only Add LED to leds_list
 when it is fully ready
Message-Id: <176787446317.914194.18032642254997811373.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 12:14:23 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 11 Dec 2025 17:37:27 +0100, Hans de Goede wrote:
> Before this change the LED was added to leds_list before led_init_core()
> gets called adding it the list before led_classdev.set_brightness_work gets
> initialized.
> 
> This leaves a window where led_trigger_register() of a LED's default
> trigger will call led_trigger_set() which calls led_set_brightness()
> which in turn will end up queueing the *uninitialized*
> led_classdev.set_brightness_work.
> 
> [...]

Applied, thanks!

[1/1] leds: led-class: Only Add LED to leds_list when it is fully ready
      commit: bbe55e436524c99549e05d61371fac0806718a86

--
Lee Jones [李琼斯]


