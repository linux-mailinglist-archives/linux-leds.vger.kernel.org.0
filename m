Return-Path: <linux-leds+bounces-4886-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54AAE8FCB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 23:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F81E3A72FB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 21:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224371F5827;
	Wed, 25 Jun 2025 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jE5QY8OC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391617A31C
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885413; cv=none; b=SHjpqP2xUoqJNBfsXRVFFl40xj+EO/j6KyyDt3z/HD3SqGPazERZxsZq+mbZaf7qBncpuBRtSFG+EMtCvLDo41wcRJ2BgW1NmwrR9+Yz3EwDqQuC5ocWtyBXIVKh+KH1ACTppzFNVNybihlb9rQn7qYR59ZSC9UF134iHPDu0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885413; c=relaxed/simple;
	bh=BA1SJ7BB+xjW15IIb8AKZyMEAqBjcfpDeU4wKnF9SNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtocZ5mSDdvsBWZAVDEVyBwOEHMR8mDi2156d88VK7Fj6durh3b/w+/ID9iG5dgm+Zql68dKjQehyiDGI8A6yE2T8PO1RtXtiyWAVkeD5yxWTPVo1xvq+rEe54rJsCGXJTv7uKgDb83Jud34DENo5ozeeYOCjyN+ueeHGyuwNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE5QY8OC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBnFiw013198
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 21:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6G8NazoQCjyeRDRCOe2NN6H/
	BOfkB3FLygIjOlcUYwc=; b=jE5QY8OC95ET4xnGwB0hcpWGffIshWW7qDsJ7IbU
	ODJMc6E7WrvkXfdg6/UTmUu/+QwSdIij1tBuUMI5fuM9jU5adiawiAb5P8k/Q1VL
	oYggcBezPDsNBp/gx05kv/seoUZsbs0cbD8fdWYYbUe1ztlcvlI5FzXIQM8FE+Uv
	kFheIsCpk4cT70gNQXsj4NzCuZ4/H0AEnPEUiqy+iatYPWx6X1BvoCGWTUzMxKue
	9XcuZ8m1GnD7ovHobwgw649P3wOqRBYHoT4AjMf6JEIMi1VurFLHTznQdJlFqO2j
	3vkLesROGNrUcSCNVHFZaSmywIlOcis53kzvuZVBHWOOmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1yrk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 21:03:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so76900385a.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 14:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885409; x=1751490209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G8NazoQCjyeRDRCOe2NN6H/BOfkB3FLygIjOlcUYwc=;
        b=DO0wiaxeNCtqbxzXZiuY6Ko10D+yv4ooGx+7ApG2oXZkntE0ORbXyxAdGHie8n6Cnm
         kZVUGaN4ml9TPGrKXH5CSN266aslJXnNPv/ZC46sILpyYV/6QRg9daxW/+mzDXcjkHNH
         MHcrSBdRdKfB2VukLk8TYpWdW0EGz12OfV4sd+DHm4w9z7t6OGCyKvHbUwq063Fz2Bsx
         K7zndJxWHUaf09ZxoZKITnXRTGeTJe+oiMiTqInz3yaP448n2h8U1B2I5jdgBYS3TGDg
         FKg1HTGu0PNVaat7/PtQ6Er7viSD4js4bB5vbfmrkJvPFJz5LjwYeFdN7AkH4uyLJK5J
         OQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7VvjCc/h2tWPRYfzWSg8TWj2uXrWK6USodnW/6tKCwRf+2TD0uzpNoyy+2Ln9fduqvNuzuS9164vJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEwCvEeSWN3Y4BE20jslWRPcmGDBUKSYovMEgh/MXQHdX+CG+
	FNsM7f/wzU6JU9Qh4OjS6YRXz8H5Z08xgW88klqSzwOInfUU4G3PohTDpDrCyppOVXxqsRIMmIe
	JlLnJS2Q9zHjJlX4tWKYjkT9ltiVuFgifGOt0TeIp8bmUH/YpAj7isGgu+Xz90rNj
