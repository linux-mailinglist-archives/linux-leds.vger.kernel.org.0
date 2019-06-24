Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF335196A
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2019 19:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731262AbfFXRUt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jun 2019 13:20:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36198 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfFXRUt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jun 2019 13:20:49 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OHKgp4080283;
        Mon, 24 Jun 2019 12:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561396842;
        bh=YNkUtWajZtiM9sopHCT/5Y0mKT4JD06PwkeqZVYX7vE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QiDX+xtTz/NfG1c9k7nwjSzLGfmo/HLfMbG50FhY0Pa4OjMqPKm7lSZPfBfe0PnqV
         2Y+UJiGFDIgl+k3rVFf+KXzk40WMdlV7/W5bsTT/4Z6jSLlIxCMqSFEa8zizTXnGdY
         qw030qDerqiN6ih2akJoWA9g9S03IxaQ/zKMDR2w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OHKgvX033882
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Jun 2019 12:20:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 12:20:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 12:20:42 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OHKfTT026570;
        Mon, 24 Jun 2019 12:20:41 -0500
Subject: Re: [PATCH v6 0/5] LM36274 Introduction
To:     Lee Jones <lee.jones@linaro.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190624144217.GJ4699@dell>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3d2aa88c-c21c-b3a9-c8d9-fdb3a8fc3858@ti.com>
Date:   Mon, 24 Jun 2019 12:20:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624144217.GJ4699@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Lee

On 6/24/19 9:42 AM, Lee Jones wrote:
> On Wed, 05 Jun 2019, Dan Murphy wrote:
>
>> Hello
>>
>> The v5 patchset missed adding in the new validation code.
>> Patch 1 of the v5 series was squashed into patch 4 of the v5 series.
>> So this will reduce the patchset by 1.
>>
>> Sorry for the extra noise on the patchsets.  The change was lost when I converted
>> the patches from the mainline branch to the LED branch.
>>
>> This change was made on top of the branch
>>
>> repo: https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>> branch: ti-lmu-led-drivers
>>
>>
>> Dan Murphy (5):
>>    dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>>    mfd: ti-lmu: Add LM36274 support to the ti-lmu
>>    regulator: lm363x: Add support for LM36274
>>    dt-bindings: leds: Add LED bindings for the LM36274
>>    leds: lm36274: Introduce the TI LM36274 LED driver
>>
>>   .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>>   .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>>   drivers/leds/Kconfig                          |   8 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>>   drivers/mfd/Kconfig                           |   5 +-
>>   drivers/mfd/ti-lmu.c                          |  14 ++
>>   drivers/regulator/Kconfig                     |   2 +-
>>   drivers/regulator/lm363x-regulator.c          |  78 +++++++-
>>   include/linux/mfd/ti-lmu-register.h           |  23 +++
>>   include/linux/mfd/ti-lmu.h                    |   4 +
>>   11 files changed, 437 insertions(+), 8 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>>   create mode 100644 drivers/leds/leds-lm36274.c
> Can you finish of satisfying everyone's comments and re-send with all
> the Acks you've collected so far?  If you turn this around quickly,
> you might still get into v5.3.
>

The changes were made by Jacek and I reviewed and tested them

https://lkml.org/lkml/2019/6/11/455

