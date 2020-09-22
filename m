Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C58274A3F
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 22:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIVUlm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 16:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIVUll (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 16:41:41 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9085C061755;
        Tue, 22 Sep 2020 13:41:40 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b12so17457355edz.11;
        Tue, 22 Sep 2020 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4dgd90IlEOGYMbnDbKsBu9fNTMld0P3Weu+wzDmEYE0=;
        b=DST2qbmtk2UjxKqB9tuI5Y1s1/kPK6cHtLNBAb/GqAT6J+3G/FObSSFtObqNhXS1Pv
         OkMbzBGNaw3nUVTw1f2afISrE04vzs0GJJcGOrKJtkUJ+VkpXCJeJ24Mge29nkabLCUM
         dhnEoynNGndQ24gFY7lSFBYlOsXj6T30uStgz4hiJAGaXqIYupW4nyk373fnMnTQAmUe
         DfR4JejSbR/U5mMva2/nz5pPRxDT114nGvZTYWi6hVyRDZ4qE0tVSS4vLT2brHlF/h9k
         yEyu6/Du6TtVWQ2vMInSIALzQSb83WuV2RwUXiDkezqFciCPOJ13obXz1laYlo7f/atc
         B//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4dgd90IlEOGYMbnDbKsBu9fNTMld0P3Weu+wzDmEYE0=;
        b=bnkn2T40AB545+Yg2gqX4MYVEyelhui5YH6qExeuI05yFGIo8WAoiBbfpZ1CnBKMSf
         Qflxvz5/1QrLqJFYhXm0C1MKxeV9CXyPc8J0UXGw3ojDdgfIGFTSY/SHO7VMXsVdQOGa
         UOsGALr8eCsHfW2Hl0x924fCAVdEHPFRlHDIqWW/pMUtKY44jglvJjyJJutXYmI5K3Oe
         Y62aKxXRBxyx9jHk+YFh7D4M6XLjyNy1HZbOAFvEc83xNGZq7czdhf52PzuEvs4tQfJd
         0f8F7AVn3N55nbOLiB0/7NcwNJJAaCEv4DTKMEyCuBGSXgGam8dxb9ahKbNY78C/GFPp
         I6iQ==
X-Gm-Message-State: AOAM530dZMPj1hC6qNzxE03hbyC7zSjHgVu25YfF4F2O+BIK6yCADHZ2
        RfvbgxvyS9mosRgUP2pK2ZoTK6+53xM=
X-Google-Smtp-Source: ABdhPJzHzzY6vJWSdgIVIMFjD8mhomT/pDksfp1C7Bl32WOxaZor6MF085m1mO4cGFbQFups+T/RQg==
X-Received: by 2002:a50:84a2:: with SMTP id 31mr6088348edq.138.1600807299092;
        Tue, 22 Sep 2020 13:41:39 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:b5cc:61dc:8ab6:72c1? ([2a01:110f:b59:fd00:b5cc:61dc:8ab6:72c1])
        by smtp.gmail.com with ESMTPSA id x25sm11412539edv.42.2020.09.22.13.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 13:41:38 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
 <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com> <20200921224212.GA13299@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <db0b2dca-b7d3-8d76-cc6c-b399c1fa9921@gmail.com>
Date:   Tue, 22 Sep 2020 22:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921224212.GA13299@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/22/20 12:42 AM, Pavel Machek wrote:
> Hi!
> 
>>> Can I get details of your setup?
>>
>> I don't use this trigger, but I can imagine that someone does.
> 
> Well, if someone exists, we can increase the limit, or convince them
> to change their setup.

Linux is used in many commercial projects and each such change generates
a cost, so this is not a sheer matter of convincing someone.

>>> What CPU type that is, and how are you mapping CPU activity to LEDs?
>>
>> The type of CPU is irrelevant here. What is important is the fact
>> that with this trigger it is possible to visually monitor CPU core
>> online state. Probably it would be good to ask the author of that
>> trigger about his use case.
> 
> It is relevant -- cpu trigger never worked on x86. I had patch fixing
> it, but got pushback.

You mean literally x86 (32-bit)? Because I checked yesterday on my
x86_64 and it worked just fine, i.e. changing cpu online state
generated events on all userspace LEDs I registered for each cpuN
trigger.

>> I have spoken up, because I don't get the reason for your patch.
>> This driver was reworked year ago to remove PAGE_SIZE limit,
>> and I even applied it to my for-next tree, but that was at
>> the time of handling maintainership to yourself, and you
>> seem to not have picked that commit.
>>
>> Was that intentional? We had even Greg's ack [0].
> 
> I checked, and I believe the commit is in:

Indeed, I blindly sought the changeset in git log for ledtrig-cpu.c
file.

> #ifdef CONFIG_LEDS_TRIGGERS
> static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write,
> 0);
> static struct bin_attribute *led_trigger_bin_attrs[] = {
> 
> So.. no, it is not causing kernel crashes or something. But it is
> example of bad interface, and _that_ is causing problems. (And yes, if
> I realized it is simply possible to limit it, maybe the BIN_ATTR
> conversion would not be neccessary...)

The limitation you proposed breaks the trigger on many plafforms.

-- 
Best regards,
Jacek Anaszewski
