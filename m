Return-Path: <linux-leds+bounces-4284-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C0A61368
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 15:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824283BAC91
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28211FFC50;
	Fri, 14 Mar 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSVc8Z0R"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68581EB3E;
	Fri, 14 Mar 2025 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961586; cv=none; b=Y3z4s5863nE8mdqi72D02q8QYskhG6g6rWACV3motPw7vBt3tqoeoaNVmYtmyq0W9YXWGpLhfV0xnWSn3OS9D9mDMdCpemhv9B3RTq5iJZWdQmKWViQtjMMsQDC9tDQpYqMAq+Z8q16DKaaHMy6Wivgb572fM8J/P1OY7Siwp8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961586; c=relaxed/simple;
	bh=tv2/YZah4h5uni5BO770OWJaT6m0SKAE40mTAbHFDK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5QCBMB2eYuwrLGOKjsyoOyl407YEhWzzxpyoyOe8168kDz3c+BEKwLhU8gTGwl8TmffMnDv4rCoQmvoymRSLOrrSAe9Pl9yMiq55qMBu38EGI+bILM6rGuy3gUQw1+22PHI/OMoN4tZYrdaqGiyr95L3UWAACpz225DoHLSdbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSVc8Z0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF65C4CEEB;
	Fri, 14 Mar 2025 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741961585;
	bh=tv2/YZah4h5uni5BO770OWJaT6m0SKAE40mTAbHFDK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSVc8Z0Rd/kqWGnja6etUX9psQ//jkPbBPi5VFuqeb3fzEcVnv9bYDxkZ/CVIPWjA
	 CFubRNPB3fR/NoOuo2eJFnnaHZEum+j16m2AtWUC9y7z1bLFs7r7lzRbmSajYPFo5E
	 YBDc5u3AonaRPHHEedANJBfUPh/yh13vxcmjyezAxsrIb0E/mPrtCROdYxdNNi5ecJ
	 hbDMsq1imjI4l/ovJArcqKVtoRpYub0w6zTsIcOp5QRn+PDLwnUwNSdoVKey3EGgDG
	 m1XmteKVCOsgRlLFt8/dCTKFyV/pJBTHf9PgcX4aFOo4ag8VFaSZzqoPRdpD4bcPsq
	 CK0xQY4GHyPuA==
Date: Fri, 14 Mar 2025 14:13:00 +0000
From: Lee Jones <lee@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <20250314141300.GR3890718@google.com>
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-2-d1071d90f9ea@emfend.at>
 <20250310144946.GH8350@google.com>
 <def0351b-c037-47c8-b395-d64cfca7ae25@emfend.at>
 <20250314105257.GD3890718@google.com>
 <8a16c018-8466-4dea-8f1e-e8a65e3ed950@emfend.at>
 <20250314114551.GL3890718@google.com>
 <7f9b920f-1851-4ebe-9054-d32de79d3678@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f9b920f-1851-4ebe-9054-d32de79d3678@emfend.at>

On Fri, 14 Mar 2025, Matthias Fend wrote:

> Hi Lee,
> 
> Am 14.03.2025 um 12:45 schrieb Lee Jones:
> > On Fri, 14 Mar 2025, Matthias Fend wrote:
> > 
> > > Hi Lee,
> > > 
> > > Am 14.03.2025 um 11:52 schrieb Lee Jones:
> > > > On Fri, 14 Mar 2025, Matthias Fend wrote:
> > > > 
> > > > > Hi Lee,
> > > > > 
> > > > > thanks a lot for your feedback!
> > > > > 
> > > > > Am 10.03.2025 um 15:49 schrieb Lee Jones:
> > > > > > On Fri, 28 Feb 2025, Matthias Fend wrote:
> > > > > > 
> > > > > > > The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
> > > > > > > stage is capable of supplying a maximum total current of roughly 1500mA.
> > > > > > > The TPS6131x provides three constant-current sinks, capable of sinking up
> > > > > > > to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
> > > > > > > each sink (LED1, LED2, LED3) supports currents up to 175mA.
> > > > > > > 
> > > > > > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> > > > > > > ---
> > > > > > >     MAINTAINERS                        |   7 +
> > > > > > >     drivers/leds/flash/Kconfig         |  11 +
> > > > > > >     drivers/leds/flash/Makefile        |   1 +
> > > > > > >     drivers/leds/flash/leds-tps6131x.c | 798 +++++++++++++++++++++++++++++++++++++
> > > > > > >     4 files changed, 817 insertions(+)
> > 
> > [...]
> > 
> > > > > > > +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> > > > > > > +{
> > > > > > > +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > > > > > > +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> > > > > > > +
> > > > > > > +	guard(mutex)(&tps6131x->lock);
> > > > > > > +
> > > > > > /> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> > > > > > > +				 false);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
> > > > > > > +	.external_strobe_set = tps6131x_flash_external_strobe_set,
> > > > > > > +};
> > > > > > > +
> > > > > > > +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
> > > > > > > +{
> > > > > > > +	struct v4l2_flash_config v4l2_cfg = { 0 };
> > > > > > > +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
> > > > > > > +
> > > > > > > +	intensity->min = tps6131x->step_torch_current_ma;
> > > > > > > +	intensity->max = tps6131x->max_torch_current_ma;
> > > > > > > +	intensity->step = tps6131x->step_torch_current_ma;
> > > > > > > +	intensity->val = intensity->min;
> > > > > > > +
> > > > > > > +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
> > > > > > 
> > > > > > tps6131x->client->dev?
> > > > > 
> > > > > Do you mean the name should be taken from the I2C device?
> > > > > The current name, for example, is 'white:flash-0', while the I2C device name
> > > > > would be '4-0033'. So I think the current version is appropriate, don't you
> > > > > think?
> > > > 
> > > > No, I'm implying that:
> > > > 
> > > >     tps6131x->client->dev == tps6131x->fled_cdev.led_cdev.dev
> > > > 
> > > > ... and that the former is shorter / neater.
> > > 
> > > Hmm. That's interesting. I thought these were two different devices, which
> > > seems to be actually the case for me. Hence the different names in the kobj.
> > > Are the devices really supposed to be identical?
> > 
> > Interesting.  What are their names?
> 
> tps6131x->fled_cdev.led_cdev.dev: 'white:flash-0'
> tps6131x->client->dev: '4-0033'

Presumably this is an I2C address?  What a helpful device name!

Okay, seeing as they are both clearly different, I think you are
correct.  Scrap this review comment.

-- 
Lee Jones [李琼斯]

