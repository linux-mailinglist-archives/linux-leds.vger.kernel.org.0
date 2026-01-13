Return-Path: <linux-leds+bounces-6638-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9655D1A6C8
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 17:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA88E30319DC
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 16:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E5834DCEC;
	Tue, 13 Jan 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmKTPS4O"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31234DB48;
	Tue, 13 Jan 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323198; cv=none; b=GXaw1Nad9O2nc/QVX3nvqEWYr8yAHVuBIk/12FLw72o4x+am4ekBLPYmqEmIT+SN9AA/9dtgZfQzfafquTh0jb+rFfTfxClzSSkW7cOIf92wxGKHuLslJTqHDTYPQ0p4k9+PPUFSy4VpwXb2ZBS4+uPYtFeBL4kM7HkuBwOgrT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323198; c=relaxed/simple;
	bh=rC0OyhL77kmNXl+KEp08CoigsLjuWii0z/bE8OWzVqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FtL2YgePOHLwWs7WdvCTTmlwaiUHDdPxvsxmlE6Pg1cRF7C5dOm9iPRPWJYgSMTS1aWfhnB0EU74aqJK9+ijCO7yqKStMXtgdmhAICcMLDs79ummGMw4HFQAgAZ7zNcuxUvWQ8XvUBlNe1a808WNDoKZUgCRfY4hBDF6cRcVCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmKTPS4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B3BC19422;
	Tue, 13 Jan 2026 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768323198;
	bh=rC0OyhL77kmNXl+KEp08CoigsLjuWii0z/bE8OWzVqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JmKTPS4OJL9DejfJmLT4WPvm6tN062qXjFMCp4Yi7U+HasK7WGiEuFQvrg2+X49ub
	 dlrZ+gjC8O4TRtQQF/Pf0U71LkBZAsXO8Uhw0lu6cJvl2o1/VbSRynhTsi2b22Hu6/
	 9ZBQebfWGJrdriJkjT6C6HIBr/GCWjYA+eYB9+jKvImzpW9yiY/o2o1w+tY0YSdL9G
	 BsYbLOzC4ZqniwrX8DZPGuB0FjG4LhDpzr1Z7FlYFQM/SoAX2yRVJSgb74Neha36++
	 kqnf1SUv0W7LptxhZdcWGBzRx/Q3L/tXlZaOwTE0m5gthnfpSf0Fuiy4kwBktwAblG
	 Xc5FCgJx2qNlg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 8425D5FC5C;
	Wed, 14 Jan 2026 00:53:14 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 John Watts <contact@jookia.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
Subject: Re: (subset) [PATCH v8 0/5] leds: Allwinner A100 LED controller
 support
Message-Id: <176832319449.634309.16923738719016027897.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 00:53:14 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Sun, 29 Oct 2023 16:26:54 -0500, Samuel Holland wrote:
> This series adds bindings and a driver for the RGB LED controller found
> in some Allwinner SoCs, starting with A100. The hardware in the R329 and
> D1 SoCs appears to be identical.
> 
> This series was tested on the Nezha board (one onboard LED) and the
> Dongshan Nezha STU board (with an external strip of 16/32/48 LEDs, also
> with gaps in the LED addresses).
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[3/5] arm64: dts: allwinner: a100: Add LED controller node
      commit: 4d9af1e12cd6462c53aa91b6a0b6af7861e1c0ce
[4/5] riscv: dts: allwinner: d1: Add LED controller node
      commit: c8e75e0cecd277fb585d4491a6eeaaff64546f10
[5/5] riscv: dts: allwinner: d1: Add RGB LEDs to boards
      commit: f8ad8bbb8827c5bfd83bdf5e1ab512d2dc5db643

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


