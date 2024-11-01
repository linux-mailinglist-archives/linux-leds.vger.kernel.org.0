Return-Path: <linux-leds+bounces-3229-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97A9B8FF8
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 12:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFDB2813A2
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 11:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275AB185E53;
	Fri,  1 Nov 2024 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxWBRlgW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9AF1714BC;
	Fri,  1 Nov 2024 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730459222; cv=none; b=XgjWrexmLHkP45L4STQoJWdI8ql243oAy2RRZeE4B2N9xNuWM8Jyf539l8zYY8mxSMrBe7tJ5DPZGYr8ZfIJ6t+Sx56XChbzPBI/YU6jAmLbrYrRH8EwF7n8XE6Rg2GH4ce5FEeo3+SmufQS17dqpZKYltBPQ5PObM+GdCpmvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730459222; c=relaxed/simple;
	bh=srguf2lufsd2nms2sdpliq9KmczeQ+7p0oDEJZUn4qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/6LDsr/eyRnY98IKNrLCSrvRL52VrV2QNg1+er5ervmcV+oULqOCoahIShKA5PpuBEjxed1pBqHs3jrLdNd9B4fWzOguEmQ6v2uvsLifVA6XwG2R0fqeS4TjyX6J9JLj6dHTOgf/uyzu6/gcoY0x5V+izj0nqzX2t47AksgmwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxWBRlgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FFBC4CECD;
	Fri,  1 Nov 2024 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730459221;
	bh=srguf2lufsd2nms2sdpliq9KmczeQ+7p0oDEJZUn4qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxWBRlgWxR/HP1ssthtXOEjS1Ug+Pnv12CO8Ue4CGm5zvPtzZNCHpIJLCVRraSIE0
	 mCGNA+ACuorR5XtJrpn+LW6WYujtmVXSTqVawVBoHFyx0NvPZNdx+bA7SU9FJQD8Xn
	 oOsAtCBRcrSTCTMMG4ltrDj7xiXWdcF1vl4QobbocLu1eoYb+c5EhbAaKK9sdgVs4O
	 uulEWugA/Ur0gE+cPD3/eKUB1xPCA9DY68NtMwWTHTH7tgEczjIIARGCWXfCsCFCY0
	 J0y5b40u+kgMDMJw8zWUxeHTPMa2RQ86ncI0qFOhEnpwyV+IQK1g6sdM6TShlMl4Dx
	 +NeuK5nt12mkQ==
Date: Fri, 1 Nov 2024 12:06:54 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Lee Jones <lee@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	soc@kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
	arm <arm@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v4 02/12] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <6zpxjvs4tbccftlb6rqxpoibasm65pgv6rfntbytbatumriyyv@6htvljg5ftv4>
References: <20241029135621.12546-3-kabel@kernel.org>
 <202410311612.0OkxKVgC-lkp@intel.com>
 <98d3ab51-e7db-46b0-8268-b111e115a281@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d3ab51-e7db-46b0-8268-b111e115a281@app.fastmail.com>

On Fri, Nov 01, 2024 at 10:06:40AM +0100, Arnd Bergmann wrote:
> On Thu, Oct 31, 2024, at 10:01, kernel test robot wrote:
> >
> > kernel test robot noticed the following build warnings:
> 
> >>> drivers/leds/leds-turris-omnia.c:409:12: warning: stack frame size (2064) exceeds limit (2048) in 'omnia_leds_probe' [-Wframe-larger-than]
> >      409 | static int omnia_leds_probe(struct i2c_client *client)
> >          |            ^
> 
> The problem here is the i2c_client on the stack, you can't
> do that:
> 
>  static int omnia_mcu_get_features(const struct i2c_client *client)
>  {
> +	struct i2c_client mcu_client = *client;
>  	u16 reply;

OMG, I see. struct i2c_client contains struct device.
OK, I will do this correctly by finding the MCU device on the I2C bus.

Marek

