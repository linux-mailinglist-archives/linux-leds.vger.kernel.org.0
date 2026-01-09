Return-Path: <linux-leds+bounces-6598-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3712D08D37
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 12:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25C23005FE3
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 11:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB40338931;
	Fri,  9 Jan 2026 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpuIFfHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C34PH7LM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110933770B
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956958; cv=none; b=lgUIHKo1ZJYeaKvxrZZ8tjfdeWOEkftx3IZbVkQzX1Dm+DklbNegr3QZQOPA6hioVJrGeyEXvu6R+3aoqNpPh4qHf3usdRCviZUpdx9dDHIkw9sEp0R/LbgObJmQe7R9cgSUV7o7Dgo/KqMdjBngQfJuwdFUtzIvdw82qtPbT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956958; c=relaxed/simple;
	bh=np5AHXSBZDD+N/+A8BMXsBKSc4+aFegJWYRGSXEX2+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rswfkh0YGzr34c1uWX305V1nJVkmtWKG5zCrqMYCoL/S5CbDjZHvogPSu72a8ExWDcL4NED/tc1qBB5ip2Oq/Ir1iy49DntY8hDVfRKSqnNeeGhWwG3rv/RO/WhRfMZ9XPOq0HdI5e2pF2brpwOqJ+g0kZRBijOLjHgG2xc0vtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpuIFfHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C34PH7LM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60952qoK3542328
	for <linux-leds@vger.kernel.org>; Fri, 9 Jan 2026 11:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfOxBAB/NL8Y1LHRkR5yqZTg4muif21ux/cBVZr9MtM=; b=dpuIFfHM0GgisAWD
	pwfwW0apkVLGLOvgZl06nguD8hLBDQxeyLBo0N2hVQD6PXncccyYLsro85pdCPOd
	/054B9hOaZwSrulWucN9qbdiUl3jIJTP2YcXJNUFxQqhjGVLWuCkFL8uunRfSVO0
	Mf/Ghz6AIbzhXpCcNkYdGrHJbDCwTudG9rowmnHds3Gzcw1kDzBidHerU4TZIIQT
	LDhOSEQH8ryNejcKLbUrtQoOzUiYSpoRXKo6F8sDFU/fFkW1JDKR5p5Tq1ZjEYaQ
	urj1UBmzs2+zIA+Gh098UxRob28VLnHmC/BHOuPdyyZcy/kPSjLrioSb/eGx2ZFa
	znrZcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b11qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 09 Jan 2026 11:09:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f357ab5757so13308861cf.0
        for <linux-leds@vger.kernel.org>; Fri, 09 Jan 2026 03:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767956955; x=1768561755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfOxBAB/NL8Y1LHRkR5yqZTg4muif21ux/cBVZr9MtM=;
        b=C34PH7LMffjGDHX/6fDwsViHXmGaqU/xgvzmPuq0Frghq2IR2G2hTcM1PiH7J1Qzkt
         eY73mLpszu4zsghOHupaMetTlUB+JHxue4bysptdx6PGgZ8m2++MBZ0OVvDwZRCsfFEu
         sjG0i3ub27fSXZUt3b5DWpRSQNEyH/q7VGgepoNvuFR+kIapTzm+kT541in2WOFau19f
         dxS1YPusI5VGTxxcK1kFxMoAlLH1Ll9rqbKpy/+pNH9C+oospeEb/WAwkYw1k8h+rBpU
         hjGSGg92qlNCuIdv5YEiPyxE1/dqG0vs7svjYa5q6GfA1lydrR1w3XQx8aKIelLIcGCq
         ypBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956955; x=1768561755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfOxBAB/NL8Y1LHRkR5yqZTg4muif21ux/cBVZr9MtM=;
        b=YrBzSj0gOX1vo5sO3noKesPWqBcZmet8pUMFnd1BRMlTNTtH2/nRWL9ESnV5r7IFhi
         zmEbBi/MVAvJovNm5ZQZAV++NOYh0cqNTkbQ3u2C0jxQr+AUPM8Ry75rw9JkJ7Q4wGn6
         Nua0mob98uNPMxTim8GaNCc8wDTSJ5FwUuGcJWF5+DK1/vTSAIBbcpKv9Au0QDdppYDO
         PuxWirqL0P2kk8rOsHdBxjdp8VXRf1zsConhHYyTorPhmYiQCcWD+MU/hDFAH/VTMuuD
         nahMpiYy2RPxrgtgGuyV+uBI4pLQOhxBcV1fLfy/e/gFYXT8JoWpBz+urh0CeQkbS3cC
         XVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoZee8eLx0mBLBSzea+wWtEL4DSSA0Vn9Im3Q9msLx3+uqMDlGE29hd27l4+HZ7ndNbDc8xDUCgjmG@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1sjWJMLkcXhSOPbPekHDKgd3iccqcQnjqAhlOvaVeMYjCrPj
	gIfn5Utob0BUz8FgOLC9xWMXG0Tq1kPPpVYY/zX0IzaF12PUuEzmr+0AJrUqGcQAORwX+i3WYYB
	vmTN0NIHYlO9Q7lcqs8GvZXmu5CUTmO5yDMqLscSalgiKLeQ9FZ8D8x+dt2QBjOUv
