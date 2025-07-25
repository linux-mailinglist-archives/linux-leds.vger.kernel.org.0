Return-Path: <linux-leds+bounces-5132-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F565B11ECD
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 14:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38FFA16944F
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20E32EB5DC;
	Fri, 25 Jul 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fApr17mn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA81BD4F7
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447075; cv=none; b=qooy3f5HqBCiefXGwlYux6qlg8n0kW5CwZTIIMZxbEIZ7IGhjgl35vP047Cye7NGa1K87HkOYO7ZhK+IF3wnqkRF9dFyjrCliVqaHMlfhS4bS9fqYyjWOAIDxObVftYWwqgYO7Pms2hbwIh6dEwjWWEajYGl7NezsyIK9QqIWr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447075; c=relaxed/simple;
	bh=ruGHJA2MBI/bHqx9IT2Fhc0C3ebab59kHOS3t3z7JeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tw64z13P2Ni2Ax46E8VW7zRE9OHmCEl25lzVPAFTDXoP1JUDb91cb0S85CaZJd1+LkVxtzdspbj5/QCuNGNAflAAvTK4uybk1Z1Mf70GaGakRyNSMbmQ6DpVYeU3axsIZdPyOvRV9tLFNkGUWvNwu9UPrLwxiRG3sfzLN4/7xSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fApr17mn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PAXscH001302
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxbPT/h2NgyuaBFUgccrrjF3eSaUnQoYtVnInKJnygI=; b=fApr17mnhmEypAJo
	7+G8ssy8OfhI55zgoslwiVH5gbwgUWCxYhGjzWI5Y668QlQSktLFJ7bdkEIiq0C5
	QzYOJZMzv0ypNWAan7Un2FwGQ2WkMJzexXDLpvsMe1BDSZMxQC+MYwnm9oCUZgkC
	vrV65qsUw6NTcTUoSkBqPWLMQv8Nz90+mqJuDgwGeYV3TWQpJ3XZyR8gIbb7sDV/
	RyKwVNue0t/oGIm4QVTBImy+TrDLgIjgp3zIeTdmPZ1gzCNAj/iq4Jott0OVvR8A
	mjxDqoMvlZDB9OTpbXY8+5mPV3J8c6zbD+8jiRnZQtIxe45OW2VuPqVhqkk0IE5D
	E5HXQA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4848970b3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 12:37:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7070423f741so2089786d6.2
        for <linux-leds@vger.kernel.org>; Fri, 25 Jul 2025 05:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447071; x=1754051871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PxbPT/h2NgyuaBFUgccrrjF3eSaUnQoYtVnInKJnygI=;
        b=Lh+nZksuvkDU719uPKSrtIBGwr0M2Tpq1UXamieyvOnMr9TfVcCiTweYG/OFZXA2xP
         KlYgikipp0fS7OhwdHqH9wOvquo9HHrwRXMm2c7GwchxZXmtDAzT6Rz7aDlrT2Gg8xHF
         NdvhNEb3CIVykgf9mB+Z2LbcV56Vng2wKf4JhAiyGharfXJrOiPnXE9vXdjNQnt6QYQn
         bPznaH1aBlwKRl7JAXqkho7xqqGhES7UYkuz8dpoeoY9A8jrv6ZDpq7YmxvW1jEeKGtv
         9I3i6BYsKQFcGmhgg9NBD0W6RHwRYayLiNL1s8QqTTFL7uU7p8OEqDCwrmuKqinIhAIc
         UdIw==
X-Forwarded-Encrypted: i=1; AJvYcCWhiv2SLp+Kb27sI+RSVLn2yrT++cTTpOVCHaqrICeI4AkuxFIBVL3Up1MvrmJiaa9iq8hPjYMbv+DE@vger.kernel.org
X-Gm-Message-State: AOJu0YweE3qDEQfCiGtg9ZO1yh3l/7YeJBNvhNSTEgXE4DNFZ0xLIjjf
	0hvii/93UyywS5gL/OQTiFip2j9Y2m0W/C2sphzpND0M3BsG6FFd3/NDogeV5OhbdViodQRaNOY
	JfJes8iuLKoo7I3vP48llDA2YJZ6gU8nfNuGaMZop+/v67/a3IzTPX+qVtfXIY/Ld
X-Gm-Gg: ASbGncvAhpn063lTzcgmoNbl+W5yUo/VixNwt2dU5Bxg5v5b6SOqb9W+eDEwhinM5R1
	e0Pv3/EhYkND8BAktQrN5coahtAHmuMXUKuLbBEIY3oo6t2NaOuAroFE771zIs9dyOQWilHY2o8
	1u+4mrU1uYPotc1a7djBt0Y4FLC90AySFE0ZYes8Lc2B4OhtpARyJeXqlz272wuO5fhYUgcTPmO
	9m+SF5gkk+JRR72nHyl5jNDn3SbyEcLlEvZJNITWMyrAopLpGMGUHqV3mhkH7gNTDZs/Nt5N/nv
	hp+lGIk3p6m3oepsbgezkBDctjeEuRxROAqsWJ76DqfVah+ACjYymaIl28LjXJpwvdOQchy+0zF
	akR+Vo02MVRq2ljGT/g==
X-Received: by 2002:a05:620a:25d0:b0:7c0:c024:d5 with SMTP id af79cd13be357-7e63bf8512bmr85403485a.8.1753447071379;
        Fri, 25 Jul 2025 05:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERt509FE/R/HDar4fcGLlfGtbq3oPf6L67zs4yLAAJi3QwodiT0ssuUrXCi77Ez0DmWv3qSw==
