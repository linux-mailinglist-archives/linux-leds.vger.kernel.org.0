Return-Path: <linux-leds+bounces-6555-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6DCFECBF
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 17:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43141300EDEC
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 16:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D51E3385A5;
	Wed,  7 Jan 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrmMxHN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlJtf0EY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF412F8BCA
	for <linux-leds@vger.kernel.org>; Wed,  7 Jan 2026 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795198; cv=none; b=UJYDzHOGWIDWmY2YF7SOodwDSc1kex/8ATH1x3vUbW9FYE4iNgYom2RI+gSyiFpm/n5+yi1Zp3ibHBD4LM9SUyAHCNQY1K2R1WnEpiOhOvPfgCpiIURSzTdnhloxvlTzcxlA92XI3IXuRX4U3qk5afbrNIO0hIdLiw+KpfgpPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795198; c=relaxed/simple;
	bh=rV7uwDQK9sVXXMMSbCrFkdiROsOoC7NEJyUS/32GXfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dH66IpaXnkDgzgLecf8N1mtyty5jF4boGqHnj2C9Oey77x5lFPdRcAvgoGLMcvyn3vjEbfamWytF8AdizyJgTS8zIRtUe5NrFVITEIu6Qe7SUtkbpPuEyNyjF3s8UVvEoXx4G/P0FdO3ZePKc/5bjpqitc9EPVUYRpEpcmTyAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrmMxHN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlJtf0EY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsSN92239477
	for <linux-leds@vger.kernel.org>; Wed, 7 Jan 2026 14:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i88csJUcM2ULCrqraGjde9aKEzx82JPtrxGeziCgzEU=; b=DrmMxHN9fMHEppWv
	Xj5gayauNSS8e1mPVGpyWWqwnIjNqm9W5d4QjFtObGKEPP1wy0h0EnFKuDkDQl50
	kNcvZPQ0qyHGhvJMw5K1IKBzBgtt1mhs077WbJAYYq7oY4FNnDiISvtSiLjd9Bwr
	Irc4BojmDTTiDWqAAzQF/qayX/cDJBoax+NPc749Upi4dZyJnT2E330Ln+CAvQl2
	edV9ikj04F0s7Wugk77UXB3uNeBqKdnqAWj3axGFzw9DHseUOMjBFhJAf8ViX7SG
	BdnyNPiM7YGN5LTry9r3HsjuSXCzg90FdtgcY22XBDMEr4qtDday3GjwNYnkOOLk
	Tokrrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg07d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 07 Jan 2026 14:13:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f77be4f283so3215401cf.2
        for <linux-leds@vger.kernel.org>; Wed, 07 Jan 2026 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767795189; x=1768399989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i88csJUcM2ULCrqraGjde9aKEzx82JPtrxGeziCgzEU=;
        b=HlJtf0EYNkI3kCfJCUIMu3i/0JPjQHFKYnVDDPqsy+blESUiHX6gMEHb4NRtu1UXlE
         jK3ywHztRJNMWFCn68Oaopvmj8r9aHc97FTelQ8UaWKKQnRpCIiuMcqGn27BD/+/fp3a
         Qx+hoKylqqBE/zKHGBMaKr1sJ7HyGhKuhmoXxjVwbxrmItZ/kEbnxcNuXptQKVjPunAn
         AQ645X0aYMxb9i2aIXtDc2ih8cgwPlJo47dzx2RJxINu2+pHcQtR2kFTYlz6VFkjNgVV
         dGnC4Km+v5gkHtr6pi4TNprzNFkWWJq+Hkfu4z5zOdXZ/alLzXfjWjZmNwQg5p1pJ6LF
         x3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795189; x=1768399989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i88csJUcM2ULCrqraGjde9aKEzx82JPtrxGeziCgzEU=;
        b=V6SKy1ulOnL5ffvSLXIjQ9iRE8pNZ2QiaxxfaqYVrj7GLl/KB6X7jFAii/SyKXQcpn
         +l4HkLNSxHyRY+Gc157CAsBDRZuyfZJzCIYUk80ywCZ+4zKgw+niaKhjdCj2j5McYHFP
         56vTOD51FUcxRrj3p0DSYXK2Tium88OkG4UNxhd6jOAVphpsgER6pO2frhpGM5X07K+A
         MYbyf9NQ4df4YF1kjt75JtoUM57cNwZsxMsUM9ifcryCD6S6o16AtLvfYhc2VG3Svcb/
         gL6zyNrlG3iaVMWNfC82OPE9BudkeCkTvLm2Zl2sgTb4dCyiEEp2c3GwRGreYlR1Gpzp
         +vsg==
