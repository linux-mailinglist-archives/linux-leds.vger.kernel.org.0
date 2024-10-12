Return-Path: <linux-leds+bounces-3084-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BF99B648
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2024 19:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7694283423
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2024 17:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC1081AC6;
	Sat, 12 Oct 2024 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kUaoHc2N"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4F80C13;
	Sat, 12 Oct 2024 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728754211; cv=none; b=GXHZbH2jCgPqDb6J53W9pcvsficVWEpbGoCCFPkFccTWH+BRBrmVgf1gQuGSJwovv18NwUU/2waBnH4L0xaOC7GK38/qW7SFKN3eCDCfXaCLCAqAMa0u4tnRK6KTcmemmHSFuYUTJPUBXzDe1+gC+Ti2yKiy8aopq25ryB4WQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728754211; c=relaxed/simple;
	bh=F4HMD3Kair+xdbSSDMsfamj2TZkUyOVqdk3NYwMIONE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyGX31bHVba7qwN+2LN0AdtlXWxRWSWTMrC8QxjZVVusfDvrYboHGfpAXYTwvwAS7HwEgUWFB56G5DwEObeDfiRA5cQWy2C49oB6RXK7Kyqua7TUMEm2Li47Oob93Htd1HayPQ38JwBUY7kkqlSUPZf6ff9aXWTIYhPt1dhFD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kUaoHc2N; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=71BSTdIyrfjerwIGqojoGIBnSEV0WkvBXwqhEQC6Psk=; b=kUaoHc2Nd5nP51QZEkWvhzTTw4
	XQY6t4b3R7VZZOFilNyUmEPyo714gLirROrgsFeTIyI6DWtnEU04ZMP4jFGclW5s7G5YEpAbSC8xb
	XqsNhyvep1NTfnrr9ZWTeUtzeC0hV3IjQhH8ttZ1yOIYWK4n91zf9jiVoRxx/PeEsbr8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1szfwB-009oI7-CW; Sat, 12 Oct 2024 19:29:55 +0200
Date: Sat, 12 Oct 2024 19:29:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xu Liang <lxu@maxlinear.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/5] net: phy: aquantia: correctly describe
 LED polarity override
Message-ID: <632c399a-ea41-4323-a754-e6588751ad4f@lunn.ch>
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
 <86a413b4387c42dcb54f587cc2433a06f16aae83.1728558223.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a413b4387c42dcb54f587cc2433a06f16aae83.1728558223.git.daniel@makrotopia.org>

On Thu, Oct 10, 2024 at 01:55:00PM +0100, Daniel Golle wrote:
> Use newly defined 'active-high' property to set the
> VEND1_GLOBAL_LED_DRIVE_VDD bit and let 'active-low' clear that bit. This
> reflects the technical reality which was inverted in the previous
> description in which the 'active-low' property was used to actually set
> the VEND1_GLOBAL_LED_DRIVE_VDD bit, which means that VDD (ie. supply
> voltage) of the LED is driven rather than GND.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

