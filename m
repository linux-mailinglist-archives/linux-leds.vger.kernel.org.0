Return-Path: <linux-leds+bounces-6633-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB131D189B1
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 12:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F52A302106B
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 11:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8602F38E128;
	Tue, 13 Jan 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBhzx5L1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353538BF9A;
	Tue, 13 Jan 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305427; cv=none; b=DjgdRlq7ujPQpxUNy4vHO6k7F5CmgJJl2LfPJHBqv9EjR49jn57iDRIc+wIl6gpKpn/pPJNerLrV03aVvxSJAYtev2P/dKurR1xV8CBA9hUdoDqd6JDi1kkH8n1P6M+2RQfGQCsUVlnfmsFVpa/nHV4A1H88x287g0Bl61Cj3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305427; c=relaxed/simple;
	bh=roZ5mXriqj7Jo2C5/BUF+xezWpztqHhayxS1hL5udhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuW+GWmC4awNDMtLCxk3tGqpx+jdAcvn5iaQMdWSmkQRq3jIT937OdbF8KVt9An6cJ6vd/B6e5C0QNkke113aW5fzUuC3YBhbq5MWB5xQvGtedSEIwGxS4p2KP3bvk4B2wLqFwO6gtkEMenOZzhvUZ2GkgGV/hr0xQ81RmUFSU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBhzx5L1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6999FC116C6;
	Tue, 13 Jan 2026 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305427;
	bh=roZ5mXriqj7Jo2C5/BUF+xezWpztqHhayxS1hL5udhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBhzx5L1553HunK5ce40/PjIfpNy9MgHcDe+D7ND0ggv2lCjlaXzJuJ7gm+oTuX/h
	 A1ArfpuicBNWd7LlfSLTAQ4TehZNINDMzCUGiOQD4KjLfQxgRRxkthr9ei/1Heonqu
	 NFhp8MLuumYq0G6Nj/UYjEaGUEQLFuNdfC188AddLX5EzLCEMyotxiEZSnXYSwX7Eu
	 5tRf/G+FJKyPL/iheBSOS697VrcUW0HRibMHnAnbkDbEH5T5tcA+bAWnk+0Uqpuk8b
	 U6WyBpmefxRWHqz75+J+DBwkB2YBtRQk9UnMdNWaewgSF843lwPB+CHGn3dbXoAwal
	 OLJw1y0ATf9tA==
Date: Tue, 13 Jan 2026 11:57:01 +0000
From: Lee Jones <lee@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Message-ID: <20260113115701.GG1902656@google.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230082336.3308403-1-professorjonny98@gmail.com>

On Tue, 30 Dec 2025, Jonathan Brophy wrote:

> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This patch series introduces a new LED driver that implements virtual LED
> groups with priority-based arbitration for shared physical LEDs. The driver
> provides a multicolor LED interface while solving the problem of multiple
> subsystems needing to control the same physical LEDs.
> 
> Key features:
> - Winner-takes-all priority-based arbitration
> - Full multicolor LED ABI compliance
> - Two operating modes (multicolor and standard/fixed-color)
> - Deterministic channel ordering by LED_COLOR_ID
> - Comprehensive debugfs telemetry (when CONFIG_DEBUG_FS enabled)
> - Optimized memory footprint (~200 bytes per LED in production builds)
> 
> Use cases:
> - System status indicators with boot/error/update priority levels
> - RGB lighting with coordinated control
> - Multi-element LED arrays unified into single logical controls
> 
> The series includes:
> 1. New LED function identifier for virtual LEDs
> 2. Device tree bindings for virtual LED class
> 3. Device tree bindings for virtual LED group controller
> 4. ABI documentation for sysfs interface
> 5. Comprehensive driver documentation
> 6. fwnode_led_get() helper for firmware-agnostic LED resolution
> 7. Complete driver implementation
> 
> Changes since v3 commit
> - convert driver to pure fwnode
> - +Multicolor LED ABI compliance - standard multi_intensity/multi_index attributes
> - Winner-takes-all arbitration - deterministic control with sequence-based tie-breaking
> - Proper LED reference management - fwnode_led_get() + led_put() prevents leaks
> - 30% memory reduction - conditional debug compilation
> - Global ownership tracking - prevents conflicts between multiple controllers
> - Hierarchical locking - documented 3-tier lock order prevents deadlocks
> - Lock-free hardware I/O - concurrent vLED updates during physical LED access
> - Dual operating modes - multicolor (dynamic) and standard (fixed-color) modes
> - Pre-allocated arbitration buffers - zero allocations in hot path
> - Comprehensive power management - suspend/resume with runtime PM support
> 
> Changes since v4 commit
> - fix yaml validation errors after feedback from maintainers from LKML
> 
> Additional highlights:
> - Update batching for software PWM workloads
> - Gamma correction for perceptual brightness
> - Rate limiting for runaway updates
> - Extensive debugfs telemetry with stress testing
> - Deferred probe handling for late-probing LEDs
> - Removal race prevention with atomic flags
> 
> Future enhancements planned:
> - dynamic led creation Chardev Interface like uleds
> - ubus/ dbus wrapper for linux and openwrt (out of tree)
> - addressable rgb support WS2812B/SK6812
> - readonly leds for important kernel/ functions
> 
> Testing:
> - Tested on ARM64 platform with GPIO and PWM LEDs
> - Stress tested with 10,000 iterations
> - Validated suspend/resume cycles
> - Memory leak detection passes
> 
> Jonathan Brophy (7):
>   dt-bindings: leds: Add LED_FUNCTION_VIRTUAL_STATUS identifier
>   dt-bindings: leds: Add virtual LED class bindings
>   dt-bindings: leds: Add virtual LED group controller bindings
>   ABI: Add sysfs documentation for leds-group-virtualcolor
>   leds: Add driver documentation for leds-group-virtualcolor
>   leds: Add fwnode_led_get() for firmware-agnostic LED resolution
>   leds: Add virtual LED group driver with priority arbitration
> 
>  .../sysfs-class-led-driver-virtualcolor       |  168 +
>  .../leds/leds-class-virtualcolor.yaml         |  197 +
>  .../leds/leds-group-virtualcolor.yaml         |  170 +
>  .../leds/leds-group-virtualcolor.rst          |  641 ++++
>  drivers/leds/led-class.c                      |  136 +-
>  drivers/leds/leds.h                           |  758 +++-
>  drivers/leds/rgb/Kconfig                      |   17 +
>  drivers/leds/rgb/Makefile                     |    1 +
>  drivers/leds/rgb/leds-group-virtualcolor.c    | 3360 +++++++++++++++++

This is an unreasonable request to ask of any reviewer.  I certainly
don't have the time to go through this in any level of detail.

-- 
Lee Jones [李琼斯]

