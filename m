Return-Path: <linux-leds+bounces-4884-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F02AE866B
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 16:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 143C16A4048
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 14:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9336026656D;
	Wed, 25 Jun 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gvz0OY/N"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12635266EFB
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861526; cv=none; b=q2cGuq6ST2dl3UxdCndrtGABTdJT5PHZghblEmynLn65mFo8577S9nxUINhgLvr93bYE6XGzHAZ/rEtoKXb5FaQwTkJk2NantOKwbtqFicry20T6rC4yySeDQ19KunRbG1Z3yBA+zXsgBjsgK6h9/Gv3QVGHmSl3+KODpX46RoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861526; c=relaxed/simple;
	bh=SMDUPPCgoy4irnfRcvFwYNWDljy6PoXj9dVonnDd2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c59EoOKXcsVwVRs9+jRnIIeWQZU4ccFZ3fwCPhgcVGeKchUkatgnkX4yKu4lK7Zvz5RZOSFZuOO9GWZviUdkkBO9AfkTwoXH8sOSyVpeUNkIcvBShs8N5jzKeoy2VVc0HuKUuqOyoyBDh0CMB14nKLhuFqwEcSmtLd/bQuhPFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gvz0OY/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBXF9u027585
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 14:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/9WVv1gsWDZO+apIRm8Vr06
	XSYUUadHkZ0D69bY6lU=; b=Gvz0OY/N0xL/7O+DlYt7P2YEtVRVSdbfx0RBJSjx
	17Ohq2EXTTAvcWyu38mbExIYiktaU1ZTWT5uDeA5D5Uwosi67mre6F6PpCKIJvyE
	K6yk0Sj9JZv4gEU8o13YHSETc1uiDrL5j6Z8EIwuXVDR7lfnkbdKp8fH2KqMZEB4
	04DQI43IrYPyzb4nqrY2jGjxX6ptgYUxhggfpbTa3lb/GPZhLrYllrKL51i8umk6
	iZo34Db3ZpycjeMaZczcVDPrMMi2wJNMvfVjPygBePBwoQVHYXLZO4S3csBr36y+
	rjMtd5FvLdYzR8YMGnzUO/mL2VL6IyEWkEO/sUwX7B0VUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqpnm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 14:25:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399065d55so225046885a.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Jun 2025 07:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861505; x=1751466305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/9WVv1gsWDZO+apIRm8Vr06XSYUUadHkZ0D69bY6lU=;
        b=L3IsGJ1BTvFmwZ53iDhu2xIDnTpf3955QZvUCe43ax+wXOyZr3EGQqyF8IiKHlfPC5
         Xln+pKmKlNGPPCoz7ihOUtf10jrGQrmU+hhsb/rgkgUK7p+7KwqCWJmDafbAbQq66aeX
         6b0DuqWv32YnT2a7SWYqXRqZ0PnUJU1OxmFcpm34AsmcJ8zqJB3GF/Y09vllgpoxZXZq
         nGEJwllJ/AoorKtPp2vcfUayDD10EjmrFPwNXqgZJIQx0cIS2FD+aJ7+MLcWSYtHXGrD
         1K88N+TLB9K4KYKf7Gi04++xCIJEjVxOz5vfQt/XcQfMrKMoDwsc6HLL1VNA6HLgK9Kj
         b7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXS0HiZElDkuOFvIYXUzkw1ULoWUK+HFy4BWUh3+Vc22yvpIBhY2QnGXIBDJYpRcDCrDYMvdSo5AaH9@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAbi7tBEt1Z3dT3lFI8sEJ4tRjbtNutRMBuvNg8DJ48MT607k
	YKhA+OVUYiMSEDcqxXbEcV40fEz2ZLeGhUH36eHr0wKPBa2atpIxAzdGiQCfe0ioltJbLz/6V4L
	Xnr8XS2GWX1+HaotKAd7fgp+YpbOvihnnTR0/EtYdAd4GLsBR4q7ysob5/w5dZowc
X-Gm-Gg: ASbGncuGUEAmtSf9foON3dJjsB4xwGMZqMukHQJgQHiRU3qJdvMz0HVSTSd9gIvY+Vt
	JmJ7lDwiEr9Mz5UwqLErigc/5qvmxWkmZ8aK/wa8JE/1rAhBPqphe85lwhvRt+vB6sor2TQVCCA
	0X6Dyida8qI1/hAKUtP5ZYfWiHJeV3xx5g09Lpxo2Z0ev9yHd8h8iiH1OGJcs2OoHKthhbnFkFA
	WNDXKvVyg1QeOdrLP6mwEWIp4RprmnErvpplkxt/lng2nHT9fs7mqIORN3dIoxesFcZY/XcRdSF
	RMLGa/VDS6r9PrIrtWrT5k+aS+OrpiX/EYrC8sh68GuSgrd3gWjcA7VsNc2P2GIS7Rh+LCLCMg8
	BgPi/1kdmzpPMT51DfORsaDy8fpRpLSb0ZVY=
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390998285a.12.1750861505053;
        Wed, 25 Jun 2025 07:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEgmUYzG5q66jyh65Mm7bfSX8TgdMQuftg7DpsTSuzDtL/tJHOo29ywzX65LlAhePFJPlSw==
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390992985a.12.1750861504345;
        Wed, 25 Jun 2025 07:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f10desm18964771fa.111.2025.06.25.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:25:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:25:02 +0300
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
Message-ID: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
X-Proofpoint-ORIG-GUID: 5xBWjPgEDwG6IIgJ5T_oH-LSVYVEUm1B
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c06d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=ACp3OnxLZ-M-vqTyPYQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 5xBWjPgEDwG6IIgJ5T_oH-LSVYVEUm1B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNSBTYWx0ZWRfX0SnAGAqMmgqb
 n/qx5hpdpBJTRwtKUAo7JR4WQlONOsQeMCjdOy8h37UtjWgFtUR7kl6cGNgqaluQ/kFZLzFegu/
 RjZygSlAN0pTXtKE/nJCAc8HQiAOEUupHE07eDUb/H60M8GpvU24hj3e7Sf1x3HEO2ElJJFHDV6
 Y9UkJWhTuYJ0IG3nJ9vl4cfMgVcsybl7/r0SVrjmA5eIPgBt4DfeR3ZB2t9fixzlxz6eTNlCB8x
 mtqfsm6VjnFCd9KgErhD10eevwwUWaAgHzb83xKmSZUk7riEvVbiwpp2xxAkH+kqtLbrtaI+v97
 Ha/zIcfiaAL/peObBhN9ndlQlEK2HKAoQ9ZnDGc6TqMPqEEEKh5wdQ+2wqV3AcWG7hLs9MaL0D4
 AnyZMTHr8RyAYumwWgFEqY77vzaxttIy4I9UzTuD2bC8AYlKey7o6PLa2NNiNjB24q7kVz/J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=889 phishscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250105

On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> and the devicetree description for it.


Please use PM7550 instead.

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (3):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>       arm64: dts: qcom: Add PMXR2230 PMIC
> 
>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry

