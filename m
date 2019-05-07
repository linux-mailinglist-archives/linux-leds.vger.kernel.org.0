Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC6916B57
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 21:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfEGT30 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 15:29:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53520 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfEGT30 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 15:29:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47JTKvu077675;
        Tue, 7 May 2019 14:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557257360;
        bh=/er7IZp3FL07Qf12wHoriGzeuJGmeh+jKRcu8QZ2pOw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=J7DZ18QsYw7SC932rQdSaep8PLiSUyjVOqgloB043oDA1UuUNc7Ah4mkzz2tjAxtF
         eR8OLIbeLMj+luyWyUvgun4JQhPK8Z/PvwXC2OaTkbeBAHLhJZqVju0L/ObghzDjv3
         l3r+FMI2ov8X7/JTpU1HIBkO9zxC8GiJz8PvM2GE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47JTKji056393
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 14:29:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 14:29:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 14:29:19 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47JTJtR108361;
        Tue, 7 May 2019 14:29:19 -0500
Subject: Re: [PATCH v3 0/7] LMU Common code intro
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
 <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
 <bf6768b6-2795-5904-15e1-75109a694fcd@ti.com>
 <2f786e83-0776-9bcb-a485-6e03c8db87ce@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c3a8be67-a3c3-60d3-aeed-4ef36f72f164@ti.com>
Date:   Tue, 7 May 2019 14:29:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2f786e83-0776-9bcb-a485-6e03c8db87ce@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/7/19 2:13 PM, Jacek Anaszewski wrote:
> On 5/7/19 9:06 PM, Dan Murphy wrote:
>> I have posted v4 with requested corrections plus I have an additional patchset that is based off of this patch set
>> for the LM36274.
> 
> Yes, I've seen it but it was quite late. Let it receive
> fair testing.
> 

OK do you want me to combine both patchsets?  Or leave them separated?

>> I can post that as well and we can present everything for 5.3
>>
>> Maybe even the base MC FW ;)
> 
> Is it somehow related?
> 

No

Dan
