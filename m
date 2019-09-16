Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1429CB3C12
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 16:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbfIPOCR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 10:02:17 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37602 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbfIPOCR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 10:02:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GE2Cgc025414;
        Mon, 16 Sep 2019 09:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568642532;
        bh=Xl9b4PUExnfZHvUF7588PZbpU0FSiro9VaaKxw3/RqA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xOUqt/BJM/mVAqg4+62+CpurC6X81OyBNCpBh76mycX9koY14m7bUp9y/KwTWRJiZ
         V2Pajuz/LXxvgt7UTQXg5ee192iA83tJik2SHkdZNI2Mnqn7/cWElbSRp+vcdjfYCp
         K0+I2Ia9UUrCi4byNp6XmtgDQLFpMRUBc8MblNYo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GE2C3d083688
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Sep 2019 09:02:12 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 09:02:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 09:02:10 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GE2Ck0089319;
        Mon, 16 Sep 2019 09:02:12 -0500
Subject: Re: [PATCH v5 9/9] leds: Update the lp55xx to use the multi color
 framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-10-dmurphy@ti.com>
 <1cf766f4-ca88-9114-6e73-a4c5e7460b7f@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f5f179aa-fad7-90d9-5bd7-0f718c549a38@ti.com>
Date:   Mon, 16 Sep 2019 09:03:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1cf766f4-ca88-9114-6e73-a4c5e7460b7f@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 9/15/19 11:28 AM, Jacek Anaszewski wrote:
> Hi Dan,
>
> On 9/11/19 8:01 PM, Dan Murphy wrote:
>> Update the lp5523 to use the multi color framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/leds-lp5523.c                |  13 +++
>>   drivers/leds/leds-lp55xx-common.c         | 131 ++++++++++++++++++----
>>   drivers/leds/leds-lp55xx-common.h         |   9 ++
>>   include/linux/platform_data/leds-lp55xx.h |   6 +
>>   modules.builtin.modinfo                   | Bin 0 -> 43550 bytes
>>   5 files changed, 137 insertions(+), 22 deletions(-)
>>   create mode 100644 modules.builtin.modinfo
>>
>> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
>> index d0b931a136b9..8b2cdb98fed6 100644
>> --- a/drivers/leds/leds-lp5523.c
>> +++ b/drivers/leds/leds-lp5523.c
>> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
>>   	return ret;
>>   }
> [...]
>>   struct lp55xx_predef_pattern {
> Below file seems to have been added to the index by mistake.
>
I will remove it

Dan


>> diff --git a/modules.builtin.modinfo b/modules.builtin.modinfo
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e528d8f57796621b6cfef52ad0da44551a482481
>> GIT binary patch
>> literal 43550
>> zcmcJ2?Q+|=(x(2ta}}twKjNIV<j*)6t(~$X+ldo9*0G$-%sF+IMNyQ*NF)`K@<-~u
>> zoV|v<f%nGt=>|YGNXqfd?pCE75g*+RpaC?x8;w!ycl>2BO|zrh@WId3MUofUG7gi1
>> zeg~})3e2M*O!DyPegBfbM`0dh(V~db<mme9q^|~l3~tY^)aliUI=#90dUn&gPqW$g
>> zWw;DG3qOmC$3=KF3Wv*yH%_x4^s>wg7R&B1P3KKT7wLVNdEs~*1raD&TW%EP{%{_8
> [...]
>
