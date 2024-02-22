Return-Path: <linux-leds+bounces-911-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E978604DC
	for <lists+linux-leds@lfdr.de>; Thu, 22 Feb 2024 22:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 578F5B213A1
	for <lists+linux-leds@lfdr.de>; Thu, 22 Feb 2024 21:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A92A73F33;
	Thu, 22 Feb 2024 21:34:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920D71738
	for <linux-leds@vger.kernel.org>; Thu, 22 Feb 2024 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708637686; cv=none; b=YpkpgzB2lHI6YcMlN3NmP3o+Pfa//iXX1GVMFsnweS/cXOdmnWjbsbXGWOd3WAqwcfimGOlhL3ic2WXvftVaKaw4OtOf/Pi9lcjSH6AYrvv/TH9EsRSvI73P1eT0deGDmJpwzCXoSkFWxuxg/OW55sWfZDSVgiW/FgUnwmjO5IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708637686; c=relaxed/simple;
	bh=tVO/2wuamC42MHKdIDybSKJStcN68xMdf6hl3eu6sWo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVC5TmCiUwslI7aiFVHeWJuIIHFnVgPIgmnBKvFeUNH9liGQ4fHe2zkZ7TrvWvjmG2AWmg3AAIqsZmxMZeloQLg+r7wRIJUqhydI5H3iYw7FRBe4NTttSs2NolmWgNKwLpx5tHM7BuIaSLvgu/99HDKtqvu30yFGTAA0S+BF65M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 2cbcaad4-d1ca-11ee-a9de-005056bdf889;
	Thu, 22 Feb 2024 23:34:36 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 22 Feb 2024 23:34:35 +0200
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Pavel Machek <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Linux support for a 7 segment LED display
Message-ID: <Zde966nsJ76QOuzm@surfacebook.localdomain>
References: <1f598a72-dd9f-4c6c-af7f-29751f84bd23@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f598a72-dd9f-4c6c-af7f-29751f84bd23@alliedtelesis.co.nz>

Sun, Feb 11, 2024 at 08:46:12PM +0000, Chris Packham kirjoitti:
> Hi Blinkenlight enthusiasts,
> 
> I'm looking for something that I figured must exists but maybe it's so 
> niche that no-one has bothered to upstream a driver for it.
> 
> I have a requirement to support a 7-segment LED display[1] (one that can 
> display a single digit from 0-9). Hardware wise it's just a bunch of 
> individual GPIOs connected to each segment (plus an extra one for a 
> dot). I can't see anything obvious in drivers/leds but maybe I'm looking 
> in the wrong place. Or maybe it's the kind of thing on PC hardware that 
> is just driven by the BIOS without the operating system knowing about it.
> 
> Is there an existing in-kernel driver for such a thing?

No, and can't be. Here is just a mapping table and other drivers that use
7-segment LED displays to be connected to.

What you need is something else, i.e. special case of leds-gpio (which should
be somewhere else) that does something like this. To me it sounds like a
mixture between line-display.h (from auxdisplay) and gpio-aggregator.

How many digits do you want to connect? How are they going to be connected
(static display, or dynamic when you need to refresh in certain periods of
time)? Depending on the answer it might take one or another approach.

> [1] - https://www.kingbrightusa.com/images/catalog/SPEC/SA36-11GWA.pdf

-- 
With Best Regards,
Andy Shevchenko



