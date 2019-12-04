Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18B21112BE9
	for <lists+linux-leds@lfdr.de>; Wed,  4 Dec 2019 13:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfLDMq7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Dec 2019 07:46:59 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46638 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbfLDMq6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Dec 2019 07:46:58 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4CkkgD061262;
        Wed, 4 Dec 2019 06:46:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575463606;
        bh=7qbekqxk5cyz305GNEwUDyut5GgLfq4GzPplRlk6THw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=f6PpFrzsuN9/5muENmAeFIPnOxWw0GvGFDJ6h/ZNf8dhKOl4oD/UtuABqnZ2zCz7J
         qKn8X7tJ12O1rfx83fi9hsldZHRD8f2dSNHgMOFTRnqdlAr8CAAjDEhK5F++UQdePn
         0SPQ1d+c9CnXOMrpm154+XUy0KpgxCJMQMgayr3I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4Ckklx103420
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Dec 2019 06:46:46 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 06:46:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 06:46:45 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4CkjDu113804;
        Wed, 4 Dec 2019 06:46:45 -0600
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     kbuild test robot <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
 <29321f74-8200-90cd-40f9-8f5bdb86e34e@ti.com> <20191125150730.GA3816@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e05148a1-2588-0b08-2bcf-1ef819c33683@ti.com>
Date:   Wed, 4 Dec 2019 06:44:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191125150730.GA3816@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 11/25/19 9:07 AM, Pavel Machek wrote:
> On Wed 2019-10-30 11:43:10, Dan Murphy wrote:
>> Pavel
>>
>> On 10/30/19 7:07 AM, kbuild test robot wrote:
>>> Hi Dan,
>>>
>>> I love your patch! Yet something to improve:
>>>
>>> [auto build test ERROR on j.anaszewski-leds/for-next]
>> You might want to get your tree to be the base now.
> Do you have an idea who I need to contact?

Not sure maybe the mail list for the kbuild lkp@intel.com?



>
> Best regards,
> 									Pavel
