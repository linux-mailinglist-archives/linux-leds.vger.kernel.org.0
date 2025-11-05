Return-Path: <linux-leds+bounces-6018-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D9C375A4
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 19:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 029954F1B3F
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EEB28489A;
	Wed,  5 Nov 2025 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DMWnxMtC"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459B1261B8C;
	Wed,  5 Nov 2025 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367736; cv=none; b=Yj+aKM5BK5i+yHYIpzB4eMOg/cz+95AazhtbO7a4pH141CpCDegLiIwav8nziC+vEPJheLj/SjNvFT51RPpak2e+0Ee+2EHByhKQIoERwj/kmj2Zdq8oXFDlpWIlr0RqG4Rx4t+/VtprpAHjX/NoklPcrZOwzrDDUIZ9DefZNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367736; c=relaxed/simple;
	bh=vHDCXTaIfWhkhZfvI9HtlKPpn/+0+WZlcUbjNDsPP74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFavwzltWhpbZJeXm7HEPzSsuMesb970nQiU0gGWUzw9cEIClF9PHchQr+0YdhX5uFL4d6XvwpBmkF2tb5tTUo+d1wk0hop9qpPnR3+19q+4G/YFMBFlRtO+EhU7qq3bTvszOy7c8Ny95EmCEIr9bLO0gvgpUFdW7mFJKhsyJcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DMWnxMtC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gr+fuIZVMsvAB/4PFLwSP+MU9/cNRU8q+NVEIzxyzsc=; b=DMWnxMtCsq0D0tbGXds9Jlq92p
	6kWZFYL/VDxkTLUcWlf5Sj2o2Bs/yoUqEZ863Xf8Vg7QITqHw2GD7+fZjG1g3z8NLUI9PgkTcaSdl
	u/J07eG9/5iviqz9saqGsvvrvioG32NJgerH5vSyX7Hgc6SLnXgw0IuotSFLcYOym8PE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vGiLy-00D1wa-KD; Wed, 05 Nov 2025 19:35:30 +0100
Date: Wed, 5 Nov 2025 19:35:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
Message-ID: <7be43544-20fe-4471-9fe4-1c8f82ad56ef@lunn.ch>
References: <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
 <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
 <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
 <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch>
 <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
 <CA+V-a8snRfFrZeuJ7QSt==B5vWAyTpHzdNj0Jx6oz_aaozbGYQ@mail.gmail.com>
 <b7454a3f-fac8-4789-a3ef-baf341aea8f0@lunn.ch>
 <CA+V-a8v_1u2jGVRRKQCS7ZvvjKORrHjEBdTthjAF91LYEhvYYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8v_1u2jGVRRKQCS7ZvvjKORrHjEBdTthjAF91LYEhvYYQ@mail.gmail.com>

> # ls
> brightness  device  device_name  full_duplex  half_duplex  interval
> link  link_10  link_100  max_brightness  offloaded  power  rx  rx_err
> subsystem  trigger  tx  tx_err  uevent
> 
> As per HW manual [0] we have,
> 0: Combine enabled (link/activity, duplex/collision).
> 1: Disable combination (link only, duplex only).
> 
> # Combine DISABLED (link + duplex only)
> echo netdev > trigger
> echo 1 > link
> echo 1 > full_duplex  # or half_duplex
> echo 0 > rx
> echo 0 > tx
> 
> # Combine ENABLED (link + activity + duplex + collision)
> echo netdev > trigger
> echo 1 > link
> echo 1 > rx
> echo 1 > tx
> 
> So to Enable/Disable LEDx combine feature we just need to write as
> above. Is my understanding correct?

Yes. The PHY driver gets passed a bitmap of each features to
enable. Looking that those bits you need to decide on the 4 bit LED
mode value, and the combine bit. Or return -EOPNOTSUPP.

	Andrew

