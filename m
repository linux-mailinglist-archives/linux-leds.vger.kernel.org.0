Return-Path: <linux-leds+bounces-3550-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C21559E9A02
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 16:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5795D166DAD
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 15:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97CF1C5CAF;
	Mon,  9 Dec 2024 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XQynOSxf"
X-Original-To: linux-leds@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5110E1A2392;
	Mon,  9 Dec 2024 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756712; cv=none; b=loPUamuNg4/xr1ElG3Y0T+gogS4Uubk8v5uLabdOu2rKOyQt2TqgG4hAT932axXH+HZ2aBcRpaTCteMSucRaQBbbE4tDPikMdsoypisIe10mzdCCp4J6rVSKRHvpAY4KYtzukoVvnG58Kb56rP5bjkGcRXKsE5nDpShXiJM2uQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756712; c=relaxed/simple;
	bh=9XjJLLBjdUK7G6tIajiloTXf4bXlnh38KVKc1NP51VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K15jqYh97WUzGaiBfEsi90Fq5RdNJDvGccRtnMQLCWKaL7giuGd2V7HBEo3JsDwP+9zKiI29G2/+i/6ng679T+0jDC0rQgQlecGxwKZRtwLBQcPu8M5XQCDVQvkcL5qkjWDlv6tO36ORiQH3d4SZwKN5iVjOR+fO7j2bZAnNvSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XQynOSxf; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B9F54WK122706;
	Mon, 9 Dec 2024 09:05:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733756704;
	bh=D6X8Rn9jbUQ+esL1GB5A8GdEaY6tx/Qp5esXRH9z34w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XQynOSxfR3c7kxv2rWxnN+vHej23fASMUuaAPLJZZcS3qN6L0rVi7pureAjHt5WTJ
	 v/vVeUafLuEI77WR+LIQ2kY9QqiFPOV3akEjmGBYQ8mCmaME5q0C8ltA4fJ7IKBc7q
	 CY51+HuhSnPuCqmYKjhLD4R2qWTGhiJ+ajchEuGA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9F52LN018534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Dec 2024 09:05:04 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 09:05:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 09:05:03 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9F52Sa091874;
	Mon, 9 Dec 2024 09:05:02 -0600
Message-ID: <d1122a33-5735-4000-98b3-ae9b1ed73008@ti.com>
Date: Mon, 9 Dec 2024 09:05:02 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
References: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
 <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>
 <8e1122977b316ca16e9eec0850ed470c31ae9f24.camel@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <8e1122977b316ca16e9eec0850ed470c31ae9f24.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/9/24 8:35 AM, Sverdlin, Alexander wrote:
> Hi Andrew,
> 
> thanks for the prompt review!
> 
> On Mon, 2024-12-09 at 08:29 -0600, Andrew Davis wrote:
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: I2C slave address
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +  enable-gpios:
>>> +    maxItems: 1
>>> +    description: GPIO pin to enable (active high) / disable the device
>>> +
>>> +  vled-supply:
>>> +    description: LED supply
>>> +
>>> +patternProperties:
>>> +  "^led@[0]$":
>>> +    type: object
>>> +    $ref: common.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      reg:
>>> +        description:
>>> +          Index of the LED.
>>> +        const: 0
>>> +
>>> +      function: true
>>> +      color: true
>>> +      label: true
>>> +      linux,default-trigger: true
>>> +
>>> +    required:
>>> +      - reg
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/leds/common.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        led-controller@2d {
>>> +            compatible = "ti,lp8860";
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            reg = <0x2d>;
>>> +            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>> +            vled-supply = <&vbatt>;
>>> +
>>> +            led@0 {
>>
>> So same comment I made in the pre-public review, lets see what the DT
>> folks think:
>>
>> I don't think we want to have the "@0" node naming. It forces us to
>> add the "reg =" below, and that then forces us to add the #*-cells above.
>> All this to work around not just calling the node "led-0". The driver
>> doesn't care either way, and there are no in-tree users of the old way,
>> so now should be a safe time to fix this while converting the binding.
> 
> If I understood you correctly here:
> 
>>> And one channel controlling the others is only in this "Display Mode",
>>> but the currents to the others can be independently controlled in a
>>> different mode (seems these modes have less features which is probably
>>> why the driver doesn't make use of that today).
> 
> then some mapping between subnode and HW channel would be required.
> We probably don't want to parse a node name in this case and carve out "-0"
> part of it, in such case a well-defined property, such as "reg" would be
> required.
> 

We are not the only driver to do the "-#" method. Although yes just
using reg is easier for the Linux driver.

> So preserving the status quo looks more future-proof IMO.
> 

There will only ever be up to 4 LEDs, but you give fair points. No
strong preference from me then, and everything else looks good to me,

Acked-by: Andrew Davis <afd@ti.com>

