Return-Path: <linux-leds+bounces-169-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F37F9B65
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CBB2B209DA
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 08:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4A010A28;
	Mon, 27 Nov 2023 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arUeWjhh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E63D10785
	for <linux-leds@vger.kernel.org>; Mon, 27 Nov 2023 08:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F7BC433C7;
	Mon, 27 Nov 2023 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701072790;
	bh=jdApDdp5fys2vmxXQeWrknDBds70DchNIYMmgGQiSmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arUeWjhhaXTIyqScRkphKIC+XgOr5v/R9e9FLSNERvhxALI6UDy5a8u/yUznOhxn8
	 O/ZT5lxDW/iYsSuPnqGJt0nJvgV1AG9l9IHMcUkhg1QrLwyDw8W4AxHkxvEBobWZ5M
	 Ylvv5ac9l1eT1xxmYmKJoeKFyYMQ1bmHujkJjQyNR/4dnzCfWNz8OQ/FcYRFLRJRt8
	 v48/FfXdspUqZvxSo4uBLwmuqudrRQfGwXJ87g+42HIeQwjOmv6qPO/4n11vDRAQGG
	 0VsFtsmsNnrBHpOaEowODs+sGbYp3+VZNvFP/0Oagugw9NX2hIxlA49rPLyFlQNSaa
	 mJ54Yd+9Tf4dQ==
Date: Mon, 27 Nov 2023 08:13:05 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Li Zetao <lizetao1@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <20231127081305.GB1470173@google.com>
References: <3655d56c08b60f0ce562ceab3a627fef046a7617.1701029732.git.daniel@makrotopia.org>
 <4bade634-f2f7-4bfc-b882-67cfe9e47b8f@lunn.ch>
 <ZWPCdHBt_g4-5ArV@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWPCdHBt_g4-5ArV@makrotopia.org>

On Sun, 26 Nov 2023, Daniel Golle wrote:

> Hi Andrew,
> 
> On Sun, Nov 26, 2023 at 10:04:22PM +0100, Andrew Lunn wrote:
> > On Sun, Nov 26, 2023 at 08:17:03PM +0000, Daniel Golle wrote:
> > > Add 2.5G, 5G and 10G as available speeds to the netdev LED trigger.
> > > 
> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> > One thing to consider is how this get merged. I assume you will have a
> > PHY driver patch soon making use of this?
> 
> Yes, exactly. I'm working on adding support for LEDs to MaxLinear and
> RealTek PHY drivers.
> 
> > We can either:
> > 
> > 1) Get Lee to merge it into the LED tree and then create a stable
> > branch which gets pulled into netdev.

I'll create an immutable branch.

> > 2) Merge into netdev, with Lees Acked-by: 
> > 
> > It seems unlikely there will be any merge conflicts. So netdev does
> > seem like an O.K. way to go.
> 
> Via netdev (net-next) would be better imho as it would allow to add
> changes to PHY drivers making use of the new constants without having
> to wait for LED tree being merged.

The former solution does not prevent this.

> Note that I've sent v2 which adds missing use of sysfs attributes.

-- 
Lee Jones [李琼斯]

