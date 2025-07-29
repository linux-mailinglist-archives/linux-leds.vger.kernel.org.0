Return-Path: <linux-leds+bounces-5162-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F4B14CA8
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 13:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9153A6EE6
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 11:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F1328C2A2;
	Tue, 29 Jul 2025 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrw44Sfh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BB28BA88
	for <linux-leds@vger.kernel.org>; Tue, 29 Jul 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786900; cv=none; b=ZCry4Rni1rPVEqtZk+mlCyqotzItz9RyXKck8Npp0q6yrmMz7+cn1KIPeeCjR0w9FLMjF24kOJf3FiwqLBjhk59/exUHX67UXfYoGt3Kvqcn8NP7bHAPh7MQBYD0DxU1S2CvFwAnybkceHzlnMIJ4Sri82hSgYxOSQNAAMzBYJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786900; c=relaxed/simple;
	bh=8f2SEo4XBdgTs1jpjDIkot8A+fWIBeuKn/IbDGluHN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTvgbo4sqdrt2yTDnfVvxf49pr3iwQECUgcVcus/1J2OABn6fQM/A4yl625vlH51Xv6aXPelkawUmxahP9IoD5DqHj0oszuNIAjnucNVPWKQRUaHmC0Sg/XdGjEWuA1bDus7U7wo6o9XbCIizRBhUtbloxGgzINdrARk3Wpz0gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrw44Sfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9o4p7001728
	for <linux-leds@vger.kernel.org>; Tue, 29 Jul 2025 11:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K96z8vUYHVZ1BnPPZ4P6DoWPT/UnQ3ldWwK7PWSLHpk=; b=Xrw44SfhSillDu7X
	wSrJyJrHDfoJeggTAMaAacR/4bLMaqQ7vGDjsnfVX7zeCSOUFQzVnSEOH0MGm/ft
	UT5TNEftv5qp+w2lQ3NkzZ168uu9Os4QvCwmNFs1kP28X16Cr5dHFH9hRTwQNCFX
	e1S7eKuUWfjMHRhti+QGmzYy+zuq76UBrhPy6tlSSN580JU7ELaD4fUTW+oC/jK/
	Qr/sRQ0QvIpVvhCr1kuk2npFLPa7TlmZ/ElK/2ixGoWbh90M028vTxKFazasS8KJ
	Rec0/pTJwKs01B91VqK3oiRnOCVKLYCWxMOY6Bq2F41zfOdjRmPNv0KOiQ6xNMhS
	c2PBXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aft80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 29 Jul 2025 11:01:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7deca3ef277so108417385a.1
        for <linux-leds@vger.kernel.org>; Tue, 29 Jul 2025 04:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786895; x=1754391695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K96z8vUYHVZ1BnPPZ4P6DoWPT/UnQ3ldWwK7PWSLHpk=;
        b=Cla0IXmb+NoV3qfrxbufwl90hXpSIc6zmnC3iGPE8TcGCMPM5/KjzuBXlBpXpod4+N
         naIwRl1xAfkcyXrOTX2UpJUHm9XBtuFI21Q+f0Ux5/63bS2GO6aNMFcU7eF2z7drnk67
         vCbhx4/4E32YMIFfJjj6b+/jfcDVuC49SG0ZNRv0xtlNdfNMfVWhMN2lHyVbgPjkKdY8
         60QVVHF+d18WsuH45MWgs5CcnTIl/H8ia1CAob+QRhXaxidj4diQYUFn377StNgs8h1h
         li6ik7mNJTz7WBBAPwAFsDaXyYzbk+xXCkIN4PnsDTz9DFpuA9cvDzSpgMMGTsjAJ3gE
         WTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+5uI8rxvrwV8pLumL94ENjbQN7fBt48WXZQigctRKz/SSuhRqJRbbshf50Ms0UNCYvtkv4Z5dDi2C@vger.kernel.org
X-Gm-Message-State: AOJu0YxOF+R3+8tF1hwq5HDqVV8rH27XraK85GkPGIB/HEuC6IWhIyQV
	3Fhtng7rzuiJgy3ZIRgA1Ddkaap//vmz2LrQGZCoj0jftjKJSRJdbv4HaEmB2jsAZ1Ypl92C3l1
	q3t56jcuiXYiNnlDChhOJECTQ7AQcTf0K/+rk9IwPXFWrDYkF9HeBpjYYarjpCDbH
