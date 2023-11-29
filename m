Return-Path: <linux-leds+bounces-202-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 418937FE294
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 23:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17812812FF
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 22:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CE54CB43;
	Wed, 29 Nov 2023 22:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dWci2Z9z"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE0F1704;
	Wed, 29 Nov 2023 14:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t1K9aR5+s9N93bh3ebk4fNP1kEYrrDkBqchQHHkXkVo=; b=dWci2Z9zlsYbFbErmkfY4xX9Od
	JCYOO/ICReV3YkLR9hPqk88PeY46qb4kGATaJMRb7XMUsiTTyephLmoeSF3spPoV9DJheDL3OU8sS
	zEG9L3KdSh3f6d0svBrbmNkQeJnxTQTfnur3psN1/kUyB7fijS2VakQkfjym7nhITL/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8Sdu-001cKh-Ar; Wed, 29 Nov 2023 23:02:50 +0100
Date: Wed, 29 Nov 2023 23:02:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Message-ID: <7535cb07-31ab-407d-9226-7b3f65050a65@lunn.ch>
References: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
 <a69ebe41-3f37-4988-a0bc-e53f79df27f2@lunn.ch>
 <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFSsGVvBfvkotAd+p++bzca4Km8pHVzNJEGV6CAjYULVOWuD2Q@mail.gmail.com>

> RTL8168 LED control allows to switch between different hw triggers. I
> was under the
> assumption that this is not uncommon.

I did take a look around various datasheets, and i did find a couple
like this, but the majority have the ability to do software control.

> In order to deal with the non-atomic issue we have to set
> trigger_data->mode to the
> resulting new mode, based on what the user set. Question is what we show to the
> user. If we show nothing, then he will expect the new mode to be active.
> If we show an error, then he may assume that his input had no effect.
> So we may have to show technically an OK, plus a message that his input has been
> stored, but is not supported by hw.

It is hard to show anything to the user. We are just doing

echo 1 > file.

There is no channel to the user other than an error code.

There is also the question about what the LED should show. Ideally it
should indicate some sort of state to indicate there is an
error. Either constantly blink, turn off, etc. Maybe that is the
solution. You implement a set_brightness function which just indicates
an error on the LED, but otherwise return O.K?

   Andrew

