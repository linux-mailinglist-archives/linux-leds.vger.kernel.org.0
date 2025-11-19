Return-Path: <linux-leds+bounces-6197-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A1C6C59C
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 03:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 070202C436
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 02:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5C927F18F;
	Wed, 19 Nov 2025 02:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4YLNk8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpfPpQCc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F427A461
	for <linux-leds@vger.kernel.org>; Wed, 19 Nov 2025 02:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763518673; cv=none; b=QRloLwzUp1zOaY2kc9EBwhMu4UbJcMRWB5TUNeHpza8+RV9fYwoax77476/1gVu0gNpEpDh3bxcyQUnFhhGzLel7UnfZdkjOa4dLEqGIbqvJBBLOWDRVaVrn/5xDTro44Qp/lzo+X+wx88ONaBlqS+pqb8zeMFMfvuGNm5JVs00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763518673; c=relaxed/simple;
	bh=0YhrzV5gD7CDuyv1H+SuXOQI/APRCSye3sXbVMJuVSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unz5rWdyKxMBXXlPdVBsmbZgTjmgM/rQRydUGZ1H1pQmlTZbaC54850utXd5lCZ14v5Va1hmklVoPZ6MnyNRZmjKkNsHFQrPQ59TScg2vU+ps6paU2MRHYxhy3D3hwNqKR89P0un3isrFIOAkjjPXzTa0CvnmaHUedOu1LLyHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4YLNk8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpfPpQCc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1a94V3412655
	for <linux-leds@vger.kernel.org>; Wed, 19 Nov 2025 02:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qLCTpbJ91/tLPaDCvXWoGR8whLKko6G7JiNVQDYup8=; b=Q4YLNk8j5fSk3bkr
	OWmMZkvFwjbSCmQE5+HR3fidCilGcQrOX5OLzwtgJo79iIgZ6TfTjNwMEBk7l/d5
	TyyeWoaT/oFlYuD53H7qnAop4XrhWdfbwmJ4FPXj4p4UOrCZ6XkM8Lr9uTyMQkBv
	RCAbJRwol7IPEYrjfIZ6kNvk5t/gF/r0pPH4Py+HmpWPJjrOcB/vzlCjiCSdSbWx
	jtRvkhL6zLeLqShb8rs8TXjJw7e902qD1Sy/hRZ2FkLJ9q97G0KcsvgqUOns6edR
	YDnLKiLm6LkdyM2/SuEJIKJJJcU49vvxyonjlQs7eDuXBOh6SBuOsGT08bAbWAAu
	UgV+ug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v1kju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 19 Nov 2025 02:17:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299d221b749so11829305ad.3
        for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 18:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763518669; x=1764123469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qLCTpbJ91/tLPaDCvXWoGR8whLKko6G7JiNVQDYup8=;
        b=NpfPpQCcQJijr8TYA22PJU5Fp97Y5jLths1hsqUwr5agB2Ta0NwVL+rcx4p4cHGsFS
         /AiXkw1QISUt5xPGFikRhLQgH7yetWBZk9yMPD6LC+hXZcUxK3SKt5yhAH/f9VA3kkJa
         UWO5Q6KWo7Rwh+38HyhkGj6zulQRQihBoKvU0h6vR5xEe568g4bm34REt7DNBHxjIQkU
         HDA2aqHWlfJWyxUgLjrj9wXts797uRCRV1wmZdZ6R9NU0yQH1RLai9YPrTogQ4/vq9NA
         B1XB1pTHucPFlII+DmrbLCrtW7XeVhlGiRzOE+jOxp0pSr6oucth3XnzvLfhhoP611vJ
         rhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763518669; x=1764123469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qLCTpbJ91/tLPaDCvXWoGR8whLKko6G7JiNVQDYup8=;
        b=oB394sJbvZz37Yb9QxOAoN0qlWxPE7BiKe3GOWFHDkO0vGInV4PZoONvfrPkxv0QO+
         EMNLdLJXqD2QiR1jvxcHgvmQGpozifnDKTL8nMeZPK918SV9+oyqh8E5z1gr/NEFsCbQ
         zvwiS56bGAynrD4CH3nXDGZnXml9/tA9KYpr4KvKEUaDxEEZKlIwAVBe4VK5P9BotWy7
         E0+nCx7Fh37vL7vuxbNYIpFxS/2tQBATu0VvzaMcE+fs+PK9o1A5NuAXUD2BYRXHwAQg
         J0FAVTj3hzjixTiVODD7X4ZHj88GR5ENS0bIY9Fu9UnCmZJs5V935VGGXK793+txGECB
         5buA==
