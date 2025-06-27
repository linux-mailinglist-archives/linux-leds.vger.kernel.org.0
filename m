Return-Path: <linux-leds+bounces-4905-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B134AEB87A
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 15:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A5717DB29
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F53C2D12F5;
	Fri, 27 Jun 2025 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYEXqRg9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0774B2D8798
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029671; cv=none; b=GlrWFlkxF9Wf6bV2ta7hrN88CV32d1LeT0mgNMF7GNboK/SQSDUw2b+Ar8HoCpw7CcVgaLeFIN5BCP3L8EopRfif4GH2vTIyccqojU9N0Q+/LL3Pr58LiOb59QSkjuZwtae5jXx1wa9EQE1LO8cA5LjM2o1kcHkcdKbo9QUHRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029671; c=relaxed/simple;
	bh=1HjGPrePx9BzLMqlBHVXd9mgOpoGcPi8zMxkRoCatQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyq04vuIcHmZ8z1qDSDZNnC6SZPgJryyEMH0PddafMcXTRDa1wyGldHWT/LkmJHPlnlo5qGXiNyP/UKQRmrXBr7MK8MkuYilu1ugJjtec9GAxaOIsYObMddQEC4G5vjRT+uou8mMyYFdQrxbEmAl0Ly/VpOaILq4dwxxhPmDvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYEXqRg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC95PE032643
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7B1mI43rlLj5MdjG05K+u9+5onCyxbic4JTto3iPdEs=; b=QYEXqRg927Z++bbO
	xOCZk4H+CYaAZfC1X5xqjlQBv9UQcCADerV5UxGLUsiceRYSggfkg1oqN2qqFpyt
	VhvuW9uy//eGFducA8i9ay091SDCyMibcRcli9g1RWkCkdEdUc9R/w92t2OnihzQ
	x3bBe1T+oCzakmBASiwvuTOjCZQW/WYKomBVs9tmv5gIn1afwjCwgCtPTzzYdP3b
	IzppQ4jdnnQNIWj50/yZ31JK0qi4tMIATnnTZy0zl7PZ7McnAmzXSpNVCWX4qT6/
	dFfXnG5r0LM2EaOfZprDvb4uJq2J1ovAFFnrZQ9/eRNlZt6dLXVoHNH9IoOWH70V
	PUFnMg==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgx1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 13:07:49 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cf89ff625so199346539f.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 06:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029668; x=1751634468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1mI43rlLj5MdjG05K+u9+5onCyxbic4JTto3iPdEs=;
        b=Ijb3e2AYJUamGzqXqAcaIfACbtsDnRgH21fqrTRj23xIKGGlioL/8O/P8SAph1AwaM
         CiOhRxMcyp5RN1IZEqnhcInoxaAxF+T5vjgy36UicwUlcfCm7X/v5nzbVOLS5mqWT8yu
         jO7F0P9nTJsvbX0ClB0ETLedUUbOYL/5nSOypeA/kQxaccjKjc5oM5uzy0q/GED46Pjb
         raYfLaguzXpZsP+u/Tsna4LbN2YHHLRhPoiIbHQoHCVGdHnq6k9rdIgW13m9CakleIQA
         UE6LtIcu9DRnfvsC+GUYufgca5+Wn66gwqkkKRAWXUelWd9yxr37EAfMmSaULr8V1PW0
         YGUg==
X-Forwarded-Encrypted: i=1; AJvYcCUb3j864CLGqXhXHndEtM5e1eZU/MkYsUKP7OC1tiqo9zS0YaF1YSYeGoE0EZLQfiOHbN+p87iUKqjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3PWGNDtvrPgBcjv8iR9xIhcI1sgHqcU7EOT+iDbwqPHQDuDa
	AbUnQm++DEgPIssojtaxY0YhO+RVGN2e2VxVkh2hQs28l9j37f9m/mPYkLHFpB9WQuvZ3NadnxI
	Nw7/xgDzOAOosATVLuuRoIybKnx5qJoOaeYr6hLr5Lw9NviFFjajwOweF8eM5Lx0L
