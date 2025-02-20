Return-Path: <linux-leds+bounces-4023-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823AA3DC38
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB870188BA85
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 14:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC371F63EA;
	Thu, 20 Feb 2025 14:11:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DC11FCCEB
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060692; cv=none; b=Dit0HoJXnbwgSktEc3oqhofyek8mwWqe5M1LDiqx2ybeCHyAKJSQYIFdGUGl5tlgz5B/HQmJibtqdu0mIJaGkXdxU57Y/1dkl+hddbuZLwmEXO7KaeiDUTF3eQsBZmklWN4gmmQj/a2D/MEmnQwROVugWsrkIESrBnNXpHayGXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060692; c=relaxed/simple;
	bh=LI0Je3OsQZgBdDqnX2MsMKsQ8lnkBp+kiW/gf9oGHNY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N3jrQvhKG5pYkvy8TSRmAVC7gleLzFaQfFjU6kqicTSh+eLypVsoSmL29NYv2k12bSun3nqn+l2YypN/C2PvzZLmYNvblsS2hHFosKQ4OuvzVKAP1u4J1OLC9l2KLHkfJHXnvjB8LBO9jM9evb1VZ9HOqsJlV41h6YVORX2R6NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tl7Gt-0001Vy-Sa; Thu, 20 Feb 2025 15:11:23 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Steffen Trumtrar <kernel@pengutronix.de>,  linux-leds@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] LED: Add basic LP5860 LED matrix driver
In-Reply-To: <20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de>
	(Steffen Trumtrar's message of "Thu, 20 Feb 2025 13:57:55 +0100")
References: <20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de>
User-Agent: mu4e 1.12.8; emacs 30.0.93
Date: Thu, 20 Feb 2025 15:11:22 +0100
Message-ID: <87zfigaeph.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org


Hi,

On 2025-02-20 at 13:57 +01, Steffen Trumtrar <s.trumtrar@pengutronix.de> wrote:

> The lp5860 is a LED matrix driver with 18 constant current sinks and 11
> scan switches which allows controlling up to 198 LED dots.
>
> This series adds just the basic support for the device on the SPI bus.
> It is also possible to use it on I2C. The interface can be
> switched/selected via an interface select pin.
>
> Next step for this driver will be adding open and short detection of the
> LEDs.

for this next step I wonder what would be the best way to propagate the failure states of the LED to the userspace? As far as I can tell, there are already TI LED drivers (lp55xx) that check open and short failures. These drivers only emit failures via sysfs_emit.
I need to be able to tell from userspace if an LED that is supposed to show some state info isn't broken in hardware.

Any ideas welcome,

Thanks,
Steffen

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

