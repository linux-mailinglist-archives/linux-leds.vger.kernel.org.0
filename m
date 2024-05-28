Return-Path: <linux-leds+bounces-1714-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99ED8D14BA
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 08:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0930FB211E9
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 06:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D650E6F066;
	Tue, 28 May 2024 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi5qfLeb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74666EB7D;
	Tue, 28 May 2024 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716879237; cv=none; b=c6XjeuPyJ16ivHYl2HlTR+R/qDBVVEAhDu8xQYinJJSGwNGQqTFF9xfYdP5tcv6dDdksoJ0DxNmo66lyaPUInjk4FSH0j3IRO5hu5AdRcwz6Kso51aR8zRSuGxYcb5dr8NjChVGvYKz81ZCqMuEnqI/kh/L0f90dbz/3T6blju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716879237; c=relaxed/simple;
	bh=VVzEUWBFG5vVHZ3d6fNOxVhRwLW4JBRdhZdGeDgS+jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1K+N+p1ywMnm92jsbNon6KYoOeSyJgr0xjFqRwMGXcGwaI/8qL10GBm/KtTaYdGuxXCFEMaAB2JcCi3NCStVaHDqHIb6GnQYxxk08HdMi2PpkuhRIFG9MFYMn81j1l+8GEGYN9MKc+P4enq5aur2XShT9Lo7DW+1GEFom2THYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi5qfLeb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899CCC3277B;
	Tue, 28 May 2024 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716879237;
	bh=VVzEUWBFG5vVHZ3d6fNOxVhRwLW4JBRdhZdGeDgS+jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bi5qfLebcIuaIxEcz2CjI+km5F/mUgIgK7Lkmz7SFlS6oVIfMcEnTDyTUxrylLX8c
	 rXsehHXCdUzwdYIUhhGVE/FR2ff5mhPhYGcEEfIfipt6cMIlljYvclMNK15H+VCTmu
	 etpxI84j/WKhBjNjqmhjTQ/gG4C6zqnSHD+99tKLj2C0VXjrS5rCbWj7tB1V3/ibVD
	 b69P5ijzs6zWOoDQ9QBA9yDK9oV9Xe641xKm6AMN03a7W7afXsXNyrycFsgmu61TNg
	 HiCxQKNBjkxPOzOXH7G/Ot85ns3tpI64t7V/dIT/t7JIdhl/Ae8hNYEttwIQ4Ixp1z
	 Sxp6bQef8MORA==
Date: Tue, 28 May 2024 06:53:53 +0000
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
Message-ID: <ZlV_gV5HOyz6VipT@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
 <ZlVtnF-ZZ72N2PAG@google.com>
 <4b5d7db0-4454-4c69-b2c4-9ad652eade76@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b5d7db0-4454-4c69-b2c4-9ad652eade76@t-8ch.de>

On Tue, May 28, 2024 at 07:41:09AM +0200, Thomas Weißschuh wrote:
> On 2024-05-28 05:37:32+0000, Tzung-Bi Shih wrote:
> > On Sun, May 26, 2024 at 08:17:17PM +0200, Thomas Weißschuh wrote:
> > > +#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
> > [...]
> > > +static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
> > > +	.init = keyboard_led_init_ec_pwm_mfd,
> > > +	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
> > > +	.brightness_get = keyboard_led_get_brightness_ec_pwm,
> > 
> > They are only available if IS_ENABLED(CONFIG_CROS_EC).
> 
> config MFD_CROS_EC_DEV
> 	depends on CROS_EC
> 
> Do you prefer this to be spelled out explicitly somewhere?

I see.  I missed the part.  The dependency is not obvious from only reading
the C file though.

