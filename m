Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914363CAE8
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 14:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfFKMRQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 08:17:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60314 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfFKMRQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 08:17:16 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BCHBRn079570;
        Tue, 11 Jun 2019 07:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560255431;
        bh=Ei7/kusf0DKtFGr5yCgtc2sRG6+/0j75KPNwiUUozVs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wYreh9jMavyAXrUj81MzhvXZhlNCzekJOtu1ss7PfKYQ7WiUKyVQ1b+Frc/MHGJwc
         8lrCHJagrSPoVq4JDawlMYpg+Idt2qBJ43RB/sJLQ+OzHJd6TDsb2bR9kDwBG1gHoQ
         S9HHJoPw0c6VqlEnELOGuz8tWXrjvYJyhKh8lFio=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BCHBK1042554
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Jun 2019 07:17:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 11
 Jun 2019 07:17:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 11 Jun 2019 07:17:11 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BCHALV102129;
        Tue, 11 Jun 2019 07:17:10 -0500
Subject: Re: [PATCH v6 0/5] LM36274 Introduction
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <cb41fea8-4cc6-bf0d-8006-6441ba8f2213@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d6f3a1d9-5198-917c-8313-ef2036472ce9@ti.com>
Date:   Tue, 11 Jun 2019 07:17:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cb41fea8-4cc6-bf0d-8006-6441ba8f2213@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Reviewed and tested the updated branch.  Looks good to me.

Dan

On 6/5/19 2:31 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the v6.
>
> Patches 4/5 and 5/5 don't contain amendments I made to
> the respective patches on the ib-leds-mfd-regulator branch
> (that address issues raised by Pavel), so I just kept those
> unchanged. Besides that I updated the remaining ones.
>
> Please check the ib-leds-mfd-regulator branch. I'll create a pull
> request once I get a confirmation from you saying that everything
> is as expected.
>
> Best regards,
> Jacek Anaszewski
>
> On 6/5/19 2:56 PM, Dan Murphy wrote:
>> Hello
>>
>> The v5 patchset missed adding in the new validation code.
>> Patch 1 of the v5 series was squashed into patch 4 of the v5 series.
>> So this will reduce the patchset by 1.
>>
>> Sorry for the extra noise on the patchsets.  The change was lost when 
>> I converted
>> the patches from the mainline branch to the LED branch.
>>
>> This change was made on top of the branch
>>
>> repo: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>> branch: ti-lmu-led-drivers
>>
>>
>> Dan Murphy (5):
>>    dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>>    mfd: ti-lmu: Add LM36274 support to the ti-lmu
>>    regulator: lm363x: Add support for LM36274
>>    dt-bindings: leds: Add LED bindings for the LM36274
>>    leds: lm36274: Introduce the TI LM36274 LED driver
>>
>>   .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>>   .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>>   drivers/leds/Kconfig                          |   8 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>>   drivers/mfd/Kconfig                           |   5 +-
>>   drivers/mfd/ti-lmu.c                          |  14 ++
>>   drivers/regulator/Kconfig                     |   2 +-
>>   drivers/regulator/lm363x-regulator.c          |  78 +++++++-
>>   include/linux/mfd/ti-lmu-register.h           |  23 +++
>>   include/linux/mfd/ti-lmu.h                    |   4 +
>>   11 files changed, 437 insertions(+), 8 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/leds/leds-lm36274.txt
>>   create mode 100644 drivers/leds/leds-lm36274.c
>>
>
