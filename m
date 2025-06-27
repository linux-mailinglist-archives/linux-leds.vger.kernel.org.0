Return-Path: <linux-leds+bounces-4904-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0716AEB876
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 15:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 150F03B9905
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 13:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF722D97B2;
	Fri, 27 Jun 2025 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JywYaVQH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C92D8DC5
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029630; cv=none; b=ZZQyOl8ZUMvYVtEoBusJJwxinE8ANTNGcymaF63+Qq+0y5HX2X0BkNdDKh4hW3nIlKD/+85yI2Stt02h7ox6xLqpMndsT3Bz+Ku/CHlbckzMgZ8HTd1iPbN6r1iiqMeynPYxqgDCtRhgdmNdWAAJ2jthy1wSVgvmQo+hQinRGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029630; c=relaxed/simple;
	bh=tg6R/OxBEXFdnuXFE43TcWTsroZknzNNCoZ8QfLjMNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovsvQsPWC/ASQmfddLRYlVWza3qHCXkRkRoRh7esy1qvxPTlbPGMT3C60EvzmDU/GPlt6c3f7BW5revCkvurmkQQr/n4J4f7UBZSqgGJOTxkitRbfRsmbVzvWU3igz4yDV0x2o329uHtR/RxWPPQXVE1gkfrYgrTpFaoQbDxiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JywYaVQH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBdlLk000970
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 13:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kOUX/LASzquhlb9ZqFy8fIjM
	n0teZEO5MHWRCaUTrxQ=; b=JywYaVQH2xpBA+Ok0aU1EP0ExUHBMUZBKgrR3LNf
	SQksZCScvWtjwOB/RR++LZkdiDz1NT+jBCqKdL/rnBqfw9D/RBXypRTnT7kCU/3i
	9/dbWTlK0kxpykswfFZy+sOsVMuY87euqbHCE1IlA0Ae0oXv62bkyMwlvn/n5bRw
	ZZawutGCgLdklBlY7Y8QHffk4AiAXqMIKOWbeZJW9w1OCl6T2DZAmyJncDOfxpmT
	sYJwQbu3asBc0dYc8ZZHEwdVtpcbluNzgfL62KYHiA4hcjbC+gnp5G4g+XNwJUsV
	uG0XIQgN0a1TxTVoQ5QhMHpmS8OtxjFubNJBZRoyXec3Tg==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgwyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 13:07:06 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df2e89fc8aso17632535ab.2
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 06:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029625; x=1751634425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOUX/LASzquhlb9ZqFy8fIjMn0teZEO5MHWRCaUTrxQ=;
        b=JqsfGMG3muzR9npOSvPvHylrZTv042EtsLCYXO+tnWDReb+S0OoOGP8Gz+JPG99ukl
         XJvsuyzfC0Wzz5k8FxdCKZ/7yBdIs42U6D2Ksm3T9tr1j0Mz0FH7494MTZD9158U6pij
         /z6+eM0ItkUR2seUUYjLmfQFoVPsppwCI06fLUux5U5j/1cMHol19tbt3Vr5N49QH/Xf
         TstFfHt5ZaHJHVGGU0aIrBv1vdxeK/L0iIe+2+k06DUx8ihYkc8ONWvNQPvoLdMGCg7n
         gnP1PF+ToT1fwlt3V/6JSInbkBvcN2ssiSLdLqdVettoIDVNHRTcOK9WNKelJ1O31/D2
         Z6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjXFO2kVKahu9/DmFDstE+VC7VPPR8l1LkjEaopyKoSm9D/8QIOK9blOKf8rcwG/AfxfI9EOTQfDTW@vger.kernel.org
X-Gm-Message-State: AOJu0YwzX797QvlVYzPPAlXzHit7P9gXGl3RMorIJNbs33hUT89vmotL
	g/wHnfNdiSp//Ua7VF1WORDwffFzMGxpfhqb2qvu9dh7m+Flt8lHbugnmm3bknvVIE3JgwOPQDO
	eFKMadY/ZJCxzIuMSFph+sWRi6un8MuaAmyM0t8XMbTEo3Rb2d45sCb8YlSl8hG1n
X-Gm-Gg: ASbGncuYUTbD8zvbwAWdFpkV2/lUiQf0z6LW0zI9rayQjl3ezRwy9SqfE4QSJ0MBszM
	UuWYwe3cEBazfmz1GGKU4ENYyfRAR/6vTzADSu0XSAId8HeLzBVWlT0lhepWrexEO1yYYODOWk/
	xcKf/M+4ycxl/tn1zDxGQZo0b75ojXa53U9NXDAaQT33YneLujM7Pgf+mjNRorlcNN6PfRKOhQM
	z8T5Hns78T4VUWSOrwuOXPiLcOu0b5FQeIMhGFLBO58rHIv5/BqpWjE86WYmKma/U+cXGnylVdk
	Bximl6ZdBftC+nRtk6aPcr72i2tpHKtgCKIbhjhW6EuLyXhD165gH4nvg71DLjHO0ZMk1Q4cuaz
	8FScxcXo9lHMLps/Hf+rSnz5qFQfZWS4hTTM=
