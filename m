Return-Path: <linux-leds+bounces-1921-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915F9081B9
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 04:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224CC283F02
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 02:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC3D183085;
	Fri, 14 Jun 2024 02:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI6wAYcG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A99138495;
	Fri, 14 Jun 2024 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718332767; cv=none; b=fPry3wjau1PD1ZGKk2LywwztDpPbT9MdMrTzBHxFQwW1OXix3nqBfFDl9/vDfYJjWCvT71IAHPTfN1nfQ75tPKNm2rXkV20BIoU47yDB76UeMNr/WaBnbu1yge1XbN81t6C88hwEsZUYbRRnKjx5g+sRJYWcupokWX4PRJZXQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718332767; c=relaxed/simple;
	bh=DbwkV7I4TDAunTvuYUKRHX/cfvaGjJuo/LOZ9F3a9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK62r6Hfz+xzjN++iiGDdOATYcPFvyfDbXnpCZZz5r6AEvPLgY/Dn7E8c5Glj8UYaLtXds12E7+W1dploGMijCBJWJueeWB+RmGRqWAO8nXxIivsq6pkB30TP39D+tCPlhcrhG7lQv61KrLFNiQ2yxwpB6ZSjN/3YWgxOghZ5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI6wAYcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EB4C2BBFC;
	Fri, 14 Jun 2024 02:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718332767;
	bh=DbwkV7I4TDAunTvuYUKRHX/cfvaGjJuo/LOZ9F3a9iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DI6wAYcGrzi/V+hkEyW5fjDAGj/DmMza4RLody8Nrzug+tSCkxEEisc23joEK1HCU
	 Z4eahAFqY0Z5DLWFWjiYsI5yOTBt8PvttnDs8iv5xD/ZWVYWWOV1PEWDLSm5JWaPCE
	 /xKHtT4eh4mP6TtGhn7bNSh8iIQjXYNn0gvYvDMZ+a5yzTiQzVdGKUaL07Q2JobZcC
	 9Po/yvy20Ab3e2wrpd9HZDFi/44vKnd9GpeNipaLQ3ZLe4VKbasd7q0VYp3HgL3dF9
	 g5VGe0NuUvbC5ds+S6OkAmGRgDvvVZocgdTeW/5NHvYrffOsQGyAX+UyP8HbaE1C7Y
	 2J/fwuENw0XCA==
Date: Fri, 14 Jun 2024 02:39:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Lee Jones <lee@kernel.org>
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
Message-ID: <ZmutW6vh7pD1HLf5@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
 <Zl0jIZbIKV6mG12I@google.com>
 <20240613143451.GF2561462@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613143451.GF2561462@google.com>

On Thu, Jun 13, 2024 at 03:34:51PM +0100, Lee Jones wrote:
> On Mon, 03 Jun 2024, Tzung-Bi Shih wrote:
> 
> > On Sun, May 26, 2024 at 08:17:17PM +0200, Thomas Weiﬂschuh wrote:
> > > The ChromeOS EC used in Framework laptops supports the standard CrOS EC
> > > keyboard backlight protocol.
> > > However the firmware on these laptops doesn't implement the ACPI ID
> > > GOOG0002 that is recognized by cros_kbd_led_backlight and they also
> > > don't use device tree.
> > > 
> > > Prepare the existing cros_kbd_led_backlight driver to be probed through
> > > the CrOS EC mfd device which works without ACPI or OF support.
> > > 
> > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > 
> > The patch overall looks good to me but it depends on previous patch in the
> > series (for LED_REJECT_NAME_CONFLICT).  Let's wait for review.
> 
> I plan to take this via MFD.
> 
> Is someone going to Ack this patch?

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

