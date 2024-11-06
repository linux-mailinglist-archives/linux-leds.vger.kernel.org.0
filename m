Return-Path: <linux-leds+bounces-3312-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA19BE51A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 12:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6541C20D52
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B7A1DE2DF;
	Wed,  6 Nov 2024 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSg9NINL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CFA1DC734;
	Wed,  6 Nov 2024 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890922; cv=none; b=lh+qxI7gdMA5mqHQC4SmvkE0dSHLFBT+ooUONFfZxBlmqstw+cJPL38Ny7hxMFJ9Kq5MrgjHo1TLYT/OZobkieV+S2GtgHT3W6/GWN76v4Subu0jYA+lraflz0pQNROWOo786CNX3S7J/hUPIucOYggqEpYg9GtINu4Mjuoz4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890922; c=relaxed/simple;
	bh=R4KFIpTwSYwi0uSTr4qqyTaoElUcnWINoFL/IwPq+6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhhA1T1OMZyT853N6hV6w0vaoEwXrqjOSpGwgOx6xFpPxsepCvwYDp6mHlc+goB01N0d0v1eVQat49+mr8XOY7WNKzK0bJSBvHU+Is4ge8VI/P2Pf8ODElnv3N1rTstqHSJo4FJ85jDMwmU8vYkV2wRI8+W4+O2nuFFc620+u+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSg9NINL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AB4C4CECD;
	Wed,  6 Nov 2024 11:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730890922;
	bh=R4KFIpTwSYwi0uSTr4qqyTaoElUcnWINoFL/IwPq+6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSg9NINL3R1lnxQ7wJvkKF2/r1poB6BGYDQXWyGUchyJkytMyV1TsgUvAqcEv0frq
	 WLAHXnmiRKUZipI5y/cCOmR77kqvRNA+I3wRDLI97UZIbSpcVELBKdIlOHi12B1PxV
	 Rt8iaW/62qf0oAAyolbkPPE2p6T/6N+t/Z1qa2qJMoaBwUBijpBFZ/is6GOiQRajys
	 Z/CDwCftb2a5U8kCBvAnok3JSCvhVCxAGxWQTINCrP5kKFomGaJgMYhdURg5uSof5v
	 frD6XXrgfKx2JBzoT7uSs8UF+EW9YKjdGbEBvzbEQP8HlD5Peqnr/Mqrs4YcPudCRz
	 621hjCV/w/t9w==
Date: Wed, 6 Nov 2024 11:01:56 +0000
From: Lee Jones <lee@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 01/12] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <20241106110156.GS1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-2-kabel@kernel.org>
 <20241106102840.GN1807686@google.com>
 <87msic8wh7.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msic8wh7.fsf@BLaptop.bootlin.com>

On Wed, 06 Nov 2024, Gregory CLEMENT wrote:

> Lee Jones <lee@kernel.org> writes:
> 
> > On Mon, 04 Nov 2024, Marek Behún wrote:
> >
> >> Move the command execution functions from the turris-omnia-mcu platform
> >> driver private header to the global turris-omnia-mcu-interface.h header,
> >> so that they can be used by the LED driver.
> >> 
> >> Signed-off-by: Marek Behún <kabel@kernel.org>
> >> ---
> >>  .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
> >>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
> >>  include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
> >>  3 files changed, 136 insertions(+), 131 deletions(-)
> >
> > Who needs to Ack this for me to take it via the LED tree?
> 
> Usually, it's Arnd who takes these patches, so it could be him who needs
> to acknowledge them. However, Marek is the maintainer of this driver, so
> I think it's already okay for you to take it.

Okay, let's leave it for a little while.

If Arnd does not protest, I'll take it in for v6.14.

-- 
Lee Jones [李琼斯]

