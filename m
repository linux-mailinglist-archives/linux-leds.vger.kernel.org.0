Return-Path: <linux-leds+bounces-6294-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE457C7F303
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 08:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1EE3A3BAF
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 07:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8BD2E6CA0;
	Mon, 24 Nov 2025 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNpKVjB1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957742DCF78;
	Mon, 24 Nov 2025 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763969592; cv=none; b=BUOl3QDSNocUygqYiG3RTbJk1D5Ar/foh/fgtbdVDm1JfL1ECgR6LEVxT99lPq2ZgzcfAThzdIUt0uthXdNT/rKDg7fvqLN8lIawJkDvtJnWrSbApli1Aqwdc66rLgwz8Vi8jvxevK8LzVEIP+mAPFXokWDuo3bbjd0MbrtK+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763969592; c=relaxed/simple;
	bh=cqbIEG4ASBw/izH7PnD3MA5+1hXa/BVGhD6facXwBjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF1b5MeqJ4Rza1wQabIvh+IMx12bkcdK71jeNkxSselKAMC9qy8R+iADXgoKjS35CbtTHEmwXQgpJQygx4yuBSiCL6GsbQG4QSkysd0rRJ20zDQB+v3KHV6HIsB3x1xDcjmx057bJqkbJIlRqflUWWJmAy2iPzynnAUNwt9V0jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNpKVjB1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763969590; x=1795505590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cqbIEG4ASBw/izH7PnD3MA5+1hXa/BVGhD6facXwBjw=;
  b=hNpKVjB1SiRoicA/JPblqXo09x3AdgkpsKjsXW42GKfnMvoJxoYliYEO
   DOloMngI5C7CfvHl7F5frlRbslFeiJEFtI0XlwOBn2JI/O2RNcZvfdzJU
   jur196BIAwbjmzgn0JS2CMjyukgPGX0NOQB9hK+P+IVeKGq7w4df91NPN
   rm9DxwIif4BRHWOJxMqf8RCxFsJwDtcVHJQvinYS48ClXf+0x8aqrw9V7
   nUkG5IopW73ZPPNS0vdxW2qzxIvQNBha7LoOFUka4VDcee06wDdtYgm2H
   A5X4xGgGvx5ro2O0bOTQ7j8qw++e6JPaZYPhRdkamDxDKlt6/e3kkISJL
   A==;
X-CSE-ConnectionGUID: jofHJxH0QcGGpDdumVfakw==
X-CSE-MsgGUID: qJ8SdlkoR9yDNlR1TD7jhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76574423"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76574423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:33:09 -0800
X-CSE-ConnectionGUID: y8oQ5MozQVKD0XS+fHAIMw==
X-CSE-MsgGUID: aiTgZwhLSQ6/uI89K1nWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196544650"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:33:07 -0800
Date: Mon, 24 Nov 2025 09:33:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/7] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <aSQKMXNmF4CtFQxy@smile.fi.intel.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121145911.176033-1-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 09:59:00AM -0500, Jean-François Lessard wrote:
> This series adds mainline kernel support for TM16xx family LED matrix
> controllers and compatible chips, widely used in auxiliary displays on TV
> boxes and embedded devices.
> 
> Many consumer devices, particularly TV boxes, use auxiliary displays based
> on TM16xx controllers to show status information such as time, network
> connectivity and system state. Currently, there is no mainline kernel
> support for these displays, forcing users to rely on out-of-tree drivers
> or userspace solutions that access hardware interfaces directly.
> 
> This driver provides unified TM16xx support through the LED subsystem with
> both I2C and SPI communication protocols. It integrates with the LED class
> framework, enabling control via standard sysfs interfaces and LED triggers,
> while supporting keypad input when hardware connections are available.
> 
> The driver supports multiple controller families from various vendors:
> - Titan Micro Electronics: TM1618, TM1620, TM1628, TM1638, TM1650
> - Fuda Hisi Microelectronics: FD620, FD628, FD650, FD655, FD6551
> - i-Core Electronics: AiP650, AiP1618, AiP1628
> - Princeton Technology: PT6964
> - Winrise Technology: HBS658
> 
> Key features:
> - 7-segment display support with flexible digit/segment mapping
> - Individual LED icon control through LED class devices
> - Optional keypad scanning with configurable key mapping
> - Device tree configuration for board-specific wiring layouts
> - LED trigger integration for automatic system event indication
> - I2C and SPI protocol support depending on controller interface
> 
> Device tree bindings describe board-specific display wiring since
> controllers are layout-agnostic. The bindings use separate 'digits' and
> 'leds' containers with specific addressing schemes to accommodate the
> hardware's grid/segment matrix organization.
> 
> Tested on multiple ARM TV boxes (H96 Max, Magicsee N5, Tanix TX3 Mini,
> Tanix TX6, X92, X96 Max) across different SoC platforms (Rockchip, Amlogic,
> Allwinner) in both I2C and SPI configurations.
> 
> User space utilities available at:
> https://github.com/jefflessard/tm16xx-display
> 
> Dependencies:
> - linedisp_attach()/_detach() infrastructure introduced in patch series:
>  "auxdisplay: linedisp: support attribute attachment to auxdisplay devices"
> - fwnode_for_each_available_child_node_scoped() from patch series:
>  "device property: Add scoped fwnode child node iterators"
> 
> Note: This driver is placed in drivers/auxdisplay rather than drivers/leds
> based on previous maintainer guidance. LED maintainer Pavel Machek
> recommended auxdisplay for TM1628-based display drivers:
> https://lore.kernel.org/linux-devicetree/20200226130300.GB2800@duo.ucw.cz/
> 
> Regmap Evaluation:
> TM16xx controllers use command-based 2-wire/3-wire protocols that share
> sufficient commonalities with I2C/SPI to leverage their subsystems, but
> are not fully compliant with standard register-based access patterns:
> - TM1650 example: 0x48 is a control command while 0x4F is a keyscan
>   command. These appear as adjacent I2C "addresses" but are distinct
>   commands with different data directions and payloads, not read/write
>   pairs of the same register.
> - TM1628 example: Initialization requires coordinated sequences followed
>   by indexed data writes. Single regmap read/write calls cannot express
>   these multi-step transactions and timing constraints.
> - Protocol requirements: I2C read operations require I2C_M_NO_RD_ACK flags;
>   SPI write-then-read operations require mandatory inter-transfer delays
>   and CS assertion across phases.
> 
> While regmap provides valuable synchronization, debugfs, and abstraction
> benefits, standard I2C/SPI regmap buses cannot handle these requirements.
> 
> Custom regmap implementation is technically possible via IO accessors, but
> demands complex command routing logic and only partially supports paging.
> It would essentially recreate the existing controller functions while
> forcing them into register semantics they don't naturally fit.
> 
> The current explicit I2C/SPI approach directly expresses the hardware's
> actual command structure and maintains proper controller abstraction.

Sorry, it seems I forgot to send a review of the input (sub)driver, I think
most of the comments there are still applicable to this series. I'll also
look into the rest.

-- 
With Best Regards,
Andy Shevchenko



