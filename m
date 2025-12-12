Return-Path: <linux-leds+bounces-6411-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA8CB8643
	for <lists+linux-leds@lfdr.de>; Fri, 12 Dec 2025 10:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D7530CD0FA
	for <lists+linux-leds@lfdr.de>; Fri, 12 Dec 2025 09:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E93431283A;
	Fri, 12 Dec 2025 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EK9RF/6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNwvvS8k"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A0D312820
	for <linux-leds@vger.kernel.org>; Fri, 12 Dec 2025 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530345; cv=none; b=c3IYUvZZl1B8DG1wA5pUUvWCh4kLjIdjFLakryoF+wc+rJxfpuTN7sO+QQRcQBEz87zI5qhrc/qj6ohYht2j7iekpu0ebiotj9gyLHrU3ullsd35XjWngnSRG8/STAeCMJQPdREKTh7TTKMQDiQE0v3xLHh5FuUlBuIAVh8Rr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530345; c=relaxed/simple;
	bh=xrmgGCgFrU6vIU8uBY7JJOVp1heoUxGeVMCpOgMlZPs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JfJiZ6EdZ6rAKarFk+xql1DqPlfJG89Y1F5CNH4TdzWd6ZJuNsXW3BOmcBB2Rgs+KsRkwx5r2ac+LDlqnhDTqHwh8RizJ490EtiFRjfF5Fma32+PCPH5gEM1JvaWC3u5+BkqgyZW5QaZV/dtgIiFfXyYZpNm2Kr0KJcolP1hpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EK9RF/6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNwvvS8k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC8SYPE3432697
	for <linux-leds@vger.kernel.org>; Fri, 12 Dec 2025 09:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fo1TThen4KPg9NOYuyuxZuTulH1Gx83LwJhG7LNHqcs=; b=EK9RF/6k2IDNJ+qG
	Uw/8XTS4V3VDS/+KBhHxPsVsX+BdiJjF/ernJQduUDRhIMBKN+js0mgiP//7hGXP
	tSHl7tDk4YOS4ZR+p2pqmdDc5R+ip1oGA//9IwaTsd2s+0PGOR6HMn1EnqG076FM
	ilGRiTAp4G6U6W+TLgV6OvLD8EfGOONB5eQLc1WZqqoL2oQXz5zpCT8PUbSLB75B
	ipuk83EtA4u07bKme9Rnf4zUEIQi2Ss9yIVxfZGaDGxIuXB79YpGz/VoCnzeKmIF
	F0xRFxWOmbbxuXdTcdCaRitgO6zanJ9aHEPAMqJNRxphVJZ6ZAGuVamsAWDTCShH
	ktAzNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0fjt82cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 12 Dec 2025 09:05:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so26965951cf.2
        for <linux-leds@vger.kernel.org>; Fri, 12 Dec 2025 01:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765530341; x=1766135141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fo1TThen4KPg9NOYuyuxZuTulH1Gx83LwJhG7LNHqcs=;
        b=HNwvvS8kSBeRtaegkFCzNFMY6bQJxD80SuHfcbvbCFde90PMMaQqtU4WTzqtZqbWf3
         j6mhePXEr8xVEDEN7rmfDP6kWIftkzERi9IZqn6d3+GyA2tbQ/DJUib7SNvP7l3k9nu+
         YmiFyhc4Z597W5fRp2OaWO/Wt1nxoUGn3A3zgwafme5qyKluV7hN29Q/z4Pn052390jg
         SURk7HY4o6intL4NuOT8dmxBM1+CPLQDd9JqubWlNRKdn03W+4eehyrYdrWFy+97bfOl
         g+51b2ng0B57AKSIzIyXEbJSDzJVH+GHNSooIp0IdtL7uaaZ2KDGNeN8qgapWn1gfKj6
         iOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765530341; x=1766135141;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo1TThen4KPg9NOYuyuxZuTulH1Gx83LwJhG7LNHqcs=;
        b=Nz7+StMymTME45LC/xE1vtk1C3Z7nansSRB4lxz8unnJIRRjArFr5S/AvKqsZsqBPj
         w3oRhRPURwYBpARjoYwPxStO6BSDSfwAVTlh0ZZNqL+uF3Re2/HUHX8WzZhzfwtN3nVG
         4HIJsh4DSf3Sy9JGMeJNCgYKcbDO2Q0uBN0WARmRv6yLPi1rDQC5U1HY1y60VmoqzGNR
         APDxpX/4YRChWdtvHz0mpovgrdub6Q0/J5zqs5VGbKHLnQPbZIvY8VqrHVrkLV274sPQ
         VN5k48ysn6vegTtc5J71E9WMYDbQMuS286+iFlptF9qk4IIidJBJU9e9OWKAnSQWzjU4
         DkLg==