X-Forwarded-Encrypted: i=1; AJvYcCXusHa8lroD0UDVisj7iw2TsCPszaBl+CmWgej3UVtdT5oQ/dEzS7JI9mm1e9wVe1N+u+dvoEopePnk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Jtjet9715Xhtwm3fGo4IVqHcTnyaCxLXViDzi1HAZzbAwYQ7
	IXPRv69Kl6FSXzFR+e81GU7I5Vg41lBEF8njt65r7larjfyjG0CZWk4e2AktYb1YsRLabUnfpqK
	0xylUa2ENKlMeUWQkAo7NdZqcTvyWMC0RZERyHEIIOHRy+45UnW/DgLYOMS36CqZH
X-Gm-Gg: AY/fxX7yNeLeqbWkoYvCIY/Z6J5VbgBEVP2p9B5FKhDt6V6pqX1cBGjEMFlVnhie6oE
	AOK5roubU4nm5MRNq1lQN15Se57J3VDDdcIwSo/DAxOyNYN/EMfGckJMeD7xNY6Lef5GJu2e6sy
	8LRZnoQeoMcVlCghahKUbJr6fJaZ193J1RGpiF0CUM4kg0eBSq6rT84ou0RehcdhMioKTBuDIzU
	5OqSWkzDZBcBvxsmbdOjVgo3pRRO08g1VckOhAU8Kc6aNv3Cc2z29OprJy0Ry3kyDAzlDO674gN
	/wlaSmQffLluEVRBGQA2grpDgLrU0ALV3uMvQy1E2ZR0newXSBvH+7bcYomoA96EKw/hUNULgnR
	Vr1IKjT3aMC+cG9U8lM+HXYqAfm3L+0tXg5WkGb/+J0Tkhi3+Ud2Pmfg6UygTNfM4iMY=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr25633751cf.11.1767795189108;
        Wed, 07 Jan 2026 06:13:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBwq+C7m0bosWHj3HTwVxZmMkUGfTBcl5hp78f4iYACKooL8OU/CX/+Ny3sPLi5gByEeejsQ==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr25632931cf.11.1767795188359;
        Wed, 07 Jan 2026 06:13:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d89csm4659986a12.35.2026.01.07.06.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:13:07 -0800 (PST)
Message-ID: <db0ee006-44bb-4587-b4d5-3f767cedc3cc@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:13:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-5-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-5-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c-7_dGw5VZ7wwSQFVFe_sbmaOs13yfCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOSBTYWx0ZWRfX8UUIh270aEd7
 f2Mszmocyz5zu4KFg5WwuEVB6foSbgHke8rCOJQlz45njviC1fKSnx0JU6RPqcp+rvq/xPRcatc
 GMQy3q7ptadLnSd0V6u1wUToFtYrzhv2dljPOn4ESkrd/G8CZ+Pvbl7BbId2nGWEXsBH8nSiDfo
 KEggsfdOFcrtjgRRM5XoUcOiVqhPJ2/FNkRvA9iojQKD7btHJBEVRdyFeaZvJylzGaRMoXPSir9
 fbx7zNYtpmaDg09nhWShHQ0y1gnn4XLYr6R+8tysjx3IjLH6uo3bJqBtIssPS33JxOCKfRp2zUf
 /kvaItVdcQ6X2BuYSMzDuJIIK0r5A6fBKt205+QtbGb8kR6d1TWf4TV/Ev+mwJNpCc+xXobDPTs
 wl64vGJlPAFFkuTOOBWUBofFblLzqD+zF5uVfqaxiUue2m2c62qAzE1fyFTA+tw3gKi70H5X1vN
 iNZQLPUJDDeh4Nu63dQ==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e69f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=tgJsgVuRmq43osI8c0oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: c-7_dGw5VZ7wwSQFVFe_sbmaOs13yfCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070109

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> Set qcom,num-strings to 3 instead of 2 for avoid stripes.

"""
The backlight on this device is connected via 3 strings. Currently,
the DT claims only two are present, which results in visible stripes
on the display (since every third backlight string remains unconfigured).

Fix the number of strings to avoid that
"""

Konrad

> 
> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> index ddd7af616794..59f873a06e4d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
> @@ -157,7 +157,7 @@ &pm8953_resin {
>  
>  &pmi8950_wled {
>  	qcom,current-limit-microamp = <20000>;
> -	qcom,num-strings = <2>;
> +	qcom,num-strings = <3>;
>  
>  	status = "okay";
>  };
> 

