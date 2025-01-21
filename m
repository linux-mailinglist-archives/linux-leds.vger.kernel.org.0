Return-Path: <linux-leds+bounces-3837-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1864A17D77
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 13:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F141F188BC57
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 12:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22701F1929;
	Tue, 21 Jan 2025 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="azlEFBnp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D01F190E;
	Tue, 21 Jan 2025 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460984; cv=none; b=b2T7wOs1p5VM7BxxJV+ILmTFihqnKX8k0mmPIB5PjRtoaLtWSFHtEDAor6RuIfC/yQ+xo6+gLtFvkloLHqLexqIBCKh0lM2KNXaTfATz85JNoa+2w8KN1Mkp9kxRJNjKB6gbhqgH3+pLSqPwVR7qzXF48fDU5B53gQ2r0bh6YwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460984; c=relaxed/simple;
	bh=SSKcj+ZCYXAP4XCyRJVat3KbUG53wj7IgRB6pc1Za/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noW/n21EzgZb+OUvLnKG0YniXfgAC/Y2Owp7DBvZkPVZwJDzTbxsO1NLnAs302ui1ubL3MPnAVOCHuTXmPdgPBFseYaEBVn0ybtjUFK0OPEyMg6yEI3XavCJphQg+RWtMQ+8J/U8w5Ki/Qi3kQpb93/OWhPM2LNJlH/k9DqnVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=azlEFBnp; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68501108ECC22;
	Tue, 21 Jan 2025 13:02:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737460974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWLTnshKJss0C5hixpOZt9oVL4A4PlDNq+o3owNK/5A=;
	b=azlEFBnpnC34/WvcJE3D09uOanxdxBzy3PvSqriuytwoPI6630ywtrz5kpNAJfDUFNMdgg
	M6Vo72c8lKQ2mAmtVxiWLspRpP6h1ZV30AW8DXDw2DUmuB01k2vdrYcsN/xPCttMVLpuMS
	FguPtvQfYMwUcLLg3Vl+Ot5YIswADhqmJ8eDHz1L5MpaQtZxPyI9pwvF+Hq5L8HHMJzD9s
	ZxSo6LCW5ZkOhSiqi/LPmJen9liyaobANgteY5a22WWsq6hOunFlF9O3R8AQyD1qe6bxhX
	I3Wz1bwMt8TSs4KqScBjpDUY67/kAyjdzW71f5emRG3ngSLAfZDVPARAszjOeQ==
Message-ID: <30c39bb9-2b45-43a6-b5f1-f7957ce5a666@denx.de>
Date: Tue, 21 Jan 2025 12:37:34 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20250113002346.297481-1-marex@denx.de>
 <ad334b1b-a4e5-426d-a801-3e1d72455304@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ad334b1b-a4e5-426d-a801-3e1d72455304@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/16/25 2:32 PM, Andrew Lunn wrote:
> On Mon, Jan 13, 2025 at 01:23:37AM +0100, Marek Vasut wrote:
>> Document netdev trigger specific netdev-trigger-mode property which
>> is used to configure the netdev trigger mode flags. Those mode flags
>> define events on which the LED acts upon when the hardware offload is
>> enabled. This is traditionally configured via sysfs, but that depends
>> on udev rules which are available either too late or never in case of
>> non-Linux systems.
>>
>> For each LED with linux,default-trigger = "netdev" described in DT, this
>> optional netdev-trigger-mode property supplies the default configuration
>> of the PHY LED mode via DT. This property should be set to a subset of
>> TRIGGER_NETDEV_* flags.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Christian Marangi <ansuelsmth@gmail.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Heiner Kallweit <hkallweit1@gmail.com>
>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Lee Jones <lee@kernel.org>
>> Cc: Lukasz Majewski <lukma@denx.de>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-leds@vger.kernel.org
>> ---
>>   Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>> index 3e8319e443392..1f1148fdf20c0 100644
>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>> @@ -233,6 +233,12 @@ properties:
>>         Maximum timeout in microseconds after which the flash LED is turned off.
>>         Required for flash LED nodes with configurable timeout.
>>   
>> +  # Requires netdev trigger
>> +  netdev-trigger-mode:
>> +    description:
>> +      The netdev LED trigger default mode flags, use TRIGGER_NETDEV_ * flags.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>>   allOf:
>>     - if:
>>         required:
>> -- 
> 
> An example would be good.
> 
> In order to be able to use TRIGGER_NETDEV_* i assume you are doing an
> include which is outside of the usual dt-bindings directory. I don't
> know of the DT Maintainers opinion on that.
I think the question here is more ... shall I introduce new set of 
LED_NETDEV_nnn flags in e.g. include/dt-bindings/leds/common.h , so the 
flags won't be Linux netdev trigger specific ?

