Return-Path: <linux-leds+bounces-5431-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B90B484FB
	for <lists+linux-leds@lfdr.de>; Mon,  8 Sep 2025 09:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A53189A1AB
	for <lists+linux-leds@lfdr.de>; Mon,  8 Sep 2025 07:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8F12E228D;
	Mon,  8 Sep 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZfEPaaI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E22E5B1E
	for <linux-leds@vger.kernel.org>; Mon,  8 Sep 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316008; cv=none; b=BjI+jDMB104h+hpk4UPAhsl/2YhOIC8jZNVvtBm2q2ZfF8CHguEvkfufj5Slu+EBEPpMhGT+rQ7JrF2hwXLaeIIBiC5zv7qzSLOeLWGs1En9OfNzLQj39Rb0PYJkEPFuiu6T2BCZ5PzlZ8Bx8SD02HkoZWl5YrYyurph/PgTgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316008; c=relaxed/simple;
	bh=PqMyOblKEfOraVWVRyMOSW5G4N5oZyOPcmEHnteK9jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1W6WqVIQpoo0nAYdghq6KeQA41q6Br0FHYZFfgtuGHSEeAyC5OGLQdM2D03IFntsrEwbQKHk+W+h0TkaXkfPXdOKtZlA+nR6UhonuY6ASSnZlLI/tdjB7kbbHUwsx7p+tPJitqB4Ee3P/gnuCIIT9iZVgv3/gvhgkGTOnMEhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZfEPaaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LrbhG017315
	for <linux-leds@vger.kernel.org>; Mon, 8 Sep 2025 07:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWcKtvk8mFvfLmI00zGKSgzDw0tbzl3o6sU4GJfPEyg=; b=IZfEPaaIDN1l1x7T
	TnF1MTF+bRDRHQxbUua0ygSd0wlAkRtC3j1WrZRPaExv+OwbqMdE64KkYmn+QCQs
	RC8rVme6YhJB1Hsy68yssndvDzHpyAbOSHNpkcueZqfCvgAp1TCD6aebERni0Vez
	zWkLr6RkuDPBvmWRSah/ywQzw+d8Q4/IXKDBhwuyan4zzz9L38g1ImRJNbFjJP0R
	JdXCKEHEAxF0011/Igk+GEy0NopfLO5xRLSi+2te9Gk+E5pXGakkpxQVMkYaLuf4
	4jjhtJ4wLrzgfXVQB26W8Ftgje8vJJ3UEpFTKgPRpKudOlUI31Skz60BoDTdUcho
	ll7Dgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kuhd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 08 Sep 2025 07:20:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b6023952f6so6345911cf.1
        for <linux-leds@vger.kernel.org>; Mon, 08 Sep 2025 00:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316004; x=1757920804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWcKtvk8mFvfLmI00zGKSgzDw0tbzl3o6sU4GJfPEyg=;
        b=Pjx6jAYAx9eQBN6FRKwQEN4ESMd8Unj1UR8pVwIXeHD+/1oR29etEj0oFx3kbge2ER
         TdWO47wSu8IDqVTonnJkjtsW0NuNYkBdWm6nDTK2+H5YoDJsdbwNMjt2Ap2v6IX/nRcw
         8gdZQRQWTBGdq7dHAre9oWPo3ZmJyfYC9c0erKHFfpmgvUii4Sr2zziWxGFllIHau1M4
         W2DCS8wXfy/YCegv/jV41D3s/k6sA3Md1Z9i1xPjXqTFlmfrpfbuAbHXaLti+XaSFE2S
         m6NuMnfr4mx7sCcuOv53AIJUW4rxU2GW7WI8Gt6aWppRcE79FnNtE/77BjnGVKaqpn0k
         FEhA==