X-Received: by 2002:a05:620a:25d0:b0:7c0:c024:d5 with SMTP id af79cd13be357-7e63bf8512bmr85400985a.8.1753447070910;
        Fri, 25 Jul 2025 05:37:50 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff42a34sm259167866b.136.2025.07.25.05.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:37:50 -0700 (PDT)
Message-ID: <fb79df7b-1c7b-4085-9f12-35b7cd56bb87@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 14:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
To: fenglin.wu@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com>
 <20250725-fix-torch-clamp-issue-v1-1-4cf3ebaa4c67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725-fix-torch-clamp-issue-v1-1-4cf3ebaa4c67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m8NO72R2tA-GGX_kGzHiqvSp155UYAsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEwNyBTYWx0ZWRfX7+gzBaPQPvH0
 A+P1kaqQ3Zq6nOZwB/pfHlBmeSULmfi+qX/fOl5HWEmHBCX52I4xh9fXdPOI0GsknIqFHjLG6Pg
 oF/1T87zYNV7Mju4LIwXhIdVSH+Mf1Mr84WLCIt0hI1gxC7wcZw7OwP3NTmeIEC5TT3KlAvZRR9
 Tiko560NBGGMogzlRD1+a6VpMKxSw7RJ6PJPqdjmMfM3qph0iG4D6gUbuxWXIcwdGvLom1CGleX
 SMZgUEoQbiAOyCEGz9C5v4Z2mfSKfBqzxIW9zW/p+esOygSHgwIm7i66XlHci98FMJ5DeRNsgMH
 R/2Ulm3TdzPh0IC6UtPQ76RXqS7eZlB2DgudXDj0GnSqaE2fBkNfls8Kccnh6VmsFVZTmkhAeXv
 O+OX5B9RgI4P72T8E5u2C6lBRUZjgPaZB8fsHfP17jXvDQVOwx5WRoj5ea0x87BWjq5eL25x
X-Authority-Analysis: v=2.4 cv=VJjdn8PX c=1 sm=1 tr=0 ts=68837aa0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Y_oDrEvWIW03XMJpiboA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: m8NO72R2tA-GGX_kGzHiqvSp155UYAsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250107

On 7/25/25 12:04 PM, 'Fenglin Wu via B4 Relay' via kernel wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> There is a register to clamp the flash current per LED channel when
> safety timer is disabled. It needs to be updated according to the
> maximum torch LED current setting to ensure the torch current won't
> be clamped unexpectedly.
> 
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/leds/flash/leds-qcom-flash.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
> index 89cf5120f5d55bbb7e24faa8c3a946416f8fed46..9c2e41cfddcf2d50d5a633cb157084371a631d74 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/bitfield.h>
> @@ -111,6 +111,7 @@ enum {
>  	REG_IRESOLUTION,
>  	REG_CHAN_STROBE,
>  	REG_CHAN_EN,
> +	REG_TORCH_CLAMP,

This is not the name of this register on at least PM8150L

>  	REG_THERM_THRSH1,
>  	REG_THERM_THRSH2,
>  	REG_THERM_THRSH3,
> @@ -127,6 +128,7 @@ static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
>  	REG_FIELD(0x47, 0, 5),                  /* iresolution	*/
>  	REG_FIELD_ID(0x49, 0, 2, 3, 1),         /* chan_strobe	*/
>  	REG_FIELD(0x4c, 0, 2),                  /* chan_en	*/
> +	REG_FIELD(0xec, 0, 6),			/* torch_clamp	*/

Please keep it sorted by address


>  	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
>  	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
>  	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
> @@ -142,6 +144,7 @@ static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>  	REG_FIELD(0x49, 0, 3),			/* iresolution	*/
>  	REG_FIELD_ID(0x4a, 0, 6, 4, 1),		/* chan_strobe	*/
>  	REG_FIELD(0x4e, 0, 3),			/* chan_en	*/
> +	REG_FIELD(0xed, 0, 6),			/* torch_clamp	*/
>  	REG_FIELD(0x7a, 0, 2),			/* therm_thrsh1 */
>  	REG_FIELD(0x78, 0, 2),			/* therm_thrsh2 */
>  };
> @@ -156,6 +159,7 @@ struct qcom_flash_data {
>  	u8			max_channels;
>  	u8			chan_en_bits;
>  	u8			revision;
> +	u8			torch_clamp;
>  };
>  
>  struct qcom_flash_led {
> @@ -702,6 +706,7 @@ static int qcom_flash_register_led_device(struct device *dev,
>  	u32 current_ua, timeout_us;
>  	u32 channels[4];
>  	int i, rc, count;
> +	u8 torch_clamp;
>  
>  	count = fwnode_property_count_u32(node, "led-sources");
>  	if (count <= 0) {
> @@ -751,6 +756,12 @@ static int qcom_flash_register_led_device(struct device *dev,
>  	current_ua = min_t(u32, current_ua, TORCH_CURRENT_MAX_UA * led->chan_count);
>  	led->max_torch_current_ma = current_ua / UA_PER_MA;
>  
> +	torch_clamp = (current_ua / led->chan_count) / TORCH_IRES_UA;
> +	if (torch_clamp != 0)
> +		torch_clamp--;

In case anyone's wondering, ((1<<6) + 1) 4 * 5000 == 1280000 which we set
on some (all?) devices

Konrad

