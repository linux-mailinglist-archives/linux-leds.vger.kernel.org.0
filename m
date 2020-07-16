Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E31222673
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 17:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgGPPG1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 11:06:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36158 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPPG1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 11:06:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GF67vT094865;
        Thu, 16 Jul 2020 10:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594911967;
        bh=ZRXaPKqO824iMUfjsyA2RVRrQ8jqiJKdpERWl5OpL1U=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=JUlcFeznp6WTiJQYcfC7EhpCejnuoFMP2l4GWOsEpCx/9t2Gg28zuM5fine/boBB7
         JL4wDkRY1yH2NWk/bzjSMMUscxLtlkRu1bjQTAmHZh4hpH6vl8J31/vI6mVNwpqlhc
         HiTShs2KPLu7P3f7UHDnsI9WTeRMXaibeejVybrM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GF67dk062299
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 10:06:07 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 10:06:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 10:06:05 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GF64Xo039745;
        Thu, 16 Jul 2020 10:06:04 -0500
Subject: Re: [PATCH v30 05/16] leds: multicolor: Introduce a multicolor class
 definition
From:   Dan Murphy <dmurphy@ti.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200713154544.1683-1-dmurphy@ti.com>
 <20200713154544.1683-6-dmurphy@ti.com> <20200716083104.GA30361@amd>
 <b298158e-327f-cf97-2723-75a7d832931e@ti.com>
Message-ID: <a7cf67e7-680b-8e67-a4ee-207eff316316@ti.com>
Date:   Thu, 16 Jul 2020 10:06:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b298158e-327f-cf97-2723-75a7d832931e@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/16/20 10:03 AM, Dan Murphy wrote:
> Pavel
>
> On 7/16/20 3:31 AM, Pavel Machek wrote:
>> Hi!
>>
>> First, let's substitute multi.color -> multicolor globally,
>> LEDS_CLASS_MULTI_COLOR is most visible example of this. Please also
>> decide whether it is MultiColor or multicolor, and make it consistent.
>
> Dictionary definition is multicolor no space.  Capitalization is 
> dependent on how it is use.
>
> Basically no capital in the middle of a sentence
>
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The multi color class groups monochrome LEDs and allows controlling two
>> For example here. Plus, the LEDs are not neccessarily monochrome, we
>> support white LEDs, too. Let's use "simple LEDs"?
> OK
>>
>>> aspects of the final combined color: hue and lightness. The former is
>>> controlled via the intensity file and the latter is controlled
>>> via brightness file.
>>> +    depends on LEDS_CLASS
>>> +    help
>>> +      This option enables the multicolor LED sysfs class in 
>>> /sys/class/leds.
>>> +      It wraps LED class and adds multicolor LED specific sysfs 
>>> attributes
>>> +      and kernel internal API to it. You'll need this to provide 
>>> support
>>> +      for multicolor LEDs that are grouped together. This class is not
>>> +      intended for single color LEDs. It can be built as a module.
>> "single color" -> "simple"?
> ok
>>
>>> +    /* account for the new line at the end of the buffer */
>>> +    offset++;
>>> +    if (offset < size) {
>>> +        ret = -EINVAL;
>>> +        goto err_out;
>>> +    }
>> "new line" -> "newline", and actually check that character you are
>> skipping is newline. Someone could put '%' in there...
>
> Actually we don't need to check for the character.  Even if someone 
> put the '%' there there will still be a '\n' at the end of the buffer.
>
> The for..loop above only processes the total number of available 
> colors so effectively the '%' will be ignored just like the '\n'.
>
> If the buffer contains more entries then the number of colors an error 
> will be returned via the check below since size will be greater then 
> offset
>
>     if (offset < size) {
>         ret = -EINVAL;
>         goto err_out;
>     }
>
> Maybe I should remove the comment as it is a bit confusing.
>
>>> +        if (i < mcled_cdev->num_colors - 1)
>>> +            len += sprintf(buf + len, " ");
>>> +    len += sprintf(buf + len, "\n");
>> Using sprintf for single character has... quite a lot of
>> overhead. Something like buf[len++] = '\n' would be
>> simpler/shorter/better. Please fix all relevant places.
>
> OK
>
>
>> Note I already applied patches 1-4.
>
> I will rebase on top
>
>
One last change my legal team came back and said no to GPL v2+ so I 
reverted that change

Dan


>> Best regards,
>>                                     Pavel
