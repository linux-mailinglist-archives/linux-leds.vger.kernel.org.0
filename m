Return-Path: <linux-leds+bounces-3278-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C99BC8A6
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 10:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46547282E2B
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 09:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FD41CEEB8;
	Tue,  5 Nov 2024 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tM/s6U06"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4DB1CDFD1;
	Tue,  5 Nov 2024 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797678; cv=none; b=HsAeXhlq8uwmk5oHGibHEo7vxWNYpkcli0HbHuu1+kTvYKzy2SkNSsTz1QkezpGChphZ8Drx9T8mfNsxH8ZohX1CY55R1ofPTDdugi05zJMyQv6NbS6SN8exikeOPVlOVB/gwKdiOV5BAxVoYX3i6lzzwRTBmJQNZ6tackZUTJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797678; c=relaxed/simple;
	bh=pmGq4bxmNkXH43e+/yMhBxMa+keTYDeRSUEaiaZ43bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gODSsSZIzxGYkiAIk6RehcCkVxEE1T+urA0+lwWkH8mXAkhHUevHj8wkReeTEyVbf4ZtN98YRVeZShBj1twvMCfbIxdPsqIQHsX7eI1cN9BUGMD9PptNOYrFlb63yHJuicOzY6O+ZwULfRXw0U1yD+PP702l4vN3LaSDL7y9reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tM/s6U06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68519C4CECF;
	Tue,  5 Nov 2024 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730797677;
	bh=pmGq4bxmNkXH43e+/yMhBxMa+keTYDeRSUEaiaZ43bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tM/s6U06yMCdIMZ+I6yPyi159xDRefUguxRfmo4V22GQy/aYgZTJBt36mG8iwHqFd
	 NozJbUa5TbWLQFh+wGxtFttgp5o/jYvONUZCBQnTafkoSoYYYOBF83t+95rxrWaVrS
	 /hgJMdO1QYub5jPqWu0EUJ2eNh0Wf4Tkl05ORdDTx0B89q8wS7nVN7VR91mkDfX3VX
	 cRuVMsw5vy4m+d4aVnBgl2teXhjI8aZ2CyPv3SkTFEaFcyb8BNPjSffrIqcwFNtx6V
	 MFMgjYB6JxbxCsGxGz9ueLr3wND9JQJHP/gv9SVb3AobG6xiXhHPoZG1NjwqvdnNGz
	 AX1ZVGO1dqgXg==
Date: Tue, 5 Nov 2024 10:07:51 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 02/12] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <y57d4i3kzk2w7bceuikfrr37ba2iwzdysj3ojjhexrvq6il23f@kkglnapi552l>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-3-kabel@kernel.org>
 <ZyjfbOkJgpWVvj9v@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyjfbOkJgpWVvj9v@smile.fi.intel.com>

On Mon, Nov 04, 2024 at 04:51:24PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 04, 2024 at 03:19:14PM +0100, Marek Behún wrote:
> > Use the MCU command execution functions from the MCU driver instead of
> > the ad-hoc implementation in the LED driver. This allows as to drop the
> > LED driver implementation, which is a duplicate.
> 
> ...
> 
> > +static int omnia_match_mcu_client(struct device *dev, void *data)
> > +{
> > +	struct i2c_client *client;
> > +
> > +	client = i2c_verify_client(dev);
> > +	if (!client)
> > +		return 0;
> > +
> > +	return client->addr == OMNIA_MCU_I2C_ADDR;
> > +}
> > +
> > +static int omnia_find_mcu_and_get_features(struct device *dev)
> > +{
> > +	struct device *mcu_dev;
> > +	int ret;
> > +
> > +	mcu_dev = device_find_child(dev->parent, NULL, omnia_match_mcu_client);
> > +	if (!mcu_dev)
> > +		return -ENODEV;
> > +
> > +	ret = omnia_mcu_get_features(i2c_verify_client(mcu_dev));
> > +
> > +	put_device(mcu_dev);
> > +
> > +	return ret;
> >  }
> 
> I'm wondering why the MCU driver (and node) is not represented as syscon
> (with some regmap beneath it).
> 
> In such a case it would be something like
> 
>   foo = syscon_regmap_lookup_by_compatible();
> 
> here instead of all these dances.

Hi Andy,

the MCU interface is command-reply oriented. It is incompatible with
regmap. I investigated this back in 2019 and explained to Jacek why it
is not possible, but can't find the e-mail on mailing lists, so I am
attaching it.

So regmap is most probably not possible, unless things changed.

It is possible to add MCU node to the DT binding and find the device
that way. But if the device-tree does not contain the MCU node, the
driver would still have to fall back to this dance, for backwards
compatibility. Otherwise it would not be able to determine whether gamma
correction is supported with old device tree, as it does currently.

I guess I could break backwards compatibility with old device tree with
this small feature. I don't think there are any users that don't use
TurrisOS, do upgrade the kernel, but don't upgrade the device-tree...

Marek

