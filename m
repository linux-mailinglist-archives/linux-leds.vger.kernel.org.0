Return-Path: <linux-leds+bounces-4543-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B75A9C4D1
	for <lists+linux-leds@lfdr.de>; Fri, 25 Apr 2025 12:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FC43B121E
	for <lists+linux-leds@lfdr.de>; Fri, 25 Apr 2025 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DE123315E;
	Fri, 25 Apr 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mS24obDf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AB22F75A;
	Fri, 25 Apr 2025 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575881; cv=none; b=glTbWnVqbC3iBnCjbry6Bndg51C3Bv8mr4vmGtSE7kUzgaLsAK1+uoqiVkzGlqUGERSZ34lUKa/R3BEzfpz5pm4dOssdZ8xIfA0LvGZDso5A6sS9pcNYFyIU+h676HGlL+ZMyyPLDsMwjzZ9YS1fvGFhJzM7Ien76iEv/5Maptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575881; c=relaxed/simple;
	bh=kvvnHvigW0VQbIe0ZGV9v0oum5k9cSu8YzHMjbx3H6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9VB5X6tkpt/ixWCVtUm8JFUSHKiXRbldEa604JxaMe/vbPd2WEJfvBMu3njxiRYOI4LPEP0EZYRvfMKSZSyHnwgVWSFX34vZz99vC8RqndOdV41RMtUDUjunrSy/skx1A3Uijg7+ZChlf56f9P/KbfFrX91Z4VuV6GEEky6SMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mS24obDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7230BC4CEEB;
	Fri, 25 Apr 2025 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745575877;
	bh=kvvnHvigW0VQbIe0ZGV9v0oum5k9cSu8YzHMjbx3H6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mS24obDflvZCOBToupjgcFflGEET7oy3pnjXDwArZ3/F0z5+giauG00F+eIlB9Hfq
	 j0Ihhc5pWkdBTlgEz009tUXKAlE001tYI6aockGWu8b0Taf4mD4ge60FW6WhBukP8m
	 S73o1gCe2hC2pWdvT56nNCsaF0Id5DEy3lU6U9vAT9gLwDFOWGYHVllGDUevXjwoPI
	 OmLkfmx0nIr74pNxQuzAOTwiks8+7PLbScWIgoZuR2Y9qMEFznpXcFwIxc8ljCSnmM
	 a+NY0FoQ/IRgWNVK+TE4dJGGo+hg6F4HwyoOYEuey2AJ5CiF+mVCunpxt0KdFFwteg
	 W6GtTyChAUEbw==
Date: Fri, 25 Apr 2025 11:11:12 +0100
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] leds: add new LED driver for TI LP5812
Message-ID: <20250425101112.GB1567507@google.com>
References: <20250422190121.46839-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422190121.46839-1-trannamatk@gmail.com>

On Wed, 23 Apr 2025, Nam Tran wrote:

> This patch series adds support for the TI/National Semiconductor LP5812
> 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
> Changes in v7:
> - Mark `chip_leds_map` as const.
> - Use consistent `ret` initialization.
> - Simplify the function `set_mix_sel_led()`.
> - Refactor `dev_config_show()` and `led_auto_animation_show()` to avoid temp buffer, malloc/free.
> - Simplify the code and ensure consistent use of mutex lock/unlock in show/store functions.
> - Remove `total_leds` and `total_aeu`.
> - Link to v6: https://lore.kernel.org/linux-leds/20250419184333.56617-1-trannamatk@gmail.com/
> 
> Changes in v6:
> - Add `vcc-supply` property to describe the LP5812 power supply.
> - Remove `chan-name` property and entire LED subnodes, as they are not needed.
> - Update LP5812 LED driver node to Raspberry Pi 4 B Device Tree, based on updated binding.
> - Link to v5: https://lore.kernel.org/linux-leds/20250414145742.35713-1-trannamatk@gmail.com/
> 
> Changes in v5:
> - Rebase on v6.15-rc2
> - Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
> - Address Krzysztof's review comments
> - Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/
> ---
> 
> Nam Tran (5):
>   dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
>   leds: add TI/National Semiconductor LP5812 LED Driver
>   docs: ABI: Document LP5812 LED sysfs interfaces
>   docs: leds: Document TI LP5812 LED driver
>   arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
> 
>  .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  144 +
>  .../devicetree/bindings/leds/ti,lp5812.yaml   |   46 +
>  Documentation/leds/leds-lp5812.rst            |   79 +
>  MAINTAINERS                                   |   12 +
>  .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |   10 +
>  drivers/leds/Kconfig                          |   16 +
>  drivers/leds/Makefile                         |    1 +
>  drivers/leds/leds-lp5812.c                    | 2736 +++++++++++++++++
>  drivers/leds/leds-lp5812.h                    |  348 +++
>  9 files changed, 3392 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>  create mode 100644 Documentation/leds/leds-lp5812.rst
>  create mode 100644 drivers/leds/leds-lp5812.c
>  create mode 100644 drivers/leds/leds-lp5812.h

Nothing about this driver has anything to do with the LEDs subsystem.

Suggest moving it to drivers/auxdisplay instead.

-- 
Lee Jones [李琼斯]

