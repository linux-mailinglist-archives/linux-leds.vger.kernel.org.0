Return-Path: <linux-leds+bounces-5134-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2EB11EF6
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 14:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C912E165627
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 12:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC0E2EBB92;
	Fri, 25 Jul 2025 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUZpjctD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BB137923
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447545; cv=none; b=rR6jC3sE9Wd14zg2MvNjNFKWVLnBLrWGLnOfplYQr8fk2eiNqc/5J9hvxzFnaSDQrI3lk4qcYOKzJBvh0i0eHqPBy3ueN+ahv3lNOJHGs3kSV16+xxbUGR0WoiZLUarrjEi5iqK4BVY/uUzuICegdqljDZwzlcoY5KHSgFtnXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447545; c=relaxed/simple;
	bh=QbTw8SJUtfP777UsDGFoqMnCn6JvOeRYHiQ5q8JZcsI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SAji8yAssRQN2M4CQO44jl8eNzZcJtKb3RQSTQSh7+hMH8DL9Tb2/NelMRLlA/hXqjSgfgh2YrP50RUwvYUp6xfGwt6gPQgDJXgnWMmIXsMs90KIt2828MewI5uTycEkONH/6ixRZ9YOvMmWTzV1rpk//lkrAZSBax2DyYeiS5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUZpjctD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9Ghsl018080
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ti6JBDX7nM+D4zJHf8kiJnbDj8pg05R7/KSmm41Raw=; b=kUZpjctDqkxBfvad
	j96F8rk5gl0uWY8j4DzKunEAA4aRD4nepQTQFjQlezvZm27C5MPY6kF2ioaMxTJa
	IbIiWdwecMSiAfIrjFUha51L9cRgPTV9mQqKUeHaov2dPTvcjRfxeQupEqMbmMv6
	Bw0LBAX09XPjdXi3aD2PicxTYBx+eg1yQ3vNwooki0Hl9RWTvTGk15LOPYtxdHwA
	2qDUeQtnvNlhIzgeODSVXE7rU2HJwGpLoRKRNaFTE1tENfDWbGo5qKpAxpaRkmas
	A4Zy66as0OM0g6XB1egbDg8GnUhsLJWmaAbHwqbChB01u7TRC5gU7/Jot1m1WTot
	Cf33pQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s23a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:45:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70717059030so3089026d6.0
        for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 05:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447540; x=1754052340;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ti6JBDX7nM+D4zJHf8kiJnbDj8pg05R7/KSmm41Raw=;
        b=QW0kirRltJK9oKhtgV+kHQVyhUqCY0XdBRZQeKIBi7LoVv2fDEX0i1Wdn7VJyq/fIt
         NjEyLgUuCmlAGjp93izRbWhKlINZxmhLdzhuToqqNcKca+V3uZL8F03E+WyYH2OVhdhm
         /pdjAHx1uri5YXlwVWZT2fRQhE2vpItUWWDR7UhhxYX1paYiuXPaj6IlHfVsz2hDXs00
         8hXrLAnxWDa+BjFeu1+rWg3ldxYuD2XFhvlqszEfEzpnIUDGLcIK33NclXVEis6NHIYZ
         YvQ4IM2Q5XIEfhjTCvMJit3JZYSstGwVYLrtI7EgyhpEs0a68VpiG49hl4DMpT8NJYfU
         Cuog==
X-Forwarded-Encrypted: i=1; AJvYcCVsKsFiORXmE8UVW4yDivEezD4vSgoP4agRJlbODd/ZjHUoqinwCsFvdup6oaa8cGmhSQYyDJWlD3sE@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhxmkGsEXlGuj2ccNggC46z96G47OED4CJDyM2p4oLWvW60Pp
	ecq0cSxJvgs93au7r9j6PwzUs57w7u1X7Dwv0QFPoWcBbVtM8DbjXrq+pQVZWjI9WpYrrV1jbHY
	YPeTnh8WyPt0+F8t5qgxB2GP6nlYdwfPMzxLswLIaF9014j/7dJbhivv3TWcgAEvn
X-Gm-Gg: ASbGncvq1mryL43JxULxs4chgCguxX3K70Hir4U3egkgiaTrA9PeMbIJGVR27xZYpOI
	/f6XQGW2WjN6ZxPRZG2B6CPAjVGfXmbLrLVO3XMeSu8pGDedS5nUJcU12OKJg8/2XeVVjmExN6Y
	UlItdXOdYDkTR7vE9xXluuOlxx+Lcsxeck9sSxUJoBSlb1M71NiCgfDgCLpYm8aRXYuXYOHN2WK
	1tqFvGBjFLJC2m3VYl3ntAz+16FtAOL2SH4fIKZwm5czs2/EBE/9G4GTW8JJwOY4tIkekvPZQFF
	zj7ljwCSnf4NJ9yCAH3Aur0VlG3hppiyCQnCgxHzcW3dJ4tYcWUTphy3kngjV5/6W0I/cRj7JOF
	b1Ns8oQeQpmVHCPVmig==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e63bfc3749mr78312285a.10.1753447540331;
        Fri, 25 Jul 2025 05:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfLV1ZY39q/r+UCCQN6SW6T2ISL2r6UJg3mQuEZwzTcICCrxo2zw3qZqg9ajzuJjSd2TQxHg==
X-Received: by 2002:a05:620a:284c:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e63bfc3749mr78309285a.10.1753447539691;
        Fri, 25 Jul 2025 05:45:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af479228a3fsm271198866b.0.2025.07.25.05.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:45:38 -0700 (PDT)
