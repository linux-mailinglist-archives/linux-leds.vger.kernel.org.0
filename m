Return-Path: <linux-leds+bounces-4040-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A99A3E6AB
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 22:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3419D19C4C39
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 21:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B25264FAF;
	Thu, 20 Feb 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7fJ8uQ/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426B2641D0
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087060; cv=none; b=oUwMAmVy1XhruPxiNyMVfKJmQaVcHJDWDKXyYntjsfIlxGxoKL0aTlmcA9svI7Q5C1sm9Ava7S6tFlpn9UJxFhVJc+BGPuvQEsQpIyiaZR6MoiKa6FY+QqJqOBUaKiYsCPSsyKHeofHnbkRlxD7fdb73ufg8BEmA5owUUy4XrLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087060; c=relaxed/simple;
	bh=Jcm7PvHpMe7tKGTpIyGRdzGtn040bJAdsFeXtJ5E8RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNSiEPUSx8a3RjprS61fcrlsr7qHPM8r60VpVJYPQMdU9R6lAr6gIzBZKGxm6W72bdjsiWbcjZhnRIrHRniG2FIlvC3PHSMS1a4FsPS/Em/4UVDqSk8/GkItxzRocpfmvlFjw7r+n5/eN/mlp84cZ+HNRGvXcMx6d82WgMP6pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7fJ8uQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KGM2bx031746
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 21:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4b/yWlz2b5oRI/+oWIeuPJO4gw6pMqA+jcdXud5kRy8=; b=M7fJ8uQ/YQo+U5c1
	AI+PflHA7lAcH+DS21iEGwiibUMtciUIcKz3/V2ET6UD0hQcsJbfLVBht1sSBkDP
	MuSPUB4eM9endoIm754gqnrbvAXD1oMQqePAQ1McSuYXQ1Q/IcjaP5IQawfcgYzg
	SrJ6aebRLmxbr3uxqont8+AqcSirCol8DRtPa50Ofion/M8SvF2QpzcI4omYgnOI
	DbGmJfm3BR/4fTr51Za7mhC27tnfcbgPcy36zGym0Mb2W7Nz96oBIy6LA95wBR+J
	oLRKdz8T2UYLs0w8pFqxNMNMaO2VF95bopoFJvA0evNecWoDCF7QnYVkyt3x15Dc
	XdvnQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5feax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 21:30:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220cb5924a4so47124235ad.2
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 13:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740087056; x=1740691856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4b/yWlz2b5oRI/+oWIeuPJO4gw6pMqA+jcdXud5kRy8=;
        b=N0Udn1DzidjUlLyit++rJENOpu9xfsBxun6+iV+40AJnHhHL2SseU5z0RW1oZ9JZ+k
         LaLFZA5a1cfuG4xPL8d/ts1yf8O7LmdSAitlym/BvXb+dGzGXXVhjwm91m1PJBdfSX6/
         mbm18TzPCh9MhVehxOUqWLLYzOZlcjwEmOsUyAPxrq3sHcmIVeuO55LQGqxzl1oFbO3K
         OJZVrn/nmDFyFM40sA6zsQy3ixhRuwgy4DLveN3TRkMq9ti6eT+wxYtsp8EkigCSkcxh
         Jp3P12qCPWwDg2DFg7jlyhz4AJjzX89HZHqk9/zJ3auEYTz33S9c2fZ6oBcuX05kF9tz
         Tn7A==
X-Forwarded-Encrypted: i=1; AJvYcCWyoFKxPSTxbwPA2C3xJvtkccDZFrkInx53hG/3kQWz0Ugp/KzUsZ3T/m7SUujUcaESyfO1arozWJRE@vger.kernel.org
X-Gm-Message-State: AOJu0YzmeWo/6ua4msOoQ/kF7JVfBh9uTeVooFSiw/E5BlkEIDHzDHYL
	Ny+cCnphNYxiS8LTFqcwFvR3o97verey7QQwaYyzS1Th4Lo0Xkvk1UnW3sXRlAHrgkPy4KSjsaE
	rWHVmHbv8iPmQYgvK6USwhYlqoC9Y/b53XrKZNfI9iIPCqst1SdKOyzOjiC+V
