Return-Path: <linux-leds+bounces-4728-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A2AC765B
	for <lists+linux-leds@lfdr.de>; Thu, 29 May 2025 05:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C6E47B51B2
	for <lists+linux-leds@lfdr.de>; Thu, 29 May 2025 03:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8B2245006;
	Thu, 29 May 2025 03:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izhl589d"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF7245025
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 03:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748488303; cv=none; b=b/k9TG+OzUjHSAXLYkteDcGOx4fvjluOdj9GlJsBJ0Ea9nsPL9Um2KwzerDHJ1ME5RI0Mba9R+yGIZPXmApV0And0xLVoiDtN+a4bIWx4JVVAL8g6yxG5s53jblGblhB9W37YjU0fu8C2u8KUzyAYbvpiCKh7NvSpxnJiUB28iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748488303; c=relaxed/simple;
	bh=aaJ6iaqpBEkCCmxAISiX4uGVBDBfRGWsFdy29xehZXA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cwg/Mb8A2B5kLcJjDHhToc0Gj4hoqlthy512mi6G1VjQY32YmRq4diVjDbQcIX846m9hxKcOaT7nr4iZdjykSt3apF0CBoMqUFHIZR23ScOi3nv/FC/tgBmDKCySG3KuT1EFYAY5zre/oQawoUkyrOujZUyECmx4OQT99sBvtUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izhl589d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SJjOPU009214
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 03:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2vePQPOnLVdfdrggklf8PTNS1Rsknj1/JpGHx3svC8=; b=izhl589dsj2FHk+1
	RndQ2CwUNyWJqEVf0pgg+eCah8WfBYZCDkBgGTTIjRTYI/DAMJQSWiiSKTbHvgkM
	fUf/kn/ZoKgVdTcTxSgq+zCPMYrHoK7Yg5pFT1zOPlWEQr2e4JeeyxE+lgZVzmwt
	JyWBEVkhRtFr4cOxsICA7xlD6QNIscLT3qBOQuf1KqAVbtUQX4YuMbh2Ea5cWgcB
	7ptXNv+zuzp2qdcw8iIinwVOlNCn0KKzsZAYLJR34QB7NPq1rvTEVEx3oIiXkL+W
	NYs+ccXtg/WTNr7t9VCvrFRX9oYNNjOcq3WxjsBU1+MPRXoJ9+iIXu1DCPjDl6eC
	+rt6Pg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mtgau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 03:11:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311c5d9307eso522038a91.2
        for <linux-leds@vger.kernel.org>; Wed, 28 May 2025 20:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748488298; x=1749093098;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2vePQPOnLVdfdrggklf8PTNS1Rsknj1/JpGHx3svC8=;
        b=r1JIvH5L67QO7Bn62YfGpb/c6hCLLOzgez/gLWaESnNZ17YkdXZXTNLjEmmAxHorZO
         ZiJRSRpFk10fVmWZTSmi7wtYFfRwe03zzZlAyX0cOy9z8AXrPLpBYqVybn2J8/I4fkbJ
         UeGtsS7kJwYTyV5ojv03yEQDngrfFb/yh3Ur0z4iloB8QWRlXxnLfStjl9V/CJadleuM
         DzWLbVF+f28USdTPK3vSvHI2FbHWYG6ft1ypqGiNpS4DghXB0dj784ZvOmoMzVpzNEXG
         WyWikpmP3dA+7OWSraeeIlCFMmBnpq1gSf7jGbgziJTq8rXlgMTW4WF4uAyUbYRKIJvP
         Y2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf9QDKNuexMuVl4to1xwwweRJGzGJISL/LzbM7Rhn+gKld+eEo9mxWnQWQ2rVjmbeO8m/6tO69QGZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lksGY35mwdYfQSNL11YqYUjjvvmNs86Rymq2HPDtg6eUPWPz
	Qe3LvCuuPfUYA7nP3gYiSnxSJzaPKUWcc8hVh+nVfF4RbCj7OX59yQojEPag8/oEfwcMTGLSFKE
	9fuYjVQnynbIbXcJ4HkzvEBlkP122kKm27qMWZvIEP2x00vFZuH0AHsCBtBMBxxJc
X-Gm-Gg: ASbGncs77+FgqL8WDFwKZ3trvZllyWkiF4dP+48QrfD1MVczmDBR6xMPtdkqicSRx4c
	12dv7l1tdb1L4mXxKvpg7BxTNKW+w/adxSiSuduHM+qhvKFv1iXj944Ok0vs5MWT9mQvFW1CU/C
	uD4ZjXziQItMGomfdtG3PSEJCEum599960UJE1zJj3jvtLJ4MiDOB6AWukkr5ohty6tgsAHM6mD
	g//G+A13M/iFita2ZjtbkxuIA3itIpu+DwzzBYHOf7jdN30EJQluMuw47Cka3jERii2BG49SXD1
	tJlaVFg8ZSe9VA9No1c8mZHRTVWaVy0=
