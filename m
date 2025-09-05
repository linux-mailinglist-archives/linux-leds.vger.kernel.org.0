Return-Path: <linux-leds+bounces-5402-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F5CB45461
	for <lists+linux-leds@lfdr.de>; Fri,  5 Sep 2025 12:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05F9A5A42C5
	for <lists+linux-leds@lfdr.de>; Fri,  5 Sep 2025 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC97A2D480D;
	Fri,  5 Sep 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDWdCbR5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4902D46CB
	for <linux-leds@vger.kernel.org>; Fri,  5 Sep 2025 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067624; cv=none; b=K+v4hseklyWh0mJjlujeEfPMZV+oufVk2OW5ivK/S/0GPgUcGuh5iw++2Dh4dwPT2jNjHSJswaKlY41db2sKnFxV11Blv9NcGLvyl19Dh8e0Ob5YJU8ZbCLJZ6ck2ZszhlXjzUic7jEzoywqUF10POLtOEMSvMlCWJaMUiz1N4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067624; c=relaxed/simple;
	bh=NhL39okvE1UQ0JDbrGcrVCu7unTeSnVwrFd1RwYqZM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibQjMrLE00Sz921HjfrRLxZWlI53S4Tj+7NxiX+6sjgm2hkTRn9Ot8NXrTYVp2YUd8TSPcy3mxG0+XiF+bmKAknidFul4LUbRVIkbgaGzQd4d7K8AM7+Zdbv1ZDmZ93BGgk7PXItIA0FqAKl+xpiP63dDG4d4B+lpw+/vKc63vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDWdCbR5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857GRYp022433
	for <linux-leds@vger.kernel.org>; Fri, 5 Sep 2025 10:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTOVAGfJmHAMbslcDUKw3QbQxdL6mIKaKsV42CZz9as=; b=iDWdCbR5bU2UWlLU
	y4vO0uzK/G082CYybYH9KBDzkgIiLLuDfn9q4i8gWqER57Y7OtZW00rEBUuV6zl6
	Om4lUxRVewiEAxwZcqBC/hI6b6LtQgKMb416nUV1GcdIVpDXhAYBjI92I0IsjrEH
	ZBqtY176u1be2bt5W7cnnS40jG5Fh4SAJgBtc7bu/7TtEwiOVF6JHtASmiEXYg/j
	3ECvhkR55a5XHDPKKs7zB2jpTRjsUpNn5sl1hKCctVkD5/KuWPT9bIcKyZGj/zXG
	R9N/qQJ5yquVKJBOwkqppq+Cpdw1sCokN8AaSlwshVaOJa+bZaseMXoRtfbgV9g+
	FWlV6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9amn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 05 Sep 2025 10:20:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b33e296278so4285931cf.0
        for <linux-leds@vger.kernel.org>; Fri, 05 Sep 2025 03:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067621; x=1757672421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTOVAGfJmHAMbslcDUKw3QbQxdL6mIKaKsV42CZz9as=;
        b=rl01EgNLz1J1eFj7MIGHlxJ7QRLuK3+sKgdIx8VKpzU9rDPXh2mhudfEbCXQIm6jBG
         3BQqLte1RhH4TGBFubCW5N6sGKFvcWE8zDgJVvwO50O1GZfUDRIKeLI+PFejtkJhIcCA
         n7VZD+B6boMg+f34OJdpAPKXZglGgHBht9gr6wJzninSo9sq9MRoXFQE6JaIfg6CIjgz
         xp5GM85gLO933zsfY/OWASu4X6FCV1hh6C9M2yOITCwHFs18BN3L886T9BU+dBll14+0
         hb5+fxtykbmXX6x4R0+zOFzodDnaw/stpuTLTPiHLT9Lcnr0eFVwrc6VtcGdWqgqlIRd
         CTGQ==
X-Gm-Message-State: AOJu0Ywfxb6xuQfaujGFnGvhgCf3voJLgXr3Xu/Ldu3zBfvsJYZQ4az7
	aAg5KaxGIiwiX4o7fgOlabh+86mzN3eWxME4gjdAyBbCZTSPyeR3obsKIABgqESnXXDFgsKvmHq
	FPowXuP0ndoI1pqK7piMhCOvdiqFU1eUmLKjPQBLanVpYdbTeaCHDVxtP7Yzdwwme
X-Gm-Gg: ASbGncttjSve+/FW2DduBbENtEhE0TsVFNfu0apgPpAo4FyJ2qwjBAFYcN+hMqw0yWN
	vhTmUo3+SxMpnLTnZTsIilYSDqR3TC6m7KWWC3590HRm6no/6ElIxN1wp9sfpt0iw15g2OIjiiD
	ELZZATV2Gc18re1En0q3H5RA+4G/ikEdwXVAyiLSZEOFHiPdlx69qTGOmmffDTDYJTdVxlXuj+e
	rZVPyH0D3UgRUdcfjwyJdIqHqvtI2AIlACJKjMMhW6w8klrD/SxfzULiF4vqhcsolWTwcLOgLsC
	JjmKJOKCiVwpZ4VAB7K1kbhjOi/ZSEvwuSa1tu+z81oEyM+yUKEyEgzKH/bZjzcVbaPHFAguwDO
	1Vgn5kGNtJ1ODZ4uC27X8cQ==
X-Received: by 2002:a05:622a:1483:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b48e4d6f04mr83378721cf.13.1757067620965;
        Fri, 05 Sep 2025 03:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6Dw5E5OGVqQHPhLnTT6piTScFBZOcK2M8RO2gr8kQRnOFlQeerKrV8G2BH+P30VO7Bu8Lg==
X-Received: by 2002:a05:622a:1483:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b48e4d6f04mr83378341cf.13.1757067620108;
        Fri, 05 Sep 2025 03:20:20 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047373b000sm497098966b.68.2025.09.05.03.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:20:19 -0700 (PDT)
Message-ID: <e480ab16-bf98-4a3e-a7e1-67776a598201@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:20:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ROQva9f1ReMWnypDtTIZ0dAgT5ttzug-
X-Proofpoint-ORIG-GUID: ROQva9f1ReMWnypDtTIZ0dAgT5ttzug-
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68bab966 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=2ng2SV8iM2HKWhXzYmMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX3idyydGuDBZn
 8FhG2Vyq8xXFGmEu0lWURavxrzJFfgupFSXhM//aNrdSWBsjxjZYYcTpAc7vkfEJi54ZugAWIhN
 iZuvIN6nnCziDiya1torA8vhVkVt2883Ft0zOOwvjChcGH8en0v4PLhIBWrObUz53zKW2IR9t5c
 rm/CQiVkMoH0ZqdVDtZNhjtO4ZeIOwpcKYS4Ktzt0cPWcnAZHsg1FjG5mZB33Dvx5qgfI3Oz6ea
 Iu9woce8pQxwaOKWhXi8ARFkDbq3YRd2ojhE7+nj5j8QFKr87Nk0dAJz0nso5p4HCnnHcdCfEoD
 8ltsnUJnlp8yaCSOmuDSdtPBj1TJMz9LOgaTufBMYetv5P1f2auft2F9FDrBpfKXcinGiGepakm
 Ni0hycvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/5/25 9:59 AM, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      camera@36 {
> +        compatible = "ovti,ov02c10";
> +        reg = <0x36>;
> +
> +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&cam_rgb_default>;
> +
> +        led-names = "privacy-led";
> +        leds = <&privacy_led>;

property
property-names

is a common pattern

I know this is just an example, but people will copypaste it

Konrad