X-Received: by 2002:a05:6e02:1561:b0:3df:34b4:1db8 with SMTP id e9e14a558f8ab-3df4ab3d2a9mr43205755ab.4.1751029625334;
        Fri, 27 Jun 2025 06:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE50hw8i/Szi+Vi9+TVEvYSP86FNNUfbWZEopTrfXXcxIjLifGRpkjO0fFOCbyvyj5vIC3A0w==
X-Received: by 2002:a05:6e02:1561:b0:3df:34b4:1db8 with SMTP id e9e14a558f8ab-3df4ab3d2a9mr43205145ab.4.1751029624832;
        Fri, 27 Jun 2025 06:07:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403edsm451530e87.14.2025.06.27.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:07:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:07:01 +0300
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
Message-ID: <lrbqjf5zxxyjnyfwwk6wniauffi5a3hgkg7jvboybvmrwxyu52@56onam4vvhz4>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
 <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
 <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e977a cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=62jDj0fiULz5QxSi0P8A:9 a=CjuIK1q_8ugA:10
 a=8vIIu0IPYQVSORyX1RVL:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX6RE8FMSJtLrs
 H07XQSJYXYBMz8OxWnjBCeDua8dCrd3770SEhsYnlAwq0kOB6qcpIhAVuG+iOhbqfwvdhEhVRvv
 KTpLr4I64VC9Vhla/ZnYEqFFbHjdAdUHvJMWoXKYGTuUPl6kNhRQTdYBonzPCx1WKzINZ8VVUJ/
 xsF+WT1h/ItsJm5mEXLQH1sRl+AE5pjce3vlKu6fbXb8ionpeJ0lp9ejszsDF2oLhBMfC4Jee48
 3HUC9iAnmzyhZq744WjKVKJZ48Xl9eEvLVX2YNILSAnCGdkIyzLaTBfaNnoCJMzrdPzKY2rreKE
 Xf4UfHdBaKzIq5ADCZEZdyj18/GGRC0IDoHh2B/RVqhkn/hE26vdts+2IxaTpuKZ+noMwKwCbGG
 M1xfnJgYjKtOddYW9qpr7RyFrslBwB54Sv0pgXzXoVf6A1BX1Spfairpb/J995opxxvREuXs
X-Proofpoint-GUID: SqQ8XtTAGuTpOHcRB2Ua-xhll3vpqErq
X-Proofpoint-ORIG-GUID: SqQ8XtTAGuTpOHcRB2Ua-xhll3vpqErq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=997 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270108

On Fri, Jun 27, 2025 at 12:05:08PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 11:03 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
> >> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> >> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> >> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> >> >> and the devicetree description for it.
> >> >
> >> >
> >> > Please use PM7550 instead.
> >> 
> >> I'm happy to not follow downstream naming conventions if being told, but
> >> do you have any details whether PMXR2230 == PM7550, or PM7550 is just
> >> another SW-compatible PMIC as PMXR2230.
> >
> > It is PM7550.
> 
> Ok, will update in v2.
> 
> >
> >> 
> >> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
> >> get updated for the PM7550 name.
> >
> > No, leave it be. We should not change existing compats for no reason.
> 
> The compatible is not used in upstream dts though, and cleaning up some
> old naming for the PMIC would be good, no?

Then, I'd say, just use pm7550 everywhere, making the qcom,pmxr2230-gpio
a one-off unused entry, which we might drop at some point.

> 
> But I can leave it for now, and we can potentially take care of it
> later.
> 
> Regards
> Luca
> 
> >
> >> 
> >> Regards
> >> Luca
> >> 
> >> >
> >> >> 
> >> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> >> ---
> >> >> Luca Weiss (3):
> >> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
> >> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
> >> >>       arm64: dts: qcom: Add PMXR2230 PMIC
> >> >> 
> >> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
> >> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
> >> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
> >> >>  3 files changed, 65 insertions(+)
> >> >> ---
> >> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> >> >> 
> >> >> Best regards,
> >> >> -- 
> >> >> Luca Weiss <luca.weiss@fairphone.com>
> >> >> 
> >> 
> 

-- 
With best wishes
Dmitry

