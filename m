Return-Path: <linux-leds+bounces-8749-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/9HHYjxPGoVuwgAu9opvQ
	(envelope-from <linux-leds+bounces-8749-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 11:14:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4656C4209
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 11:14:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l4QIDGce;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ihDKYSWR;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8749-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8749-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30F743037D46
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 09:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1214037B014;
	Thu, 25 Jun 2026 09:10:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4712F8EAF
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 09:10:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378621; cv=none; b=LOyzm7eSwSypw9vVJXSByOYmqupYmM3v3dOFoOJ6CqotqVJLrFYDUUIWLJY3ilfK3EXqb3RUy60z3xyu05cRXcsVG1ROXgug1oNYa6s8FophbvPK4+u7ymkuk9ACrJB6itULWWwZpA8a3wwaUFGF8sXpdJXsfi9lIioMUL4dM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378621; c=relaxed/simple;
	bh=BwTZm0QTrFC8551Lx3tFYnLALArcN7EF2f8UQs0fqks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDGgXjaE5T7pTtyMOg9uR31h9sCeXjXujDl/HJp+Yiq3OOC97nVUXzhR7mnI7ai1UVsfxGwV1hYnRsRJa8YDtQEkWe9FAOb8R3EVY36Mc0xIllppbkPsA+/xE0LdHRWkjfmIVU3aNu1Vm1N9pGZNAHwej+3/DdZgYUTyt/bnZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4QIDGce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihDKYSWR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pHlv1629593
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 09:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Dp/rVPOEK3+fKbuVp8/HILtja3W7TceSg9QMydZFB0=; b=l4QIDGcezJlgl/lg
	l2ynRcvRsd8aXNMj2LkeJNBAhtdebvAZpUfSKtb4tr1babFtLX4DJ73IDidRWUI0
	NYImW1XboVsVRzv6cWJfgcRU72kiZKQsG3nxySKxQjkG7jN6WwgYDUrdhGeACgb3
	qlThCA3rAIh8XMyMAgKKCkNTu2pT8D+Gt00xofOHnQT6dHFBuU73dw0WrszsDvoy
	jTRPk9Qsl11kHkm4NGUBWZY2lnjGeEYoJK2NeK54lC/lSqbVWHgdqb/hVPhUIWBX
	A6ZirjRimNfABItgBl6JS4MzU2z8Sepk72vhEHy+1MK+hQGaCChu8lLoMAN7GOY3
	W5fMWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q11yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 09:10:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b9d0162aso38523985a.2
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378617; x=1782983417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Dp/rVPOEK3+fKbuVp8/HILtja3W7TceSg9QMydZFB0=;
        b=ihDKYSWRezxYosZXyJP5qsfT/KcMpe6cNDptvjNPS/xpXkw42CjzR+mo4TOixyArVb
         Kmq/bpv9MRinrnxmblqwwIKTeuO+UtlIRp2Xoo+QTbxp393KnQoC7ilBNnv4aLGiob4X
         m/rPZhqXmT8MX0s5gbfU8gx7xLZ13/mt2ISqhb8OiwjXbHDyRrEMXDr/ipu6Dwd8Qe6n
         20gbJGUH7jqUzJamy/y9MiuxzhFPNPURqYAEnc6FbIwRUIaJP+8cJSWXThjcToh/f/uU
         0V21jg+nQ7laFmkdHY5z6uy8rS5vFwDZSFRfG8vMOGBv3SQMrmpwDxYcbQb0JZjhCuB7
         C22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378617; x=1782983417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Dp/rVPOEK3+fKbuVp8/HILtja3W7TceSg9QMydZFB0=;
        b=pLkHP7GXvh2c+zPUOOOroeUrRuZZ5SAOJAzR6PpEUWm+YFR+eIfDw69q85E9nZYUXv
         4ZEaaeLlseEWmaRnL3T2zyF3MqygIGIbtEeYPbIkfKfyjt58zW4WfoFooF006q6FKbEN
         pJP6fkmYo41Vi5CmOLxHmQDZVwL38+54cFcrbchS1Jh2a9I9nU3TCEJh6WtH/vQ4uCCk
         s4wbKPqtTHnjS9PifU+MBvLhdX4hFHnXMuv7K4+U3Bn3DtqqV32iklcL22rUo4E26Y20
         b+bhrU1RABtc66xwOEqpcbD79zv2CiXKOR7UWHHLjNu/u2rgJhZExU0AbxGc4OF5Cc2X
         cQ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zeNAj9vm5kMhO1t99EGGCNW9ZSzjKkb4UMMUOtpBoFdQZ37AFY5f26bkjh662IFOXOhwwgaBSZrxO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KlpVXWKJGNNbMLVP/pHbN59yygZqFGPhwjEeUPCdnmPxmGkw
	9yaAVxwjOaTue+dS9eq0kRatU0XsCuYybf4wlsH77ZL83qNzAjtCMWnzXrCZJYQFkL3Y5JDPGV+
	ySRPHE/Ep41WnYgccTUvmKz9nGx5nCUZ7nMKDiB1ESeUyVCL1hZQdZLRogNPvdUto
X-Gm-Gg: AfdE7ckyPxD4eH6dRiKOCRmZ+CYiDKWr3ypuL7B+W0YmbKrHHQEz0UlIA06z6Dy1RqI
	vGe99kTJn9USs64TYLY6fdVuXeKNLhPtJgD3iSZ7tiElFJisiXijU8wuynTWcD+vpZHXYQKh02K
	cBJ9cPBM5AYLMx1GytTdLyKCRdCDRtVzjHW4SWOmEopL8h/QxbS2rRLnMpxEKUoPB6XJdrc2hXY
	tFKffqOjBoMML0xAz39mPPTELypLarLBcbYjD4YhloBK6w3H769tKCneZeGDuNb/U5wXedE8kwH
	hwJC02nAAweI6xVuQTmrZl1UzGPTHoi9T8kbYqm7er5K5Au7+gyiJBHX2TCHohf2La69NoWCwUE
	d6DbBUZ0++ASVmXBPGV9ylljUo0QENp6T0m0=
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12656471cf.4.1782378616905;
        Thu, 25 Jun 2026 02:10:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1451:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51a7279ef50mr12656121cf.4.1782378616454;
        Thu, 25 Jun 2026 02:10:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba862asm139923166b.9.2026.06.25.02.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:10:15 -0700 (PDT)
Message-ID: <a83b2bc4-6f70-401a-bb83-7b9668b5b87a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3X7Bz3EKFpaedDI0-qkVF3v9DSWZwk_k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OCBTYWx0ZWRfX5CV3nPnlwc+Y
 Izvo7Z7uCX2cF1MDwj/RA2LUQtstgaoqge/UvgbIexoFusUaU/88VDpcrSoKEE2WHLBhdAOm1ko
 RmHBi/pkl2zYlRgv05VyFnGYUg85umY=
X-Proofpoint-GUID: 3X7Bz3EKFpaedDI0-qkVF3v9DSWZwk_k
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3cf079 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9BMPqzrIbjXEeBTFrkoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OCBTYWx0ZWRfX6JZ1/nUMfuFW
 9wG2BtQy1mx3LT9t3GsJ3EEYH6lQPbVL+IcPNpTat04QTIppXSmKrpy4HZl5qmfY4UUHEk8fks3
 o+DTFeNz+G7sRnjfnEIjNvVttmfdghiykPNZSs7tybFZOGLbM1Bbwxw/Kjx+lcTtilKKPlZzi34
 JS4Yl3yqfom0ktcWvJV0Pn0KQfXyqYO+Q+VGYbYLNbHdCQ19G5M2Xvkcv7mESKv7E9zPofjle8G
 9fqZ6Tivesk0kryOpvSMG+MGe6610zjSq8qcJhz+zeJXG8ZeHzMHG8Y+hqUShuLNsmEEvbjIA2J
 w3Lv7/MSqVOQ+KHSdNtdWIOCkzqGObkOKs0IOIEI61d5lU9vFbfdZn+0DHQplcDW0OW4mqQM76Q
 ka3+nCfvYS5N8hODNgRKpPOu0m/LRPPNvJKm+SF0fbrkMmRM+Zu1Naf11+Ni3NxRs+/+8LqOytR
 35sSQwUIKOy3c5QhuWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8749-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA4656C4209

On 6/24/26 9:37 AM, Fenglin Wu wrote:
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

> +out_free:
> +	kfree(pattern);

We can use __free() from cleanup.h to get rid of the gotos

[...]

>  out_unlock:
>  	mutex_unlock(&lpg->lock);
> -out_free_pattern:
> -	kfree(pattern);
> +	kfree(pattern.data);

likewise here, also with guard(mutex)(foo)

and same below

Konrad

