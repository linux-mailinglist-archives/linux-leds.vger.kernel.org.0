Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D616C228CF9
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 02:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgGVAFX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Jul 2020 20:05:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49318 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgGVAFX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2020 20:05:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06M050kV122034;
        Tue, 21 Jul 2020 19:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595376300;
        bh=PF4V+O2qLoTetHzWe1R0WHJq5APQt8IGaIyAnbSS8Ys=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=M+b8r0ghaJyudEXFK7tzSfVnh+LR8VhPHDD+ulGW7aGWqxqrY5scurQPjM4KbZfrn
         FhewPReA6muP2YHUlYYgeC1g9Sf1DxtxNla8imREdCT043/UWGOET0UM4s4SiPfNOY
         qhDnIcpxHIAgYdfRdajxKii/S4bHapXUl5hNB/xw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06M050Zi057979
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 19:05:00 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 21
 Jul 2020 19:05:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 21 Jul 2020 19:04:59 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06M04xtU045816;
        Tue, 21 Jul 2020 19:04:59 -0500
Subject: Re: [PATCH v31 03/12] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-4-dmurphy@ti.com> <20200721210554.GC5966@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c774fab9-124b-da2e-6f7c-614f34322942@ti.com>
Date:   Tue, 21 Jul 2020 19:04:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721210554.GC5966@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/21/20 4:05 PM, Pavel Machek wrote:
> Hi!
>
>> The device has the ability to group LED output into control banks
>> so that multiple LED banks can be controlled with the same mixing and
>> brightness.  Inversely the LEDs can also be controlled independently.
> Inversely?
I will revise it.
>
>> --- /dev/null
>> +++ b/drivers/leds/leds-lp50xx.c
>> @@ -0,0 +1,784 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// TI LP50XX LED chip family driver
>> +// Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
>> +
> Can we get https here and in the binding document?
>
> Please run this through checkpatch -- I believe it will have some
> comments.
OK.
>
>> +
>> +	device_for_each_child_node(priv->dev, child) {
>> +		led = &priv->leds[i];
>> +		ret = fwnode_property_count_u32(child, "reg");
>> +		if (ret < 0) {
>> +			dev_err(&priv->client->dev,
>> +					"reg property is invalid\n");
>> +			return -EINVAL;
> is handle_put(child) needed here?

It will be after I refactor the label


>> +		}
>> +		if (ret > 1) {
>> +			priv->num_of_banked_leds = ret;
>> +			if (priv->num_of_banked_leds >
>> +			    priv->chip_info->max_modules) {
>> +				dev_err(&priv->client->dev,
>> +					"reg property is invalid\n");
>> +				ret = -EINVAL;
>> +				fwnode_handle_put(child);
>> +				goto child_out;
>> +			}
>> +
>> +			ret = fwnode_property_read_u32_array(child,
>> +							     "reg",
>> +							     led_banks,
>> +							     ret);
> Move this to subfunction to reduce the indentation? (Or, just refactor
> it somehow).

Actually I can just put it all on the same line since the 80 character 
requirement is relaxed.


>> +			if (ret) {
>> +				dev_err(&priv->client->dev,
>> +					"reg property is missing\n");
>> +				fwnode_handle_put(child);
>> +				goto child_out;
>> +			}
> Create label that does the handle_put so you don't need to repeat it
> quite so often?
I will rework it for  all
>
>> +		fwnode_for_each_child_node(child, led_node) {
>> +			ret = fwnode_property_read_u32(led_node, "color",
>> +						       &color_id);
>> +			if (ret)
>> +				dev_err(priv->dev, "Cannot read color\n");
>> +
>> +			mc_led_info[num_colors].color_index = color_id;
> This uses undefined value.
OK needs to goto to out.
>
>> +	ret = lp50xx_reset(led);
> Does the GPIO need to be disabled before enabling it for reset?

You mean toggle the GPIO?  Yes it should be toggled I will update it.

Dan


> Best regards,
> 									Pavel
>
