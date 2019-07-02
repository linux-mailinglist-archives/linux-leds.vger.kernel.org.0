Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DD05CE4A
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jul 2019 13:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfGBLVd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Jul 2019 07:21:33 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40360 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfGBLVd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Jul 2019 07:21:33 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so17940977qtn.7;
        Tue, 02 Jul 2019 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=h2Np4DHFhHTTDGodM5khZXbcgpQeX+8Tn/kZsYfdUts=;
        b=iRnvtDfv+ih1ebqb/5Lrvt/lqNC34/2BD8tS4mvKMAaeRqTS0G1o+neexgzx/EDqUO
         Qm+oUEAkXNvkGWCfe+JC+wQ+5/OJNABJX3C8llKJXnHL6yDaCD6nxjuXXGyUxKINgwEQ
         j5UfSs6iIFaWs28uKkNAInBzZBkh88h6UlUro8AEaBkgs/jPotuLxk8fIxT2FAi3J8NP
         BvGqbgXM8/U7bt5wFmr7iVmgtsAPHfpVZKBt4xlRirpzm16Ucce00JNCyJZAn1pvnolB
         y5lMbIcSZJMnfeCRD8+0ShJA0PXPFAwetiqt4JI7H4H3M0yOJ58117bXehwC5QgszB5F
         YEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=h2Np4DHFhHTTDGodM5khZXbcgpQeX+8Tn/kZsYfdUts=;
        b=XUfchanwWkw4slVkM18QWxEmp5ATWHKY5icrK6Pq86iqM4XD68LqN7A3pSoFIYZiiG
         RTXXAcOOK3aE5FTwhbdQmwAFNqme3yFTuQPj54NXxdGNIi/eDPLwV4isnZ9vS8xpg1un
         x9i1WQGee5aWFXh3ULf7eHSv181wi7+agZuT8QQiROcTPA83sIaFRZ31NLKqypfU42Zr
         C/MNaFWchIW16B1hFb52bo+FoUSCiu645YPnLPhjh6qaeD2CqMY4aGv5CRDweucEcZA9
         oH67Ujy6lksVu/CqlKgLwuhZj4RlcLUb9DV4JtLi7sBHhFnggwMWuf7vtVjOeHXDaRva
         ORbg==
X-Gm-Message-State: APjAAAXoxAwjFpu0aWrdwaTB59xS7y1BpqgwN2n07lPGRaB2jkvZZtbX
        6ZTXyJygu8BrFW4t2rMlYhK1Gm+Z5/s=
X-Google-Smtp-Source: APXvYqyjIyuQgRKYHEfQxiC9gdHUUodmZG32ZwLm7VbHnNkq3YB7CZ76nRgoG0BnEJBN/n20O3xMnQ==
X-Received: by 2002:a0c:d0b6:: with SMTP id z51mr25977834qvg.3.1562066492288;
        Tue, 02 Jul 2019 04:21:32 -0700 (PDT)
