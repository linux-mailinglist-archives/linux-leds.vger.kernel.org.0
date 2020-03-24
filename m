Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F64A191988
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2020 19:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbgCXS63 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Mar 2020 14:58:29 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35924 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbgCXS63 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Mar 2020 14:58:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OIwD8x021034;
        Tue, 24 Mar 2020 13:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585076293;
        bh=VZRtZMeA2ClsDluKB2wRA7+P+NmbtlpF2v3sLKrmG+I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GkVufOe3CA2KLoWFv/g5TE6sl1TbCjzNkOuFqpoFQ7idv9B1+4GOXzyHJk/m+QTbG
         n7F21fInhXcNZNKF7ckUI+p0K0Ow4NRssQ33OZOMR5Ap1ISFh4OtvEBOjhPLAymTCX
         KzXZGpF7Ib70Iz49cy4rzmL2/wv6wZuqPX6e/vJA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02OIwDKw037329
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Mar 2020 13:58:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 13:58:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 13:58:13 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OIwCh6115881;
        Tue, 24 Mar 2020 13:58:13 -0500
Subject: Re: [PATCH v18 4/4] leds: multicolor: Introduce a multicolor class
 definition
To:     Randy Dunlap <rdunlap@infradead.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20200324181434.24721-1-dmurphy@ti.com>
 <20200324181434.24721-5-dmurphy@ti.com>
 <e9d6c050-0ee4-6829-bd23-25e9bbf72774@infradead.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e600d433-7af2-c939-db69-29369180392d@ti.com>
Date:   Tue, 24 Mar 2020 13:52:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e9d6c050-0ee4-6829-bd23-25e9bbf72774@infradead.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Randy

On 3/24/20 1:41 PM, Randy Dunlap wrote:
> On 3/24/20 11:14 AM, Dan Murphy wrote:
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index d82f1dea3711..37dcdb06a29b 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>   	  for the flash related features of a LED device. It can be built
>>   	  as a module.
>>   
>> +config LEDS_CLASS_MULTI_COLOR
>> +	tristate "LED Mulit Color LED Class Support"
> 	              Multi
> or even	              MultiColor
> or	              Multicolor

Thanks for the spell check. I cannot believe this made it through so 
many reviews.  hehe

Dan

