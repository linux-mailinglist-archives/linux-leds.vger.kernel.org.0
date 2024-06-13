Return-Path: <linux-leds+bounces-1897-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997990753E
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01EBE1C21B23
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6087F145A11;
	Thu, 13 Jun 2024 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epnrX2KU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A6145A04;
	Thu, 13 Jun 2024 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289297; cv=none; b=sITwinf6zU7afAYklEav/4PHzIHQtqqMj5cIlQmpUDByZI49qgqy0WZeLwJrJch3ewDhxAYGDrBRapj/RCQLYdbeTxzYOTP+5fGOKxLLuu1cuJUJq/MvWjl4IN6kvZxTdJhDP8T4GxQGFsHicaBV/jNy3IsZmix1CnfBEXDZAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289297; c=relaxed/simple;
	bh=MdM3a6B4+l2qcSrHcAmmwfPHGPsUG5JqDPDvr1IT3LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmGOsrIdiQ2NV2TobUpx1RR4opJdmtMZ92QVtgDr8vXyikHByIBJdEhTMp/MjBFPd9eneh1tJ2nQXxr7RVYMSQ+RByTNUkBHDGRn/vv+Hm+o3ATTCG6hzOIPFfYisij5b6YZaKLyoKCFrPDdjZOMRzXYsJOIr7wt3/HtnKfgC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epnrX2KU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D45EC32789;
	Thu, 13 Jun 2024 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289296;
	bh=MdM3a6B4+l2qcSrHcAmmwfPHGPsUG5JqDPDvr1IT3LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epnrX2KUjJkKb18onmCfdfb58vrBTjalSFG4FpziJxfKUzhkjH6fKGvLTjNO8LYxv
	 tuC9AE86IRXfuy41fKp8UasotChIiSzDIXf5cyukLW2/nhdtdKGKMyd+1YJ6XEPHXO
	 QmfchMYtXFu9+MSCag4IWfqSEZVn8vjseobeSbxXiBE/NnA63dNSWHUPlXPc0MKEpZ
	 2WuYUSStlGBHxvrzVfp4KMDmut/TuiJwJJWZhVdnGJTbhXW1wgeBFniwBWBYQctR8Y
	 qleNrFBnHPrCIb9PiTG+BuuNRNoft1nlvdlmxcq6zjQ5ri63hhjgFnHdaI93cg2/li
	 ZVNwalbaLrPeg==
Date: Thu, 13 Jun 2024 15:34:51 +0100
From: Lee Jones <lee@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Pavel Machek <pavel@ucw.cz>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-leds@vger.kernel.org,
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 3/4] platform/chrome: cros_kbd_led_backlight: allow
 binding through mfd device
Message-ID: <20240613143451.GF2561462@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
 <Zl0jIZbIKV6mG12I@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zl0jIZbIKV6mG12I@google.com>

On Mon, 03 Jun 2024, Tzung-Bi Shih wrote:

> On Sun, May 26, 2024 at 08:17:17PM +0200, Thomas Weißschuh wrote:
> > The ChromeOS EC used in Framework laptops supports the standard CrOS EC
> > keyboard backlight protocol.
> > However the firmware on these laptops doesn't implement the ACPI ID
> > GOOG0002 that is recognized by cros_kbd_led_backlight and they also
> > don't use device tree.
> > 
> > Prepare the existing cros_kbd_led_backlight driver to be probed through
> > the CrOS EC mfd device which works without ACPI or OF support.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> The patch overall looks good to me but it depends on previous patch in the
> series (for LED_REJECT_NAME_CONFLICT).  Let's wait for review.

I plan to take this via MFD.

Is someone going to Ack this patch?

-- 
Lee Jones [李琼斯]

