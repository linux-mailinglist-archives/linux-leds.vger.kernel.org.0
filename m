Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64FAA567DF
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 13:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZLog (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 07:44:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47734 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfFZLog (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 07:44:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QBiSZ6051879;
        Wed, 26 Jun 2019 06:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561549469;
        bh=mKtXv03ZcxrF8K2N0kwvFVNwU8jLpeFN2jb6+ZaJNTQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yaH2jeymL9cb8gnfj+a3JYqPlL2Xsx3ExKigv3J4BYGEQvtFxycDlgBQub+25SD97
         l9BoznDqDM3l+Z13q71VQM3dgOJwsDx+IVP56G3fQlYOygUUieFEhvyeW57ksbcf5D
         E4DDsX7Y5XnxoGE0n31XXe3zfTXGP60CLJV9OneY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QBiSMm023834
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 06:44:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 06:44:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 06:44:28 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QBiRIs042717;
        Wed, 26 Jun 2019 06:44:28 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Brian Dodge <bdodge09@gmail.com>
CC:     <pavel@ucw.cz>, <lee.jones@linaro.org>, <jingoohan1@gmail.com>,
        <jacek.anaszewski@gmail.com>, <robh+dt@kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <pbacon@psemi.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <905cf517-0fae-cc52-d0ef-5b1dbe1c5864@ti.com>
Date:   Wed, 26 Jun 2019 06:44:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625085534.xf2ullyju3ewbgik@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 6/25/19 3:55 AM, Daniel Thompson wrote:
> On Tue, Jun 25, 2019 at 12:05:28AM -0400, Brian Dodge wrote:
>>      The vendor-prefixes.txt file properly refers to ArcticSand
>>      as arctic but the driver bindings improperly abbreviated the
>>      prefix to arc. This was a mistake in the original patch
>>
>> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
>> ---
>>   .../bindings/leds/backlight/arcxcnn_bl.txt         | 24 +++++++++++++---------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>> index 230abde..9cf4c44 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>> +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
>> @@ -1,8 +1,12 @@
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
> This is more a question for the DT folks than for Brian but...
>
> AFAICT this patch is fixing the binding for the ArcticSand devices to
> use the correct value from vendor-prefixes.yaml and has been previously
> discussed here:
> https://lkml.org/lkml/2018/9/25/726
>
> Currently this patch series just updates the DT bindings but the
> implementation also honours the old values (since there is a Chromebook
> in the wild that uses the current bindings).
>
> Hence I'm not clear whether the bindings should document the deprecated
> options too (e.g. make it easier to find the bindings doc with git grep
> and friends).
>
>
> Daniel.
>
>
>> +
>> +- reg:		slave address
>>   
>>   Optional properties:
>>   - default-brightness:	brightness value on boot, value from: 0-4095
>> @@ -11,19 +15,19 @@ Optional properties:
>>   - led-sources:		List of enabled channels from 0 to 5.
>>   			See Documentation/devicetree/bindings/leds/common.txt
>>   
>> -- arc,led-config-0:	setting for register ILED_CONFIG_0
>> -- arc,led-config-1:	setting for register ILED_CONFIG_1
>> -- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
>> -- arc,comp-config:	setting for register CONFIG_COMP
>> -- arc,filter-config:	setting for register FILTER_CONFIG
>> -- arc,trim-config:	setting for register IMAXTUNE

IMO I would prefer to keep these and mark them as deprecated since the 
driver will still

honor these properties.

Maybe in a Optional Deprecated Properties section in the DT binding.

Dan


>> +- arctic,led-config-0:	setting for register ILED_CONFIG_0
>> +- arctic,led-config-1:	setting for register ILED_CONFIG_1
>> +- arctic,dim-freq:		PWM mode frequence setting (bits [3:0] used)
>> +- arctic,comp-config:	setting for register CONFIG_COMP
>> +- arctic,filter-config:	setting for register FILTER_CONFIG
>> +- arctic,trim-config:	setting for register IMAXTUNE
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
