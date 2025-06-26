Return-Path: <linux-leds+bounces-4889-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA73AE9E2C
	for <lists+linux-leds@lfdr.de>; Thu, 26 Jun 2025 15:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C9211C4008E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Jun 2025 13:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CCF2E542C;
	Thu, 26 Jun 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGfxAgDz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53E2E5426;
	Thu, 26 Jun 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943141; cv=none; b=n3D+2kLkQE7MV3aW7Il08mCj4cI71Be7quhmYnWQ8+14IGnM+PL5yPE475wQlN699qez+zzaTgAdGNQ1uxbYJkBGjUwt6o34LI+nHDfZTB6PO+lFCP7VYr716Y9Mm0XPvrgHImQFh7DKlcxqiyBFNbx2PTE18HFrG3gQp/29Vn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943141; c=relaxed/simple;
	bh=DpGBPizqI39r8mTEdIiOyt3eB4mXDzhbE/IEJOZzF0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzHkYL+Wt0xxVYE2+L57dhSvQ+SjbzcJ7srXdTe0ZKY6rc/XLP7cKfn3JsuJ5OIv8qrFS62Q1Zsi1vGBdXq6TEh0C/nQ6zZ69ZBDWyCORwy25oZhjsayeTfDUYHLSaiGVRtuumXgf9IEADH3MxBnV5w0YSI+veYb4MpJa59s1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGfxAgDz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4192C4CEF0;
	Thu, 26 Jun 2025 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750943141;
	bh=DpGBPizqI39r8mTEdIiOyt3eB4mXDzhbE/IEJOZzF0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGfxAgDzzRqOtClrx7FlwSf2lx5m2SzNkhrlnPhjR7u0ofzjwXWMD5mKQ3AhCy8hq
	 mVX/aWSRTcsGPspsm9zZQb2Jl/KWBcWR1vbC646JRQXpMDsHvDbvo3ujHt98A5fA/z
	 edAprThG+Lqrd0bTYrTXxSp3DDWpscEWn7i9y4iLwXOLklN6WVtML+6gpQp7loCkU+
	 +iICkJwX7MXCSBHgb4oN017O34FwCe7AI0EwQ+/pApq8vdMByfko45sTpw2Hbswvl0
	 ppKHAqsu10JsuvVoug2M/GZ3+5ZB2L2ePaCk241MzgBhC5iR8E14r+Rjp1ygsKFDFF
	 IxyLHCAOxwsJw==
Date: Thu, 26 Jun 2025 14:05:36 +0100
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, rdunlap@infradead.org, christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Message-ID: <20250626130536.GC10134@google.com>
References: <20250618183205.113344-1-trannamatk@gmail.com>
 <20250618183205.113344-4-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618183205.113344-4-trannamatk@gmail.com>

On Thu, 19 Jun 2025, Nam Tran wrote:

> The LP5812 is a 4x3 matrix RGB LED driver with autonomous animation
> engine control.
> 
> The driver provides interfaces to configure LED modes manual/autonomous,
> set PWM/DC values, and manage autonomous animation engines.

How many of these can be swapped out for already existing sysfs
attributes, I wonder.

Let's start with the basics first.  Just to get the device working.
This is a huge change with massive impact and it all needs to be well
thought through before we start doing anything drastic like introducing
massive amounts of stable ABI !!

> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  40 ++++++
>  .../ABI/testing/sysfs-class-led-lp5812        | 120 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  3 files changed, 162 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> new file mode 100644
> index 000000000000..a8b1d5c52a82
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> @@ -0,0 +1,40 @@
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Configures drive mode and scan order. (WO)
> +		Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Issues device-level commands. (WO)
> +		Valid values: "update", "start", "stop", "pause", "continue"
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Triggers a software reset of the device. (WO)
> +		1 - resets device
> +		0 - does not reset device
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Clears fault status. (WO)
> +		1 - clears fault status
> +		0 - does not clear fault status
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Report the current thermal shutdown config status. (RO)
> diff --git a/Documentation/ABI/testing/sysfs-class-led-lp5812 b/Documentation/ABI/testing/sysfs-class-led-lp5812
> new file mode 100644
> index 000000000000..a6cb49fb523f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-lp5812
> @@ -0,0 +1,120 @@
> +What:		/sys/class/leds/led_<id>/activate
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Activate or deactivate the specified LED channel. (WO)
> +		1 - Activate
> +		0 - Deactivate
> +
> +What:		/sys/class/leds/led_<id>/mode
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Selects LED operation mode. (WO)
> +		Valid values: "manual", "autonomous"
> +
> +What:		/sys/class/leds/led_<id>/led_current
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		DC current level. (WO)
> +		Valid values: 0 - 255
> +
> +What:		/sys/class/leds/led_<id>/max_current
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Shows maximum DC current bit setting. (RO)
> +		0 (default) means the LED maximum current is set to 25.5 mA.
> +		1 means the LED maximum current is set to 51 mA.
> +
> +What:		/sys/class/leds/led_<id>/pwm_dimming_scale
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		PWM dimming scale type. (WO)
> +		Valid values: "linear", "exponential"
> +
> +What:		/sys/class/leds/led_<id>/pwm_phase_align
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Configures PWM phase alignment. (WO)
> +		Valid values: "forward", "middle", "backward"
> +
> +What:		/sys/class/leds/led_<id>/auto_time_pause_at_start
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Controls start pause time. (WO)
> +		Valid values: 0 - 15
> +
> +What:		/sys/class/leds/led_<id>/auto_time_pause_at_stop
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Controls stop pause time. (WO)
> +		Valid values: 0 - 15
> +
> +What:		/sys/class/leds/led_<id>/auto_playback_eau_number
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Active AEU number of led_<id> selection. (WO)
> +		Valid values: 0 - 3
> +		0 - only use AEU1
> +		1 - use AEU1 and AEU2
> +		2 - use AEU1, AEU2 and AEU3
> +		3 - use AEU1, AEU2 and AEU3 (the same as 2)
> +
> +What:		/sys/class/leds/led_<id>/auto_playback_time
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Animation pattern playback times of led_<id>. (WO)
> +		Valid values: 0 - 15
> +		0 - 14 means 0 - 14 times, 15 means infinite times
> +
> +What:		/sys/class/leds/led_<id>/aeu_playback_time
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		AEU pattern playback times of led_<id>. (WO)
> +		Format: aeu<x>:<y> where x (1 - 3) indicates the AEU number,
> +		y (0 - 3) indicates the number of playback times.
> +
> +What:		/sys/class/leds/led_<id>/aeu_pwm_<pwm_id>
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		AEU PWM duty cycle setting. (WO)
> +		Format: aeu<x>:<y> where x (1 - 3) indicates the AEU number,
> +		y (0 - 255) indicates pwm value.
> +
> +What:		/sys/class/leds/led_<id>/aeu_slop_time_<st_id>
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		AEU slop time setting. (WO)
> +		Format: aeu<x>:<y> where x (1 - 3) indicates the AEU number,
> +		y (0 - 15) indicates the slop time value.
> +
> +What:		/sys/class/leds/led_<id>/lod_lsd
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b4eb3265c800..cdba86f1768b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24565,6 +24565,8 @@ TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
>  M:	Nam Tran <trannamatk@gmail.com>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> +F:	Documentation/ABI/testing/sysfs-class-led-lp5812
>  F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
>  F:	drivers/leds/rgb/Kconfig
>  F:	drivers/leds/rgb/Makefile
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]