X-Forwarded-Encrypted: i=1; AJvYcCUh/+lBzLtkk/aS9UJv6nHdL9flZsCjLcpm8r9IgzPn6Hc8khr9zpuFtoWZh/YGz/yR2AWsgGubpkQE@vger.kernel.org
X-Gm-Message-State: AOJu0YwRCVwcPdlTX9DZla0S7Bkr2B/vn9i3daE5ad1gQkXO48yjD9XF
	Ryq2KUOtGWtPK930TloJnh2hBXRwyUwdusYV8jPqyov0k4tW0D4+tlGlHw2eeEK8dCOsrKZpC+4
	61W+Kosu5GeA2qOQVd+SBn+ExUEhEhT83vsbO5jy9AZhJxjCrKPjw/U3cNCbXMLVq
X-Gm-Gg: ASbGnctPn6tH8P0NsYEVw2rOGVN9jeTNfVJW9hHF1ZniZ3MRmNsbHrazZQj0v/L2oQp
	tE4pnQESHfglnjFOeZezjv8EGhqiH51dCu+uvABR6t8TRqhpX2Yh0ZMsrQZqwSqaXrWX3xdb1L4
	LVLyrowyuerecdJWs+fYn0HnAw1ushBOtWrLQPEMM928rkxXadDLxrjY7XxMr1UVoC03J8CVxjM
	QgfM41CpA+bTj54P+jvivAKeHuwH1+fyQ+F50tImh8g0YfM/79s1L8mbABLaz+3tyq4RDRUPzgD
	AwHzkRal2X6O2A9YeEo3lp6vTgb0QKi170bXDUT124lVxhoCCT9pIciHkY31yvI6ZAIHa6sS1D1
	dwHNcd797cKbgR37PwQKAWY7Em295i8E2GfhyX8sc8XW79Ee5EOYxdlkPpPYZNxaTDX+u2OJenj
	jMq8k=
X-Received: by 2002:a17:903:2f88:b0:298:43f4:cc4b with SMTP id d9443c01a7336-2986a6d6d96mr195364305ad.26.1763518669360;
        Tue, 18 Nov 2025 18:17:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+BHebgsGCE1G+oNxb3K/WpP9FOkTq1uk6xNgjTrhRbxT7n23TYAj5iWgYTNMdrNbYWSiCYg==
X-Received: by 2002:a17:903:2f88:b0:298:43f4:cc4b with SMTP id d9443c01a7336-2986a6d6d96mr195364115ad.26.1763518668865;
        Tue, 18 Nov 2025 18:17:48 -0800 (PST)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37703a0d9sm16033385a12.31.2025.11.18.18.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 18:17:48 -0800 (PST)
Message-ID: <d10f7383-1eeb-44d2-a34f-15e76c3451fe@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:17:44 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when
 configuring PWM
To: Bjorn Andersson <andersson@kernel.org>
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com>
 <7d46k5kmygmgjje3pc3jfebestkksbnq55q44urljkrmtrvwa7@6mxkt7zlmoid>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <7d46k5kmygmgjje3pc3jfebestkksbnq55q44urljkrmtrvwa7@6mxkt7zlmoid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAxNiBTYWx0ZWRfXw8HodsDVAKvJ
 mh5qbSrV07c19kbMkgSEQ3HbeJC/uVh3s8rt7+52qsUcAUlIil+Vl7i7JHjGu6kEM1tL0VYlZdZ
 g5eAv69MemKAv9+YcQi3keJsHLorYVawh253rZ6t4LI214/bHNUjS0tDc648x/R4XjvYWsNm2ZR
 yh9fITGVKvq7G5xKJ7Cx27ZWkRVKLlcTi055HmKkce5/shIwuHKWa91DWlDIC1pIwfW7CqGhYsh
 dcf0fCaV3KA8xl4Z07UY5I4YnUBcINy1muQSIBKHpv+ySBSw2XIeN//8DhCm0JoGO1qumnXl9wM
 G2KwK3hq91vRSmVHLkQVhKZi0MZrUOFx1otjrwx/Bckjn1zQNqUrickVuTTbVzESj3+aDwzIchU
 z95w/b9BfmbnWSK3/KDZTINV/YgRJw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d28ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hjtR3xsaaK_9zSbMpp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 2nELBsxUwmr-iPQrJYodbTYj-MJMqXQA