X-Gm-Gg: ASbGncueQ0uXdLFvUmu0quyhVQj5U3bO0M5yghENjXyP7QXmfLSD7BHyjqvCXuBgzRP
	8Y5B2A2qpFiLq77ZKYcZEyIUNvtw/877L2mwLpqdxVAvnncmcVf5y1/XKn/mZXxVqe3seT8r125
	z8jZn2IixTZ60rIWamP09L7ZvhglBbNzZU2wWJUGIFqck3jq7PBAocAwHZDEP6iynz7eA0ALsyG
	dHu+to7ja2bGQ6V1AKy9x9gBd7/AmhtrYVkxxCPN7opo8Ku+mugTPK6gyzyEESw+lCZQyaV22Mv
	uZ2l7h2iva3Bd8jhmU5g2vvmgkp96eFcsAnAkbArx9GC5GT5n5ZN+dgEdzrt5QuVbq0ifvrOpSG
	wgXtpnjc43lPbhHXFJA==
X-Received: by 2002:a05:620a:199a:b0:7e3:2c3a:aac5 with SMTP id af79cd13be357-7e63bfb2a75mr936547685a.12.1753786895048;
        Tue, 29 Jul 2025 04:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5hkbGdP9yGcQW8bBmtcA+DatoS6/Sk05o9vp3Pm8uMRRyc9F2uLjItN9/JUxZOI4zhhcinQ==
X-Received: by 2002:a05:620a:199a:b0:7e3:2c3a:aac5 with SMTP id af79cd13be357-7e63bfb2a75mr936544385a.12.1753786894421;
        Tue, 29 Jul 2025 04:01:34 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm3534384a12.45.2025.07.29.04.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 04:01:33 -0700 (PDT)
Message-ID: <f3c004a9-dba9-48b5-9930-979053d0a32c@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 13:01:31 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
To: fenglin.wu@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
 <20250729-fix-torch-clamp-issue-v2-1-9b83816437a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250729-fix-torch-clamp-issue-v2-1-9b83816437a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Onmt6zw-4-tMKmeabW9EkQA3vYkhXFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NSBTYWx0ZWRfX2wHbkuwCn5ww
 lQLXwrAgpUrS+uszLWGNrGW61Hk3DFuYhHkdyrv7f6UzIbOvmrN9YRI7Mp553C8Wkr2zEWVkfJI
 7W6kmsbFoUqjcetT3GJ2x35gXr/LbhDZHfzSAnoH2P8NXv1uqc475w2lOWXW0poTRGCdjbPkak9
 qy94NtKuIC5lEx17MVCKsSIu7c9NiKjSqeEE231ky6cV4YJOIGYAnX+QCd28NHYA/eMxniVl43l
 fU+cVIUyQERB17BXP1cvSYOn1VCWzfxo1pPFaLlZcfkvGVTTu4x9anYTHojWedtmA1tVocakD2D
 QI4Wf+oxkR7E6oRxAY48mBMAP7qFO6NH4IMaWBV9hC7MSeUZmmsQmK203aJt1uaCHrKXCoQwn+h
 SShvuzEoaKFiSRgHzx1nUKTRgiPGNsoivOYxCZD+t6ZhEMJS5iw3Ixld75dQzELCjDr7FIja
X-Proofpoint-GUID: -Onmt6zw-4-tMKmeabW9EkQA3vYkhXFb
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6888aa10 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=m2s_gCkc1pbH6IbsRzcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290085

On 7/29/25 6:51 AM, Fenglin Wu via B4 Relay wrote:
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

I'd prefer the regfield change was done in a separate commit,
but it's not groundbreaking so I don't mind that much

[...]

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
> +
> +	flash_data->torch_clamp = max_t(u8, flash_data->torch_clamp, torch_clamp);

Please confirm if I understand correctly, we may have N flash LEDs 
connected, and this additional safety hardware can only compare any
individual LED's current draw against a single maximum value, which
we're setting here

Konrad

