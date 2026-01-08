Return-Path: <linux-leds+bounces-6567-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF44D04264
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 17:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3608930BE322
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC43350283;
	Thu,  8 Jan 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6el5agI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ke2ubWbp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A643ACF06
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862553; cv=none; b=C+ZJa7DR8TAIYTPtvGqYNVEH0YBEn2efjiW5OkV78GJrRS/7aexNGb0hmMPEGmPCalNMfeUp/GVSxx+/r4GIDtdmKJFDsGjxqcDuW8Enj64FOop/Zj47emAZhzJjt55rH4p+8ieErsj7tYez5rqfl2PxdshMEUL9GnOsSSmnYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862553; c=relaxed/simple;
	bh=vihXKZgC0RF0ZvWdSb9dihAYRm5zi3vzFR6ngUhuC5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUAwE+ejhMSyVYgktE3u+jMqti0FJrGTSpWqwKjMj5Gk5UKDklL70o2LtaLuzkwc3QSikUCb/rb86aC1kv41a0fSg5zAgAZcQed2qhfARpWogL3UvF1GCmH6pUF5+1eOSF8YcbJKyfn5o3+MwrYKFSngNZZaRvjH3BtRynTk/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6el5agI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ke2ubWbp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088pGIn4049328
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=; b=J6el5agIdb0Tv0H6
	AweZ0W4e0nDdcw6KClr0kxkxvvWoaHjpy6kcoeFZjAHksZ9JORlHI33VBmUyiXNZ
	acCvd8okWKfonyTboawiXCvDBQ3lCF2mozB9amhs1tXGSSj0mL40Y9bQ/h7QpYHL
	G5rPr4mqfumhYo/0MT5F5bk0F0fCImunLaedL4Ee8PjE9acJ7ECMNmCuOZ6D5KLO
	OL0R5DffkJuXu4g34WsFaS54u5+QfEp3D06xvlf9ivL6kg6L2ciT8yXNQmvk/BJm
	NzDNTqR7Vkscyqu/t2R8AEJEWZ+XyabSlRussylCI5FbIuJJRupxtmDuUnYzEEVD
	Hmmyqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8habp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso8148871cf.0
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 00:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862544; x=1768467344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=;
        b=ke2ubWbp5m27bThrAYFevJyC5SdLT33EAIAMrYIm9W97HCUucpt0E8+oNxGAwF5l4i
         jXOwbfI3YCcAUCO30QPe0kYbPUMK7rL51DobbjFp/iDwO8oEHCFmZy32wd9RBCZo+v6w
         mFEhJp6t5QNaEU8vnen9K4yYPVO0ew28wADf7lcTXyc4dslrtK5O22S6mahxBCK6V6Ny
         uLz/F3gzcn1AYL3TXsx87dJfqNtpwOlJ6g4cCDVZXEOYgneGFTluMgDFkWLnhMObV7u5
         IrXjmeUWIWyS2Xt+6DBKKNeF41C2fIENjwuc5LDVQeRkmMoT7Wzv5a3vMTkyYtLR0nrw
         UEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862544; x=1768467344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+LUBAWmsVKlASWBuram6zTfQJk0Q97+yOU2s3t9Be4=;
        b=ve56+DDSnj2v+6HM0PWkRLrPFaoUCxAMIAquMc2MFWhPlCV3QF6JsDutq86O2R7Xwc
         zx4PMv4YPUmYI2KbVE5d2VL5uv6uvuAsvkdvFQWUl5rtRiMQq465drhB58Bo+IVIjBhf
         S9EYBcvrrMprGEAAIO5doSLBswMMoaHHq0nu2ojIuVyHdyzz6t9RL88ofkHwDPfps4lU
         mzMSZuE/wzUWcqDw1SDSKbWz2fzLwWKbcmjexhE3xq7Xxc4CvQSlOSqbKyMzGp+L5yOo
         i2uRb6ad3D5+KDImntcKb2rY7VvHl90QqUd7kylpkqI2VsxePORX+bDOW7gifGu3pvQz
         v8+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8wRk+kjMzWbzPurd1QMFT8+a6hky8tXehvDcggeMpqRQB7Sx3PnX/7rs/NIDeS6Yu5QNmCkofZt/k@vger.kernel.org
