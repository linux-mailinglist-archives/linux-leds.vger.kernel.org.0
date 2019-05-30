Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6482FDCA
	for <lists+linux-leds@lfdr.de>; Thu, 30 May 2019 16:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfE3ObA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 May 2019 10:31:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57960 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfE3Oa7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 May 2019 10:30:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4UEUqEa063847;
        Thu, 30 May 2019 09:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559226652;
        bh=Cg30MeZA99CqmwGHpSCXMESG3MfaMxR7+LwVQ+Gg4Uo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vqlNLopfA8qkd2o5CEXM8oA8SZd2A64ck04yKT09X0fpUzrQ60JaBUuH7AKhWkXqI
         lgtye+vVpoZ/o6EXhtL7TktSyIhnBJts9Xyt1vCIL6dDSBAMFV06Ge9clwdOXmr3y0
         mVmjvKCNgz+8g58Qxs7HTTp+JjgKqgK4gDb730FQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4UEUqx7095739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 09:30:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 09:30:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 09:30:49 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4UEUnRo039151;
        Thu, 30 May 2019 09:30:49 -0500
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com>
 <f01ac400-efda-80a8-4d63-1e2add5e054a@gmail.com>
 <185abdd6-100c-0a71-2da9-8f556d8ea701@ti.com>
 <333167d0-4615-2fbe-e933-cbca623998ef@gmail.com>
 <e54d9d29-5daa-fd3a-a5a9-ebd2450882ee@ti.com>
 <c947d07c-2a8d-b9a8-b2ac-6c249ac54bca@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ee675df2-9097-8e1b-b9db-a42017ac06b6@ti.com>
Date:   Thu, 30 May 2019 09:30:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c947d07c-2a8d-b9a8-b2ac-6c249ac54bca@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/28/19 1:29 PM, Jacek Anaszewski wrote:
> On 5/28/19 8:19 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/28/19 12:44 PM, Jacek Anaszewski wrote:
>>> Dan,
>>>
>>> On 5/28/19 7:32 PM, Dan Murphy wrote:
>>>> Jacek
>>>>
>>>> On 5/27/19 3:00 PM, Jacek Anaszewski wrote:
>>>>> Hi Dan,
>>>>>
>>>>> Thank you for the update.
>>>>>
>>>>> One thing is missing here - we need to document how legacy brightness
>>>>> levels map to the sub-LED color levels, i.e. what you do in
>>>>> multicolor_set_brightness().
>>>>
>>>>
>>>> Ok so i will need to document the algorithm that is used to 
>>>> determine the color LED brightness.
>>>
>>> Right, and please send just an update of that single patch.
>>>
>>
>> So you are asking for v4 with only this patch updated.
>
> Not exactly - I am asking for v4 of this patch. We don't need
> to spam the lists with the rest of unaltered patches from the series.
>
> The interface seems to be the most vital part of this patch set,
> and it is possible that it will undergo at least slight modifications.
>
> We will move to discussing the code once we achieve a total consensus.
>

Sorry for the late reply.  OK I have updated the sysfs documentation but 
in doing so I am also going to send in v4 of the sysfs documentation as 
it explains the interfaces in more detail. Also I will be adding more 
technical information into that sysfs doc on what is done and what to 
expect and it's usage.


Dan