X-Gm-Gg: ASbGncu91V3aOkmK/Fw9jXjNqOf9g+Xe5aXkHg5qHbNfE0RcRd9/UYdpM66hzxkbX/Y
	sv6gnv+QcPl6OjXDstyd1dWc0uf45pwRb32KqkOBbAXSNN+/sKRIihKC3dUScKkHkVJ7C4rvT2d
	g1oDw+JxNRkUzUxxavlycrPk+EuOqKy00YfC59kIDiWfye7UQnQJKxsSyq4ugUXzOACUP+LXCDb
	ok0rrtXK0us+MNNa/nWrjLgmgRxJECkgatf1ouPiTHClO0jVAOJy16Vy95HXidZK7OicLhs54d3
	ic4QtFUv8CRlmQPSwT5pRZ0H7j+TALDEy3COxbvP7cESQwvEhL1e7+VmbeQS2TSe9Gkx5pAcfkg
	JSmGV0NgapuUwNCvyXNboqw/+Hk2weCdLzAc=
X-Received: by 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr36335045ab.2.1751029668096;
        Fri, 27 Jun 2025 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1Fcg6f7qKMNrYzUxfeKnTHHm5N3qcjPX4yV/7MeF8kJhFcrBQH1magZpQ6jw8N55D4Fh7hw==
X-Received: by 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr36334625ab.2.1751029667636;
        Fri, 27 Jun 2025 06:07:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ecf63fsm5663921fa.74.2025.06.27.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:07:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
Message-ID: <x6jo5xpvqlehij3rybcq26xehmeuzju2mgarnp3panag5hy3ao@fmtu7tgc3p4n>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
 <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
 <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e97a5 cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=h56Vx8HxoSJ7g-UfYxsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=61Ooq9ZcVZHF1UnRMGoz:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX3cqx+nVCKHoB
 S6eikUfd/ak2ESXxkCU8g6ccQH/R0m6wW6dF2SpkCR5mSqSiHJ91DSo1JpQfbSV64oMi50FfCZ5
 yV2Zpq1RjL/44MMx/LHQIf/yZyyeTnQbaWAGe1G66mXi2Gb0MgK6SxRvgB5fzaKzdxb8VPtJ0hB
 xGxvKhylTV+kGErIYytjhOZnLtqc5glErns4WMInQY6e1tUDcwEBIaLNg5jfTPaHOb3VGKUmH5S
 pSMvoKWK4ezEOsb1YX4ks+KUmPLcvCPng1dPCFaTpBn+zlTAoH3ZZ48v7CIVCU/tw+kxlM267wU
 rFq2VW3SgizdmhUgmMeRubhTa2HmlhvGBlUZmFzk75fYxfhh69+EXVRXu3XKYduCn0KmLPCmKsa
 rTzRWt5IJyCY4GmPZvXKJI7tMutA1jnYHW+tWub9JfVW+79Xxx88cEZ/uiiKyh5o8DVdZEEQ
X-Proofpoint-GUID: HKB1iw0QKwPttwL5cxYWN1csaSsm-Boi
X-Proofpoint-ORIG-GUID: HKB1iw0QKwPttwL5cxYWN1csaSsm-Boi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270108

On Fri, Jun 27, 2025 at 02:54:20PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 3:20 PM CEST, Konrad Dybcio wrote:
> > On 6/25/25 11:18 AM, Luca Weiss wrote:
> >> Add a dts for the PMIC used e.g. with SM7635 devices.
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 63 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e897e5e7ae2f20cc6
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
> >> @@ -0,0 +1,63 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/spmi/spmi.h>
> >> +
> >> +/ {
> >> +	thermal-zones {
> >> +		pmxr2230_thermal: pmxr2230-thermal {
> >> +			polling-delay-passive = <100>;
> >> +
> >> +			thermal-sensors = <&pmxr2230_temp_alarm>;
> >> +
> >> +			trips {
> >> +				pmxr2230_trip0: trip0 {
> >> +					temperature = <95000>;
> >> +					hysteresis = <0>;
> >> +					type = "passive";
> >> +				};
> >> +
> >> +				pmxr2230_crit: pmxr2230-crit {
> >
> > This name is "meh", please change to tripN
> >
> >> +					temperature = <115000>;
> >
> > Unless there's some actual electrical/physical SKU differences,
> > downstream lists 145C as critical for a PMIC carrying the same
> > name
> 
> [    0.085990] spmi-temp-alarm c400000.spmi:pmic@1:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> Same for the PMIV0104:
> 
> [    0.086556] spmi-temp-alarm c400000.spmi:pmic@7:temp-alarm@a00: No ADC is configured and critical temperature 145000 mC is above the maximum stage 2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.
> 
> What shall I do?

I'd say, use 125°C or 124°C.

> 
> Regards
> Luca
> 
> 
> >
> > with that:
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Konrad
> 

-- 
With best wishes
Dmitry

