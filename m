Return-Path: <linux-leds+bounces-3836-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3630A17D74
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 13:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D14188BC7F
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 12:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647BD1F152D;
	Tue, 21 Jan 2025 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="b9PruH7t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF11F0E49;
	Tue, 21 Jan 2025 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460982; cv=none; b=m/zzmG3TEUIK8PczCd0SQyda2Ilpp1A49kF0+odKx3tGkyPFQyvfCKVYABWz0b/oEkmj5018os29o0VGNYwdrK0Stlskv81XsdUr//QMx7WpsbwwlGSPJOgAgzRiQXIQ9v0WTFhmdHo/vYwZOP6JvH/GBY2LR5WbPmXlKC9D1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460982; c=relaxed/simple;
	bh=tPrJ5jjHLltiUAj7gfhaYo12/BtKmyn2DmWvKMt1SZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSE6NlllwxqJ8rPh3L/rd4Y4LmTwoTA8Y3oScSg9abFM8StzklJCrxqoc0tyfkCZSgI9QL8qTcU3a8Rk/+dtCOJ2S+tJVys5GX8KyLbmWplqQiZnvzuyfzB0DoJW1PSbVCjifSLThnAWvId7NwzJqsAOji2uq6Uv69Q8nid62KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=b9PruH7t; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3865F104811E3;
	Tue, 21 Jan 2025 13:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737460978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j4WtQ+/mRNKeD/HgDlXat69eX1wWTNQU0Q0aL7ZOqwo=;
	b=b9PruH7tV4DqXYdGfdTR4q7x0Njwpq6K1UxdY9AvO3JHM+PbntpCfiqabJDH66jhxU5vYZ
	lrRRKayoZUZXZgC7+FgWnjSyUqAGr4CP00Npm7vja9kNONzbEQjVeBw6C/TljCjiUrM79t
	DsST8M0AkFEg1Eeqd3OCLGQ5/AXQpQwZFEIATRJmzHAlSFedl9DItso3w4A/pwrI01S/sj
	As1TBljKNUGxqQCN42s6n2UAFSHAOC33VfOaBqodpb4j5NcPLKbv361ILVytLMDG5W0VZE
	4lx1HXC3Y2wVeYZK1adrGpUkeASZ/LJLSklTq8QtBOa+SAUxzpl6fNns4/hbpQ==
Message-ID: <521f9c3c-2979-4308-94ba-ced2cb430eaa@denx.de>
Date: Tue, 21 Jan 2025 12:53:41 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: phy: Handle both led@0 and led subnode name for
 single-LED PHYs
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org
References: <20250120090256.54382-1-marex@denx.de>
 <f2a4d89c-d633-4b18-bc0e-2994a0f76b9e@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f2a4d89c-d633-4b18-bc0e-2994a0f76b9e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/20/25 5:35 PM, Andrew Lunn wrote:
> On Mon, Jan 20, 2025 at 10:02:46AM +0100, Marek Vasut wrote:
>> In case a PHY supports only one LED in total, like ADIN1300, and this LED
>> is described in DT, it is currently necessary to include unit address in
>> the LED node name and the address-cells have to be set to 1:
>>
>> leds {
>>    #address-cells = <1>;
>>    ...
>>    led@0 {
>>      reg = <0>;
>>      ...
>>    };
>> };
>>
>> For a single LED PHY, this should not be necessary and plain 'led' node
>> without unit should be acceptable as well:
>>
>> leds {
>>    ...
>>    led {
>>      ...
>>    };
>> };
> 
> So how do other subsystems handle this? SPI with only a single chip
> select line?

I believe for SPI, it is always mandatory to have 'reg' property.

> Standalone LED controllers with a single LED?

The GPIO LEDs driver does not enumerate the LEDs at all, so there is no 
'reg' property needed in any case, but I don't think this is really 
applicable for the PHY LEDs, which depend on the ordering within each PHY.

> A PWM with a single output?

Reference the controller node itself, similar to how single output clock 
controller works.

>>   drivers/net/phy/phy_device.c | 15 +++++++++++++--
> 
> What about the device tree binding? Does it already have the reg
> property as optional?
Documentation/devicetree/bindings/net/ethernet-phy.yaml does not, but 
that can be changed if desirable . If not desirable, then I can just 
discard this patch ?

