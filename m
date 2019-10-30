Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6F6EA4AA
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 21:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfJ3UYH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 16:24:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34030 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfJ3UYH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 16:24:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UKNuKj099408;
        Wed, 30 Oct 2019 15:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572467036;
        bh=QRjoE331Q/k4D/4Fby6fACVvZ6zBumRrr3LPiv9jIBA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SVAfgh6V5NpUgTVMsmXdUR35BuWKy8I8d346G0sBuzrsR9MykqwlfjEmqBtDDbzvC
         tCE1ye2Fac9sUOR0tWRifwSc0rhFhzx2yAxcW2kEPiE/s80OdYVz/nfCRfZRKsVvq7
         4qXpbcVwyunJ6ujLBmCVVNkWl/uwtqUTfc2g3hXc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UKNuq5090504
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 15:23:56 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 15:23:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 15:23:43 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UKNtCG022757;
        Wed, 30 Oct 2019 15:23:55 -0500
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        kbuild test robot <lkp@intel.com>
CC:     <kbuild-all@lists.01.org>, <pavel@ucw.cz>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
 <bb3473ba-ddfc-2b51-4a75-c23c5bf3bc62@ti.com>
 <075c9330-a9b5-1360-4447-71a4797553a9@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f32e2063-3c56-607c-0e74-f75f68e62e16@ti.com>
Date:   Wed, 30 Oct 2019 15:23:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <075c9330-a9b5-1360-4447-71a4797553a9@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek


>> Does not appear here
>>
>> Finally not sure why the MIPS compiler is complaining about this but the
>> ARM and x86 is not
> Compilation breaks also for ARM.

Thanks for the information.

I am not seeing this issue or even a warning when using the ARM 8.3 
toolchain even in a clean build.

arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture 
8.3-2019.03 (arm-rel-8.36)) 8.3.0

So is a bug in this toolchain?

> This is not architecture specific but language specific thing.
>
> If you enter this error message got Google you will get an answer
> to why this happens in the first result.

I did Google the issue and got the answer I guess I just question to why 
I am not seeing the error because for me the patchset builds fine no errors.

And why is this only reported on the MIPS arch.  Not saying that it is 
not an issue in the code just wondering how it gets there.

>
> You need to patch your driver with the attached one.
>
I will try to reproduce the error and then apply the changes.

Dan

