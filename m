Return-Path: <linux-leds+bounces-1712-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A08D13F9
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 07:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 974511F24146
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 05:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0A74CE09;
	Tue, 28 May 2024 05:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJTwfcpM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA24CB2B;
	Tue, 28 May 2024 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716874657; cv=none; b=RmHSv94+0+9Zu9t3cDsBl7LnPFHfKkr3N2F8zn65xbfwvt18xZpFeGNZv/ID+mrB3y5PBHdj1iFhaB+3PjuP4Yhph4L6BzePu9/nqQxtBDYj8aQ/kQLWgObAP2AhpQiF5eThC+21feSfUEVTTKAYTE+DGJ/m/l1J3dFlaEeplCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716874657; c=relaxed/simple;
	bh=y+v/kHdfFry41PCJXe5N+KAUHrNkRTybrDCFiVJtkF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqnPeDn1g7MM3TgmmTuEGVA7Tn0kJDYNscDbVp2FkA/NFytdrChKnfCZ6RRMJ+utLdC7X2sSNl7dvGxHCGgzgsh5hnFjkzcXlcp7Gqy9tGVTXpHVw0MWVcUUoMLjxJmoi7Cz2JILwn1NIPSyCT+R0p8F8kzJSXEEaCyzRPIHaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJTwfcpM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB887C3277B;
	Tue, 28 May 2024 05:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716874656;
	bh=y+v/kHdfFry41PCJXe5N+KAUHrNkRTybrDCFiVJtkF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJTwfcpMSUu6VkZi+MzWKj+Mf5oFrKYeykkA+0GmqwRIZeO9dhd/pD4wWeKD347I2
	 mXNA6eTct049yBkTSMGrU+Sibj4zmRPClCE4ZPvoHbBjRnKXrbsDTX8bp7JMCNOMOP
	 kuFxW/cu6ShRKsnHQb4To31/i7lysXTpvP/Tbq5I/isWvMk9Nzd3HSHO4Nx6tIxCN2
	 DFYqV39001QupNjdURNWrCiuz1B09zo5gctmFbei1Vx55byCorvQEJydzBjgv1maAP
	 jjbt9eSaCbFg33UEEUcLXLqo/rfIHPrSMUbmJr+gCWcPb7+MaGrHxqPMpKun9tGyH9
	 hQkDdENocj5lw==
Date: Tue, 28 May 2024 05:37:32 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Pavel Machek <pavel@ucw.cz>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-leds@vger.kernel.org,
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 3/4] platform/chrome: cros_kbd_led_backlight: allow
 binding through mfd device
Message-ID: <ZlVtnF-ZZ72N2PAG@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>

On Sun, May 26, 2024 at 08:17:17PM +0200, Thomas Weißschuh wrote:
> +#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
[...]
> +static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
> +	.init = keyboard_led_init_ec_pwm_mfd,
> +	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
> +	.brightness_get = keyboard_led_get_brightness_ec_pwm,

They are only available if IS_ENABLED(CONFIG_CROS_EC).

