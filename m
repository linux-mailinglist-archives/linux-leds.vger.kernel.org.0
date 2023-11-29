Return-Path: <linux-leds+bounces-200-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DCE7FDD36
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 17:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2D491C209C5
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 16:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F277A1DA24;
	Wed, 29 Nov 2023 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SHwLc83A"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF5E10A;
	Wed, 29 Nov 2023 08:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/uA+miTA801VQdKq+GBxddcU5PJHZsukphpTgK8YoY4=; b=SHwLc83AK8f9IfCTZ36S5HrTsG
	uqXoGnzas3y9+cCSqbs161QB4oCl58vd5OqjDuCor9mOJpHUgkWIgra4Fdhvl89tNlp/IDC+NV/Ws
	uYiyszlEgjOFZRn+Gt0/1d6B9U3epFrUd4XMcB7rdsKRgbJHBCgDxixjBgCYhHxqd0/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8NYI-001adv-7A; Wed, 29 Nov 2023 17:36:42 +0100
Date: Wed, 29 Nov 2023 17:36:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Message-ID: <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>

On Wed, Nov 29, 2023 at 11:41:51AM +0100, Heiner Kallweit wrote:
> The current codes uses the sw_control path in set_baseline_state() when
> called from netdev_trig_activate() even if we're hw-controlled. This
> may result in errors when led_set_brightness() is called because we may
> not have set_brightness led ops (if hw doesn't support setting a LED
> to ON).

Not having software on/off control of the LED is a problem. It breaks
the whole concept of offloading/accelerating. If we cannot control the
LED, there is nothing to accelerate. What do we do when the user
selects a configuration which is not supported by the hardware? The
API is not atomic, you cannot set multiple things at once. So the user
might be trying to get from one offloadable configuration to another
offloadable configuration, but needs to go via an configuration which
is not offloadable. Do we return -EOPNOTSUPP?

Before we accept patches like this, we need to discuss the concept of
how we support LEDs which cannot be controlled in software.

    Andrew

