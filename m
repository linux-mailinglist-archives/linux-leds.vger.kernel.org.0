Return-Path: <linux-leds+bounces-4622-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FFAB52EB
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 12:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43A9816719D
	for <lists+linux-leds@lfdr.de>; Tue, 13 May 2025 10:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD5D241689;
	Tue, 13 May 2025 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQcv2VLY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F95239E69;
	Tue, 13 May 2025 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132814; cv=none; b=XC2qrelNSkDGqhdZ/rYikGN6htcIqMo4dos0E5Upel0uld2QoUlEgipY//Gkk2JzBJZEFj7n1Mml0D7zlsND6YX+1Yq+Jqwfz6k8SACiTGdI977eidcfeZWdCTOtsxYBPA8TYfABPtGpshKv8lTsRlyMZEPvfvJFUSMstCfvLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132814; c=relaxed/simple;
	bh=2Fkgi7Va5VKMoSknzpuOJJ9QAUTUUc3KgzRl3TQ86Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZeoRS2Jarmf17GnBuV4plqwQpUiAA7ELV7zXsXgGH70V/x8TG53duNz3yyVJXFZkAt+9dgF8Z48/C6qQkXWHNXznBNBxfqUMUYSKgqbBkFRyMSTjG6dIAxSwXzFcy1cvJutfsNGq9RI46dXO4bRmNH2EyWbBQlv9cPji8fazwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQcv2VLY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1597C4CEED;
	Tue, 13 May 2025 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747132813;
	bh=2Fkgi7Va5VKMoSknzpuOJJ9QAUTUUc3KgzRl3TQ86Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQcv2VLY31mHUvs7kc87jwSdLEVkBrEWO6WiSo4W3ug0qM5p4x22YP7DW+WoyVXbc
	 bgNsbl2KBkNF9vZciAo5lz2W3ecJpgGYJlyNwheOXhtJfpYOnngCrWZS5adD2uiDJT
	 lbsDPmSidM0MC+5ZwvvUr8Fi4SM1IgGRZw7tdXqG6ma169+Mmzt5w9XNBAWaBGSnh/
	 IaCrdwLNdRdwtrF5NbsZ1hFRiGwk7BQFWjEzeCcRXOLrJgdaOylUit8rq34He/KM5l
	 hS2PmDbWj/UeeZEgN713hwh6ctXWVMp4AFrJAWBLidvUSDj5HNlSUAypLuZ10Eh60k
	 F1Fz4SdthN8dw==
Date: Tue, 13 May 2025 11:40:09 +0100
From: Lee Jones <lee@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/2] Support for Texas Instruments TPS6131X flash LED
 driver
Message-ID: <20250513104009.GJ2936510@google.com>
References: <20250509-leds-tps6131x-v4-0-2c9563f5b67c@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509-leds-tps6131x-v4-0-2c9563f5b67c@emfend.at>

On Fri, 09 May 2025, Matthias Fend wrote:

> The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
> stage is capable of supplying a maximum total current of roughly 1500mA.
> The TPS6131x provides three constant-current sinks, capable of sinking up
> to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
> each sink (LED1, LED2, LED3) supports currents up to 175m
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
> Changes in v4:
> - Added/removed/adjusted comments
> - Use defines for register defaults
> - Updated source format
> - Check for error in torch refresh timer
> - Return error from tps6131x_parse_node()
> - Link to v3: https://lore.kernel.org/r/20250423-leds-tps6131x-v3-0-ca67d346a4ea@emfend.at
> 
> Changes in v3:
> - Add comment for locking
> - Drop handling based on CONFIG_V4L2_FLASH_LED_CLASS
> - Stop if getting reset GPIO fails
> - Optimize locks
> - Fix type of num_channels (u32 -> int)
> - Convert a remaining return sequence to dev_err_probe
> - Link to v2: https://lore.kernel.org/r/20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at
> 
> Changes in v2:
> - Bindings: Extend device description
> - Bindings: Drop unused address/size cells
> - Bindings: Use fallback compatible 
> - Bindings: Corrected minimum current for 50mA steps
> - Bindings: Drop node label
> - Fix name of REGISTER4 INDC shift define
> - Save device instead i2c_client in private data
> - Add comment for mutex
> - Use macro to convert from uA to mA
> - Use defines to describe initial register values
> - Add safety delay during reset sequence
> - Use fixed value enum to set the mode
> - Renamed some local variables
> - Re-sorted local variables
> - Replaced ifdefs for V4L2_FLASH_LED_CLASS
> - Improved some error messages
> - Link to v1: https://lore.kernel.org/r/20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at
> 
> ---
> Matthias Fend (2):
>       dt-bindings: leds: add Texas Instruments TPS6131x flash LED driver
>       leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
> 
>  .../devicetree/bindings/leds/ti,tps61310.yaml      | 120 +++
>  MAINTAINERS                                        |   7 +
>  drivers/leds/flash/Kconfig                         |  11 +
>  drivers/leds/flash/Makefile                        |   1 +
>  drivers/leds/flash/leds-tps6131x.c                 | 815 +++++++++++++++++++++
>  5 files changed, 954 insertions(+)

I get errors on apply:

  WARNING: Message contains suspicious unicode control characters!
         Subject: [PATCH v4 2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
            Line: + * Register contents after a power on/reset. These values ​​cannot be changed.
            -----------------------------------------------------------------^
            Char: ZERO WIDTH SPACE (0x200b)
         If you are sure about this, rerun with the right flag to allow.

FWIW, I also saw these in your mails:

  > The values <200b><200b>are fixed because they are written directly to a register.
  > In V1, I used an enum without values <200b><200b>and mapped it to the register value in
  > a function. I was asked to omit this mapping and use the enum directly.

Never seen this before.  Not sure what's going on.

Please fix and resubmit.

-- 
Lee Jones [李琼斯]