X-Gm-Message-State: AOJu0YxIOMStQV93I85QRs6lxQp5cgWKfQHOpcmpP2YO0NyqYYJ3Sic7
	26b5Mqu3SQStOJb1/OmWZy2KAZtxebOkcQ134tV5jrGPGCFis4NCyKtC3ApUqjqbjVm3sH/iehG
	psbbVyLJLLL9pvut1qmnJuajT10/8hQUR62rCM+Haap58lDRrwajrL9rOL38T3ZEc
X-Gm-Gg: AY/fxX5si0JJNuTegJ+ez41TvLEvUZ9hldKU6ac5TzyyYgtueGifDQdu0xvc/VWv6gz
	YnvqfYqMNJqR8M3Ho29EezyimJVpr6MqU8irZ8y94TQycsLoGMhftjbakuOkSur3WB1wDsY1KKH
	Nz2f5GX8O3RwgKZ0u10eIJE8AS+40BRwQSFvWeHxtiYueZlZadRbL0lODsA09j8tlYRB4O4TaiH
	jNy2LOSD0BfyY7EGaUaedVvPUFTcHrB2swncWoqpa668uoW53CdfEynms/pDnPJs0OsabK4Tadk
	0xzoOzgjPoToyySBIXVdpT53qq5lsswztiM2s9bCs1dF91GqjNckylMYfPLHnXizz2NPqDBakLK
	pJO/OkKduLY9uNQDp9/CIb1cwN14SQ0WrUws6hXxgPxXI9S5m0SnmoGEI867/zxykqeY=
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr58398531cf.3.1767862543694;
        Thu, 08 Jan 2026 00:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Lv86d+HKglAfIaITF0v/1w20K9Yw1Cy6aKrCbkHCUfrjyUTzhk3wIiJr3LYFJQaOUvw//A==
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr58398381cf.3.1767862543327;
        Thu, 08 Jan 2026 00:55:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8429fdf4e7sm780584966b.0.2026.01.08.00.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:55:42 -0800 (PST)
Message-ID: <736c8986-7adf-446e-9720-c4a71272825b@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:55:40 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f7110 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=GYwjzM_fwieWSpg0kukA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 0emJvl0L1zrKDrp36cataWUrw4zSglOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX3F90L3+iZj59
 po45BPczVo9YSYlSM1qpamfNXl1dZgwu5kZRuvvpAnKTplHzwf/YPY/fxYqWqSJBxBbDmrhVocC
 FgzQ2FFyIsAFiuDxKSpQNj3yg/yJopGihL4J7jMlRvGd+vP8+p/51A3niNWF6TG/rQ6scb9QQyK
 i3/ai/61NRYvVJdPH8lWpeDS5GHedVTCnbgMp9rDzczCWxOYaRF6M64LgubMnvcP9BMVfB4hFo4
 W2+hmP3D7PX+HZmKWKAZRv5NITzTKGPbkucJQ8rmm+RpJhfl8vbB3bSkQCTscOKPOo/i4w/dGCy
 sEfPD8QXrTiQK4Y8dVyrjgY03ln0rDkCXIXRgfUryBcAHZ95qMv6lFG1nijn0fId3Nvwzdz+m5H
 ik1I63k2QL3k0qBczHOI36Cg71ktU8QLxTuXpDQ7G79XLrTO0WQFIYQscXd/ulHuhBXtWd0A0CB
 t/8PETmawyk6QHcq6Rw==
X-Proofpoint-GUID: 0emJvl0L1zrKDrp36cataWUrw4zSglOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> WLED4 found in PMI8994 supports different ovp values.
> 
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Likewise, I reviewed a version that said PMI8950 instead.

Konrad

