Return-Path: <linux-leds+bounces-4883-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A6AE8472
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 15:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0321F3BC1E0
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 13:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C5513D503;
	Wed, 25 Jun 2025 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmEJCt+K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60125FA31
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857626; cv=none; b=Ds26yHe8VfqSwu6V0OGRknDsJuo3Mmtp11dY9PfFPFArf2Iwg+agqPsLjzBcEeU/QGkZEA6PXvypMYFERoXolNokzaU3jWB2md5zUGRX4Xgvz7ISwaQSQyXHe81ru5ga6SOkl0zzc0FTidS0QuRKBqWhnfoCeIoWyM1Cintbi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857626; c=relaxed/simple;
	bh=J32uwR5PG6Pj/fkgodkU8NToknBPtoDkFd1PmBMP74o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WL+EP4pFnl6kXXAZNcvx7iaDujf1g/vtksM0hUP6lUd9WPvmsb/a96wg5n3JwDx72hIzXO5vGFOGSiBD89KDe7zMjgCSl7+lWIZDkOVcB7pMrwh34Ja19Eu/78CmokBdR2zy53MYXuQBldbzLpQ01z51YsIEIfrMZkUNCd0Diog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmEJCt+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBg9u4021046
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 13:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Wc6gS//yAoCzSiP++Qy1pCvIWUQ0H5tM6n71zaADIw=; b=WmEJCt+KShHamXWM
	DwQtRpdWj0ommS/ZUnTqMILSd46G8aIrPS2dHbUNg8QsD6ENqdrgsppZUkf1aqWv
	/7tukxP4ubFmNP0/A1lgRMc/0m4HrWcMbQlwVrvomLcsaFw42o198fZP/biNGa2D
	XFGsDnCLYsKEgBCn8DQ8CdnNciMy1R+AD/fCOtOQHAFPj+A8kJO32k+2vnP/YydC
	H/s7Uymw7CFZtlbvmaLzFt8JiZCl3aPu9iufhwPQh3nw2F0y0pWkRShNJ+I3tsWI
	JHP73zuL+ytXK9cJHa3k6RWj8+cQ0CuWYtvJsbnHWQLt+Keq6gHljgBeiayDY8lt
	GycS6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwx9hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 13:20:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so20559081cf.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 06:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750857622; x=1751462422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wc6gS//yAoCzSiP++Qy1pCvIWUQ0H5tM6n71zaADIw=;
        b=PjN/5t35DCRS4GI6hOMngrZAzroUsJX0zMNxzJjqJqwxH+xEF+do9keUUEGbGRt8wL
         G2pTb6S/aJ/LArTZ4ZnJIA1IWFoRcr5N0rXkLvlBg5YPf42+x5UX+E15DEaatWexYzRZ
         ZvxexqaT2nQkKLfhV9ZVSYTJPaeq24b9qDPymq+OylEI3SqzqkmyNnyV+58tDg6cDU28
         vu1peLwaqRGZaXWJRNkdiuBoq+elfh9psx+r2tC5jrxW79jYFva7Qt2/ZV+d5oKw+p6Z
         4jCaepqLnHciw3HFr2CeWetYbut5r+/Wv+L7MX9Mm9jkdsLhDHSaYkQJs2UL9OWEbgYq
         nJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7qWntRqx0mfaII+nepwfCPcCtNgx0kXtnWqqODWWeIs1QhYcb6y1WYTFJPnMuEvbvcsbOFc0vRCm4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18N5jImalIH+MnAswtkKLlZK/dwjjKsWnEUEdF7b0yQ4O7cBd
	lM409R4nI+oxzhKl1AAIscq3DLaGNwYezSaGQqHlfrT2h5qL66z+8EbtMESS9v8s9APvAnj00Nt
	FnxskprzpaFROVyFEsrMac2Y+JvS2kP7edKLswEhU1W0JTguslWf68hd7sHYRcsya
X-Gm-Gg: ASbGncs5vnC2O92QuiKdngUvdicUVrITAKltKVK+JY8cNCyEyAOzXF5RMMdBWm0LyxC
	8gAoMPdGbNA7MsE3cnvVfPb4h5rBdtnsJBckbGj4JI6cWiUGPbG3xYbMAfcnA1T6dGK2yzvkd/3
	XugW/jVs/Kd4TahqMOG9xLdwVkBB+qOshfXbqPT+h4ncWZsC7fdkwbl0LFRtmlrLLSyHfxA84GI
	1LWijW5vuwYPZoOD4OhBz7rxJNYn2tSaYxEF6dIu36SN8uPC0P/HXREP8NUV9UI/biyS8Q+8fgQ
	W56fth/xD31E8thlLYlqJEzkM2E5Uo/Ir9gaeY0iy+mXQPoIYGJMgQvaMnuUY9DVLS/+ltPKvM7
	itFo=
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr149809385a.12.1750857622547;
        Wed, 25 Jun 2025 06:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhWy2dsS1LyGigZ4Dt8bnXgAs0PhlY9HNqrotGcZ/DU5sSn6FMsWkf7WES+YXghkiMky5/Bg==
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr149807385a.12.1750857622105;
        Wed, 25 Jun 2025 06:20:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a06ed21bsm373251666b.29.2025.06.25.06.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:20:21 -0700 (PDT)
Message-ID: <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:20:18 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lpq860y04wqB6pm2dAunP1OuiioaR8DY
X-Proofpoint-ORIG-GUID: Lpq860y04wqB6pm2dAunP1OuiioaR8DY
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685bf797 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=1Wqoc7Fd06vDnn7CWGcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5OCBTYWx0ZWRfX+n0uC+q5znXc
 CyAG10qT1VA0yxKLVkXhdEPd5tC7iKsfymPsfh39ol6OnsCKmGx8mVCzb++6bdyJOjrPnm9ZCpd
 C0p2kFrjGdmanb+ARDQe9lVwFX9qFu2b5dQbNE2/NNCgVo2vWES0TwRP5PC6Bg+2QbXEL1v2JUL
 tCywMA5bVMZocS/RxIBL9L7UYfhrMUQEPuuP4ntKwAczDvp/1NTAqaSx4n066KfsvA0MehE4uAm
 1AoGZP6zSOpFMLjTZyT+mEE/YTmbAAd+yMy68dTW+7Pkripkz+0jB6pr7U8KF9pHziONAFQU+Vl
 c2o7bF0zJTNWR3cP03EkTOifMmevC04T+bOkyj/KGrV5ZDlP4/G9mGEqMavPUY1pd3yE7lpEODm
 Gh2Lfhc04q++xIFUx4YJijFKovbLaGCdG5qliVHbAYID2I6wCwyb+Bx0Mmg7Ba3hgqFicpQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250098

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with SM7635 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmxr2230_thermal: pmxr2230-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmxr2230_temp_alarm>;
> +
> +			trips {
> +				pmxr2230_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmxr2230_crit: pmxr2230-crit {

This name is "meh", please change to tripN

> +					temperature = <115000>;

Unless there's some actual electrical/physical SKU differences,
downstream lists 145C as critical for a PMIC carrying the same
name

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

