Return-Path: <linux-leds+bounces-3494-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8139E6F26
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 14:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7EDF164BBF
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 13:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42861206F3A;
	Fri,  6 Dec 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6QeHy05"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466B1FF7D4;
	Fri,  6 Dec 2024 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490931; cv=none; b=cEDihQTYfuG1wwe8RHEO8vX9Tss2HpoeFsz34gq1T7N7pMXOFLv4k3QB7ENlue0HvbMl9TmqjGQyYXqvofFjnYTGAwsMyQwtLaBXpPy/AbBe9kS2dCpYLVZ/LbTmGTsV0tAEgoc0dsE+0Wn4epTmWQaCvBqQ0hPhdwS6Av+p0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490931; c=relaxed/simple;
	bh=RBQPiZLaF/HhYgZcAn4z7acnCKkfab9JJzcgHdj2gco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbHi7KE7U5g68mqSkcVeZdkqvrSITK6mN8jQaz+Rjoj6AItjtgv5H2ZeIjcUZm1YzIXJ/v2K4pRBnXdIm9q3Oyi57RCx0Z6CdgAjmYtIS7SvZ3VFfdsjxop1/wXyw65QrXom6b9CblXdhcXBcWzwgOYqtYXEE1oAgDgNmnJTXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6QeHy05; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C9DC4CED2;
	Fri,  6 Dec 2024 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733490930;
	bh=RBQPiZLaF/HhYgZcAn4z7acnCKkfab9JJzcgHdj2gco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6QeHy05RXBSsTKwcBOYlJr2HkerKo9KqPFDRbXA6hFsWiGonVcZluo4sks33Ow1L
	 cFU7qPOwcNsmP7qio8uAeGLVOEfGvAfemTa6vPS7gK2Y093SZZ3OxmjlW3npcci3Jj
	 2ennJ8B3UOZYsw6TwDSbGqNwtpwLl1DwHYmU8KWjHNpHK9NVIKsgKDWiZ38Uvp8dEO
	 YBG9l7V+Rca9oWH2ZnSoDrdoMsoo6VwM9UHDb6HBnIVvT4+/V2P5cjYyWgs65vGAGe
	 9CqPaR419CkRVg3c0twz2p+hTf1sjwO7ozndhp4o/zvJctY7/fDwvIS3+8ZE/v8UzY
	 P4A+JwrZ8KuAw==
Date: Fri, 6 Dec 2024 14:15:24 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, regressions@lists.linux.dev, 
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
Message-ID: <7rkcryouxg2s5misf7nx3vsf72rhaq2twhlksj62bzmaagdwfv@p3xy6rhzgntz>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
 <CAPy0QmsF1qr3A-89BDQHu-QVXpMhMGWt8e74FfDkqVT6Ha7q-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPy0QmsF1qr3A-89BDQHu-QVXpMhMGWt8e74FfDkqVT6Ha7q-g@mail.gmail.com>

On Fri, Dec 06, 2024 at 10:04:49AM +0100, Klaus Kudielka wrote:
> On Thu, Dec 5, 2024 at 1:43 PM Marek Behún <kabel@kernel.org> wrote:
> > On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Behún wrote:
> > >
> > > This is because the patch went into 6.13 but the rest of the patches
> > > did not, Lee wants to take them for 6.14 :-(
> > >
> > > Apply this series and it will work.
> > >
> > > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.org/T/
> >
> > Alternatively you can overcome this issue if you enable the
> > turris-omnia-mcu driver in 6.13:
> >
> >   CONFIG_CZNIC_PLATFORMS=y
> >   CONFIG_TURRIS_OMNIA_MCU=y/m
> > (and also the subsequent options).
> >
> > Marek
> 
> Thanks, I will try that when I'm back at the hardware (in a week or so).
> 
> Do I correctly understand the situation:
> For the Turris Omnia LEDs there is now a temporary dependency on
> CONFIG_TURRIS_OMNIA_MCU, which will vanish in 6.14?
> 
> Best regards, Klaus

No, the leds-turris-omnia driver will have hard dependency on turris-omnia-mcu
driver instead. You won't be able to select leds-turris-omnia without enabling
turris-omnia-mcu.

This is because leds-turris-omnia depends on the IRQ line provided by the
turris-omnia-mcu driver.

Marek

