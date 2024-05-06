Return-Path: <linux-leds+bounces-1605-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4358BCAB4
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 11:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFC38B20D8F
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 09:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C187E1422AC;
	Mon,  6 May 2024 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="ruSrxaBq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A031422D6;
	Mon,  6 May 2024 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714988042; cv=none; b=kIhgZhOUsp+TcayRJcRfYlIP3crJa/p6VhrKwGC4pQBC5GTEF8I9vTuzw+qaqjuz2JvEXM4ikiKSPZqf+wAHNYCQPQsKnyrCJ9MH7mR04lXnII3JiMqLWxAlzk5Kw6bhR4zUJiYVdv0ebxXg55B1rkZZQxLFSA0LiK+f/tYfpSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714988042; c=relaxed/simple;
	bh=9C8JvI+7wm2JcAyLDZ0Qc6A4yORKfHgNwrpHXYrv3Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfAid23z/eaUPaTGUQ2ZNQvW7Vn6Y/ZipeOTCrA/C0bVuNubYfI0UGUS32ybUNlEP9oUU6WbXKweTE9wGrFP3iWnohmn/T8XSiY4Bh0G05kuYLzN+oczo2mjl3QJrZ0JCoKp3WkyEZ1vvFSP1n+djpOPDngG03mKdVFjvjbreic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=ruSrxaBq; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B84891487F31;
	Mon,  6 May 2024 11:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1714987639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bm2YH55vsuB8a5BzC3OKohaHswSl7MN/90c4mNewII0=;
	b=ruSrxaBqNLhN8GftpFruP6UxqioezevNCSRs4OcBtZZLcncZKq3bZIknK37Me3heM3sFyF
	Gdk492Cde0mq9+yFrSe6QtivFsvEBqqCxX24vpDUKdETMzq7xeT40F5szbYrK3K7UB/5/J
	V5XzUV+6uUeAQSRRilhy9RSJM+nNTEhtUKcrZsm2ra3sEYu2KFJruMxKJ2tPMs1qBX1Km/
	+Tf20Ia6kOlAx8Sne3PWYSY3Ada7acKlzflpg1tSVpo6c4seKpWLIS3xG7aseHHTdN8LYA
	9XGRToM4PA4cJKax2UiXIfpRGn2TgxsHNJk4NrQUygRZd3tL65JRgrc6bXUG+A==
Date: Mon, 6 May 2024 11:27:07 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Joseph Strauss <jstrauss@mailbox.org>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Add multicolor support to BlinkM LED driver
Message-ID: <20240506-unfazed-uplifted-3b2abebfc454@thorsis.com>
Mail-Followup-To: Joseph Strauss <jstrauss@mailbox.org>,
	Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240428162309.32111-1-jstrauss@mailbox.org>
 <20240503085724.GL1227636@google.com>
 <20240503232636.kbygwgo6h2c5evqc@libretux>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503232636.kbygwgo6h2c5evqc@libretux>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Joseph,

Am Fri, May 03, 2024 at 06:26:36PM -0500 schrieb Joseph Strauss:
> On 24/05/03 09:57AM, Lee Jones wrote:
> > On Sun, 28 Apr 2024, Joseph Strauss wrote:
> > 
> > > Add multicolor support to the BlinkM driver, making it easier to control
> > > from userspace. The BlinkM LED is a programmable RGB LED. The driver
> > > currently supports only the regular LED sysfs class, resulting in the
> > > creation of three distinct classes, one for red, green, and blue. The
> > > user then has to input three values into the three seperate brightness
> > > files within those classes. The multicolor LED framework makes the
> > > device easier to control with the multi_intensity file: the user can
> > > input three values at once to form a color, while still controlling the
> > > lightness with the brightness file.
> > > 
> > > The main struct blinkm_led has changed slightly. The struct led_classdev
> > > for the regular sysfs classes remain. The blinkm_probe function checks
> > > CONFIG_LEDS_BLINKM_MULTICOLOR to decide whether to load the seperate
> > > sysfs classes or the single multicolor one, but never both. The
> > > blinkm_set_mc_brightness() function had to be added to calculate the
> > > three color components and then set the fields of the blinkm_data
> > > structure accordingly.
> > > 
> > > Signed-off-by: Joseph Strauss <jstrauss@mailbox.org>
> > > ---
> > > Changes in v2:
> > > - Replaced instances of the constant 3 with NUM_LEDS, where applicable
> > > - Fixed formatting errors
> > > - Replaced loop inside of blinkm_set_mc_brightness() with equivalent
> > >   statements
> > > - Changed id of multicolor class from 4 to 3
> > > - Replaced call to devm_kmalloc_array() with devm_kcalloc()
> > > Changes in v3:
> > > - Add CONFIG_LEDS_BLINKM_MULTICOLOR to check whether to use multicolor
> > >   funcitonality
> > > - Extend well-known-leds.txt to include standard names for RGB and indicator
> > >   LEDS
> > > - Change name of Blinkm sysfs class according to well-known-leds.txt
> > > - Simplify struct blinkm_led and struct blinkm_data
> > > - Remove magic numbers
> > > - Fix formatting errors
> > > - Remove unrelated changes
> > > Changes in v4:
> > > - Fix indentation
> > > - Add default case to switch statement
> > > Changes in v5:
> > > - Fix warnings related to snprintf on s390 architecture, reported by
> > >   0-DAY CI Kernel Test Service
> > > Changes in v6:
> > > - Refactored struct blinkm_led to use a union
> > > - Refactored blinkm_probe()
> > > - Clarified documentation
> > > 
> > >  Documentation/leds/leds-blinkm.rst     |  31 +++-
> > >  Documentation/leds/well-known-leds.txt |   8 +
> > >  drivers/leds/Kconfig                   |   8 +
> > >  drivers/leds/leds-blinkm.c             | 223 +++++++++++++++++--------
> > >  4 files changed, 198 insertions(+), 72 deletions(-)
> > 
> > Just tried to apply this, but checkpatch.pl has some complaints.
> > 
> > Please fix them and resubmit, thanks.
> > 
> > -- 
> > Lee Jones [李琼斯]
> I fixed the errors and warnings that resulted from my patch, but am
> I correct in assuming I am not responsible for fixing the warnings
> from other parts of the file? It would make the patch messier is my
> concern.

I would say so.  Output somehow depends on what you call checkpatch
with.  Passing the actual patch (after `git format-patch …`) you
should only get warnings for parts you touched.  Passing the whole
file with -f of course you also get warnings for other parts.

Greets
Alex


