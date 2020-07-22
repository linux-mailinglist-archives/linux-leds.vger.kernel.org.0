Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C25228CF8
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 02:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGVAFZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Jul 2020 20:05:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46604 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgGVAFZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2020 20:05:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06M05DNQ130836;
        Tue, 21 Jul 2020 19:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595376313;
        bh=BaVl8BMz9uCrVtWj8q6K5EptiOMW/J/P4Io6v+g3r48=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=oD8YLncuwpqLVfP44aad7yVfnnIbBiWWZQDlL+0IbEHVFexNY88DyDBtIKnkoBuc3
         B9iTHy/zDVPctK+VYwk96rpNScnZVcPiF3nf5lTInI81JWFnDsMWDOmC/LNt+3yNQx
         uKy7CNAlsmTxJqCJw0QMrYBMty7MFjOQhzzRJkmA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06M05D0m058564
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 19:05:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 21
 Jul 2020 19:05:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 21 Jul 2020 19:05:13 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06M05DVv046850;
        Tue, 21 Jul 2020 19:05:13 -0500
Subject: Re: [PATCH v31 03/12] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-4-dmurphy@ti.com> <20200721210724.GD5966@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <59d0a02c-cfae-1170-728d-2ae332a81f6e@ti.com>
Date:   Tue, 21 Jul 2020 19:05:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721210724.GD5966@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/21/20 4:07 PM, Pavel Machek wrote:
> On Thu 2020-07-16 13:19:58, Dan Murphy wrote:
>> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
>> The difference in these parts are the number of
>> LED outputs where the:
>>
>> LP5036 can control 36 LEDs
>> LP5030 can control 30 LEDs
>> LP5024 can control 24 LEDs
>> LP5018 can control 18 LEDs
>> LP5012 can control 12 LEDs
>> LP5009 can control 9 LEDs
>>
>> The device has the ability to group LED output into control banks
>> so that multiple LED banks can be controlled with the same mixing and
>> brightness.  Inversely the LEDs can also be controlled independently.
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> +/*
>> + * struct lp50xx_chip_info -
>> + * @num_leds: number of LED outputs available on the device
>> + * @led_brightness0_reg: first brightness register of the device
>> + * @mix_out0_reg: first color mix register of the device
>> + * @bank_brt_reg: bank brightness register
>> + * @bank_mix_reg: color mix register
>> + * @reset_reg: device reset register
>> + */
> Should have /** if this is kerneldoc.
>
>> +		init_data.fwnode = child;
>> +		num_colors = 0;
>> +
>> +		/* There are only 3 LEDs per module otherwise they should be
>> +		 * banked which also is presented as 3 LEDs
>> +		 */
> This is not usual comment style for kernel. (And add . at end of
> sentence).

I will fix both.

Dan


> Best regards,
> 									Pavel
