Return-Path: <linux-leds+bounces-2310-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498693BE3A
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4961F22450
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90952196C7C;
	Thu, 25 Jul 2024 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWALtTPG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615BD196446;
	Thu, 25 Jul 2024 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897673; cv=none; b=oZ6fHrGI9uDWJWMPYKnw4PbEsBiBx0aNv6tk89fNSzDaMdadGjMofE2zPfWIKw3z+REM73uElAamYWzUHZLd0qlorF+oEWnrubytZrVc5RPS2SV8yd92v7LTvVsnjhBN4PWBFtY8ZJZaFAvQTP1y5mo5vYb/BKVLfHoERd1bL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897673; c=relaxed/simple;
	bh=LFjleej6va1/xz+ykBTWahA4XEevUy9aUUCl2TISl9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dbULOC+6S1AapLTS0C/yx9mA8DY58izh2lUpG68ZR76+pjP/X9PMaSlGvOMReBOelkIrEPl0nvbGU81NH9Tol83mUPJyHlXIGKm5EDM2ttVz3+DCm2tQluOGUPyemoMjkEhx7pNnxLLIwHoEF9uHvbH79gDn/mumtyNMhEmu1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWALtTPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7CCC116B1;
	Thu, 25 Jul 2024 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721897672;
	bh=LFjleej6va1/xz+ykBTWahA4XEevUy9aUUCl2TISl9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gWALtTPGUCIDdJ6T1ps6V3LAanrIzxeTbPUVX6B0s0+oogI/KwDupB3+uR0fdxcxr
	 qmY/1FSpEdOaJH3Kx+2ad65MGVj9C1wUDRDK/7VPNi6TBEg7eghu9/NyVxbcCEmhyT
	 Smaejv1OV1eA9/UqIdPRVhXqgzFiaYKJrxVfM/VRpDncNqUael/uers1/ZtTJ8wOxa
	 TCwbTz+YhKvlJZWtVw9dIWEqYN/lLi7X3P26DhUoXTAC5EL9oDBEVC00jeH5zxC46M
	 0JGMxBf/7rtpU2g9j4G2ZTR3nn9ozCBgtCk946lWVID5JUlYHU7qMgeAQ3gpGHayvI
	 hc2iCO/F6C6XQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Daniel Golle <daniel@makrotopia.org>, Li Zetao <lizetao1@huawei.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240710100651.4059887-1-lukma@denx.de>
References: <20240710100651.4059887-1-lukma@denx.de>
Subject: Re: (subset) [PATCH v1 net-next] leds: trigger: netdev: Add
 support for tx_err and rx_err notification with LEDs
Message-Id: <172189767041.875230.3269889865332839490.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 09:54:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 10 Jul 2024 12:06:51 +0200, Lukasz Majewski wrote:
> This patch provides support for enabling blinking of LEDs when RX or TX
> errors are detected.
> 
> Approach taken in this patch is similar to one for TX or RX data
> transmission indication (i.e. TRIGGER_NETDEV_TX/RX attribute).
> 
> One can inspect transmission errors with:
> ip -s link show eth0
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: netdev: Add support for tx_err and rx_err notification with LEDs
      commit: 8ed8ccdc279cf840a456c9dddb572fbee45ab6ae

--
Lee Jones [李琼斯]