X-Gm-Gg: ASbGncvYEGCgGe637mK5THrQtGX7H/d05v3TpYcnQYxWyxE9QaQ2fUPpLBElexqosbW
	+/J3z2tElu94B9CtgIuvtgkhZkgtnDubCyq+zeQE4jDk38vdfrhk8V2alyx1Hlbx6BzsO3kxkin
	V1m3WPJ6UfYHD57lzV5s6FaF50iu1Fdee5zL0yxgx6iQODu69A1x6UWD8migMP+aQVdzZT7D8bl
	NQNwGOBno6qIdLgqBWwcYRnIzz0rwLXgsuHg3yME/1ydKlzTv2hYQTmJ9UH8gXQchzg9V94GvnP
	NX7+tc5J3MRdqKvcO6WWZ+SAmjDNITghmsyq9O5JZgac5j6nqDXmmUmdBV7+LWwfH+qxXg==
X-Received: by 2002:a17:902:da91:b0:220:c143:90a0 with SMTP id d9443c01a7336-2219ff600b7mr11658985ad.24.1740087056262;
        Thu, 20 Feb 2025 13:30:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNaLSENnRatqWhogdEYw5CUZWUoO3mcRQXara8Vz/XKsvoelzsFfaRcRLsxSscNETH5JB+8w==
X-Received: by 2002:a17:902:da91:b0:220:c143:90a0 with SMTP id d9443c01a7336-2219ff600b7mr11658495ad.24.1740087055823;
        Thu, 20 Feb 2025 13:30:55 -0800 (PST)
Received: from [10.71.108.77] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d559089asm125179175ad.241.2025.02.20.13.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 13:30:55 -0800 (PST)
Message-ID: <e97d17ca-be8c-42a2-9767-77d73eaa916c@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 13:30:53 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM
 resolution
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, andersson@kernel.org, krzysztof.kozlowski@linaro.org,
        morf3089@gmail.com, u.kleine-koenig@pengutronix.de,
        marijn.suijten@somainline.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Zejiong Huang <zejiongh@qti.qualcomm.com>
References: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>
 <20250220145522.GA778229@google.com>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <20250220145522.GA778229@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F7xRpFCSK_JR4WqfORcAFW1AE1hgfugZ
X-Proofpoint-GUID: F7xRpFCSK_JR4WqfORcAFW1AE1hgfugZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200143



On 2/20/2025 6:55 AM, Lee Jones wrote:
> On Wed, 12 Feb 2025, Anjelique Melendez wrote:
> 
>> Currently, driver only allows for PWM modules to use 9-bit resolution.
>> However, PWM modules can support 6-bit and 9-bit resolution. Add support
>> for 6-bit resolution.
>>
>> Suggested-by: Zejiong Huang <zejiongh@qti.qualcomm.com>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index f3c9ef2bfa57..4e5c56ded1f0 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -24,6 +24,7 @@
>>   #define LPG_PATTERN_CONFIG_REG	0x40
>>   #define LPG_SIZE_CLK_REG	0x41
>>   #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
>> +#define  PWM_SIZE_SELECT_MASK	BIT(2)
> 
> Are you sure you want to shove this between 2 seemingly related defines?
> 
We placed the PWM_SIZE_SELECT_MASK here so we could group all the masks 
used for PWM together then the masks used for Hi resolution PWM together
i.e
   1. pwm clk mask
   2. pwm size mask
   3. hi resolution pwm clk mask
   4. hi resolution pwm size mask

Would you rather have definitions grouped based on mask type?
i.e
   1. pwm clk mask
   2. hi resolution pwm clk mask
   3. pwm size mask
   4. hi resolution pwm size mask


>>   #define  PWM_CLK_SELECT_HI_RES_MASK	GENMASK(2, 0)
>>   #define  PWM_SIZE_HI_RES_MASK	GENMASK(6, 4)
>>   #define LPG_PREDIV_CLK_REG	0x42

Thanks,
Anjelique

