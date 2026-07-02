Return-Path: <linux-leds+bounces-8841-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6IQNKgZ1Rmq2VgsAu9opvQ
	(envelope-from <linux-leds+bounces-8841-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 16:26:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F16F8DC8
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 16:26:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bbIIBqLm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RyvLGkWW;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8841-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8841-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6884030297B6
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 14:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED0548AE3D;
	Thu,  2 Jul 2026 14:21:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63544D02B
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 14:21:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002093; cv=none; b=D6HjAJq4vFWFflrHwYjI67VwPmDVDHP7gp76G1e1vT3WjXw5pr8PclhnWiFbr20UvfU4YjCNqZgOpXQkk1I/02UPk8FNJu3uqrrhLO96ZnMsgOzhMQKf31/xsxqM2YQAVG/5JHx9rG3g6G7rcu1xvMgw9yKvJb9JB7NfK5THxTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002093; c=relaxed/simple;
	bh=MPs05alcI5kyt2xMxJXFLxjTmV0pdLFe+NT8Mu8MLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUOuTR74IAFBoFzREraR9o2zpsRvjo1fUrsEtTREThOeGgk5YFH+5A6IZpKmbBeHjbkoEtgdaN/Kwu7dBCdeDe6qGjUmFwPVSTC/5Z9FM3kLKS+DZ3mWiLNiGy3rwAfXjlEV9rqLA8pt/wFcooBTbNuhzXGav28c6GFw0LQF/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbIIBqLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyvLGkWW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3hmh560796
	for <linux-leds@vger.kernel.org>; Thu, 2 Jul 2026 14:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqVtWXYMTfvzhL7PG+gnIDmu
	Na4x7hH2EKxmHvzclx8=; b=bbIIBqLma4/I95h4vPOsI+Q4NmwkE7LEAE9tPxh2
	yVUSMUlAoYZ1zVV3uuXiS8Gy+XhSCbTi/mWrD1cUZ33SVM+eGcNGQAFNv6Vw1CRB
	hlRmXKwSPn4oQVccVd0tFN49S9zFnrCUEAvJUHtfXc2LNOGv32tG0jIp51lu8ZXG
	+TgHyVZiHDP7iyaylM+mnTh44sWguTwew/6vxg1EplRfa1+CQRPZFiHcsV8pUZmE
	eEXkS70XC0aooLoeffvZRSgYQDMCmCQsWbPwFFF9YEItrWIQA8Zo/mluaFw+BFqI
	EzH9rzVEs6m98utB3sKWXijtxGamgGERydscFflP0aID9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bh5xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 14:21:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so240080e0c.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002090; x=1783606890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqVtWXYMTfvzhL7PG+gnIDmuNa4x7hH2EKxmHvzclx8=;
        b=RyvLGkWW8DXn3c/l/3nRPjkku+iSDYiEUVbKHVzenVXzghp6vCu8QxgMWBP2Hm5usE
         O2Tp9N/i+JyKmL9O5obvbZKONYY9s42U4NCmGBoePvf3nVvu9+MhXsquKcH/LDhlx+Da
         PZZhFDNq/JqkuUgu/Ppo2ve+0u9Bo+7EtIZmjV+FWpOtx96GQHAD693xxxCLXU8xpT4H
         +IAVHWrVzLrGV8c5ZdzbldU4oGbESGzdMpE76IFYmt7rukJKzV3qmP2lv46YICwuQiz8
         mGyEf7e+pwi0B9AUHgRPn0/otH3V+3+ANvsxY+w34IUt36gNVBHAkLIc/TEJ1jt/R6QT
         n4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002090; x=1783606890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqVtWXYMTfvzhL7PG+gnIDmuNa4x7hH2EKxmHvzclx8=;
        b=OE1VuideBNN+Fn78u4ZNEwZ9mxNQ4tOuNqeWVqNoIHoV43Wwh7bnJ6ktJOxyoateTe
         gUWsfmAEvt2mI4JJU37RDuXkleG55qkfL5wr+fczoi4I2iMaH2zXVErB4Xz+AZl+vcgn
         aZB7Rureeyxofr7CPb5MoPXq7ipyOmQKkuPEZuLVxUD8B1MhlkLSzpbrpgTnldeYhvSp
         IDmtSEmgguCDLfymqHcioDdeCXeXGxG1z7JpQwV3xjddFkUVPkmIu0mUEQ4cPl19YQDy
         jx4sf0ur/PoQ/WH4xC5YD7gzl9GSs0cNtig99qPW030uotBUWVZWyaiYC8/84QM/+vcl
         J2pw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4cpGenvjuTe5EcBWxhrA8YQdC7mTz6NdmLo15qYI+tkJ+/Ghl7LpE8JdEKA7e2+mwZja+2A1QMAdK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8DFcrXK43lvy0EP6MBai0y/ffihxwUdSNSsFn/oHvOmrhIsGI
	6yllPcJL8CNUTb71v9QKgiDBkE8yCMsGHIlxaWHsMSU0v0qFhR4noq1pPhbadmsQlmxRWuUJDNt
	fRflZ5hqHJVWR8DBHn7OeLtU71qzsK+91/4su2xgigiEhWq8Vp7QiQPH0jL8lgT1o
X-Gm-Gg: AfdE7ckoG6E2B6GBJ1xb0l8WMMrs2iQHNhS9j4vtlQSxiEhHg8k2sZW+DPctVi0Fayt
	4jMG/Mmyu4LtIc7vCsCyjsoB05dqnKsLJkT2lDkMruJu6awrQAPfVwB1nuF7o98ZzAFihlDtM7c
	dhSgZQ0zzyjYwQwKt8UIa/L2XXaVS2CNjBkZ4G6mUOomuv3rvZ6CkafUBxK/2LZGnpwVWE5AQCA
	EbOdh4guLJ6v/GfAaSNm9Ykvn3GwrHCj/1JzjjEns9gXaSRZTA/1z587zr1iEQg/wImxSz5WqgF
	cxFp0SI9JkQzvuksTHhhMBjfWMFx9vEBcZVVpudmsHZa3f3QB2DIis0HUv3IeIQF/y6AtrhnGGw
	cDZcVEpAbn570+YY1BIYs9L00XQIv8hiUZ21rZSOqeVeSN09CGuEf5ca75Q2UnF2ap8pfBl1Nqb
	TQvRPm0s5JqMgw3IMPPpcC8Qdo
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1966158e0c.11.1783002089920;
        Thu, 02 Jul 2026 07:21:29 -0700 (PDT)
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1966141e0c.11.1783002089444;
        Thu, 02 Jul 2026 07:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dbbdesm707197e87.60.2026.07.02.07.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:21:27 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:21:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Message-ID: <55xdfva5yytsdfk2gy4fyjnhoiekqrew7c7i6ag424ltn44tgw@vdgthslyf6fi>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y4qFikn9pg5wFTBd7Y_Q8C4MFoZo1CeB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfX0xX5cjGzWYfG
 fp6/tWk6f9RkRAwG4+XkUgDDi9Q5ROzzgO2fql6N+Ypok8TCAq+ugK1ien9fRMjD8/DQo4fx3Iw
 xvoS1GjXRS1eNvDmXuGULT/bUw2whxw=
X-Proofpoint-GUID: Y4qFikn9pg5wFTBd7Y_Q8C4MFoZo1CeB
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a4673eb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfX5usF26cdqLbm
 Qq0coB31ZZo+USdCublGKw5PG/TBB3ycKYIqbG9oFVUaB2mbtgLtDQcXX0Rvhh2P/HmtcgrGEsR
 8TuC/eJUuynV5eKGBwlfLdtEoM4hQphEe6DSjHgd8f6mIRxFfVB+oXG6T4JeakKAjCfhxsm8ubb
 UvyOZUUtM4zKxby8gBfU0zlAOu3Rgyrf3xpRIBGHZt98+M72jeXxZQ2lkDO99alfNDp3lCKqGoH
 Nx0K+gH1BlsM/Rvs6BzdyNh7ezl1/sxKFUcKcaMM3DNcdbuavB0d0p/EQj79bf3v4M3j5fNOFDW
 zT/E0clqESsYOSmKj3JIvxSW9uDCu5MLs2Nvtmw3eiS12Ns6yrAaVELAlIPufAy0+Xyg4UCJB0M
 L3Q6be+Y7lvR/FP4PgxPItv9kdXQ/Hsq4ccCmlCP+eB9E4XtB8bXN62yg5ltpscHSQbnLYc4ulp
 jsMaLbOafpy4zq6io/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8841-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51F16F8DC8

On Wed, Jul 01, 2026 at 06:15:53PM +0200, Loic Poulain wrote:
> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

