Return-Path: <linux-leds+bounces-1731-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A886B8D5FD3
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1611C22D4E
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D7C156223;
	Fri, 31 May 2024 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I26DnSIc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B9155CB4;
	Fri, 31 May 2024 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151925; cv=none; b=R2HLgqY91SgFqqGH7oYlMiSMXYJgFDOGU+Iyd7v2d2rxyDlPEf8ZosAS1KTsCDFrZUtydt7obJvWkp9wUr2+TgLo0FZ0rY05s7QI9sgd2n02ju8l3xiCCShNTVSqcZOOMIRPmYtZYdTWaQkRMWmxdFM3Bp6KhiUe4WLqFj6PFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151925; c=relaxed/simple;
	bh=h/2sOB9x1IUImpZzBBj2jDaXq1nmHaIGab6FBR+GwAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qlt8I68xZ4Iq8nbUMUZk10zaMujwd3o5Cl/34adJUFLzemCflGwnNZWUM+IolVtRWyBRaB6ZtJ8mHdyx4U7ntDROWJG9TOhPE/QrK6EG4FelCfOSt4Ibd60X+zZ0hMgCGCG71idjQn9KdzsL6xhMUsNv7b2E3J9UdHgQ59HWCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I26DnSIc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38167C116B1;
	Fri, 31 May 2024 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717151925;
	bh=h/2sOB9x1IUImpZzBBj2jDaXq1nmHaIGab6FBR+GwAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I26DnSIcFGef+qsXDEWbQkVxxktWUDIDKCPzFYgx7pK4mCFk5Xv0LonIfoQzFbfyH
	 J/acrbKpqHQHwuf3yQ9aP4VUJC1isRCeUXRCM40FMcfNY6dXIMAJbIRtSGj59d495V
	 1g0M9/ijeVnYV90NIy57eCnGJTE5YTvgGjVjqB7KjAcziP6B8fS5gBby/h2LUHZ2zS
	 EEouwQESdZ+/muMhtpUKPQ6OBFTQPX5yr0tpgSIu/jxP4FyasNCoB7JvL4J0xK1kA/
	 G7DpYbOrz2LPpEAw0MYuxKc5EhXNxOEro/VbXL+20rIXuD9GaHR5XLPYaCV2fQ3tY7
	 xcOmo35hWcQ8g==
Date: Fri, 31 May 2024 11:38:40 +0100
From: Lee Jones <lee@kernel.org>
To: Joseph Strauss <jstrauss@mailbox.org>
Cc: pavel@ucw.cz, jansimon.moeller@gmx.de, conor@kernel.org,
	christophe.jaillet@wanadoo.fr, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] Add multicolor support to BlinkM LED driver
Message-ID: <20240531103840.GC1005600@google.com>
References: <20240506201905.789376-1-jstrauss@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506201905.789376-1-jstrauss@mailbox.org>

On Mon, 06 May 2024, Joseph Strauss wrote:

> Add multicolor support to the BlinkM driver, making it easier to control
> from userspace. The BlinkM LED is a programmable RGB LED. The driver
> currently supports only the regular LED sysfs class, resulting in the
> creation of three distinct classes, one for red, green, and blue. The
> user then has to input three values into the three seperate brightness
> files within those classes. The multicolor LED framework makes the
> device easier to control with the multi_intensity file: the user can
> input three values at once to form a color, while still controlling the
> lightness with the brightness file.
> 
> The main struct blinkm_led has changed slightly. The struct led_classdev
> for the regular sysfs classes remain. The blinkm_probe function checks
> CONFIG_LEDS_BLINKM_MULTICOLOR to decide whether to load the seperate
> sysfs classes or the single multicolor one, but never both. The
> blinkm_set_mc_brightness() function had to be added to calculate the
> three color components and then set the fields of the blinkm_data
> structure accordingly.
> 
> Signed-off-by: Joseph Strauss <jstrauss@mailbox.org>
> ---
> Changes in v2:
> - Replaced instances of the constant 3 with NUM_LEDS, where applicable
> - Fixed formatting errors
> - Replaced loop inside of blinkm_set_mc_brightness() with equivalent
>   statements
> - Changed id of multicolor class from 4 to 3
> - Replaced call to devm_kmalloc_array() with devm_kcalloc()
> Changes in v3:
> - Add CONFIG_LEDS_BLINKM_MULTICOLOR to check whether to use multicolor
>   funcitonality
> - Extend well-known-leds.txt to include standard names for RGB and indicator
>   LEDS
> - Change name of Blinkm sysfs class according to well-known-leds.txt
> - Simplify struct blinkm_led and struct blinkm_data
> - Remove magic numbers
> - Fix formatting errors
> - Remove unrelated changes
> Changes in v4:
> - Fix indentation
> - Add default case to switch statement
> Changes in v5:
> - Fix warnings related to snprintf on s390 architecture, reported by
>   0-DAY CI Kernel Test Service
> Changes in v6:
> - Refactored struct blinkm_led to use a union
> - Refactored blinkm_probe()
> - Clarified documentation
> Changes in v7:
> - Fix formatting and spelling errors
> 
>  Documentation/leds/leds-blinkm.rst     |  31 +++-
>  Documentation/leds/well-known-leds.txt |   8 +
>  drivers/leds/Kconfig                   |   8 +
>  drivers/leds/leds-blinkm.c             | 224 +++++++++++++++++--------
>  4 files changed, 199 insertions(+), 72 deletions(-)

Applying patch(es)
Applying: Add multicolor support to BlinkM LED driver
Using index info to reconstruct a base tree...
M	Documentation/leds/well-known-leds.txt
M	drivers/leds/Kconfig
M	drivers/leds/leds-blinkm.c
Checking patch Documentation/leds/leds-blinkm.rst...
Checking patch Documentation/leds/well-known-leds.txt...
Checking patch drivers/leds/Kconfig...
Checking patch drivers/leds/leds-blinkm.c...
Applied patch Documentation/leds/leds-blinkm.rst cleanly.
Applied patch Documentation/leds/well-known-leds.txt cleanly.
Applied patch drivers/leds/Kconfig cleanly.
Applied patch drivers/leds/leds-blinkm.c cleanly.
Falling back to patching base and 3-way merge...
error: Your local changes to the following files would be overwritten by merge:
	Documentation/leds/leds-blinkm.rst
	Documentation/leds/well-known-leds.txt
	drivers/leds/Kconfig
	drivers/leds/leds-blinkm.c
Please commit your changes or stash them before you merge.
Aborting
error: Failed to merge in the changes.
Patch failed at 0001 Add multicolor support to BlinkM LED driver

-- 
Lee Jones [李琼斯]

