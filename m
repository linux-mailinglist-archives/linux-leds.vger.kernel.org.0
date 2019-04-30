Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF2A1004D
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfD3TaW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:30:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36730 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfD3TaV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:30:21 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJU9AR033504;
        Tue, 30 Apr 2019 14:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556652609;
        bh=ELf+VXPzXaBoZQ7HMDZ7pXuUI1yMkaohJXWakQNprkc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DmhRQ7xrBly/jnVVoa3vSLyYE39iGJio8gv0/NYNx0zwKGQq2bGVQktJywN7tXwbk
         KIgAM1Z/GT/TTIXfJCxUobGcJThvd6KgvTJLL5O952zEg4iUKPlqUo3M3xwZmHG5BM
         3VUCxRQCvKhY6+rh5kUiX/BZpWlQ7aJ3IDOEFPfw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJU9Hq022115
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:30:09 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:30:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:30:09 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJU83o081220;
        Tue, 30 Apr 2019 14:30:08 -0500
Subject: Re: [PATCH v3 4/7] leds: TI LMU: Add common code for TI LMU devices
To:     Randy Dunlap <rdunlap@infradead.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-5-dmurphy@ti.com>
 <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a953b7e9-ce80-641a-4d0e-f0b96828a732@ti.com>
Date:   Tue, 30 Apr 2019 14:30:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7d161cbc-d6bd-83aa-3790-6c45fdf9521f@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Randy

On 4/30/19 2:23 PM, Randy Dunlap wrote:
> On 4/30/19 12:17 PM, Dan Murphy wrote:
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index da00b9ed5a5c..3ae24eaf4cde 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -776,6 +776,14 @@ config LEDS_NIC78BX
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called leds-nic78bx.
>>  
>> +config LEDS_TI_LMU_COMMON
>> +	tristate "LED driver for TI LMU"
> 
> what does LMU mean?

Lighting management unit it is defined in the DT documentation

> 
>> +	depends on REGMAP
>> +	help
>> +          Say Y to enable the LED driver for TI LMU devices.
>> +          This supports common features between the TI LM3532, LM3631, LM3632,
>> +	  LM3633, LM3695 and LM3697.
> 
> Fix help indentation above to use tab + 2 spaces consistently.
> 

UGH I wish I had this comment 2 weeks ago.
But I can fix it

Dan

>>  comment "LED Triggers"
>>  source "drivers/leds/trigger/Kconfig"
> 
> 
> thanks.
> 
