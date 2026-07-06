Return-Path: <linux-leds+bounces-8934-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tndSL6jES2raZwEAu9opvQ
	(envelope-from <linux-leds+bounces-8934-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 17:07:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D947125FA
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 17:07:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B1Zuk3yi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GhIm8Lz+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8934-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8934-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E7B23560D42
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 13:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F66A279DC3;
	Mon,  6 Jul 2026 13:47:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7E2777F3
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 13:47:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345624; cv=none; b=cC0jHXay3IIAgv4z0iUl+6FfGt6tYIvzmqUjqf4srfezXYj/uy7nMBMPTS6HC6Vs8A8etfGOnqBpdhkFARtcsj6Wvs9E317JAPOxk33NFCrut6wI2B9IiJ00i/notfO7Am3frH7pOZjbCQZ4irWUfTH5mbZnugjjLp+epxVS3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345624; c=relaxed/simple;
	bh=viziuRWu3cmIYW7KJ4As+2Yaz3LssnrQtJgI6ai/NA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKwCtJhbV3onSkGV6enMu5Ehl/YP8dm5lQXvJSxJ4iYV5Q+pAylDAHOENKEei74d4mQHiQVu2/HtED8fQbdzUPsZkCoLwM4Ovrz32xefyP2aovOuP9jcuaPCO8pYIjTNsokvVPmCn/wxBupgpQGgOo38+RwBNaPvPcNraaTjFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1Zuk3yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhIm8Lz+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax69M391044
	for <linux-leds@vger.kernel.org>; Mon, 6 Jul 2026 13:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=; b=B1Zuk3yigUJ+FfBQ
	IJL6kp42xLSI9m4C96UnNlFoDpC0Hv+keCZwarJTlvNZEC106BVlG+QpMHk/S29/
	Xwra5jhOjUPCHhNyBCZ17mM2AyJttWu82IomZikWK9iwTI2GRGPgTDSPxAGI4ByP
	IU3JsyLdkPUwfoL25FxlvkfjrkYM43t+X7MlJELYd6hIUu1yVpj6gf1xyv4u7B2N
	Q+cw7rSOfqNoSzA4e3GWFOCtt01xazyOPviJuy5Si+FJLiYcJmDiMz6dnB++Z4cr
	znBVQxM8hAlcxQ9DOygXt7iWgBRH6a7vYA47wY0KFcOxXxo+D7ena4m0s1YmZgJ6
	6hnQWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgs1a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 13:47:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso10050021cf.3
        for <linux-leds@vger.kernel.org>; Mon, 06 Jul 2026 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345621; x=1783950421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=;
        b=GhIm8Lz+8xavfPePTGk9fQbV8spsEi9jKKGG3w2RCGfdbt8XBWj0pX2YcnRxNuU4h9
         2yrGq8XJiJ3nmOUyndvZ8SzSLXOdjy6LBeGC0pdqtGezrivZ1mIRDlpCQ35loBHFsLtb
         5A5DwjHN8jLJKNc/dNMjJ0MItU/iQ81ZI4uQZkmkeHI2pjh+OJiHaViiQI5jJUr56+Ww
         6FEO/ZLd1JX8Mfdm9QNYmoarhY3HrfEsXIMIb16mCwJ5tB6ju/VVCNauDGnHGbE8khwH
         XZGiRy74CjkLVUbIjivBBuy5D+Z68dxqfYX5KrJVb7B/PeZPUBp81dDJGtAdLcltQtXh
         GZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345621; x=1783950421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=;
        b=rdPtgZwSD+Jz7l8bKUNCwaD0fyEkNVupwOJHMPekuvQgwWULDeUIiZCbOK8MeMSYZE
         lYoTIe8+EtCx8YYbEjDwSvXCYKx9Gw3Jj+5KULyvUP8g6RAF/mWBfVPYAILXmY08QEFg
         Hc2yApq1EiRW/ShPqYp1Yoqv7cWlAgu2U3dZbohCkj/rXpm+AJ5RqXoFM61YdiUvQD15
         yIu8mDhc7y6ctdCMB2R1KliuwPM2+cubAbckcEq++EpxaHg904lzchQBezEaRDuuyEwW
         T7ZeQDJdHO8rPk4XvxuPAwCWltvNJHKd2XvEvabzkhBq2LbvES2+lpvxXEq7rBdbfjGv
         edZw==
X-Forwarded-Encrypted: i=1; AHgh+RoRp8CWFmSgUiid6G6+1w4Z2M50plnKxhYnYFHcT6/YMUv/Hu+3TCF4lAKJ+A/TpVQzkqWXclR0vTTK@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdwsmDKwmny/72K6WEqFlmSyxbrEztbhOSWYqOJJh+Xp0WDI5
	qgU4z6LoqMz5Q/p1yssqy9Gn3wxnQaaZiDcLpAxFaoN0UgxD4J6pdY92dczUGMIbpG9yKBuoRmX
	DTFcxcpuHMi+RDtbEps4U7iuwLcqcWAilEts8TLSCu95PtFYSDpd36fXz5wmWQJja
X-Gm-Gg: AfdE7cl6WrA6ErHUmAOKc5aerpYYMZW4hRY4kqjEyrosQxrtwaK2r9XzqSk82gGu0VX
	xiqk9aWzDXmNwv5ha+SgDqDO/hDlL3g9RABVaYxclEBAFK8gRCzYytMSpHy6ZBvgidSHVWH8WDn
	ES0SCV6klKnZkQJ5nzbPCpE/18dhgqUstt6kNQ+joo5YeuP5f1DnZ49NQW3jNvO0IAwD/33rwWa
	hgEN5wtfUX83dsOWHxo4hqAEEpbdZse4np9rRTZvkmrtdEZd7kor5Rfvb2HINhbGF0R296csEQv
	qgOxLwI/wlLXoApBEwh9QEaOvBkM7JT/JQEQOE8ecMDnu8pHEhGILvzPnyXUqgkJ6wYBP3Do6Uu
	gchfxDsNc57B/TNBx6YIK9qQ2u0IfA3GedRQ=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr92401801cf.10.1783345621077;
        Mon, 06 Jul 2026 06:47:01 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr92401251cf.10.1783345620551;
        Mon, 06 Jul 2026 06:47:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628effcsm748307066b.34.2026.07.06.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:46:59 -0700 (PDT)
Message-ID: <180768d1-814f-440b-805b-61148720f81e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J0TDuibY_yQu1dUfKUa2qHev84mPjeql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfX7+1oB6rn4qra
 nbawAS5QgXLgPqvFK4hNOBQMi+S9JLHDGjjT6c3X9ptV3Ygl6BjfzT+IMntUy807dRt8wyhURH9
 usA+7ocUXc0cRZEwVYaPFdk0yOLUI0/IRtIr4bCSvP+osWJp7I+0LQTqO5cNnqp4+SaUFCPaZO8
 G8fuKAQnxrThQTifiSQ3WZvuHtI541YJA2+7yP4+MPXFn0FhJSrN7Jrz1TRa5GtDDE8+hft/65r
 zHZ1ollKnJ3OS1m4nRbpxRG4oihBkkbG5RSuKtUKXJRR6XXJybUxHZ56zwlw4HkvTXJi1U/+z88
 NuyA6G7L2h4xPHQYrskFtfmYDV+UpJu+IpUbyHixXXv3Vcg78HjOGtwzDC/htqlpCZOO3DlU0sj
 w+/qoWcyIwhcHsj7FqGWvAT+kXenHK2AQsjmal1d0vdKTKaCWARNvUUhBNggY80eJ3zNMtLy3F8
 7DFgZLy9A3u9IO7NEfA==
X-Proofpoint-ORIG-GUID: J0TDuibY_yQu1dUfKUa2qHev84mPjeql
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfXxJgTNLxMY3X/
 oK1H0oHcVDmoEB69DH9XQOs96Oi17UhnsMUlL/qH/mGzvkfDVRbjo+CaE03BFcwiODAtL285pt0
 Y+Snay4un/3aE4Hz/UCII996rtBQM+4=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bb1d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N0UkSJE8pd8tNmhoSi4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8934-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,somainline.org,quicinc.com,gurudas.dev,gmail.com,google.com];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22D947125FA

On 6/30/26 5:25 AM, Fenglin Wu wrote:
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

[...]

> +	prep->data = pattern;


the robot pointed out to me that this must be = no_free_ptr(pattern)
to prevent it being cleaned up

Konrad

> +	prep->len = actual_len;
> +	prep->delta_t = delta_t;
> +	prep->ping_pong = ping_pong;
>  
> -	mutex_lock(&lpg->lock);
> +	return 0;
> +}


