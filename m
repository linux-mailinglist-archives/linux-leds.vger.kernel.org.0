Return-Path: <linux-leds+bounces-5038-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37AB01F17
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 16:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083111730AD
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 14:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF892E7181;
	Fri, 11 Jul 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="v1H2cNLQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBF2E7173
	for <linux-leds@vger.kernel.org>; Fri, 11 Jul 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243893; cv=none; b=G7IUw4d0x2YVe/ZpFmHL0HrCEz3maojELxk5/yY4kdyRJEu/9Ms/SaNFIbHBgqtlp8W3gg29B7DcBQiajyJ+HxbRFam5YV3nGoEQ4n3XjWaqJu/ET+ssfB6J+VcC76A4albiuDfC0iRFWjxc8phxCcNYtP4qOdmacBQpudbdbBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243893; c=relaxed/simple;
	bh=cHcTu4TP0vaK+eejxybj5YN72tYQB7A7cMzcsrGbE8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fehSMsd62xlxELtl/gK3hzDX59sfId98CEhE48UvkXvkrBZ/GQXeAzPXw0Q7R7VhYQW/kMpRdUFJ5UcnORZNLs/VcSn7c7JvycpWyo+pOZHVnvrdFrcjU/j9laYssfa4TNmXXLbMThbGMDa1V3rWpSXyY3daNmk0VxLg0tkkoGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=v1H2cNLQ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KFcrff+qIv1mjwCfiMyFVPateLGBkUX9xS+1FwP1ZOM=; b=v1H2cNLQ7eBvfbw9YRNH8UFTk7
	UK9YT570yGTNMrYgF6O7/m4vUkrKtIy7Joj0z3mN78uTdRcq45RZMxwyBgVESrlwZPcvtZT4WKx9o
	Ni5q5eNQeQaQG8dwZE9+LY9Vz/thMvP4C24ZX9CktxftwjjL4oj1dHPDD/PT013BStGw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uaEg0-001Eux-96; Fri, 11 Jul 2025 16:24:36 +0200
Date: Fri, 11 Jul 2025 16:24:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	nyanmisaka <nst799610810@gmail.com>, linux-leds@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: trigger: netdev: Configure LED blink interval for
 HW offload
Message-ID: <c6134e26-2e45-4121-aa15-58aaef327201@lunn.ch>
References: <20250120113740.91807-1-marex@denx.de>
 <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>
 <aHBZEh0q_FBh6urS@makrotopia.org>
 <4856875f-72cc-45ce-bd5b-8097122dac5c@lunn.ch>
 <5c9d7cc6-370b-4702-8dc2-190115174391@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c9d7cc6-370b-4702-8dc2-190115174391@mailbox.org>

> I found one patch in tree here which makes use of the delay_on/delay_off
> parameters of .led_blink_set callback, I didn't get around to posting it yet
> it seems. It seems the other in-tree users only use delay_on/delay_off
> parameters of their .led_blink_set callbacks to decide whether or not to
> blink and that's all.

I had a quick look at the PHY drivers.

marvell.c: m88e1318_led_blink_set(). Sets the LED function to blinking
with an 84ms off/on period.

air_en8811h.c: air_led_blink_set(). Sets the LED for force_blink with
a 50ms off/on period.

Neither of these drivers use the op to set the blink period when
hardware acceleration is being used for packet RX/TX etc, which is
what this patch is trying to do with the overloaded meaning. So this
is a clear regression.

Going back to the original design philosophy for hardware offload of
netdev blinking, we knew vendors had implemented all sorts of odd
features, because they could. There is no standardisation. The aim of
the framework was to provide a basic set of features which covered
most users needs. We don't need to support ever feature of every
vendor. Does the user really care how fast the LED blinks when there
are packets? So long as it blinks, that should be sufficient. So i
don't actually see any need for this feature, it is just complexity
without any real gain.

	Andrew

