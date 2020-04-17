Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834E51ADC8E
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 13:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbgDQLyY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 07:54:24 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34349 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730514AbgDQLyX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 17 Apr 2020 07:54:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587124463; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ynJ1oiNNtDGo8iLhGl7ZCdUICxiaTN7OWhxymrToTpI=;
 b=jMpB7NQFFlDhTIcPgRKv3Cvjd0AOW/VJR/st3CF3hskXoZMAtjx2RT6DuaxcFkBnQiN2C8V/
 6jJbgNhUJ3EPmnqbB7I6OL0eQtXN3W22N/7GiXo/7FomZQRNcA1slqH85nQ/XibXvWSIu9Fq
 tKLHQ+t8JYdVojNos8QtTAEhf28=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9998e7.7f500ce55df8-smtp-out-n02;
 Fri, 17 Apr 2020 11:54:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C3D4C433BA; Fri, 17 Apr 2020 11:54:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91D97C433F2;
        Fri, 17 Apr 2020 11:54:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Apr 2020 17:24:14 +0530
From:   kgunda@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V5 3/4] backlight: qcom-wled: Add WLED5 bindings
In-Reply-To: <20200415151234.GA25862@bogus>
References: <1586274430-28402-1-git-send-email-kgunda@codeaurora.org>
 <1586274430-28402-4-git-send-email-kgunda@codeaurora.org>
 <20200415151234.GA25862@bogus>
Message-ID: <f04d7fb9cd93892455d54f4dca643ab9@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020-04-15 20:42, Rob Herring wrote:
> On Tue, Apr 07, 2020 at 09:17:09PM +0530, Kiran Gunda wrote:
>> Add WLED5 specific bindings.
>> 
> 
> checkpatch.pl complains about some trailing whitespace. The previous
> patch too.
> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.yaml         | 60 
>> ++++++++++++++++++++--
>>  1 file changed, 57 insertions(+), 3 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> index 770e780..5714631 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -21,6 +21,7 @@ properties:
>>        - qcom,pm8941-wled
>>        - qcom,pmi8998-wled
>>        - qcom,pm660l-wled
>> +      - qcom,pm8150l-wled
>> 
>>    reg:
>>      maxItems: 1
>> @@ -28,12 +29,13 @@ properties:
>>    default-brightness:
>>      description:
>>        brightness value on boot.
>> -    minimum: 0
>> -    maximum: 4095
>> -    default: 2048
>> 
>>    label: true
>> 
>> +  max-brightness:
>> +    description:
>> +      Maximum brightness level.
>> +
>>    qcom,cs-out:
>>      description:
>>        enable current sink output.
>> @@ -130,6 +132,31 @@ properties:
>>        This feature is not supported for WLED3.
>>      type: boolean
>> 
>> +  qcom,modulator-sel:
>> +    description:
> 
> Need a '|' at the end to preserve formatting.
> 
>> +      Selects the modulator used for brightness modulation.
>> +      Allowed values are,
>> +           0 - Modulator A
>> +           1 - Modulator B
>> +      This property is applicable only to WLED5 peripheral.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - enum: [ 0, 1 ]
>> +      - default: 0
>> +
>> +  qcom,cabc-sel:
>> +    description:
> 
> Need a '|'.
> 
>> +      Selects the CABC pin signal used for brightness modulation.
>> +      Allowed values are,
>> +           0 - CABC disabled
>> +           1 - CABC 1
>> +           2 - CABC 2
>> +           3 - External signal (e.g. LPG) is used for dimming
>> +      This property is applicable only to WLED5 peripheral.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - enum: [ 0, 1, 2, 3 ]
>> +
>>  allOf:
>>    - if:
>>        properties:
>> @@ -179,6 +206,33 @@ allOf:
>>              - const: ovp
>>              - const: short
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,pm8150l-wled
>> +
>> +    then:
>> +      properties:
>> +        default-brightness:
>> +          minimum: 0
>> +          maximum: 32767
>> +
>> +        max-brightness:
>> +          minimum: 0
>> +          maximum: 32767
>> +
>> +    else:
>> +      properties:
>> +        default-brightness:
>> +            minimum: 0
>> +            maximum: 4095
> 
> Wrong indentation.
> 
>> +
>> +        max-brightness:
>> +          minimum: 0
>> +          maximum: 4095
>> +
>>  required:
>>    - compatible
>>    - reg
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
>> 
Thanks for reviewing. I will submit the next revision with all the 
fixes.
