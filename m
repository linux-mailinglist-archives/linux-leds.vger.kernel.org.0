Return-Path: <linux-leds+bounces-6664-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E5D2F481
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 11:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E49FE304A8D6
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 10:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7904235EDA3;
	Fri, 16 Jan 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5BoFwLH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kej30HhF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E331D393
	for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558071; cv=none; b=o3eUnNfXEL5W4p4mTWJ9qzjftUAbgAlNkEWC9kHgPN0GfVrAi83gO/dHSsk1C9MhV0FaTIYOC9HECUS1fW9df4hBHEaP4fyl5h7pT2kfcxvExq55iTtv2QgmtmyF0T9PInmDS15vSMPeTS1yEx9vmT5vrdZQLlmP0IgCYxrdjbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558071; c=relaxed/simple;
	bh=vDpPl041f/I1iMmWEjgFBtF1sfEIsnwo6gBpwRcH/RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZTa27b4U/T/MtI10njvY90s5O46vodqXSyo2XW1ioRht/VzviXpbeNUCMb2+K6WQ7iAAU0XPdMHRI1/DWXRf+YyMa3ugG/5MMWn3ty+erD3JPuIMRfxWGPMf+T5s3NLjplKiwCwGtwipK+qH4G6YtGqf32uTDPrgrkZIDntiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5BoFwLH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kej30HhF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G872f93582873
	for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=; b=m5BoFwLHbwluIwbt
	ZJVAz7qbrmQSCyPOYNS79oJpdAp90QJSj1EUas0fdv5P/mk2nOJf5X6hzpAxx1Xa
	0suPQEXrZNAZyv4G/OcQP22fzdw982ay3r1PV/fbnNoP5EIkWvxPJ9WHJT0LTDSm
	OIQFzqMGP9q1NzgXqgERRpTT6Ixe7LET5gBVeBdn1uSfKQYI+CpAgcjcfAzvdd41
	PdI/dD+JWu1LTWRuwGcyfABsMUiDonKam+FL571wc9y656mTALv8bWES/XS01le8
	933vsSJ7MmamMqA+Yv7+yNilGDnbH8NwcvlPxyBfpBL96EO3Gt72rh/lv5oFNmlt
	b9Nuyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9aysrjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 10:07:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5265d479dso58201985a.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768558068; x=1769162868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=;
        b=kej30HhFPAOAxcr8DQcCYy6AnigoPnNPQdJqPNr3dR83jyH3YS4nMBu9uN/Sjtdd1T
         tU4r5ZbkT9ZTPGa0E+f1QfVsqukNTPy3OyNdDwm3OqeSlYFWK1UUMKKbimlndNiCKYq1
         QANniXdXj2Jb7FCJ9S2iuHudPMBYYTT1+NcFFmXECOlQEvetKQME8rRWAimxHMnpaOlW
         APx0Smvpmz+C7SxJiKaHlzdxa2CVSIFy8S35WqmbTvcVr5Ef1RAgmByeyAy/J4FUc+yH
         1WsbQNo5XkE/h/wfmmqci+ZZB0De1ieBdYMJyJsd0tPQw1gyHKy2vqNO1hPW8qm/aUMC
         +RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558068; x=1769162868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQ3ilnfqSmvB3xC+tWrAFzcEml+l5XRFMGFEeRLo+JQ=;
        b=BhNt9GOphbQOVHq4B+P9sUAAlZRWW4s6XGWymRzfKW43iwHQkEYJ8W0qjS0lttPf7g
         4Oy9lbyzNjPfnpNLAUqN+Zq/T3+KtnUw3fKeVATRdJNS0pZBdvjrjpPdi2oWAbQcxeFb
         VQTWNYG0p9cebc9sOJybgsh4d1tkvrupgL/07rZtxNFL/AYouutrx0sx6iwxRUujIAZO
         JSVSTcjAWQl1TvJlnM3TD9F6+rsly0oLoSsgBL6SBA7sjuwGyp62zHLyhkL40VjED4JB
         IhujVYYKWAXJ5mhGolKXBnRT2jXJCGXEbabtpTq+8O27wuZbDh62eLcGjPykquIKMoWb
         jVCg==
