Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080C430DF0B
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 17:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbhBCQDD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 11:03:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42260 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbhBCQDC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 11:03:02 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 113G21L7118694;
        Wed, 3 Feb 2021 10:02:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612368121;
        bh=NUA3yj41AUpvezYQrtDDkTNi4wjfNbi3KNspbr4NTLg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aDTgiA1j13LUDapeKVIWadFA4zTRD4Jybt/sVwkk4oUKBawnqM6jyrs+7yae+O3VZ
         SWzFfeNpvdPtEDg/5IYLjniMU1v53x92HvyVuak1LEsk6UkiXJGkuipaR5AoK9F/Gm
         R1bes6ODeEWBfezuFEy11p3hMNPpvJhCWEd0YFUk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 113G21pF014582
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 3 Feb 2021 10:02:01 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Feb
 2021 10:02:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Feb 2021 10:02:00 -0600
Received: from [10.250.39.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 113G20ns023052;
        Wed, 3 Feb 2021 10:02:00 -0600
Subject: Re: [PATCH 2/2] leds: lp50xx: remove unused regulator
To:     Pavel Machek <pavel@ucw.cz>
CC:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210203083408.2534-1-schuchmann@schleissheimer.de>
 <20210203090249.GA14154@amd> <2e9dff78-7fde-404d-6fad-6aeedf1145d1@ti.com>
 <20210203142336.GA12369@duo.ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0ddd5bdf-0484-3c20-1b6e-5573d1ff90f6@ti.com>
Date:   Wed, 3 Feb 2021 10:02:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203142336.GA12369@duo.ucw.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 2/3/21 8:23 AM, Pavel Machek wrote:
> On Wed 2021-02-03 07:49:35, Dan Murphy wrote:
>> Pavel
>>
>> On 2/3/21 3:02 AM, Pavel Machek wrote:
>>> On Wed 2021-02-03 08:34:08, Sven Schuchmann wrote:
>>>> The regulator for vled-supply is unused in the driver.
>>>> It is just assigned from DT and disabled in lp50xx_remove.
>>>> So the code can be removed from the driver.
>>> Dan, what is going on here? Do we need to also enable the regulator,
>>> or is the removal correct thing to do?
>>>
>> I think it would be better to do an enable as opposed to removing the code.
>>
>> This would be needed especially in applications that have to meet strict
>> power management requirements.
>>
>> Users may want to disable or enable the regulator during suspend/resume.
>> Otherwise it would be considered always-on and the regulator does not need
>> to be populated.
> Do you have set up where this is needed and you can test this? Will
> you submit the fixes?

No I use an always on regulator in my setup. I have no managed supplies 
exposed.

Dan


> Best regards,
>
> 									Pavel
