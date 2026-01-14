Return-Path: <linux-leds+bounces-6645-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3CD2037B
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 17:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8F81300B917
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 16:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F16A3A35C6;
	Wed, 14 Jan 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK8kMI3f"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2BD394463;
	Wed, 14 Jan 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408191; cv=none; b=DxxSWxQL9++xJBGvpT6eMOWQDzDjLRFjFuI8KDXku+FUtALTt0SW7Su68dDCTPhWfKMXH6u7DhrYU2+EuCC48kVy4gfTTblFqV0qUNSdjXNHEwe3eO5wiKDyrmPOpHXeVmxiKp7cOyFxPpas7O8NedXZgYh0wbMN2EBV2wKljQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408191; c=relaxed/simple;
	bh=I8+1WljunbvUFxqo0uuMi1ljN83aDJ7digha0oFhW3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpirMjEFLKorrEQioEFHIbKT1vLHnrIq+zvvLsYym9t7RroAS2ZwkI03iQxiNbMMnCyKhVIRyNPrcBojnN8ap802dWA/bnfU+Bhnir1UtgXlLZffYkVYLcCaQCV6tJ4S4aGZjQYlYaa2i+V40TXlF8UfkigaBWMPzBcVVKG48NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK8kMI3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3DEC19422;
	Wed, 14 Jan 2026 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768408190;
	bh=I8+1WljunbvUFxqo0uuMi1ljN83aDJ7digha0oFhW3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oK8kMI3fsbLCJ/RO7O6RmMGSUrb/KnoHVeDxCL6SU1hSw0dCGz5jpy8TeYhMWijFy
	 4Y6l18gHBFG01liU5Xd+7/x+lZ3tnTslJAn6x+tKCdm6wwrlDsh3Js9D11r9dUQUQ1
	 P1rmPWzPGFverhc/RQcT1t9ZTITamH1PIldcqXQfo2/+dubDFbFW3yKSCHjWgQnyns
	 WjDrp/vHQi6HX0si/ACs6w/Qkc68jUC2mryk4JkZYnH1hpGw4hotvd3LrKaBHD1aBV
	 nwKWnjBSc/zXqvv7fcVjp0htConpPi10Cu6PnhI2/UT0myjPLMDmSr89eYSeRe5wPz
	 3m9l/mvN//0oA==
Date: Wed, 14 Jan 2026 16:29:44 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aWfEd0hldSrwrh9-@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
 <aTaqCxsGj_waN92Y@aspen.lan>
 <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>

On Fri, Jan 09, 2026 at 09:55:18AM +0100, Maud Spierings wrote:
> Do you have any comments about:
>
> > +static void max25014_remove(struct i2c_client *cl)
> > +{
> > +	struct max25014 *maxim = i2c_get_clientdata(cl);
> > +
> > +	maxim->bl->props.brightness = 0;
> > +	max25014_update_status(maxim->bl);
> > +	gpiod_set_value_cansleep(maxim->enable, 0);
> > +	regulator_disable(maxim->vin);
> > +}
>
> I'm feeling like the setting of the brightness + update status maybe should
> be a call to backlight_device_set_brightness() or maybe it shouldn't really
> be there at all?

Using backlight_device_set_brightness() makes sense (although there is
still a window where userspace could come back in and turn the backlight
on again). And, if both the GPIO and regulator were optional then it is
sensible to set the brightness to zero before removing the driver.


Daniel.

