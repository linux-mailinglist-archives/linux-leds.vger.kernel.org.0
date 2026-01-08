Return-Path: <linux-leds+bounces-6571-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FCD045A9
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 17:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A973096725
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214BC435300;
	Thu,  8 Jan 2026 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zr/0udCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8z2iyyb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B423432F90
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864168; cv=none; b=tf16c2JDhLX8sXM8VqA2PqTu4AJDnzFLE0+kSWk0Kq+1PdCrXNY7pm5QqQljl7ijSBJkHh8s94NjqBJ1P8lGMQOAWMmm1+zRfxwUwhn37h1plUI9ws0Tw1zavL9GXBItw5eDQIWwcgiSZ+WkvIcP0mZL2IyCTeeGybGnyqIYRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864168; c=relaxed/simple;
	bh=7vG6OaMdoY88+gn1n5QHVM4pj2RKJcsBaH9fAfIpfg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VG69UO3a4bcoOWVvvu2xyqSUKvv7XYupDGjPhp6PKpYSWqjdI4eWw2IztcvVx97iNR53ryv6t8uNqNKabMbWL1njBpLDZ6II0XM/52BUSdYY8Qa+5RYVVHqrnPwqVaidSwgeouIFEa49jq7qK0xeDKFGeJFF6f44L2hEHYOSmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zr/0udCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8z2iyyb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089FwM8878063
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 09:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=; b=Zr/0udCuTdVjdeaN
	aqzIN+PgSWqcWrssxYyKhYJvB2EuS5UAlwenZHEQxPknppA+07BnnDLms1YbvGor
	+gKF4wRx1lFqRyIQNXJD1rzRWN9cs+UQHNKshFjiERedss0waCsRClHStbnN5uKR
	1QngrrNvX9yy3seieG5fQ8EBu/EARmQ6jkVenbm3vXygOlYGA0KCIkEnQ4tR7akF
	1w4a1+nQOwWtHGchdrGWLj/w/Ix+1+GIR/7dEx0riPYxjb0WrGFzmu7jl6mgTdk/
	JINBnDt4l9/4BEfFMoplvE/JIT5LwEZymbnPXrV+3bKoy1+HuqxWD6G1EhpwfcmT
	2N6RSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r31auq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 09:22:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8893be16bf2so7789806d6.0
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864157; x=1768468957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=;
        b=D8z2iyybUghcejjTEAOamYuv5ZDVj85ymjC2gMIlKxIPkLwBV/Jj/X/LoiK+m8Pyqh
         fskYmNAuvryGntPXf4mY0GWXKBpBkgVjyWegiikahWh2syCasbRxM/ihBXkSXjFTKQi7
         gktPJVq9sDlT9Zxumm6fxLgrVacYUwb1ES46oDLBLJTmQphXKuPYxLDrXr8aTyMPuXwq
         U2jqNve0yX3fO6MnIqA9XbY0FUgp6YFwam/k9panIap/KVPX1DwsKdF+99oxEU/IGhpQ
         2R+9dm27+RZWbpYf145En/Klec34wMmz2a9gECGycftpD37ghiFUv+mYTnrh0Fo+hU2y
         N14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864157; x=1768468957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raxQEHkAo5wpTxNFXj2x0R0HctM1cb4gUoaC2aMmpdo=;
        b=vnkt2GnFzPnAobl5s7xVjr722OtPABhSp1d7pursgyeAA/w3rNqpHqx4iLZ06pYuWx
         LlUTP4yqRSz83b6mS0jiaQ2iyIbGOnMKTQcD6TlEUp00o2AXJLMw8VuqtfNOJ/nWlreY
         KfodlL/4dXIjgJl5AxwC2cm4rSnyawILhfY7AS7GO8BrvGUpBlC7qOsANuGn5uyh9lBS
         5AxN8gOkJzRNKnLA9gPdHrQstonrtn35ox9ym+2jnXqhAouCtWQllTPGXRyM/1oozq4+
         y6h3h8wlUS0ypL0JO8nRHr31bm857gy7HE8fuAFyKr8B6e/qufvl7AK0UJ4rS9toyNcl
         143A==
