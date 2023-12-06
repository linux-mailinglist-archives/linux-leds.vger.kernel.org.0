Return-Path: <linux-leds+bounces-278-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 118768076DB
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 18:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95495B20D5A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 17:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4C46D1C7;
	Wed,  6 Dec 2023 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hgzt9I+u"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AC4D50;
	Wed,  6 Dec 2023 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1mo1LgfKsz3GNeuJdlpVdTsBLDDEkpPEzTaq9ExbB5k=; b=hgzt9I+uUlQkrxtxNPIpTm7nE2
	/A9hOHwJK92xwF2Vgt2OyRKbFJZmL3kCtQTNdceEjJRRDxP+jxp+7xNT1tlaYkk8+AtY0ax1V7bAe
	W3d668LWGdsZZAHCFaRWbBrIrO3l1MfB5UuiVqNjKg/rStzVJPxVBSHXGjtpUDDlItI8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rAvxj-002El3-VR; Wed, 06 Dec 2023 18:45:31 +0100
Date: Wed, 6 Dec 2023 18:45:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Message-ID: <a53883cd-f843-45a5-82d3-483d80e9a806@lunn.ch>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
 <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
 <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
 <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
 <c57558a4-9f3a-48fa-acb7-e3eb2349c666@gmail.com>
 <4c9396eb-f255-4277-8151-caa28c8ea0d3@lunn.ch>
 <9a8373c6-e916-4a98-858a-294e7bed9f24@gmail.com>
 <d42dd05d-fc76-4040-aa15-8bbc4aa535f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d42dd05d-fc76-4040-aa15-8bbc4aa535f3@gmail.com>

> >> I actually think we need to define some best practices, ordered on
> >> what the hardware can do.
> >>
> >> 1) With software control, set_brightness should do what you expect,
> >> not return an error.
> >>
> >> 2) Without full software control, but there is a mechanism to report a
> >> problem, like constant blinking, or off, do that, and return
> >> -EOPNOTSUPP.
> >>
> >> 3) Really dumb hardware like this, set_brightness should be a NULL
> >> pointer. The core returns -EOPNOTSUPP.
> >>
> >> The core should return this -EOPNOTSUPP to user space, but it should
> >> accept the configuration change. So the user can put it into an
> >> invalid state, in order to get to a valid state with further
> >> configuration.
> >>
> > Sounds good to me. Let me come up with a RFC patch.
> > 
> >> I don't see an easy way to let the user know what the valid states
> >> are. We currently have a 10bit state. I don't think we can put all the
> >> valid ones in a /sysfs file, especially when QCA8K pretty much
> >> supports everything.
> >>
> >> 	 Andrew
> > 
> > Heiner
> 
> Patch is so simple that I send it this way. What do you think?

That is simpler than i expected.

But i think we need to document our expectations. What do we expect an
LED driver to do when it cannot support software blinking. So please
could you add a comment somewhere. Maybe extend the

/*
 *Configurable sysfs attributes:
 *

section?

Thanks
	Andrew