X-Forwarded-Encrypted: i=1; AJvYcCXlJa5jpkjyeIxy8iJQbQiuYwNn9k8G0jKmKc9KbeV6by4u9hYcsKt2eVMWvdCDTw9oiZx99pGCL3Ei@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6Dkfnm6o6aQ/FLOVb/69ja8t7ygBLIngjWYJRagrUU7FFjIk
	Udv6e38BbjL2cqXVGNvuVV3hARttZqeM1azwQaMbuyobW9FGznXxhZvDXsExtLD3EAjU723LLXb
	tsOQaba0mb3rEuobpq4H8A4tE0yTJ5qjFO7rH4oilT6aU75Ga68gu4VeugvuVFrkNmfoI/Q+Z
X-Gm-Gg: AY/fxX4jcM0hCx7eThTHCWxaFfg1XLcFyp9XYHYnLvD2axCitr9+INBItI3yrd7meRg
	UK9AYcO1foue6+JPIkqilZkXjgeGtuIU8KMfiE7eiqN7ao1rZeoroa8Xdufz7vIuuJNPAwK1zLc
	4uJHl+8ckwScnZ09sXntqPCn8D54JrPs606tzNbuvZxI3t0KhVyOwTtp04k8RB6i27hHKxZbUcW
	j/bdB2qfhfYY9eSaFsspLBffenmrVSd3zZ0N6LWMas6lOe//xwDgFOeJfn2+oP5p5KIULtCb2Vx
	4pp8lwcO8JbxB62NyrKhNBeg7WjV7ecBvYIEtJyK4tWo7d5lSBaSoHVkxYCbGMjVfRVi2ns2lpw
	fgvGvCPu9B/7eeP01tu6kMdXfcXxu0blqaCCroNRYTopiym0v1OakWPUil2kYIKUgHCLbMj65Gq
	097rK3nJZdm7gDXZlOsxCTDKtAcGKHTodkXYW33QIK9cE3Ggg/WJgSmjIqrVIx61iDRTiCxKTsv
	zFb
X-Received: by 2002:a05:622a:1b8f:b0:4ee:18b8:2ddf with SMTP id d75a77b69052e-4f1d053d070mr14512331cf.37.1765530341209;
        Fri, 12 Dec 2025 01:05:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF45/TKRNUTsb/SJSuVbiwJAVpjK9l6qeZ2d/7lwqJrXeEQvFwBOPm2wY3dpRBRzuXBoD95GA==
X-Received: by 2002:a05:622a:1b8f:b0:4ee:18b8:2ddf with SMTP id d75a77b69052e-4f1d053d070mr14511961cf.37.1765530340603;
        Fri, 12 Dec 2025 01:05:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64981fa5514sm4684243a12.0.2025.12.12.01.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 01:05:40 -0800 (PST)
Message-ID: <585dc6a5-64e3-4f54-8ff3-9b9f1fc3d54d@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 10:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] leds: led-class: Only Add LED to leds_list when it is
 fully ready
To: Sebastian Reichel <sre@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, stable@vger.kernel.org
References: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
 <2bbtf7out2t52pge4hezfc7dryu6te2qstfm5kzez7zrw3dvqq@wxvqnjbulxc4>
Content-Language: en-US, nl
In-Reply-To: <2bbtf7out2t52pge4hezfc7dryu6te2qstfm5kzez7zrw3dvqq@wxvqnjbulxc4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZxqTZz3YCbZJ_rXkXioc5F0pbUYjFyio
X-Proofpoint-GUID: ZxqTZz3YCbZJ_rXkXioc5F0pbUYjFyio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDA2OCBTYWx0ZWRfX9WI7Qo7J4g3Y
 S7mhTlCRQceNavkAIqHXGt1YehjV5kFoWSk89wOaLr09dIxVk+xdiavO/bAeENTQyGXF7dS82cc
 vUcg01ExRH+6Nk9X4TUtdLZuq7Fn5SeqU0jOZczaHoTNyWSgiiuyN+13z9QjgF9Mmq0Qeh03wL3
 n1/t3nYGGohCW0XdtxLQtdEkhVNddzOhuHKrKSt8qmbvbCmu6ebWiCWMpsFFS/GVgpDMSNCF4l0
 /RmI1TxbT9tlNRbw/lAcLNkZB7GsOQjx2yQ8rKVAJmaF+eLeF/XslnUVQjEu5AcLxN7jJ96/eMu
 VjnTVMZ0kdMnHU87RLTaYtZPDWtkofBmittxEEpBZiYEqxJJe6Aku6AltTEjAvyA+/QAWk4D9dx
 oLane68cGlhgtWsxD8basA+n7W8HmA==