X-Forwarded-Encrypted: i=1; AJvYcCVRDDbwUXpyVCnAkU1gvirUqPrdP3rvwZNnuejLniLP/cclEe7LLSpyME5RzCvfRzIVm1TeEbNm3erJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6SgiuwcclAYeEFNeDj1eH5yv5lh1rVKMsVSZPFiNNV4CPrv4
	QTjia0rVLkO4tNLYXkVsFs3oLMxMjAYAK8fchxI3hVfc7Dgzv/8eCMLQOg5+DQ4KHx4t5J7jXfM
	ZDCXGY92ObwsuBSN7Oi90v1dD34RXa0LicRir4uo7UvQycHMj55h6/qHu5HCUvQom
X-Gm-Gg: AY/fxX5cfuBo2FxBEav2xdqMTfT2TmrE4dP0DcmG/c7PHbFE8TfhG28anrjkEhcycgn
	lBD3UE5UHVVXepE+4zouPAQsP9g1/Ku/pR/yuGw4RCasGR8lQTH6Y3X5n8JnBXEwTewVM4x2jib
	Gj56gnKDd70mY/HAiR1D7JrK/AHf+LMoZxBvuKLr+AVZQcLz656HbPl+8Oyds9MLoy7+1kuSaIo
	TzLkcCKsPw4P2x6Qn7j9qo4c2i1ajjT7EzQB7dAS6dN7mxFu1glzN/BBqUaKUm6e/IkGkesSLhR
	kvwfajEGFm/F3ZyaQk+X3TYDKve75fz0ecYoP5adlPNhDE2O41hTpMIjo/vNMX0YMquF2z5fwM/
	qbzTt8ZyhDWuBay627tfFHNTKF1gfKnhhM4NcfHM1Rmljux9xB7jKwm+syv7Sp6Lgej8=
X-Received: by 2002:ac8:5907:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4ffb4a256bamr58410721cf.7.1767864156969;
        Thu, 08 Jan 2026 01:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgk+SEzsp6wNWefdP+6JTGQNVInVd34cgE/aXxaCXZgCrNOJott53yL5pFKxHfuIwh/vLdMg==
X-Received: by 2002:ac8:5907:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4ffb4a256bamr58410441cf.7.1767864156534;
        Thu, 08 Jan 2026 01:22:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm751657566b.43.2026.01.08.01.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:35 -0800 (PST)
Message-ID: <e8c37f1d-53d5-43e4-9c8e-be44753aa1e1@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
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
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX142lLe6H5A7h
 ODHnY1gZJOYXa1O8itWz6s3DL8MJAzpzo6Qey1e277r+beMW06wW83+gqx3wrf1v9K+2n/CGVFw
 eBTBiOKCyNj2Un7SupkCvVu35u8+yTmL9ak+oT7S4psgH4ysvpG+3f6cIDnnCs6GXE+M6+L4rV8
 fzw0sCqSQZxGCYztrBudLVc14m2JpXuN90I11CnXimO91fRbtOez4W3B+Vs0QcdjToNpdxBdX5h
 viec1WhazXft1YrONNwAxsah6kqzjLndex2GVCgO2y/dFfG7I2vtMlkRErxpWInlkbldyo0fHrI
 TkZw9wUypwuVHucBtuH6cIJw+wvQYv5LD6p2KEFC47GKK0QOqDs9fnoFsFJGLjCdvVOEZ6sIWey
 yVCuEvl5FGIjfR0nLLy+OuN0YsEvbCiXam/dZnRUCIlHDYEL4qsZtmgvz4e8FQX8qof8MnRwv5o
 /S6JQdpC/K4Cv6uRFEg==
X-Proofpoint-ORIG-GUID: 8dTRht2kQmoZZT3Ln0hhgTRMu9xU-lfY
X-Proofpoint-GUID: 8dTRht2kQmoZZT3Ln0hhgTRMu9xU-lfY
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695f775d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=H4St_WrzmzoQhtTZYGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/8/26 9:55 AM, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> WLED4 found in PMI8994 supports different ovp values.
>>
>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Likewise, I reviewed a version that said PMI8950 instead.

We can keep it because PMI8994 seems to fall under the same category
indeed

Konrad