X-Received: by 2002:a17:90b:4c12:b0:311:eb85:96ea with SMTP id 98e67ed59e1d1-311eb859b73mr6274049a91.9.1748488298489;
        Wed, 28 May 2025 20:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0wLnjI8RBCVl1hZDa2G6VR0IFiIxWSSq9ghtff45z6KaBah7kcwO3pIxUpCV9np9pBPkN5A==
X-Received: by 2002:a17:90b:4c12:b0:311:eb85:96ea with SMTP id 98e67ed59e1d1-311eb859b73mr6274006a91.9.1748488298115;
        Wed, 28 May 2025 20:11:38 -0700 (PDT)
Received: from [10.239.154.73] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b91c046sm381376a91.29.2025.05.28.20.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 20:11:37 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Google-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Message-ID: <42be0934-2e97-4d02-98df-b5a03195e8ae@quicinc.com>
Date: Thu, 29 May 2025 11:11:33 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: flash: leds-qcom-flash: Fix registry access after
 re-bind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
In-Reply-To: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -GT6AZqgGeI8clZ_lJvEZnfonoFl6KI5
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6837d06b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=m213F5Sxp9nYWYPwONUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -GT6AZqgGeI8clZ_lJvEZnfonoFl6KI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAyOSBTYWx0ZWRfXxB6xIDPkVsqK
 GucMTaN8fOwdC54rRuWEMbmY1IbWuqWjH0+1joIlh+AUewXTIwmQhPI7QT8LFC//Ru56Q1HSucO
 GhML53dOXVN9Xic4aN+HDDGks1YXXG/0C1VmfnsigzXLnUkU+rRoSprZnic6hkB1oKi6fsBmdBR
 o1mewzWKTEZ2CwSsAWWQqVnRUYpGxGACjwXz0sH/YxSNrjWqGgMm/LNT8ChPs5KfOaQJxY1p1KR
 6rVUNnPx7XPHBNToe26uM8rn57NywfNRxFmNx6fFSC6ntzo58OliqtVcuVRDxpAjSZjBSxNuNiS
 LJgsTtmDMI4j4OLrw/YaR3rM/obp5R7j4ysj/tWDqy7qKZM629htGsCF6Jn84mG4FeIP+75wE88
 kNU+OnfxnZ6giQenKVp2Ug9nSomUKAnqPP6Ardk3MrtNQGc6g1eKSp9dRaeaQ34sTxJ+r/tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290029



On 5/29/2025 3:44 AM, Krzysztof Kozlowski wrote:
> Driver in probe() updates each of 'reg_field' with 'reg_base':
> 
> 	for (i = 0; i < REG_MAX_COUNT; i++)
> 		regs[i].reg += reg_base;
> 
> 'reg_field' array (under variable 'regs' above) is statically allocated,
> this each re-bind would add another 'reg_base' leading to bogus
> register addresses.  Constify the local 'reg_field' array and duplicate
> it in probe to solve this.
> 
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This is a nice example why constifying static memory is useful.

Thanks for fixing it!

> ---
>   drivers/leds/flash/leds-qcom-flash.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
> index b4c19be51c4d..b8a48c15d797 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -117,7 +117,7 @@ enum {
>   	REG_MAX_COUNT,
>   };
>   
> -static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
> +static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
>   	REG_FIELD(0x08, 0, 7),			/* status1	*/
>   	REG_FIELD(0x09, 0, 7),                  /* status2	*/
>   	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
> @@ -132,7 +132,7 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
>   	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
>   };
>   
> -static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
> +static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>   	REG_FIELD(0x06, 0, 7),			/* status1	*/
>   	REG_FIELD(0x07, 0, 6),			/* status2	*/
>   	REG_FIELD(0x09, 0, 7),			/* status3	*/
> @@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
>   	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
>   		flash_data->hw_type = QCOM_MVFLASH_3CH;
>   		flash_data->max_channels = 3;
> -		regs = mvflash_3ch_regs;
> +		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
> +				    GFP_KERNEL);
> +		if (!regs)
> +			return -ENOMEM;
>   	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
>   		flash_data->hw_type = QCOM_MVFLASH_4CH;
>   		flash_data->max_channels = 4;
> -		regs = mvflash_4ch_regs;
> +		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_3ch_regs),

Minor: sizeof(mvflash_4ch_regs)

> +				    GFP_KERNEL);
> +		if (!regs)
> +			return -ENOMEM;
>   
>   		rc = regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
>   		if (rc < 0) {
> @@ -880,6 +886,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
>   		dev_err(dev, "Failed to allocate regmap field, rc=%d\n", rc);
>   		return rc;
>   	}
> +	devm_kfree(dev, regs); /* devm_regmap_field_bulk_alloc() makes copies */
>   
>   	platform_set_drvdata(pdev, flash_data);
>   	mutex_init(&flash_data->lock);


