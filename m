Return-Path: <linux-leds+bounces-3823-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4421FA168DE
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 10:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9CB3AAAB2
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 09:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB33E1A3029;
	Mon, 20 Jan 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="DappAe4w"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF581A08DB;
	Mon, 20 Jan 2025 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363761; cv=none; b=EH26jweegrD3BbX7vOJ8GjUmJKQKEMFMDWsp8GIavR4b/tXtasJoO23wTR2HU7uv3Hs5eUF+0zS7mPULdiv6u1JzLOJ5D84ujSGZ5r515xj0a4bcDghiukUFL3v55p2siax7K7pBjYKwSCMKIaTTmTA8Vima8eoWj/qSvU+DTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363761; c=relaxed/simple;
	bh=NJg/pxlzN4E+YFfX6S0qGCp1dcEcHehVmY/W+03duw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HH/UoLWTbvQx7Is2ntYk+HElpSA7fEzjEJ4mEeI1z0+lFJ2Q0SCdl4mc+Gg8yzl5SSpBO/q2ZAmQM7dYfs3fV7UDcdRT3xjsUJtkqT4Yod7qu5uBYCxRDP2ODTEXyhAeraEYlAJUiz9V2s0CzwTPlnZMZ04DdTPJtIPmmfFTQWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=DappAe4w; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 821131048B8A7;
	Mon, 20 Jan 2025 10:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737363757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zE4hEwDwCToOHSZtQ7o/fNS7oe4K5nCBuE/9qSztkBs=;
	b=DappAe4wcBjVvxb7Fr65iJbmDyVOJ/jaiik1WBZVT2tsX4TBRlyhqIxpGA9q6AAVZCq9vZ
	aU5bxR0V00F79lpNKKrS79eCjUneX1lZ7WpVig9/Rm85irnvghbmjcS8r/ZAKsUeiC6mGc
	9fBMliR8y82Xqpl4z9m+VvLdcuq/aQlHPqtL2duF5ko8cDznhcW8BaboE610tGI0kXghQX
	OqrI5sti38/ETxOt1G4m0qwpUMfWAT0BLIxBu30vEbmwEUNOvEiVBaH5eNAuwmDkfUr7K9
	iwQQp0NZlaeXNAMfulvbFeZtC4p1Ot5bZzpH8OlPc+b4hffvH+BLtNR+tQ+gjw==
Message-ID: <197f3134-96fa-484f-a5f5-36779c54b340@denx.de>
Date: Mon, 20 Jan 2025 10:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: phy: Handle both led@0 and led subnode name for
 single-LED PHYs
To: linux-leds@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org
References: <20250120082609.50445-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250120082609.50445-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/20/25 9:25 AM, Marek Vasut wrote:
> In case a PHY supports only one LED in total, like ADIN1300, and this LED
> is described in DT, it is currently necessary to include unit address in
> the LED node name and the address-cells have to be set to 1:
> 
> leds {
>    #address-cells = <1>;
>    ...
>    led@0 {
>      reg = <0>;
>      ...
>    };
> };
> 
> For a single LED PHY, this should not be necessary and plain 'led' node
> without unit should be acceptable as well:
> 
> leds {
>    ...
>    led {
>      ...
>    };
> };
> 
> Handle this special case. In case reg property is not present in the leds
> node subnode, test whether the leds node contains exactly one subnode, and
> if so, assume this is the one single LED with reg property set to 0.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
Please ignore, V2 is coming with a trivial fix for variable rename.

