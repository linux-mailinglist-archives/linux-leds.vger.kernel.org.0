Return-Path: <linux-leds+bounces-6252-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF01C74532
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 14:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEBB94ECA30
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 13:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5CA33A71C;
	Thu, 20 Nov 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Equu/vol"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003433A6E4;
	Thu, 20 Nov 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645514; cv=none; b=e7A8LzBrIcB+DqwvxTqF9QfR09R2MVbwFZ/142k2Njsam4dn/lvHlKVEG2s0YE+4jhaKOU8q0aRkvwZOQ2MhN8lg5RhVb39moURbIDoaS7UzIPEo2D4RwfKLgSuZ2sqZhc8NifnpD3ztmigOXoGgMqnU5XemSpGaGqOhCw728SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645514; c=relaxed/simple;
	bh=OlbGMJJo3h6foGa9UIPDdn5kb4i4ti9jl9iG5XLFp60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJSfPmxJlPoloDnLQkTnmN6Xaaudm3uKi4bpXHGUTHx0f753TECPId7E79plWY7/eNjqgiObS5XABDfBe58QR6XhSWK4SoRFUJjDVs7+49LbZoiyQKcp8zA6l1VOrx8o/geD3x7DOz3KyoXv7FEFbGDkAoeGjLfqfTimR4/mEW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Equu/vol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF858C4CEF1;
	Thu, 20 Nov 2025 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645513;
	bh=OlbGMJJo3h6foGa9UIPDdn5kb4i4ti9jl9iG5XLFp60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Equu/volqLlS+/V/HejpMUXVrMOWv4YBuA4TVh35QdOGWHdxUZB66BVNZ/lk3xt2r
	 Eobgh+38biYgVUwk50p2+GF0LKR+PAEewarnZ+6V5aF3TYRl0z6mfhbu/pzi16G2sO
	 Wud2qyl7Y3q3eHHkmI6AU8kFAVcNg7hfQVI1eXh7mzA8MnsomLzsZH3K1bl5Dx2f7w
	 vtjK3hCaYNQfQ32ppTrAoVk83O3/nARw9tFNiHu0roroQ9BbEky+LPbn8UGdjz0sX3
	 YECBRGXoyzd/VJGazgJ7PSP5+V3KbTMlbbS2NoV2mIcVwjRTI5raXRqQ3nfPTNo9hV
	 y3f6A+gPlet2A==
Date: Thu, 20 Nov 2025 13:31:49 +0000
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <20251120133149.GA661940@google.com>
References: <20251117020008.316648-1-linux@timmermann.space>
 <20251117020008.316648-3-linux@timmermann.space>
 <nkdqizx5lmf5mgovt4lv4pkzzaujnqt4zlhuwdlidrlgyqr5s5@dvnhdhkhfuvy>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nkdqizx5lmf5mgovt4lv4pkzzaujnqt4zlhuwdlidrlgyqr5s5@dvnhdhkhfuvy>

On Thu, 20 Nov 2025, Lukas Timmermann wrote:

> On Mon, Nov 17, 2025 at 03:00:08AM +0100, Lukas Timmermann wrote:
> > Since there were no existing drivers for the AS3668 or related devices,
> > a new driver was introduced in a separate file. Similar devices were
> > reviewed, but none shared enough characteristics to justify code reuse.
> > As a result, this driver is written specifically for the AS3668.
> > 
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/leds/Kconfig       |  13 +++
> >  drivers/leds/Makefile      |   1 +
> >  drivers/leds/leds-as3668.c | 222 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 237 insertions(+)
> >  create mode 100644 drivers/leds/leds-as3668.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 091206c54c63..945d78fef380 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
> >  L:	linux-leds@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
> > +F:	drivers/leds/leds-as3668.c
> >  
> >  ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
> >  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index a104cbb0a001..ec37d55ac14e 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -100,6 +100,19 @@ config LEDS_ARIEL
> >  
> >  	  Say Y to if your machine is a Dell Wyse 3020 thin client.
> >  
> > +config LEDS_OSRAM_AMS_AS3668
> I've modified this line as requested in patch series v9. After comparing
> this with other configuration options in drivers/leds/Kconfig, this
> seems out of place. Shouldn't we keep this consistent?

There are a few other examples in there, so consistency is less of an
issue.  I personally think it provides a better picture of the device if
the manufacture is mentioned as well.

But this is not a blocking point.  Take your preference.

-- 
Lee Jones [李琼斯]

