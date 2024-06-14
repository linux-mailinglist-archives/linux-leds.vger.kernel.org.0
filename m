Return-Path: <linux-leds+bounces-1923-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53F908720
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 11:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D301F23692
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 09:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805EA18FDA0;
	Fri, 14 Jun 2024 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOCcUmy5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512485FBB7;
	Fri, 14 Jun 2024 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356345; cv=none; b=UMp/DpsMOh8oFGoJZjP98/r9waZ+0j4UxplT/F6h0ZFnXJnEANX99VEDk+j3qDZenb34qk68onp3szi7Rknr4E1pJOTQozIMsb96VPhH+EJfwVO5o82XuugMg856DyBzh7Ttu2+L2mmnBItSC9A803WMwWTvzPbJHPwZiXlcA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356345; c=relaxed/simple;
	bh=7kGde42zdHXHJOiY91tpSQwRc7oayfWjAOUL0Cw7kx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uItdYtpcUEua/DhKGrDFnDugu3rK/14EL41o1YCokBPYqcFsJ0rO0Tbr1hN38mrajniVYGwbQ81spx5wcunpPhYmOiBelJMk6E0gJwLblxBhz5eUDNjdSck1/qp9dlbsoboJtCDMueQ96vHT2Pz6WZrShCBnEV/80tRN2MpSxT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOCcUmy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B39C2BD10;
	Fri, 14 Jun 2024 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718356345;
	bh=7kGde42zdHXHJOiY91tpSQwRc7oayfWjAOUL0Cw7kx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOCcUmy5WDD73LPlthR8Z01XvAUv3QLCpF98pK38P2rhpXKFxmYNdAZRsU3XXOQwX
	 okNuK5pkqT7c9RV/HmT+HVlmqY5C0Y/LVU6C24VlOmZKbBgfIDm0bOktzVDkqkD094
	 KVJ020f/we3F1IA3ESsLfT10fXPmmga+JOL6ykYIcWFfBFpAPfCCX4pV/NkEXPrsef
	 Nl4Rcr4RdR9Ke3gbLPmedjZrqcCmnj0aGboANINrP0St4MH5wBWHGv+/OMvmUKyMh0
	 7vMxlokrn+vPipnqXt0UawcaIA/2+RWmFZPCD9UuThSjGwVG6BBWGly/FzR6+VYsP9
	 c56UBNQARDAvQ==
Date: Fri, 14 Jun 2024 10:12:20 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 0/5] ChromeOS Embedded Controller LED driver
Message-ID: <20240614091220.GA3029315@google.com>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>

On Thu, 13 Jun 2024, Thomas Weißschuh wrote:

> Add a LED driver that supports the LED devices exposed by the
> ChromeOS Embedded Controller.
> 
> Patch 1-3 add a utility function to the led subsystem.
> Patch 4 introduces the actual driver.
> Patch 5 registers the driver through the cros_ec mfd devices.
> 
> Currently the driver introduces some non-standard LED functions.
> (See "cros_ec_led_functions")
> 
> Tested on a Framework 13 AMD, Firmware 3.05.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v3:
> - Set default_trigger explicitly as the LED core doesn't do this anymore
> - Only set intensity for first subled by default
> - Link to v2: https://lore.kernel.org/r/20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net
> 
> Changes in v2:
> - Cosmetic cleanups (Tzung-Bi)
> - Add trailing comma to MFD cell array
> - Rename LEDs and trigger to "chromeos" prefix, to align with kbd
>   backlight driver
> - Don't use type "rgb" anymore, they are only "multicolor"
> - Align commit messages and subject to subsystem standards (Lee)
> - Rename led_color_name() to led_get_color_name()
> - The same for cros_ec_led_color_name()
> - Link to v1: https://lore.kernel.org/r/20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net
> 
> ---
> Thomas Weißschuh (5):
>       leds: core: Introduce led_get_color_name() function
>       leds: multicolor: Use led_get_color_name() function
>       leds: core: Unexport led_colors[] array
>       leds: Add ChromeOS EC driver
>       mfd: cros_ec: Register LED subdevice
> 
>  MAINTAINERS                         |   5 +
>  drivers/leds/Kconfig                |  15 ++
>  drivers/leds/Makefile               |   1 +
>  drivers/leds/led-class-multicolor.c |   2 +-
>  drivers/leds/led-core.c             |  12 +-
>  drivers/leds/leds-cros_ec.c         | 299 ++++++++++++++++++++++++++++++++++++
>  drivers/leds/leds.h                 |   1 -
>  drivers/mfd/cros_ec_dev.c           |   9 ++
>  include/linux/leds.h                |  10 ++
>  9 files changed, 350 insertions(+), 4 deletions(-)
> ---
> base-commit: 2ccbdf43d5e758f8493a95252073cf9078a5fea5
> change-id: 20240519-cros_ec-led-3efa24e3991e

Applied and submitted for testing.

All being well, I'll follow-up with a cross-subsystem pull-request shortly

-- 
Lee Jones [李琼斯]

