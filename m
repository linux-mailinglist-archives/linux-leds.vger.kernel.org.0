Return-Path: <linux-leds+bounces-6307-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5DC84B53
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 12:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A76D24E257F
	for <lists+linux-leds@lfdr.de>; Tue, 25 Nov 2025 11:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C203115A2;
	Tue, 25 Nov 2025 11:21:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F726C39E;
	Tue, 25 Nov 2025 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069664; cv=none; b=OmaI2zJ1Xbao2BTgPnE37awfg82PfCLYQ4namxZtn5IC2N8exFoaw8QBFg4L6S29f8056LcAy+xtaFY2UqlFn8RsYcbsVlKUncm7KM3M/bgscXWZE2TOTSNfA5SsTM4eHRhIqn6U3tlltU9VUo+xQ692nXi9r8cjO8UXGbLF3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069664; c=relaxed/simple;
	bh=90IwNIvTFQNIrULrq7DdzIJAwRK020sjuUe2cVoRkUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGbBNMwnURCzlIRwbeZc9+6KUJ/89p272TUp+T+gayM2YoRgwx0b4q/Myrdlur308A9oWzIpzlFl3epx8MjiuiXRbymXGle1IwiQQUmdoqBKN25Hn1HUkfg/1tqLqgJfl/skZLsE+9YG4V7JTuT4d2zvsP4IfOSDcLARQdm5BYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dG0cM3Fdvz9tX0;
	Tue, 25 Nov 2025 12:20:51 +0100 (CET)
Date: Tue, 25 Nov 2025 12:20:46 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <lqgf7lmnxy3zwmlzhip56tqwrraunhldghvlm7cafvruvscqby@5ik6mijwqmvg>
References: <20251117020008.316648-1-linux@timmermann.space>
 <20251117020008.316648-3-linux@timmermann.space>
 <nkdqizx5lmf5mgovt4lv4pkzzaujnqt4zlhuwdlidrlgyqr5s5@dvnhdhkhfuvy>
 <20251120133149.GA661940@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120133149.GA661940@google.com>

On Thu, Nov 20, 2025 at 01:31:49PM +0000, Lee Jones wrote:
> On Thu, 20 Nov 2025, Lukas Timmermann wrote:
> 
> > On Mon, Nov 17, 2025 at 03:00:08AM +0100, Lukas Timmermann wrote:
> > > Since there were no existing drivers for the AS3668 or related devices,
> > > a new driver was introduced in a separate file. Similar devices were
> > > reviewed, but none shared enough characteristics to justify code reuse.
> > > As a result, this driver is written specifically for the AS3668.
> > > 
> > > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/leds/Kconfig       |  13 +++
> > >  drivers/leds/Makefile      |   1 +
> > >  drivers/leds/leds-as3668.c | 222 +++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 237 insertions(+)
> > >  create mode 100644 drivers/leds/leds-as3668.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 091206c54c63..945d78fef380 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
> > >  L:	linux-leds@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
> > > +F:	drivers/leds/leds-as3668.c
> > >  
> > >  ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
> > >  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index a104cbb0a001..ec37d55ac14e 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -100,6 +100,19 @@ config LEDS_ARIEL
> > >  
> > >  	  Say Y to if your machine is a Dell Wyse 3020 thin client.
> > >  
> > > +config LEDS_OSRAM_AMS_AS3668
> > I've modified this line as requested in patch series v9. After comparing
> > this with other configuration options in drivers/leds/Kconfig, this
> > seems out of place. Shouldn't we keep this consistent?
> 
> There are a few other examples in there, so consistency is less of an
> issue.  I personally think it provides a better picture of the device if
> the manufacture is mentioned as well.
> 
> But this is not a blocking point.  Take your preference.
> 
> -- 
> Lee Jones [李琼斯]
> 
I agree that including the manufacturer is more descriptive. Thanks for
explaining that to me, I didn't notice the other entries with
manufacturers. Also thanks for the continued patience with my newbie patches.

Best regards,
Lukas Timmermann