X-Proofpoint-GUID: 2nELBsxUwmr-iPQrJYodbTYj-MJMqXQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190016


On 11/19/2025 12:27 AM, Bjorn Andersson wrote:
> On Tue, Nov 18, 2025 at 10:48:03AM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
> Sorry, I didn't find the chance to answer your reply yesterday, and then
> you sent v2, so I'll have to continue the discussion here.
>
>> The PWM signal from the LPG channel can be routed to PMIC GPIOs with
>> proper GPIO configuration, and it is not necessary to enable the
>> TRILED channel in that case. This also applies to the LPG channels
>> that mapped to TRILED channels. Additionally, enabling the TRILED
>> channel unnecessarily would cause a voltage increase in its power
>> supply. Hence remove it.
>>
>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Check "chan->in_use" flag in lpg_pwm_apply() is not correct, as it
>>    indicates the channel is being used as a LED and this PWM API would
>>    never get called. Instead, remove the code line which enables TRILED
>>    in lpg_pwm_apply() and update the commit text to explain it clearly.
>>
> I understand that in your case you're routing the PWM signal to a GPIO,
> and in that case the TRILED output should be kept disabled.
>
> But what if I have my load connected to the TRILED and I describe my LPG
> channel as a PWM channel? Is this an invalid use case?
This is not a valid case. If a load (typically an LED) is connected to 
any channel of theTRILED module, it means the LPG channel is used for 
driving an LED, and sub-nodes for the LED devices must be defined. 
Otherwise, the PWM signal will be gated by the TRILED module. Enabling a 
TRILED channel not only opens the PWM gate but also activates an 
internal current sink to manage the load. If you need to output PWM as a 
control signal, for example for fan control, the hardware should connect 
the fan control input to a PMIC GPIO. The PWM signal from an LPG channel 
can be routed there, rather than using a TRILED channel.
> With this patch,
> everything will look like it's working, except silently my signal won't
> come out.
>
> I presume there's no additional configuration on the LPG-side for your
> use case. We just configure the GPIO to tap into the PWM-signal through
> the pinmux settings?
That's correct.
>
> Also, if for some reason the triled was enabled by bootloader, you will
> now leave it enabled forever. This perhaps isn't a big issue though...
In that case, I would assume that the bootloader should also be 
customized to not enabling any LED if there is not a physical LED device 
connected to the TRILED channel.
>
> Perhaps none of this matters in practice, and we should just proceed
> with your approach. If that's the case, then we should at least document
> the behavior.

Does it look good if I push a change in the DT binding document to 
explain this?

--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -13,6 +13,10 @@ description: >
    The Qualcomm Light Pulse Generator consists of three different 
hardware blocks;
    a ramp generator with lookup table (LUT), the light pulse generator 
and a three
    channel current sink. These blocks are found in a wide range of 
Qualcomm PMICs.
+  The light pulse generator (LPG) can also be used independently to 
output PWM
+  signal for standard PWM applications. In this scenario, the LPG 
output should
+  be routed to a specific PMIC GPIO by setting the GPIO pin mux to the 
special
+  functions indicated in the datasheet.

  properties:
    compatible:

> Regards,
> Bjorn
>
>> - Link to v1: https://lore.kernel.org/r/20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com
>> ---
>>   drivers/leds/rgb/leds-qcom-lpg.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..e197f548cddb03d079c54c4a0f402402c5d047e2 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * Copyright (c) 2017-2022 Linaro Ltd
>>    * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   #include <linux/bits.h>
>>   #include <linux/bitfield.h>
>> @@ -1247,8 +1247,6 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>>   
>>   	lpg_apply(chan);
>>   
>> -	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
>> -
>>   out_unlock:
>>   	mutex_unlock(&lpg->lock);
>>   
>>
>> ---
>> base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
>> change-id: 20251114-lpg_triled_fix-44491b49b340
>>
>> Best regards,
>> -- 
>> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>>

