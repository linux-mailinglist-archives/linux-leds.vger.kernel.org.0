Return-Path: <linux-leds+bounces-1905-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B0F9075A8
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B3A41F24A45
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAF61448ED;
	Thu, 13 Jun 2024 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="N+i5Cizh"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51971474AE;
	Thu, 13 Jun 2024 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290133; cv=none; b=NMfYX0pCG6RFZMjl3xbp5eoCDOKxann2oSJRgGar5pY6Dw2yPRAgsmIzHL/2hItVRKZRs8cV1rKinDh6MxEOn9y+fi4kIpDGOdw8LiraKH5BFydJselPOtRm4YsA0H8KY50Xiq2r+fBiYzYfYAyon5NKGICn676tOwIMhBfZKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290133; c=relaxed/simple;
	bh=MA4hVdM8atN+j9fTv+dOnzF4lW0zwLF6ZQX3fFVdEoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEZoO2vgRPo0ac5m87WtsSXRnZvkt6Jm6iLTcSru8LXyXjlpGt4tD+KgWkR3xJkwOvJ70uZdquzKdg99zMuo84yU35DkCSb25j1jCXsd1eOSisYk9KeGk28+zuxxnSLqR+srCbLkhhbkHZf5jhwQ6/I+QOcp9wNexfCopbwQx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=N+i5Cizh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290122;
	bh=MA4hVdM8atN+j9fTv+dOnzF4lW0zwLF6ZQX3fFVdEoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+i5CizhFa78NONukRepZGRBPa6iITSIJLCaE6M3M9auIqYe4ceXgiNuaoGCYd7lA
	 vSoXizT3mJiSqwvdeHv3tIZWeyaBo6I89ycdTLdGNAqZ30jEZiHyBk1kOYQYPmzWNp
	 8kj/dJY9kj+beGlmxYvIytCy3ogUjK2c9KvRR+pc=
Date: Thu, 13 Jun 2024 16:48:41 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Dustin Howett <dustin@howett.net>, Pavel Machek <pavel@ucw.cz>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/5] ChromeOS Embedded Controller LED driver
Message-ID: <d0189349-8101-414c-bed7-94573f66b40d@t-8ch.de>
References: <20240531-cros_ec-led-v2-0-6cc34408b40d@weissschuh.net>
 <CA+BfgNJf1Av7fRVUjpU3r6aRw6DWTHfkCuOYXP2ykhPzGTVzfw@mail.gmail.com>
 <264dd508-93c5-48d6-ac69-27458acd29c5@t-8ch.de>
 <20240613144137.GG2561462@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613144137.GG2561462@google.com>

On 2024-06-13 15:41:37+0000, Lee Jones wrote:
> On Mon, 03 Jun 2024, Thomas Weißschuh wrote:
> 
> > On 2024-06-02 18:30:06+0000, Dustin Howett wrote:
> > > On Fri, May 31, 2024 at 11:33 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > >
> > > > Add a LED driver that supports the LED devices exposed by the
> > > > ChromeOS Embedded Controller.
> > > 
> > > I've tested this out on the Framework Laptop 13, 11th gen intel core
> > > and AMD Ryzen 7040 editions.
> > > 
> > > It works fairly well! I found a couple minor issues in day-to-day use:
> > 
> > Thanks!
> > 
> > > - Restoring the trigger to chromeos-auto does not always put the EC
> > > back in control, e.g. the side lights no longer return to reporting
> > > charge status.
> > >   I believe this happens when you move from any trigger except "none"
> > > to chromeos-auto, without first setting "none".
> > 
> > Thanks for the report, I'll investigate that.
> 
> So am I reviewing this set or waiting for the next version?

This specific bug is fixed by [0], which should be in your inbox.

I just sent v3 of the series, with only two tiny changes.
One more cosmetic and one for the coming revert to avoid the LED
hardware trigger deadlock.

Thanks for the review!

[0] https://lore.kernel.org/lkml/20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net/