X-Forwarded-Encrypted: i=1; AJvYcCXNynj/Z5Xv96Gs7ljMB4avoAvneHD1bdIScP12EA/deHgXJGD1kFKKcm/e+MJiTZ+HCZqMamkwPkzo@vger.kernel.org
X-Gm-Message-State: AOJu0Yybm64qtRVxTptBJCWKuFF4ip3dnJHiYk8Kom6Qv4WXpLqFMfrA
	TWmKbpVGs2/zSjg9m1Qz9Hi2KEj5AaD7B/BZz1nOxEjdwr+a7YkHomUItyeB02mpup2bmcVvf9/
	dkKjaV6LR7ftcaXgb2LA5BX6qVYGRGEVUP46s38nN3vkOiF7nT83Hi34GFqTyGWnT
X-Gm-Gg: AY/fxX7c76TGedJe8jNgfjAb3Na9f3sAXup3pbQdDq8FutwECfMoptxr4mTpu7MQasJ
	nIxdgm1Mg2UbwWl316n4WvKuww8npaSecrATXi1eATaRUxsnaSAx2NLvkAgGoGkmtguF549vHPy
	OYcxwJ3IUjzbU1ennj0NVbf2O+Rz+T6S7A5Wiewl1Ny8VSeeZMQwgNHIrtjtVxBQNFRlM3/nrmL
	157qS7dwlc0mnunIMDKsPlxhF6egcRPkQ160UpWC2fBW+TDENjTao03bk7j4xg1IYGfrMBuBtPl
	EH+LjdhujCteQ69nBn7/sPVxpETgCxB0Vam68isWNc4SqNalE/NkPNCppgcdB5q8OPC2IFeLrnb
	hiY3TUHHgDy+JSdvfwvWIWT0MXwNoCcoutHqVxtJapkEt6t+209D5ZAhBt6yfncdjybo=
X-Received: by 2002:ac8:7fc8:0:b0:501:4ba0:e06a with SMTP id d75a77b69052e-502a165ca89mr27196421cf.8.1768558068516;
        Fri, 16 Jan 2026 02:07:48 -0800 (PST)
X-Received: by 2002:ac8:7fc8:0:b0:501:4ba0:e06a with SMTP id d75a77b69052e-502a165ca89mr27196171cf.8.1768558068138;
        Fri, 16 Jan 2026 02:07:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm191564966b.69.2026.01.16.02.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:07:47 -0800 (PST)
Message-ID: <1fadb442-31da-4b48-8730-5f6cf5229600@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:07:45 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: msm8937-xiaomi-land: correct
 wled ovp value
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
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-pmi8950-wled-v3-6-e6c93de84079@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6o-Vu2DIxqmUFOh8WVx4O74XNkbK6b5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfXxWIyyLd4jLHa
 QRtwTPLzdLXHaGJyuId1hUxqwClMJ1Rq5axqD8bQIbER2o/Vwzsq6xjI4AGCHVkdJAvxKTxmv2a
 iN5YiaN9DwnLcanl8CaeQgzE+r3rPMQtkTh25R/SHoS2RD24fwtSyS0QGBbluplX5Bv7Rg9Lchx
 EEAg4UJ8xUvQgr87gzN7DH/QWVT+4B83CnGCR8n+DlZh0el7WdJNGlDlAlkYiNZ9iBsoKsToKiB
 UbbFteUwTLV9dDCH6VPIHwSiel9yq7z232F1jzFZTm9hDgQj4yoXcaaL1w4Y9O9uUZnAPfe79W8
 hzQETJXC09pDJsZSg8TJ6Qms05k3i187Zw3n6qq5RqzmdS9zvM0OTmdc5tWQnMg1oKYWklvSOJl
 lSkwzfDUsjlWP1pqjDqe1r181oLXAzKwuUEpz9Q+kgJnmFGI1TT8gdQSqOeUFgf/FQbYhBU0lqe
 XOEmRxKrjhoalLXduXQ==
X-Proofpoint-GUID: 6o-Vu2DIxqmUFOh8WVx4O74XNkbK6b5Y
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=696a0df5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=ECzvPIt7qBxGGsi-YOkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160075

On 1/16/26 8:07 AM, Barnabás Czémán wrote:
> PMI8950 doesn't actually support setting an OVP threshold value of
> 29.6 V. The closest allowed value is 29.5 V. Set that instead.
> 
> Fixes: 2144f6d57d8e ("arm64: dts: qcom: Add Xiaomi Redmi 3S")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