Received: from [192.168.1.177] (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.googlemail.com with ESMTPSA id 16sm6324755qkl.100.2019.07.02.04.21.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 04:21:30 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     pavel@ucw.cz, lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, pbacon@psemi.com
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
 <20190702092617.c4wn3dmg5orrquyj@holly.lan>
From:   Brian Dodge <bdodge09@gmail.com>
Message-ID: <9ffed46f-c878-e415-cad0-cbe64efb9885@gmail.com>
Date:   Tue, 2 Jul 2019 07:21:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702092617.c4wn3dmg5orrquyj@holly.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 7/2/19 5:26 AM, Daniel Thompson wrote:
>> [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
>> ArcticSand arcxcnn driver bindings
> The "v2" is normally applied to the whole patchset (if you
> prepare the patchset using git format-patch then you can use
> the --subject-prefix argument for that).
Sorry and noted
>
> On Sun, Jun 30, 2019 at 08:28:14PM -0400, Brian Dodge wrote:
>> The vendor-prefixes.txt file properly refers to ArcticSand
>> as arctic but the driver bindings improperly abbreviated the
>> prefix to arc. This was a mistake in the original patch. This
>> patch adds "arctic" and retains "arc" (deprecated) bindings
>>
>> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
>> ---
>>   .../bindings/leds/backlight/arcxcnn_bl.txt         | 31 +++++++++++++++-------
>>   1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>> index 230abde..4d98394 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>> +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>> @@ -1,8 +1,13 @@
>> -Binding for ArcticSand arc2c0608 LED driver
>> +Binding for ArcticSand arc family LED drivers
>>   
>>   Required properties:
>> -- compatible:		should be "arc,arc2c0608"
>> -- reg:			slave address
>> +- compatible: one of
>> +	"arctic,arc1c0608"
>> +	"arctic,arc2c0608"
>> +	"arctic,arc3c0845"
>> +	"arc,arc2c0608" (deprecated)
> Nothing wrong with adding compatible strings for arc1 and arc3 but I
> would expect it to be mentioned in the description to reassure reviewers
> that the right depth of thought has been applied Something like "Also added
> compatible strings for other family members, all the existing optional
> properties work the same way for the new devices." (if you agree that it
> is true) is good to show you were paying proper attention!
>
> However this does perhaps verge a little towards nitpicking so maybe
> wait to see what the DT folks say. From my point of view:
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>
>
> Daniel.

Good point. I did actually think about this a bit. The *only* chip 
available at the time of the original driver was the arc2c0608 and that 
is the chip that is currently in use in the Samsung Chromebook Plus, and 
the only use I know of using the "arc" prefix. There will be no reason 
to ever support "arc,arc1.." or "arc,arc3..." in the bindings for past 
or future use.

The new two chips are just basically supported by this driver. There is 
more functionality to them which will be enabled in my next patch. I 
wanted to separate the move to "arctic" from the move to fully support 
the other chips for clarity (you guys are all rightly picky!) I did put 
the new chip bindings in the driver/bindings in this patch though so I 
could test this patch against the actual h/w instances: I have three 
boards, one with each chip type and each has a dtb with the "arctic,.." 
type binding onboard.

>> +
>> +- reg:		slave address
>>   
>>   Optional properties:
>>   - default-brightness:	brightness value on boot, value from: 0-4095
>> @@ -11,19 +16,25 @@ Optional properties:
>>   - led-sources:		List of enabled channels from 0 to 5.
>>   			See Documentation/devicetree/bindings/leds/common.txt
>>   
>> -- arc,led-config-0:	setting for register ILED_CONFIG_0
>> -- arc,led-config-1:	setting for register ILED_CONFIG_1
>> -- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
>> -- arc,comp-config:	setting for register CONFIG_COMP
>> -- arc,filter-config:	setting for register FILTER_CONFIG
>> -- arc,trim-config:	setting for register IMAXTUNE
>> +- arctic,led-config-0:	setting for register ILED_CONFIG_0
>> +- arctic,led-config-1:	setting for register ILED_CONFIG_1
>> +- arctic,dim-freq:	PWM mode frequence setting (bits [3:0] used)
>> +- arctic,comp-config:	setting for register CONFIG_COMP
>> +- arctic,filter-config:	setting for register FILTER_CONFIG
>> +- arctic,trim-config:	setting for register IMAXTUNE
>> +- arc,led-config-0:	setting for register ILED_CONFIG_0 (deprecated)
>> +- arc,led-config-1:	setting for register ILED_CONFIG_1 (deprecated)
>> +- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used) (deprecated)
>> +- arc,comp-config:	setting for register CONFIG_COMP (deprecated)
>> +- arc,filter-config:	setting for register FILTER_CONFIG (deprecated)
>> +- arc,trim-config:	setting for register IMAXTUNE (deprecated)
>>   
>>   Note: Optional properties not specified will default to values in IC EPROM
>>   
>>   Example:
>>   
>>   arc2c0608@30 {
>> -	compatible = "arc,arc2c0608";
>> +	compatible = "arctic,arc2c0608";
>>   	reg = <0x30>;
>>   	default-brightness = <500>;
>>   	label = "lcd-backlight";
>> -- 
>> 2.7.4
>>
