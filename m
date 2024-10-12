Return-Path: <linux-leds+bounces-3083-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40AE99B635
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2024 19:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940EA28222D
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2024 17:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF556F06A;
	Sat, 12 Oct 2024 17:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hKe8W7b4"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322EDC133;
	Sat, 12 Oct 2024 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728753858; cv=none; b=oGlMCoZOo5nZo977HVyhvEvKICklCXkbPuY4mLyVLyb/WFucahmNi8lougfFbNJcdmYnoR7SL4dEtra+uLn1QM5PTzVGPOh4rYjt7YO1UbwIi5LmgvApD6Invtg1UQUKMn5QphJFlP/wFXqcx3xL//d8/M1QAr4eKH7H8QTZOaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728753858; c=relaxed/simple;
	bh=N4XoqOD8j/6yjqCTP1nue5zspW8mIRlcm5amoIbTYgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMVp//anwWTPSTx36VYSnzlIj9qZ9NQqDDwglyviVhZuux+jNcSX7ZaiFpWCtDfvHtfobo9gOOQxNFIloscYLhmmjkay7iK3EfDbqxiw2xIEn+kDX6jSuDZtZN9BFsyqQvpDSvIZBj5Cj3LkD5WBme4QFdLan2dCZjZEJpBcVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hKe8W7b4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E5Z1C8i4Znj4Wos9XAj0tRvPohxc/FM9zyA5QqXLAPY=; b=hKe8W7b4fFYXayoWX7fH2HW824
	2e5VfVdWshRGmST7sODJ+KZIrzJsmhWcF6gKdnVlCVWUoKo1UmajOvED8wjW1uOEx+xTNP8/ZQb4+
	VcX/pfkxQNZCBkeMUk80B1PAb/Fbfv7sIzmKK5G2rvdIVSsY9ApmLcTajW6ushGd7w4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1szfqU-009oGL-D1; Sat, 12 Oct 2024 19:24:02 +0200
Date: Sat, 12 Oct 2024 19:24:02 +0200
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
Subject: Re: [PATCH net-next v2 2/5] net: phy: support 'active-high' property
 for PHY LEDs
Message-ID: <89eb6d9e-a22a-4300-81c6-9cb27feb11ea@lunn.ch>
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
 <91598487773d768f254d5faf06cf65b13e972f0e.1728558223.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91598487773d768f254d5faf06cf65b13e972f0e.1728558223.git.daniel@makrotopia.org>

On Thu, Oct 10, 2024 at 01:54:19PM +0100, Daniel Golle wrote:
> In addition to 'active-low' and 'inactive-high-impedance' also
> support 'active-high' property for PHY LED pin configuration.
> As only either 'active-high' or 'active-low' can be set at the
> same time, WARN and return an error in case both are set.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

