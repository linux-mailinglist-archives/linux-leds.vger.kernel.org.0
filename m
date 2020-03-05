Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4F017A5DE
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2020 13:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCEM7i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Mar 2020 07:59:38 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50064 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgCEM7i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Mar 2020 07:59:38 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025CxXw7099764;
        Thu, 5 Mar 2020 06:59:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583413173;
        bh=b/Jq6XODidw4LHE0naUHsF5hZCiM5+KUNJpP8tfkuY4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=x6MdGpIP/rtjMVDajO4FOB/58E9/K8THr6prVQhnBqAUfUc04gx+qBtBKXNKJceZZ
         s/DCDM/SfEMOI11bikRmtmX/wxnmlJ0d02odBrJ+Zu8jvsQqovwWZM/E3y574yuYgl
         8QMjUp/ld9gyVoRy1KQkuqyO6Zc8QzMUVmEsiup4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025CxXiT097325
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Mar 2020 06:59:33 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 06:59:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 06:59:32 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025CxWSR010686;
        Thu, 5 Mar 2020 06:59:32 -0600
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>, <linux-leds@vger.kernel.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-kernel@vger.kernel.org>
References: <20200227185015.212479-1-luca@z3ntu.xyz>
 <7742f98c-fd96-7f0e-c33c-fbac61a4881c@ti.com> <11515555.O9o76ZdvQC@g550jk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f61133d9-be0f-366a-7b77-1f366d2cd8d6@ti.com>
Date:   Thu, 5 Mar 2020 06:54:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <11515555.O9o76ZdvQC@g550jk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luca

On 3/5/20 5:01 AM, Luca Weiss wrote:
> On Donnerstag, 27. Februar 2020 20:50:40 CET Dan Murphy wrote:
>> Luca
>>
>> On 2/27/20 12:50 PM, Luca Weiss wrote:
>>> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>>>
>>> This device is controller by two GPIO lines, one for enabling the LED
>>> and the second one for switching between torch and flash mode.
>>>
>>> The device will automatically switch to torch mode after being in flash
>>> mode for about 250-300ms, so after that time the driver will turn the
>>> LED off again automatically.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>> You seem to be missing the devictree bindings doc for the GPIOs.
> As written in the initial email:
>
>> I will also write dt bindings for the driver once I have "strobe"
>> working.

NACK.

We review bindings as part of the code.  And we want to understand what 
bindings the code will be using

You will get better guidance if the patch set contains the documentation 
so we can understand what is being proposed.

Dan

