Return-Path: <linux-leds+bounces-1817-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E78D8B18
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 22:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F181C21E94
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 20:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC79813A244;
	Mon,  3 Jun 2024 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="R/a8Gh6a"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC946436;
	Mon,  3 Jun 2024 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448199; cv=none; b=VmcUL1pqjt1LgoEhdLOgXrI6jFwAZX+SZyRTaLLdk4TwD4ofr/xS1XWnwPwRGomq2GWtG/ylB/j3Nt0LjSNEeSQvh06wcZfdrOyaDhFiGxCPwpZ7V6kDXUJppK3luWwb2quWthjmhIBBo2Hz1mhQWwBgCO5cOzBFmdtVgf+ycSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448199; c=relaxed/simple;
	bh=o8F6VoifI7A0oMK0yqKqCVn++NY/J+kNIIIvqg51Pio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUGFsBXUW27Ho5CUmQm/2zbTr2mL5lWtg+Q8tnMEfEbeezhicz4BZwqP+r72En5v7zThDwlBVWhAyy9tQ0oEewSS6udzQ2hahqjgkOhwJ7m5D0FI6/Ee2MaVJ26XS7py5EYgvXuT7pE4XpwIIxaMc/N1H1uOQTXe/aqlA3IvuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=R/a8Gh6a; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717448187;
	bh=o8F6VoifI7A0oMK0yqKqCVn++NY/J+kNIIIvqg51Pio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/a8Gh6adcU4G+Fdat0sLVBLpH4mqMpmnLWoXuSeRJrYRQtEDSzU1K5Oz4GOAzScK
	 vI0quijbumGkVHW3gUV09hAXu12jdm825r5h4rPkoYJQdo2lgIoOauUhJ2xVTYxOfc
	 k9MEaHMbGkP+KoS4AqTzuijgcBV3dIQqdABgpW6c=
Date: Mon, 3 Jun 2024 22:56:26 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dustin Howett <dustin@howett.net>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/5] ChromeOS Embedded Controller LED driver
Message-ID: <264dd508-93c5-48d6-ac69-27458acd29c5@t-8ch.de>
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
 <CA+BfgNJf1Av7fRVUjpU3r6aRw6DWTHfkCuOYXP2ykhPzGTVzfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+BfgNJf1Av7fRVUjpU3r6aRw6DWTHfkCuOYXP2ykhPzGTVzfw@mail.gmail.com>

On 2024-06-02 18:30:06+0000, Dustin Howett wrote:
> On Fri, May 31, 2024 at 11:33 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> >
> > Add a LED driver that supports the LED devices exposed by the
> > ChromeOS Embedded Controller.
> 
> I've tested this out on the Framework Laptop 13, 11th gen intel core
> and AMD Ryzen 7040 editions.
> 
> It works fairly well! I found a couple minor issues in day-to-day use:

Thanks!

> - Restoring the trigger to chromeos-auto does not always put the EC
> back in control, e.g. the side lights no longer return to reporting
> charge status.
>   I believe this happens when you move from any trigger except "none"
> to chromeos-auto, without first setting "none".

Thanks for the report, I'll investigate that.

> - The multicolor intensities report 6x 100 by default; if you set the
> brightness with the intensities set as such, it becomes only red. I
> would have
>   expected intensities of 100 0 0 0 0 0 if that were the case

The EC will always use the first nonzero intensity for the color
channel. It isn't a real PWM color mix.
I don't think there are possibilities in the multicolor API to enforce
this. For the next revision I'll need to document this properly.
Also the default intensities could be better indeed.

> Thomas, I apologize for the duplicate message; my mail client config
> here defaults to "reply" rather than "reply all."

No worries!

