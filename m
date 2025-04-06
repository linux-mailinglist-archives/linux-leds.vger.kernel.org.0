Return-Path: <linux-leds+bounces-4419-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349DA7CDC9
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 14:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20BAD188D3EA
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 12:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA95216E32;
	Sun,  6 Apr 2025 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRTyXgcU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094051A5BA6;
	Sun,  6 Apr 2025 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743941299; cv=none; b=IiLv+vlZFH3w4aO5F8R+miXG/SkafFXAeGHLqUdzOx/+PY+vkEnxBK0hnHM7Qw7CHpbSCbAnxrARXDds411jBm5LFQebuPQsbLmRBTtD5IfX4W9F4n7cHi8s+XEbFhqKFgTdbTPxdHWwjxxNw+G4zO+TdS7z5y60TsacxcObEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743941299; c=relaxed/simple;
	bh=q906i6obTio2b46mqbSb4jzWO7GgK8exn993sMTYMtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOxeNWqDnrgxW2jl/BfWneuiJ27mD31enF7rl1NSlo2Yxw/sCQwIFLtNnPMdZPbeKaJNOIYeYVzGndhAWBan3LIIb2eSdZ1E8lxCntBVWD2WeFNxr0mkiM9W4yr94UOEmS+B8A3Au9WYhkhpMO+zH3E3Tv6lni6FgrnvYDOBHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRTyXgcU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8F6C4CEE3;
	Sun,  6 Apr 2025 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743941298;
	bh=q906i6obTio2b46mqbSb4jzWO7GgK8exn993sMTYMtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mRTyXgcUkl6F9QjD/4KG4fA46qLlKPEpMK/iT5XFuysyHGRomaormScyk0k0QeZfq
	 wrhF8H8meNcw+xdnHf4lZ4vFdNnvhdvjQI8tu2+ACzdv6FE+HmMgWLZ+wMtF0pD92Q
	 pg5aP5k7p2Cvwk7ciFlVMKqiJmyro5V0S25X/oHlWfwlFXDusAtf4vNg60rhJgsH0t
	 VnA9nrikOOdm4opFUJL2SCdTU3/tE2a4wyXtwnrxPKx6xEPp5i+Suetnm1t3PSawfi
	 SqqlSd0lVzf5NpJiEnnS00qiKq9wymL3bsTHpbTxWyP46DoGQMNe+tnDgX1HnR5Y1c
	 /MgprV3B9m+YA==
Message-ID: <707dc912-12d2-4b50-b934-0c1d1f5efe6b@kernel.org>
Date: Sun, 6 Apr 2025 14:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] docs: ABI: Document LP5812 LED sysfs interfaces
To: Nam Tran <trannamatk@gmail.com>, pavel@kernel.org, lee@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250405183246.198568-1-trannamatk@gmail.com>
 <20250405183246.198568-4-trannamatk@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20250405183246.198568-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/04/2025 20:32, Nam Tran wrote:
> The LP5812 is a 4 × 3 matrix RGB LED driver
> with autonomous animation engine control.
> 
> The driver provides interfaces to configure
> LED modes manual/autonomous, set PWM/DC values,
> and manage autonomous animation engines.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 150 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 151 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> new file mode 100644
> index 000000000000..e745f0f936c5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
> @@ -0,0 +1,150 @@
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_enable

I do not see reason for such ABI. If you want to disable, just unbind it.

> +Date:		April 2025

Not possible...

> +KernelVersion:	6.14

You cannot go to the past. 6.14 was released. This will be v6.16 or later.

> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Enables or disables the LP5812 device. (RW)
> +        0 - Disable
> +        1 - Enable
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config

Looks like wrong path here and everywhere else. I think other name it as
led driver, e.g.
Documentation/ABI/testing/sysfs-class-led-driver-lm3533

> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Configures drive mode and scan order. (RW)
> +        Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Issues device-level commands. (WO)
> +        Valid values: "update", "start", "stop", "pause", "continue"
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_reset
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Triggers a software reset of the device. (WO)
> +        1 - resets device
> +        0 - does not reset device

I do not see kernel exposing it for other devices, drop.


> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Clears fault status. (WO)
> +        1 - clears fault status
> +        0 - does not clear fault status
> +
> +What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Report the current thermal shutdown config status. (RO)
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/enable
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Enables or disables the specified LED channel. (RW)
> +        1 - Enable
> +        0 - Disable

No, you already have standard ABI for this. I also already told you that
you cannot duplicate existing kernel interface.

> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/mode
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Selects LED operation mode. (RW)
> +        Valid values: "manual", "autonomous"
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/manual_dc
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        DC current level in manual mode. (RW)
> +        Valid values: 0 - 255

NAK, duplicating existing brightness.

> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/manual_pwm
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        PWM duty cycle in manual mode. (RW)
> +        Valid values: 0 - 255
> +> +What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        DC current level used in autonomous mode. (RW)
> +        Valid values: 0 - 255
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        DC current level used in autonomous mode. (RW)
> +        Valid values: 0 - 255

Also duplicating brigthness.

> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/pwm_dimming_scale
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        PWM dimming scale type. (RW)
> +        Valid values: "linear", "exponential"
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/pwm_phase_align
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Configures PWM phase alignment. (RW)
> +        Valid values: "forward", "middle", "backward"
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_animation
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Controls AEU configuration and playback. (RW)
> +        Format: (aeu number):(start pause time):(stop pause time):(playback time)
> +        with aeu number 1, 2, 3; playback time 0 - 15
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/aep_status
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Shows current animation pattern status, value from 0 to 7. (RO)
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/auto_pwm_val
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        Shows the pwm value in autonomous mode when pause the animation, value from 0 to 255. (RO)
> +
> +What:		/sys/bus/i2c/devices/.../led_<id>/lod_lsd
> +Date:		April 2025
> +KernelVersion:	6.14
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +        0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
> +
> +
> +
> +
> +
> +

Why so many blank lines? Drop


Best regards,
Krzysztof

