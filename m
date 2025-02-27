Return-Path: <linux-leds+bounces-4105-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD040A471CD
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 02:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4698D188FDF1
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2025 01:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149CB61FF2;
	Thu, 27 Feb 2025 01:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q/X48syr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF813DBA0;
	Thu, 27 Feb 2025 01:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740620887; cv=none; b=CpD0R/rcpha0pp7w1sR7toN0eZLWT8WlAWdu7yeFv+UJ7dcHKsJvyrPXhfByRQUpMRTZqvpW5l/vn4hCZ6pKnH5dfiQ8U4lLuJzc96bsoeNIOBCwT4Vo6sZIXx0Ed1mjaXrRNHHVMJlycaOjcNxDpRF3dMysBH6A4Pk6BIbec2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740620887; c=relaxed/simple;
	bh=c3jHSH5/Ic2hfTlW1xxDY80EJf3Z4p+MfLyYQXVfbks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mkZEU9CuXT/70a8J9QZiasiKdbNgxFgZiOGj6GPfOFMuDb2jM+QUpt2WA6P0p5R43+Kbh63REkA0W+Jav7amxhQIf97KiRh/aqBLEhxPTeqci3Vsria+y87sXaXSCQxZ2X7h6Fc1QonDWL8/Iu9eIUTXNIW9glZPJ4Lh8KxwcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q/X48syr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QL41QN015804;
	Thu, 27 Feb 2025 01:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TtABugFltVHuLEvIWfL7aCH1UmuOTxK96s6ajxC5MI=; b=Q/X48syrI/YkpBLF
	S+Aq9csrQC5yiPnWh2W8qJenS9LuqFJaJ/1GTHYCanA8VbN8rpRVYh831IW1HqfW
	qvQSHHtO65GNEBhcxRoXsncyRXhc8z6Vb8fLMgDyglM+FcTGKbwGh3JrhdrUep9O
	ci1QmlPmOMV1HZPma8PPJS2Emuo2q8pOWQrtIf3VRo3677/VsUicHHXohDspR8+i
	cCGJsA4Qu450rHO9WUl5XasZcWMiPm8tGkVZdQv1V+YPj3DzQ22yeiTuiUV2JG0n
	NfIkxGfYKgibZrFO5mKPrBbGQDy6x5mO0Vv/IJe1dnBEkFxRyErJY3KOLftgEhcB
	Wna6cQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnkw4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 01:47:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R1luVM009349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 01:47:56 GMT
Received: from [10.110.36.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 17:47:55 -0800
Message-ID: <c328c258-6e26-4727-98d8-c9d551358bbd@quicinc.com>
Date: Wed, 26 Feb 2025 17:47:55 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] leds: rgb: leds-qcom-lpg: Fix pwm resolution max
 for Hi-Res PWMs
To: Abel Vesa <abel.vesa@linaro.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek
	<pavel@kernel.org>
CC: Kamal Wadhwa <quic_kamalw@quicinc.com>,
        Jishnu Prakash
	<jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-0-7af5ef5d220b@linaro.org>
 <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-1-7af5ef5d220b@linaro.org>
Content-Language: en-US
From: Anjelique Melendez <quic_amelende@quicinc.com>
In-Reply-To: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-1-7af5ef5d220b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EhxmHmq6o0X-OBGGrJXaMKRw28hXHADL
X-Proofpoint-ORIG-GUID: EhxmHmq6o0X-OBGGrJXaMKRw28hXHADL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270013



On 2/26/2025 5:58 AM, Abel Vesa wrote:
> Ideally, the requested duty cycle should never translate to a PWM
> value higher than the selected resolution (PWM size), but currently the
> best matched period is never reported back to the PWM consumer, so the
> consumer will still be using the requested period which is higher than
> the best matched one. This will result in PWM consumer requesting
> duty cycle values higher than the allowed PWM value.
> 
> Currently, the consumer driver known to fail this way is the PWM backlight
> (pwm_bl) and should be reworked in such a way that the best matched period
> is used instead.
> 
> As for the current implementation of the duty cycle calculation, it is
> capping the max value, fix that by using the resolution to figure out the
> maximum allowed PWM value.
> 
> Cc: stable@vger.kernel.org    # 6.4
> Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index f3c9ef2bfa572f9ee86c8b8aa37deb8231965490..146cd9b447787bf170310321e939022dfb176e9f 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -529,7 +529,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
>   	unsigned int clk_rate;
>   
>   	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
> -		max = LPG_RESOLUTION_15BIT - 1;
> +		max = BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;
>   		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
>   	} else {

I have a patch under review, 
https://lore.kernel.org/all/20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com/, 
which adds support for 6-bit resolution for regular PWM so this capping 
problem will also become an issue for regular PWM.
I think it would make sense for you to include fixing the max for 
regular PWM here. Thoughts?

>   		max = LPG_RESOLUTION_9BIT - 1;
> 