Message-ID: <353b1b08-a57a-4f29-abc5-8d6e36b3190b@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 14:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com>
 <20250725-fix-torch-clamp-issue-v1-1-4cf3ebaa4c67@oss.qualcomm.com>
 <fb79df7b-1c7b-4085-9f12-35b7cd56bb87@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fb79df7b-1c7b-4085-9f12-35b7cd56bb87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NRD5OwqfyprBf0RBi--UQ_vkPMmCsZft
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68837c75 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Vp3g0LN821RPyLkq7IwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: NRD5OwqfyprBf0RBi--UQ_vkPMmCsZft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEwOCBTYWx0ZWRfXzBAgt2UAuOZW
 iRK8Co6BEnVrMQimotdZhmMTYSGPBWl1+rDvhl1Pjpetj95MndUOU/rcgPTkDfcygT1lsoHw/C1
 FbomNOU5aDfzlQvLm74spn+bqRgRILyBGNWpJeZcBQNBeP8u/mVAx37NJu0qiS8VM3RnWo90jb1
 LSCpRI+B4uFtKigzvqre0re5Hp6YjF5o3GtRojCYfO6dUVsn01GtXHHZa+egJjeiA+rnUbpUosP
 nhMHERILtOXIIU/aRBLuoGUAKMBW1eoc571+j/r5pcQ/3JNkqao3fuYt6tFANn2aXSwCwl3MJdA
 JQGv1xVAo9bdPb1sWWZ2IjmQVRCY5h9PykAIItQoqWcueryMvJmlOf/qCtnnsofSU0xnAWMvMcT
 d0dTS56WGZUTyJpSLGIrsmd/A+SRvaGmjDutQDroDt3eZPrkthit/XtLb63l66/giHpzOo4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250108

On 7/25/25 2:37 PM, Konrad Dybcio wrote:
> On 7/25/25 12:04 PM, 'Fenglin Wu via B4 Relay' via kernel wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> There is a register to clamp the flash current per LED channel when
>> safety timer is disabled. It needs to be updated according to the
>> maximum torch LED current setting to ensure the torch current won't
>> be clamped unexpectedly.
>>
>> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>  drivers/leds/flash/leds-qcom-flash.c | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
>> index 89cf5120f5d55bbb7e24faa8c3a946416f8fed46..9c2e41cfddcf2d50d5a633cb157084371a631d74 100644
>> --- a/drivers/leds/flash/leds-qcom-flash.c
>> +++ b/drivers/leds/flash/leds-qcom-flash.c
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>>  /*
>> - * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>>  #include <linux/bitfield.h>
>> @@ -111,6 +111,7 @@ enum {
>>  	REG_IRESOLUTION,
>>  	REG_CHAN_STROBE,
>>  	REG_CHAN_EN,
>> +	REG_TORCH_CLAMP,
> 
> This is not the name of this register on at least PM8150L
> 
>>  	REG_THERM_THRSH1,
>>  	REG_THERM_THRSH2,
>>  	REG_THERM_THRSH3,
>> @@ -127,6 +128,7 @@ static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
>>  	REG_FIELD(0x47, 0, 5),                  /* iresolution	*/
>>  	REG_FIELD_ID(0x49, 0, 2, 3, 1),         /* chan_strobe	*/
>>  	REG_FIELD(0x4c, 0, 2),                  /* chan_en	*/
>> +	REG_FIELD(0xec, 0, 6),			/* torch_clamp	*/
> 
> Please keep it sorted by address
> 
> 
>>  	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
>>  	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
>>  	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
>> @@ -142,6 +144,7 @@ static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>>  	REG_FIELD(0x49, 0, 3),			/* iresolution	*/
>>  	REG_FIELD_ID(0x4a, 0, 6, 4, 1),		/* chan_strobe	*/
>>  	REG_FIELD(0x4e, 0, 3),			/* chan_en	*/
>> +	REG_FIELD(0xed, 0, 6),			/* torch_clamp	*/
>>  	REG_FIELD(0x7a, 0, 2),			/* therm_thrsh1 */
>>  	REG_FIELD(0x78, 0, 2),			/* therm_thrsh2 */
>>  };
>> @@ -156,6 +159,7 @@ struct qcom_flash_data {
>>  	u8			max_channels;
>>  	u8			chan_en_bits;
>>  	u8			revision;
>> +	u8			torch_clamp;
>>  };
>>  
>>  struct qcom_flash_led {
>> @@ -702,6 +706,7 @@ static int qcom_flash_register_led_device(struct device *dev,
>>  	u32 current_ua, timeout_us;
>>  	u32 channels[4];
>>  	int i, rc, count;
>> +	u8 torch_clamp;
>>  
>>  	count = fwnode_property_count_u32(node, "led-sources");
>>  	if (count <= 0) {
>> @@ -751,6 +756,12 @@ static int qcom_flash_register_led_device(struct device *dev,
>>  	current_ua = min_t(u32, current_ua, TORCH_CURRENT_MAX_UA * led->chan_count);
>>  	led->max_torch_current_ma = current_ua / UA_PER_MA;
>>  
>> +	torch_clamp = (current_ua / led->chan_count) / TORCH_IRES_UA;
>> +	if (torch_clamp != 0)
>> +		torch_clamp--;
> 
> In case anyone's wondering, ((1<<6) + 1) 4 * 5000 == 1280000 which we set
> on some (all?) devices

Scratch "the + 1", I had both the width of the field and its max
value in mind.. the rhs still matches..

Konrad

