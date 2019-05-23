Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FED27EBE
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 15:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfEWNul (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 09:50:41 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48658 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730495AbfEWNul (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 09:50:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NDoZ0m014524;
        Thu, 23 May 2019 08:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558619435;
        bh=/iyye2ek1YfSfYPIG48/zDexo+U1o6msUMjecZkKJRM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LHZwAGCCYUWq9VqkVBw3MhZ8eXZxwmXIfjd17OttBn/Eg1MN3UiaNY00krWK8vJd/
         8zls0QeBunaBK71mBdnO/wJW3dkAq96ny+v5zUaWognQ8XWEgp933Bmi13kMFGaSvg
         Ve+BLb5rhBKMblbWABwcgDXRA+u0HyJr1prB9Nhs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NDoZhJ041563
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 May 2019 08:50:35 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 08:50:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 08:50:35 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NDoYpv115882;
        Thu, 23 May 2019 08:50:34 -0500
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
To:     Mark Brown <broonie@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <lgirdwood@gmail.com>, <lee.jones@linaro.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
Date:   Thu, 23 May 2019 08:50:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523130311.GA17245@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 5/23/19 8:03 AM, Mark Brown wrote:
> On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:
>> The use of and enablement of the GPIO can be used across devices.
>> Use the enable_reg in the regulator descriptor for the register to
>> write.
> 
>> @@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
>>  
>>  	if (gpiod) {
>>  		cfg.ena_gpiod = gpiod;
>> -
>> -		ret = regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
>> +		ret = regmap_update_bits(regmap,
>> +					 lm363x_regulator_desc[id].enable_reg,
>>  					 LM3632_EXT_EN_MASK,
>>  					 LM3632_EXT_EN_MASK);
>>  		if (ret) {
> 
> Is it guaranteed that the bitmask for enabling the use of the GPIO is
> going to be the same for all regulators?  The bitmasks for the regulator
> enable look to be different, and it also looks like this setting might
> affect multiple regulators since it seems there are multiple enable bits
> in the same register.  If this affects multiple regulators then how's
> that working at the minute?
> 

Yes for the 3632 and 36274 bit0 is the EXT_EN for LCM on these chips.
LM3631 does not have LCM GPIO control so there is no setting and this should not be called.
If it is then the developer implemented the DT wrong.

LM3631 - No LCM GPIO control

LM36274 reg 0x09 bit 0 7.6.9 of the data sheet
LM3632 reg 0x0c bit 0 7.6.12 of the data sheet

Dan
