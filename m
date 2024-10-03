Return-Path: <linux-leds+bounces-2948-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F2798F027
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 15:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 314E91C21950
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624C41990AA;
	Thu,  3 Oct 2024 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="lsWdX9r1"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22241741D4;
	Thu,  3 Oct 2024 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961380; cv=none; b=VLVxj+aTbBrQANhhaAIqc0BodNXxVtZUeM5Hw5ZfHIxCLt3Mm0WMsOcuRrod/Ls1gryOLh1UomvH22hOgBDoG+jhp+7VYLSjcVhEyBGSvIO1O7/pVf86AVODsHVlV44vZNMpQf9OJ5kstGNzqei3SuF+7OcIR/nTDOwVnfe9nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961380; c=relaxed/simple;
	bh=4nxtqFyV76bEZ8LXZ0YjmzB022W4x0MO9bvFq5HdI4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyKEiV0OBY2GTZX/bqqiC/7fk9h50Nt+GMYu/PcsXphzjuZ1YsBr6yl5YAjtWFzpfRnbzCUD9FGVTgzBGlSp/Mm860FL88xGGERsxt730k+xoDfhe5kgkrybm80sWPE9Erz3g5D8HuUV5PIayRB+hwh5qpiBj7YVZ79mw/+kyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=lsWdX9r1; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D78B888C78;
	Thu,  3 Oct 2024 15:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727961375;
	bh=QNI2Ifkjuw3+hHr7PhkjBjn+usr+32yD+CflAXc2zQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lsWdX9r1EwinVgs+8Tw893RPggI001Ps85Jh4jNEgd6Y6ZnoKJtvZnS2IO6P2c9iY
	 t7EIZIXNcktJ5IYhxWStI1rdjkAKxLfzaTb4nbMVt7eurLAl1AGQS7026L/qzuXYJ3
	 Fvd8TZqFwSFIe+sVCDwlZUxT8bdVtYnCbLgvE5XmS4/UEZL57kEp2+7NQRTTxI4EOg
	 nHmIURvpzAMYYE1Wanif5Quzvt/xiiNJynQoB55qpJfxg6i2Iy1tFV3jrlNhfuDyAy
	 qjMcwG4CNWNMV4KuxnYEowAfuwraLeu+HeiYhG1ayGJEImEDlOuJODjNUmfVs0djfh
	 h1XFUEYH5R9lA==
Message-ID: <dcad968d-b305-4c0a-b377-1a147d156756@denx.de>
Date: Thu, 3 Oct 2024 14:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: netdev: Check offload ability on interface
 up
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Daniel Golle <daniel@makrotopia.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
 <796d0096-1cf9-4234-9117-440469c4e9d9@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <796d0096-1cf9-4234-9117-440469c4e9d9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/3/24 2:05 PM, Andrew Lunn wrote:
>>> Nice use of udev. I had not thought about using it for this.
> 
>> Is there some other way to configure the netdev-triggered PHY LEDs ?
>> I still feel the udev rule is somewhat brittle and fragile, and also not
>> available early enough for default PHY LED configuration, i.e. the LEDs are
>> not blinking when I use e.g. ip=/nfsroot= when booting from NFS root until
>> the userspace started, which is not nice. The only alternative I can imagine
>> is default configuration in DT, which was already rejected a few years ago.
> 
> Device tree is the only early way i can think of, especially for NFS
> root.
> 
> What has clearly been rejected is each vendor having their own DT
> binding. But i think we might have more success with one generic
> binding for all MAC/PHY LEDs.

Right now I have this (for one of the PHY LEDs):

led@0 {
         reg = <0>;
         color = <LED_COLOR_ID_GREEN>;
         function = LED_FUNCTION_WAN;
         linux,default-trigger = "netdev";
};

What about be useful is to set the link_10/100/1000 and rx/tx flags here 
somehow. It cannot be 'function' because that is already used to define 
the port purpose.

Maybe something like 'led-pattern' property used by 'pattern' trigger 
would work ? Some sort of "led-netdev-flags = LINK10 | LINK100;" ?

> The way i was thinking about it, was to describe the label on the
> front panel. That is hardware you are describing, so fits DT.
> 
> We are clearly in the grey area for DT, so i can understand some push
> back on this from the DT Maintainers.

It would be a policy, yes.