X-Gm-Message-State: AOJu0YwXBKspuGN7rt2WS7o3e4KvbFQZUvyDn3bwJipsGXboq5A8QYt+
	2v3RFnRNyplqgNCjJxOjMJg/iy4UgSPXcRFiubPrqkhghNB8DVDInjtPgD48JpRTdcWXOu5x9L0
	YlAq5JMBRidXFwSk0+ORMFDqksBC4HpTpkTZbyiQPTdOWqBpga/FG41BYi6zVha93
X-Gm-Gg: ASbGncu/qQsMPp7g0L2Tb5TzgtajrI18zzPCbxg8bae0ZCTkrPKujs+n+0SM5ajpH8w
	rRDhxfvJ9gEaDrkSpv5b2XwWT+Em4lSm6u1HjVE4L1gXaGntQh2DN4QOVXu1+upltZKhivna1ai
	oThkKcE0WRo25KOtGIlDEDgfLojnlSJmC+LNe0nzUQ0HASPfuWOcYU0kizNqFQCR5lzK6iAETzb
	HzCHHip1KYNbfQi8YOabh20F+Ek84w83mvD+w/r1KjZ4vnje55O7b53uNvqVKC1NmFmYyMsAn+S
	NmJYcfDHQ5YCQmxye/v7phMtvQRFHPtG3Cl68MUvwf4n6XztZbmpF7CKbM4l8laOy1eBRAphh+T
	2/Q2cOBSHXYT4RnqzjB6dmQ==
X-Received: by 2002:ac8:5dd1:0:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b5f8445af1mr48142231cf.1.1757316004494;
        Mon, 08 Sep 2025 00:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+QiJyueOpHGD01U7ZGb5pGulY2uWYz7NY7jH/9d6NejQbnMKqPQkDJBKht2O5pECh1Hjng==
X-Received: by 2002:ac8:5dd1:0:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b5f8445af1mr48141961cf.1.1757316003978;
        Mon, 08 Sep 2025 00:20:03 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0409bf055esm2172292466b.85.2025.09.08.00.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:20:03 -0700 (PDT)
Message-ID: <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
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
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-leds-v3-2-5944dc400668@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX6yWYnAWeGEdQ
 usGcAbl1jW65lPSrLaaPYXd57LgqatDx4P+5Smi5YirnKjQbjHJ1ph7n/gNfcouUjxphcgzc78n
 LACbzPml0jzu3B3/rTYUZ+pdGQLq8nhqyiTBtQI3jwZ6C/ztRomy8N/odU9gmsB/FzthpeodMmi
 hxcSWnDLkD+6I9f1DQbbU6+ki7qA4Rjq/Q7hwTHiSGYkknwBAB8UpMz32Z5qycHp5ipB6DAZ2Tx
 84qPYFa2Gd/uM86r/UyHlnCe3oDYfmlqKwn4fDyqwNun+8gTF0DF0RnAE0O6OfdTuFt+hYTxC1c
 m954UlFcmWWWQnTbad7PWIvhPk+pOxbrjsBTGJvqCSj+nugft/urrqFSuxtLBz2xunQr0a6VRFe
 qw0wmm7w
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be83a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=zDPauhyOtcwAXlC7rdQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: RIIFaiGQJq9wu9zlRzR6N0hw15Nm1if-
X-Proofpoint-ORIG-GUID: RIIFaiGQJq9wu9zlRzR6N0hw15Nm1if-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> A number of existing schemas use 'leds' property to provide
> phandle-array of LED(s) to the consumer. Additionally, with the
> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> LED consumer, meaning that all camera sensors should support 'leds'
> and 'led-names' property via common 'video-interface-devices.yaml'.
> 
> To avoid dublication, commonize 'leds' property from existing schemas
> to newly introduced 'led-consumer.yaml'.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

>  
> +  leds:
> +    minItems: 1
> +    maxItems: 1

My brain compiler suggests this will throw a warning (minItems should
be redundant in this case)
> +
> +  led-names:
> +    enum:
> +      - privacy-led

Nit: "privacy" makes more sense without the suffix, as we inherently
know this is supposed to be an LED

Konrad

