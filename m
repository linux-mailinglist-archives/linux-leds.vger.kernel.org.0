Return-Path: <linux-leds+bounces-8101-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FmSlLm6rBWrHZgIAu9opvQ
	(envelope-from <linux-leds+bounces-8101-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 13:01:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED960540B83
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 13:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B591A3082A12
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 10:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46683B19DB;
	Thu, 14 May 2026 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPXgBkWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNoI7gRE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43E37FF46
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756320; cv=none; b=COI3JeCBhpvOm4qMoPN7QSWzAjJlm8B6+3iY1Trswhd/huTUb2MozjBeNL5IO7ZXiedqTjYrEHarsHTfnUVSc2fmqMaN6jCqezS+110OSamJKLTdgHSMKbZR9ONgrfXgoeZat4gjghfpYFRdT1B46wWtc2u0e79kpHfqOp9msbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756320; c=relaxed/simple;
	bh=6XTTjsFjyY6iJQHy7meB11Yd/k2CmMWBewbbry9SfHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLOgpU7Oboqwg7iJ0zOdXvUwF6PdAE1xjDqNqcjfLVeN2BsScA5ARCufOLkOhaeZ4WgcXmIok4jIacgxa1YofXrhn3vc/QJCPNC5WbDt1QKta1lX58lL7wuTRLP8Zpqv7IL6k7j9ttwmstMDD3DPIctRuEPBBnuK0a8EzIFsrXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPXgBkWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNoI7gRE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kFDG1989674
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 10:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=; b=WPXgBkWKfSDYOons
	V8Zyw6lnEntoyM8wItKqcCFNOVKn5LY4QFrIYhl0ZZjFBpthZxifv3XziZDSR6dJ
	nKP/sTwxc8+RSp8oXz759YxnXKiAua0IWlZG/Epxvl1UzHyFG+wz/EC0Osg7VQMN
	fHV14RMDE7KvkjvZlyqC3dnjaB6IrOv62jHUz/SaIFuur/SXwatPODS9RHK5l15z
	PPMFyr6BpmzP1U6ICljUF0JUIU4L2irkLVtN6NY+N8lhSZfwShSgGe2AaZVzbAST
	Ypf7sRnSfAh4KjcwBBVzM7sEx0/Un2brxq81bZwZypCkVG78RBedibz9vbj2x5aZ
	a5Giig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhfjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 10:58:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90d102884f5so72582685a.3
        for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756318; x=1779361118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=WNoI7gRERsQK8PIUTWWLFb+66Vt8sgQDgM9DCfQNw3AUU8w/uJBSuu2SQ/3UUVluNN
         msGBVceaVyizNXF3fvWUEOCrfZxWxfWlV3qJ45KFmhPF0IneUzofH0Ezq8tKgTgn6mII
         NFihB7A4or4U5vfeGbBMYazOjpQPK/syZO41x9t96ytxGV0R40Cn0hZDp8xIJ58wVaYC
         359qebJZU/W/6/ZFB6elBSIrgvzo5M/kue+3MoSeCj/syKpxR5CV3L6rYV4oFJApVfKG
         1sXFc7iHKULBKysQX7PR3T39HM/c6MPKB1gEkGbecZ4J5gq8/mSz4QUOzACzsxBHtyfE
         PHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756318; x=1779361118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=BWFYBvlSJtiZIL48TtDtZ5rNaeyriE51kSlEC26cRVvluT+5AxXv+P2Wo8k+h7Pq4p
         dFL60zGKG7UZOwLolezrMe0OjcrYmuWk1M1p/1dSXs7cI1bZV9Zh2kj+ZKFdFUdJcYQk
         gXwV1I0B8gumkSWhBCUE8YIAklj2H4IthhSjNQ7lIkP//BQYbDURE42R/2GYyeGbdTB5
         Mo1RWJfUZzthxQr0W/Ega4+exa7Grg6M8RYrGaQSpv3jrTOIZDmKXx7y2sfmcesIDKwC
         Axlb5s4sGhD198ZPVKuqhsbNP+i22PCo2VijaJ25yYunzoWeC5fuiXelYN0vpAq9sgEa
         gBAA==
X-Forwarded-Encrypted: i=1; AFNElJ/9TJvMkLJ8nkMkYw74uEpd0ogKiTSyLFDenxGc2WfqbQ/Q7gtSGv0VPHpr1HdIsy6Wghi2SQoknEdm@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuDSIosL1/qzacCMfnKVxL2hJ8SPqDn6oAZraDLG6yWXwxiHQ
	VuTp48kDhM8IxBJth19ul6MzIla46Jc5HVkmY+2Fkwq3KmR5hW3HY5mfoMhMMSj02mOnbAEDQD4
	zHPyLtSj8cn0+A0q7CCg6OBXZWiYlCZsJZsi98LPstW6XY/mbCngF/fRVT9NRmv3g
X-Gm-Gg: Acq92OHYfXgYhIvtBGr41GY/z0+PqhUjOEDZ4camxt71Lw/DJcwubC3tVb+mLSTR0Zh
	NrtQU+if3S6eym7nPW14kQAfBBgn4aep3sj0yZPdV/YQcAmVTJrCBl9P92QEl+R4XFas1a0BxcE
	MKFvq7dUlbrBdY4BpCo6+sEbouoq/GKupKpIMtMn4DXD6dSWoC+x9evYvYLzM1d4vWZvbTqu7nG
	SmlwMZduKkTc+so8A6Ix9WkeU/YlV5uFnWs2yzvekogb5yqCA7WAwNDSAkvSNLq2G4Qs+2h2wQS
	uC6Do8aunWEpz/oYJvOaePjyiqERauj71IRHdv+Gkwx/xzHVvfU1TtNTbqMDmqZDoVKUxsOhy3I
	rMha9lGTSJAR9aba6DmZifr16tW1gA4GfieIRcDkNjNo59cvkdXn3aokkD+X5QxzGFVu3GmAy+p
	qqpGSP+BnGcixcrA==
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383601cf.8.1778756312882;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383351cf.8.1778756312468;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:30 -0700 (PDT)
Message-ID: <f0738454-abd9-4a58-ab2a-df3479b78e95@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>,
        Wei Xu <xuwei5@hisilicon.com>, Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Enric Balletbo i Serra <eballetbo@gmail.com>,
        Romain Perier <romain.perier@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ecjzvG35iO3O6vfYZIk60ehD_I1K9kQK
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05aade cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfX6JkcRoQeyTeM
 InDTXpD4ramVXkd1mt5ZTInSOgk18ncnXKgoyVCNBIelmVgdPnRjKl5sP8jRbDpSxgka5k3QN1y
 7Izrjfav6mtxuS/Ptot1dPWxagqUNcaDJTsFlbHvE/tliQbhOy/aTiFElpyVUYPgiB90p9Ct2o0
 K0AZlLHKH833UKvt9aFDcg+FAZabuIxz60I8vYAritHMXeBkCTxZf35rC1z7BX1WTgO/wgowxDv
 sA+jDEqUiadTgTcPUOWUxy6UX0NJThshZs+Q18Pinb5SyBBtnkW+9fKHlikQBn1MVSiOghIz3W2
 GTy2S89fe9FgOx1suX8TKnSdDGy8cqDT7zkCtx3Mm3qT53FaqcG4zzhrmELYZgWF9Hv/kKiLiXa
 LUqCr0eyA1/BsuVYeGkRtoytOw54FS6uUsV4sPt+9oj8J77YuFVXhc3tRckjuZP/VreyYtAAViF
 LS5K27JSJ7iDieIcVrA==
X-Proofpoint-GUID: ecjzvG35iO3O6vfYZIk60ehD_I1K9kQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109
X-Rspamd-Queue-Id: ED960540B83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8101-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lunn.ch,bootlin.com,mailoo.org,163.com,arm.com,sntech.de,amd.com,hisilicon.com,sartura.hr];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ucw.cz,kernel.org,st.com,gmail.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,lumissil.com:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
> 
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