X-Gm-Gg: ASbGncuQnwLJAM6pfWLrFmO0sErcc+NLqfJp+wyacxc6tOFq+xVkxpvG874XkTiJ0Xz
	UlTEHP5U9p13n40ldAXxy84EbxvbWT66gghxYFl6H4tbUS+kGsvVbMywsuoD+d1HBC1ILmx6eGO
	zWFdf95wVbPNl/65Rmo/KYkrcsm4LuO8p85kwLtDqxPnOTm3TFY6TByfrmRqcqB16Ot9Nn3JAJ9
	r4Q5mxtVkpI6E0jPHxlUB2ZjbNj/MRg3eALFoo1K79e+rlrXDOZ2cv4wXYtePnNM/SDPMizQ80v
	tnqOJ4EMuq9ExAaR3lUvBQ4bJ7GtTI8rBcqImdiCJSrYGx2qQrqWryT5aofMicLu/oS57NAG6/J
	HHM65uanImDK/bOBB10zsVv74DMqZ+HtOzSY=
X-Received: by 2002:a05:620a:6293:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d429754e9cmr611509785a.35.1750885409407;
        Wed, 25 Jun 2025 14:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7oKjmuvEEF1WQFmTjT2Ttz48tRtbggO2WDZJ3rR8g4bzcxgd7OZWfwRoKuiaa2MrZBIv4BA==
X-Received: by 2002:a05:620a:6293:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d429754e9cmr611504685a.35.1750885408782;
        Wed, 25 Jun 2025 14:03:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f594e0sm20999961fa.23.2025.06.25.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:03:27 -0700 (PDT)
Date: Thu, 26 Jun 2025 00:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c6422 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=TnUiieDH8m5hmC2EXGUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7xag_gzJlEm-aQYa3vN0F4t2Ce_p-7ud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE2MSBTYWx0ZWRfXx2YhJxHc7T6i
 CGQJcRoH7+VshLhHKQKr/j2kB0hoERROdhOugMC/UCD5MFmlwx4B6jSJbPcBRz2+HvSJZpOUQgA
 ISO+u4/XwsFzodMwoEdMcYeXjk2yZ2n4SrGghuQ2rrSPkYsMStLzCcqN6OWWYaSEGDM/eTGr5sm
 pDVNxNt8ElZrKOYljWf4je6U4Om8p2ZIbv1gNisXHDFNPKQNNw1wwo1yeBIQO+wbZMlf8d1jCPH
 zS/W0GtC8fuflqyUExuea/Gqh+glNVSzy6sN223tIwvSO7sAOi17JoCCIMUGd7aGUBjn6TnBt14
 dH88Ymj1YpqX3qmDtzjZkdnnmO+xrX3PHxPALx7VOjZx1UiRpqKJ/RSBnBUXkLulqMrI9n9Diwh
 2mA4Be4mdIGRAWlh8qAy6GMzBXnp9V2Lubz2+8ocOQ7kqOBa625HoE8g3YfCDXPtwcGklzXA
X-Proofpoint-ORIG-GUID: 7xag_gzJlEm-aQYa3vN0F4t2Ce_p-7ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_07,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250161

On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> >> and the devicetree description for it.
> >
> >
> > Please use PM7550 instead.
> 
> I'm happy to not follow downstream naming conventions if being told, but
> do you have any details whether PMXR2230 == PM7550, or PM7550 is just
> another SW-compatible PMIC as PMXR2230.

It is PM7550.

> 
> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
> get updated for the PM7550 name.

No, leave it be. We should not change existing compats for no reason.

> 
> Regards
> Luca
> 
> >
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >> Luca Weiss (3):
> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
> >>       arm64: dts: qcom: Add PMXR2230 PMIC
> >> 
> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
> >>  3 files changed, 65 insertions(+)
> >> ---
> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> >> 
> >> Best regards,
> >> -- 
> >> Luca Weiss <luca.weiss@fairphone.com>
> >> 
> 

-- 
With best wishes
Dmitry

