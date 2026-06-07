Return-Path: <linux-leds+bounces-8535-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DfxcE3/TJWqkMQIAu9opvQ
	(envelope-from <linux-leds+bounces-8535-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 22:24:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD56517C6
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 22:24:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aMikmOvN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="W4+DTs7/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8535-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8535-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47393300955D
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 20:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969CA32D0CC;
	Sun,  7 Jun 2026 20:24:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3AE2E2F1F
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 20:24:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863863; cv=none; b=g+cTIYgF2l2jMOBtEY80OZO0YYCykxx1Jj3vOLqklhnA3SHOluf/crXCIBh2oXE6rFR4+d2v0Q8Y/fXAOGPSjmPnxhqJ8qZhVdXwyyiwSK9iOKiB8kevg0X8AYDmp8myfEsA3AzAHSwXPBA2QF+Z5/LyicfZLhZIbRH4rhV4PLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863863; c=relaxed/simple;
	bh=k15IyViioH3QB3wZb52xqHZ5IxctPdPprDkOecNrQWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQvL/wEFOcamPtAKpkQrtXxp+muyBCaj9VZxkzwrZN+LsUEkd2gbaNVCsPVV400x8La1RPdjML7ldYG6gL45DApyzbPcelPu+d98ev6oSQUAh3xoiyZ87PtduHrWqScTby5YFirIc8T1gEZvh0pDmRcmuJKnG+532Wzq1nQg5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMikmOvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4+DTs7/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JBqJR866661
	for <linux-leds@vger.kernel.org>; Sun, 7 Jun 2026 20:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OVAaAzQaWD4IAXLEaWPxT2zg
	M46jAQrvtC4X4hMGQz8=; b=aMikmOvNnfYcwjfWNW/YFDmHBIGNcly2DO6UEUFP
	svOwiDbPudAmi38KZn2mMv2m3yZmznfWLBGH5Tf25KWBr1Dh5CI3ZSlmoTsxbC65
	IIxZzbJ1now6n6fqs7JRtrKefOq95GMMHJylK7HYuCSWnv28berKRVRsD+OS5gG/
	Q2GcF00Fx1zObBsgPBtDFqwshkWtvX+evPNjNGMTwI8WKnnMl6PGUigpxSzY/oDd
	560oZhBuYA3VWANNAD3AQ8q2fMLoywUO+b5+FVuP4YkGDlnsC/1gQEZb3vhZMB3H
	+ORZfRQ1YrSY08I7xAKj2EPIX3sEQbP18uCNnZpx6MuOdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvdda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 20:24:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517ac42d958so18836501cf.0
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863860; x=1781468660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OVAaAzQaWD4IAXLEaWPxT2zgM46jAQrvtC4X4hMGQz8=;
        b=W4+DTs7/fe/IxzimA2q/829D5bvCvGcfpaH85CX1AghB1Fvkq8v6kxXCkpWWt89i35
         t0v7HnigOwbDJ+/yHuIkXZAQaqze/9IVR/f4y5DkYwJCFopMenVvnCoYe2f8xfb6zTCm
         PVinY1Ia41w3DNeEA2CGVpMdV6JX8/znl6Kjd1wWdwcdH6c+wCtc/KbXdAK8Y7/JNIhe
         97zVhO4ijCvIjp1H0SKg3DrzMk5UV5ntyTVIimW0Np4nSapvMbKxqmG3or7e28FfxTxg
         pFwZ0ZOYGdDcEJVDT2lRBgBkqrbuKTSxRSxIFoUYjC5CyroXK1/1dKLTgmpiyTQ51Y+x
         dEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863860; x=1781468660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVAaAzQaWD4IAXLEaWPxT2zgM46jAQrvtC4X4hMGQz8=;
        b=ZhjxLVS4gEDAu1civ6MS6vCoHn1y7JqhO5CX44thV9UnA1l1YvKBtLXKEjXhsjekNw
         iCNAyjnNs8mzul3WWITfWAKk5+xOb5AgL05fZZWaa1L9f/JFAi1wuYxBYrt/o+TsaZQG
         H81nU3BE5LCibvaPCwnZ7roeh5IlB8OcCwSspkrteijtecECKElyZjK5qhOR97LPu29j
         V91jwd7XB/m2C0R41XZvl65nB91+PYy+7pecnZTuLjYg8Dbbx3SU0PBq0ongVqfBxEU5
         asKa/1cdnkMAmmbw8SPrfoQ1cugsS00bn6/QB/sUx+PAsXV2TVn4XuQt63iJ8//3Va77
         WAjg==
X-Forwarded-Encrypted: i=1; AFNElJ9RCt8BpO9gMEe75UmVfA6J1vbHXxCD0qGSwfEHUMRwLbduB+ShtWjOduIgf2TA1+B7Ofe8dMLmYmun@vger.kernel.org
X-Gm-Message-State: AOJu0YwLMhlADiJ+b9NWk2bKotZ04aihbN8ZMKkrqPEWshnCL+RMzX6s
	GFawdDPiq3uCYh+fTR47uP44uL37u5cRcYknsTp9QPFa9SBHG3jqO4HZ0qrvPAY1o3DyNH3rwid
	plQaALjxxqpgddA+opIYyWVC3SUYyCIfJoeBXyiDnbTdKRnWNhoqFgaZLING5jod+
X-Gm-Gg: Acq92OG1zaiF703CDoMyM6OVt0lzxMOG2Ve2Hz172LwA7SMdTO4H/fIdcUQ4ut/7M6t
	BB7iZYAkHGlwxdICVmtwD1qsh6jFPtDCy3b8veHLeRY3oJUGYNS0W650jLxVWSqIgXaHyVO/zAU
	SpVT1KqPyglB68/PAN7R0LguDYtjIzaPPvybctvFfKtZnF7s9VwQ1ZS0ud1Vu937VRfMw8v08Kk
	+YIvVxZLtW09md+AMyy03xzwQJybgrO6onsYRjlgTbfhs97f0bIA8sEV5IbNMdYCqTRnbuyB0xs
	lV7h3qLhfclnVpsk9Jq2OVbwjkLMAP9XeI8jx1f2EsVxpvq5JFE3mSnLrk0EsNBy2BAQpkLrEhl
	OF4D2oxNhmfLjZsw+mJxcFxqjedQJsaKfm+j9/UZ49cbu9DmFtvbHj2f1sctWEcCDkP2G4q0/1t
	Uzkq7lHhC8vuItjKhcmJZojE8eBibj8tkcMi13WLi8EixMVg==
X-Received: by 2002:a05:622a:1896:b0:517:203b:e636 with SMTP id d75a77b69052e-51795a08ad9mr186591161cf.6.1780863859782;
        Sun, 07 Jun 2026 13:24:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1896:b0:517:203b:e636 with SMTP id d75a77b69052e-51795a08ad9mr186590611cf.6.1780863859129;
        Sun, 07 Jun 2026 13:24:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm41683801fa.18.2026.06.07.13.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:24:17 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:24:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Message-ID: <uh5yq4bislnr6ftoscklyvfyjps4topqrq2wb3oointellre4y@qeau2jz6ihu6>
References: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25d374 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lMQ6dCxS1d9JuM4dYfAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: H3EUNdQEaeC-sdO3qAZSOLeKoOOYdD04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMyBTYWx0ZWRfX9qV4XU0O/P09
 vYwa88L+/xdl0MHBfd6navz7UQKZanup5fPKQjjZY0hqZdXL+U4s/Pcc6dncCOda417lbApHtq1
 k5gM2Yh3kqa3WoEjbdpU9Q7aRST0MKrKOFxzUgoiNcaTjz6Bi4JMllnmHv4DfBBBWwDnLLYYHGK
 yijIpykLk8pl/VUNOj83B9dUeKXdzJPB37MH/pxQVQ6KwvyPlkDRNGlH/D9AV9J2QyiPR4chJDS
 +KN4QgDL4tjhDefdECIK4SB42op6tkh51q79TpEiU5MgdqtHoi+hsUQZynPP6+cySfiaAyMwRLv
 Vd+luAEgXect5OvIsK5NllZxqfGiXn96zN7325ulsbnnL+kTYdTFkaaOHUpnUXy+oRa0yYGQm4j
 sZMC63BJiFLsVEB5AQI13VG2ou3LjbM/vEnMoeh8t+DYISmjVXcqm6goWZ17I7srW79vdzOB2d+
 wb2LNdRwZg9bfTqCnsg==
X-Proofpoint-ORIG-GUID: H3EUNdQEaeC-sdO3qAZSOLeKoOOYdD04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8535-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qeau2jz6ihu6:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7CD56517C6

On Fri, Jun 05, 2026 at 01:18:24AM -0700, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
> 
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 174 +++++++++++++++++++++++++++++++--------
>  1 file changed, 141 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index d7d6518de30f..ca84da563e09 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -148,6 +148,24 @@ struct lpg_channel {
>  	unsigned int pattern_hi_idx;
>  };
>  
> +/**
> + * struct lpg_pattern - The LPG pattern normalized from the LED pattern
> + * @data:       The pattern data array (caller must kfree)
> + * @len:	number of entries to write to the LUT
> + * @delta_t:    common step duration in ms
> + * @lo_pause:   low-pause duration in ms
> + * @hi_pause:   high-pause duration in ms
> + * @ping_pong:  true if the pattern support reverse
> + */
> +struct lpg_pattern {
> +	struct led_pattern *data;

This looks like an overkill. Can you embed the struct here instead of
embedding a pointer?

> +	unsigned int len;
> +	unsigned int delta_t;
> +	unsigned int lo_pause;
> +	unsigned int hi_pause;
> +	bool ping_pong;
> +};
> +
>  /**
>   * struct lpg_led - logical LED object
>   * @lpg:		lpg context reference

-- 
With best wishes
Dmitry

