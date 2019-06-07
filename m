Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6993974B
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 23:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731187AbfFGVEm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 17:04:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35354 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731132AbfFGVEm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Jun 2019 17:04:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57L4dBx023761;
        Fri, 7 Jun 2019 16:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559941479;
        bh=y3TMmwalj8p/ibUMQfnAwnQm2tAicIorIe/nuI/lHWE=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=ZW33/FzALdojrXTpeEv2lw+ID+ysdGEpM/h59O3boDTZzAXcQmbigGG7unFD/DvtR
         3byspdlwgqTSgOSciy4g1S/sZoNZuCtSifXIyj1zxdxSlML0fZ+wKs7p4y+Ogr9zPW
         6+DxUqGjKcdROMmicM88e0ckOcmXOHngFxDMnaX4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57L4ddP077244
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 16:04:39 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 16:04:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 16:04:39 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57L4cH0119088;
        Fri, 7 Jun 2019 16:04:38 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
Date:   Fri, 7 Jun 2019 16:04:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/7/19 3:53 PM, Oleh Kravchenko wrote:
>
> 07.06.19 23:14, Dan Murphy пише:
>> Oleh
>>
>> On 6/7/19 1:40 PM, Oleh Kravchenko wrote:
>>> +LED sub-node properties:
>>> +- label :
>>> +    see Documentation/devicetree/bindings/leds/common.txt
>> Add this
>>
>> Optional LED sub-node properties:
>>
>> And remove (optional) from the below.
>>
> Done
>
>>> +- linux,default-trigger : (optional)
>>> +    see Documentation/devicetree/bindings/leds/common.txt
>>> +- max-brightness : (optional)
>>> +    Specify here 2 if LED has special effect. Effects by LED type:
>> s/Specify here 2/Specify 2
>>
> Done
>
>> But this is not really max_brightness now this is a feature and now does not make sense in this context
>>
>> You may need to use something different for this property or expose a file in the driver.
>>
>>
> Protocol for this board define 0x32 as brightness level.
> This behaviur needed to keep backward compatibity.
>
>
Backwards compatibility to what?

This is a new driver there should be no DT that has this compatible or 
definition.

I will let Rob ack or nack this node.

Dan

