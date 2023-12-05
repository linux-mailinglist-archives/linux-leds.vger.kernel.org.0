Return-Path: <linux-leds+bounces-256-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B7804563
	for <lists+linux-leds@lfdr.de>; Tue,  5 Dec 2023 04:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5A8280BDA
	for <lists+linux-leds@lfdr.de>; Tue,  5 Dec 2023 03:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7823D53A6;
	Tue,  5 Dec 2023 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ghkrNVs2"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02A5CD;
	Mon,  4 Dec 2023 19:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VZoBFo7vkkOE+8ETmoqLoMpJqmfxzyZ/oRh4/28PaWM=; b=ghkrNVs22VmbwG5bG2CPELHwz3
	E0PJfkDyfVH1wav5L+QjNpNctwq261tJcpzANvGrQAojZ40AeBabvD45/Zc7QofyUhPeUXeJSQSRX
	kBsJYMLh0e1GCbl0HSQNHv5Dr+PQOPZhc0vlRWhh1JWTlLdBgCwJLZxY4N2hm8FALs+Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rALfk-0022kp-HU; Tue, 05 Dec 2023 04:00:32 +0100
Date: Tue, 5 Dec 2023 04:00:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Message-ID: <4c9396eb-f255-4277-8151-caa28c8ea0d3@lunn.ch>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
 <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
 <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
 <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
 <c57558a4-9f3a-48fa-acb7-e3eb2349c666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c57558a4-9f3a-48fa-acb7-e3eb2349c666@gmail.com>

> Let's take a very simple use case: We have a one bit configuration to
> switch a LED between link_100 and link_1000 hw trigger mode.
> 
> Then we have the atomicity issue you described: We can't go directly
> from one hw-controlled mode to the other, we have to go via both
> modes active or no mode active.
> 
> And unfortunately we don't have the option to indicate this by some
> optical LED activity like blinking, especially if the link is down
> at the moment.
> 
> Would be a pity if our nice framework can't support such a simple
> use case. So, what I could imagine, we react based on the return code
> from hw_control_is_supported():
> 
> - 0: use hw control
> - -EOPNOTSUPP: fall back to LED software control, no error returned to use
> - -ENOTSUPP (another idea: ENOEXEC): store new mode in trigger_data->mode and return error to the user
> - other errors: don't store new mode and return error to user
> 
> Not fully intuitive and the subtle difference between EOPNOTSUPP and
> ENOTSUPP may confuse driver authors adding device LED support.

Using an NFS error code for LEDs will definitely confuse
developers. This is not a network file system, where it is valid to
use ENOTSUPP.

I actually think we need to define some best practices, ordered on
what the hardware can do.

1) With software control, set_brightness should do what you expect,
not return an error.

2) Without full software control, but there is a mechanism to report a
problem, like constant blinking, or off, do that, and return
-EOPNOTSUPP.

3) Really dumb hardware like this, set_brightness should be a NULL
pointer. The core returns -EOPNOTSUPP.

The core should return this -EOPNOTSUPP to user space, but it should
accept the configuration change. So the user can put it into an
invalid state, in order to get to a valid state with further
configuration.

I don't see an easy way to let the user know what the valid states
are. We currently have a 10bit state. I don't think we can put all the
valid ones in a /sysfs file, especially when QCA8K pretty much
supports everything.

	 Andrew

