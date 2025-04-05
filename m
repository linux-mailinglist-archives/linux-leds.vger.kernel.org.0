Return-Path: <linux-leds+bounces-4417-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4157A7CBBA
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 21:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475CA3B7EFF
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 19:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE361A8419;
	Sat,  5 Apr 2025 19:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PtlIDsak"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DD2576;
	Sat,  5 Apr 2025 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882775; cv=none; b=VzCa78cxGHhZQy2s0xl/kslLbqfyCMBA1u1LrGjRNyKj5rB7l/8pycjS+9u9zLaF7bU53beLliBHEnirdJQRpPaAvSKB/glINIVQcuYA2LsaErKmUvQ3lVif2Qrp/Wjo+80x1ULiFoe3JoEYA8i5Fuw8Y6X6Fz9/Zwt+Y4gmo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882775; c=relaxed/simple;
	bh=wzfGTTk1tUs2vl3DU6HJkdSKgFJf7MAdr0HiiYHGI0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1CVDvDZTAkPqtM80Cq5tHdOKio/CuqNY2sAkUXdyxsBTIZT2DTWbUwT8i6MTAolwMuYHbvBAhP5gMoTFka5ETs8wVSPZ6ud9vXGACGJ1JerzoTLpkcCQUvw8D2quAb61Fj5+Nx5SHQM0yiGR6KkpPLAUO77FlzllAQTSnwRiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PtlIDsak; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9YVFCQBqNQBraP+VG4DtQCRrCM9PzrsK/soBAdj4eH0=; b=PtlIDsakjusSSXog3kBEwYVcrJ
	XPgKxc/PgYRzMalCWTnbu7liiE5MDl6aDPpFwdA81rqy7bW/IJQ/yx1jTAlaCR0rRM6evg80/LTdL
	vUlYWdjxlCyR+EujSzqNQJkRZdXHL2YqYov/yHHm3LSyhrixI7hu+0j9XbUytxTDB5qA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u19ZL-0087yR-Jo; Sat, 05 Apr 2025 21:52:43 +0200
Date: Sat, 5 Apr 2025 21:52:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: lxu@maxlinear.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, lee@kernel.org,
	linux-leds@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next,v2 2/2] net: phy: mxl-gpy: add LED dimming
 support
Message-ID: <36ab1cd6-65fa-4124-b9a0-f4082936e04f@lunn.ch>
References: <20250405190954.703860-1-olek2@wp.pl>
 <20250405190954.703860-2-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405190954.703860-2-olek2@wp.pl>

On Sat, Apr 05, 2025 at 09:09:54PM +0200, Aleksander Jan Bajkowski wrote:
> Some PHYs support LED dimming. The use case is a router that dims LEDs
> at night. In the GPY2xx series, the PWM control register is common to
> all LEDs. To avoid confusing users, only the first LED used has
> brightness control enabled.

I don't know the LED subsystem very well. But struct led_classdev has:

        /* Get LED brightness level */
        enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);

The fact this exists, suggests the LED brightness can change outside
of the control of Linux. Maybe even your very use cases of one PWM for
multiple LEDs? You might get a more consistent user experience if you
allow the brightness bet set with all the LEDs, and implement this
callback so the current brightness can be reported per LED?

Lets see what the LED subsystem people say?

	Andrew