X-Gm-Gg: AY/fxX5zIbesoT9EjYfNHer1zQ87FWn/WKYEqzTXaz3NSEl6hjtRtKc6LCIF6WVXrjc
	d2gKUsF/u3f9HOIdRQXjL4g4ZdDrssDFwQE+XFMwgsEeNDWsAE5nFMC47hoB2zLCkedbTO7mur2
	mqtnM4gj+a1I6xxI6lZwLEykAe/lC/FpqK9+4U5/XiX8/RG7Vg/lTSzDYZND92zOhfnYA3a00SA
	Sr5IsNZkuCBXGDiH6XDd5CrKIH5woXaXDJqP0rtpsfsTOoTHcupB0IFGbK4FLrQ+uqpzEjOg1Xs
	uxdDrnBRjCqi6zBAYvnh9UhUpb/4w7HyPYMI56OgU+D6efBJiLrQ37g93IFsem4c7S9LZn1lcx7
	CT8pLQO3NdNJ9vxjC48Y27dacjDu2fe5qkWMdsx1hrARqMcBZoLGn++XC8Ok1UA39M4A=
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr106639381cf.10.1767956955271;
        Fri, 09 Jan 2026 03:09:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuVugm+h0bz8TunWq+Dll8IN1kIYmy69NaY5S00gzUkJiOLR/Y+VssGj7zYAE7ibYohbDivA==
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr106639061cf.10.1767956954810;
        Fri, 09 Jan 2026 03:09:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d508csm11212953a12.13.2026.01.09.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:09:14 -0800 (PST)
Message-ID: <0fe51f7f-9b77-4bff-ab1c-21c44a863a7a@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
To: barnabas.czeman@mainlining.org, Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <aV-UyhP7wllSBpYj@aspen.lan>
 <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MSBTYWx0ZWRfX4KCzS5DkWnPh
 +KH2yYK6e1ip5EiJ7NcLtCLoPJH81r7/nlRRryKH7V6mU9zkPOuDMbHoZsUQfVQi9c7wCV+kQsL
 sMgzvG4tWCZy9JwbaG8Wa7AkTeUEAPolrGStjwOqsiF8Yv+ZDm7pz/63hocGDOWLyZ+ExKhyQfH
 OG/rD02txczIEWrKnLzlX7sxk2Fjtm+8JntRlR9oGyPeNrRfDnPkwlZogb5Osp35qoeEDJ0+8XU
 D5anf+HYeq/SFOTTEH1g0UETYXbaMfVtAnAAB0SxCVjhS/0OqwfyeCaC0t9C3MQKKUHJwn/NN9y
 Xf7nMVG/FbJoH5jZn2sVyLkFAGNu8SA2idtUIGq+7pP2gRv4g/HGhpQ+HIfQwovnign+OLIBrNP
 qdsd5iQtK89V6aHiYI0681X/nXyFl7ZIAgnlrefsuXUiu8PR7f9S+ZgLHrDTSWEalkbcFSF1Ag8
 oz4pYtTU829UoVHQ31A==
X-Proofpoint-ORIG-GUID: ra-6kVKGF_BDJa70w1aMEnphBSAKRqQu
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960e1db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=dvh1Nh-0K4mN0UgEr80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: ra-6kVKGF_BDJa70w1aMEnphBSAKRqQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090081

On 1/9/26 7:36 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-08 12:28, Daniel Thompson wrote:
>> On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
>>> WLED4 found in PMI8994 supports different ovp values.
>>>
>>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 39 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
>>> index a63bb42c8f8b..5decbd39b789 100644
>>> --- a/drivers/video/backlight/qcom-wled.c
>>> +++ b/drivers/video/backlight/qcom-wled.c
>>> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
>>>      .size = ARRAY_SIZE(wled4_ovp_values),
>>>  };
>>>
>>> +static const u32 pmi8994_wled_ovp_values[] = {
>>> +    31000, 29500, 19400, 17800,
>>> +};
>>> +
>>> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
>>> +    .values = pmi8994_wled_ovp_values,
>>> +    .size = ARRAY_SIZE(pmi8994_wled_ovp_values),
>>> +};
>>> +
>>
>> Do these *have* to be named after one of the two PMICs that implement
>> this OVP range.
>>
>> Would something like wled4_alternative_ovp_values[] (and the same
>> throughout the patch) be more descriptive?
> I don't know. I don't like the PMIC naming either but at least it
> descriptive about wich PMIC is needing these values.
> I think PMIC naming would be fine if compatibles what representing the
> same configurations would be deprecated and used as a fallback compatbile
> style.
> I mean we could kept the first added compatible for a configuration.
> Maybe they should be named diferently i don't know if WLEDs have subversion.

Every PMIC peripheral is versioned.

WLED has separate versioning for the digital and analog parts:

PMIC		ANA	DIG
---------------------------
PMI8937		2.0	1.0 (also needs the quirk)
PMI8950		2.0	1.0
PMI8994		2.0	1.0
PMI8996		2.1	1.0
PMI8998		3.1	3.0
PM660L		4.1	4.0

I don't know for sure if "PMIC4 with WLED ANA/DIG 3.x" a good
discriminant though..

Konrad