X-Authority-Analysis: v=2.4 cv=GrpPO01C c=1 sm=1 tr=0 ts=693bdae6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=zz-1Wuj_SYMfJuCV:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1w4XLJb60M6FLaDUVvQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_02,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120068

Hi,

On 12-Dec-25 07:49, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Dec 11, 2025 at 05:37:27PM +0100, Hans de Goede wrote:
>> Before this change the LED was added to leds_list before led_init_core()
>> gets called adding it the list before led_classdev.set_brightness_work gets
>> initialized.
>>
>> This leaves a window where led_trigger_register() of a LED's default
>> trigger will call led_trigger_set() which calls led_set_brightness()
>> which in turn will end up queueing the *uninitialized*
>> led_classdev.set_brightness_work.
>>
>> This race gets hit by the lenovo-thinkpad-t14s EC driver which registers
>> 2 LEDs with a default trigger provided by snd_ctl_led.ko in quick
>> succession. The first led_classdev_register() causes an async modprobe of
>> snd_ctl_led to run and that async modprobe manages to exactly hit
>> the window where the second LED is on the leds_list without led_init_core()
>> being called for it, resulting in:
>>
>>  ------------[ cut here ]------------
>>  WARNING: CPU: 11 PID: 5608 at kernel/workqueue.c:4234 __flush_work+0x344/0x390
>>  Hardware name: LENOVO 21N2S01F0B/21N2S01F0B, BIOS N42ET93W (2.23 ) 09/01/2025
>>  ...
>>  Call trace:
>>   __flush_work+0x344/0x390 (P)
>>   flush_work+0x2c/0x50
>>   led_trigger_set+0x1c8/0x340
>>   led_trigger_register+0x17c/0x1c0
>>   led_trigger_register_simple+0x84/0xe8
>>   snd_ctl_led_init+0x40/0xf88 [snd_ctl_led]
>>   do_one_initcall+0x5c/0x318
>>   do_init_module+0x9c/0x2b8
>>   load_module+0x7e0/0x998
>>
>> Close the race window by moving the adding of the LED to leds_list to
>> after the led_init_core() call.
>>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
> 
> heh, I've never hit this. But I guess that is not too surprising
> considering it is a race condition. The change looks good to me:
> 
> Reviewed-by: Sebastian Reichel <sre@kernel.org>

Thx.
 
>> Note no Fixes tag as this problem has been around for a long long time,
>> so I could not really find a good commit for the Fixes tag.
> 
> My suggestion would be:
> 
> Fixes: d23a22a74fde ("leds: delay led_set_brightness if stopping soft-blink")

Ack, that works for me.

Lee can you add this Fixes tag while merging ?

Also (in case it is not obvious) this is a bugfix so it would be
nice if this could go in a fixes pull-request for 6.19.
 
Regards,

Hans




> It introduces the set_brightness_work with the INIT_WORK at the
> wrong position (after the list addition).
> 
> Greetings,
> 
> -- Sebastian
> 
>>  drivers/leds/led-class.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index f3faf37f9a08..6b9fa060c3a1 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -560,11 +560,6 @@ int led_classdev_register_ext(struct device *parent,
>>  #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>  	led_cdev->brightness_hw_changed = -1;
>>  #endif
>> -	/* add to the list of leds */
>> -	down_write(&leds_list_lock);
>> -	list_add_tail(&led_cdev->node, &leds_list);
>> -	up_write(&leds_list_lock);
>> -
>>  	if (!led_cdev->max_brightness)
>>  		led_cdev->max_brightness = LED_FULL;
>>  
>> @@ -574,6 +569,11 @@ int led_classdev_register_ext(struct device *parent,
>>  
>>  	led_init_core(led_cdev);
>>  
>> +	/* add to the list of leds */
>> +	down_write(&leds_list_lock);
>> +	list_add_tail(&led_cdev->node, &leds_list);
>> +	up_write(&leds_list_lock);
>> +
>>  #ifdef CONFIG_LEDS_TRIGGERS
>>  	led_trigger_set_default(led_cdev);
>>  #endif
>> -- 
>> 2.52.0
>>


