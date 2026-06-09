Return-Path: <linux-leds+bounces-8538-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +kUCNalyJ2p5xAIAu9opvQ
	(envelope-from <linux-leds+bounces-8538-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 03:55:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A165BC4F
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 03:55:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LrC7R1kX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="aOz/6edy";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8538-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8538-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 081D63019931
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 01:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6434335F16B;
	Tue,  9 Jun 2026 01:55:51 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D55345CCD
	for <linux-leds@vger.kernel.org>; Tue,  9 Jun 2026 01:55:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970151; cv=none; b=f1umZ6Xp/hfODjrbrWTMssbaq9RnCBfb13dM7nN4vg54NG0gJ6x5/jEFz+RrmfCkzy9jBrfC7RYwVGFiAnMm90NZoxXNW35Y2AB5TkMh7kEGJMLEaIP1+rTx91s89kVYj7TTiLtTKaaGfxjDIcmLLGJtLQm/2nB11eI7N0/ga/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970151; c=relaxed/simple;
	bh=m3IVM25TU4m6Ip/Oky5/marrcRkY5RvoQ45IdErZMGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uod/6s5FleQguN4J3jtC7AO+5larkgdw5NOMcmuFDCubAmro401S3PM0sJ/VlglY9R1x62ZMzb1e41/EmuE0ZjWwjbYDRhuHAT2MD0W20yuwi5ZUoVITUtyGl+LMDpjDydnpHaLx6Qn9cyX8F0ZHvgfAyT+UU7Q9QM2e61G+YGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrC7R1kX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOz/6edy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s1gL620831
	for <linux-leds@vger.kernel.org>; Tue, 9 Jun 2026 01:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1E1VdvhHSaZdxpy5zAZygV8cj8wYGawuEdkXG1KsTL0=; b=LrC7R1kX2GVaBmR3
	4TxD64qa9c1PpuE8Pql3rDtqbus+uvbuQiUPy1HPz1LU1EX1ra8XJET/gNdsH6D3
	MCGJbtXmaIhOIAkHCx8sk7sRmFeM/pyCrV2reNOuVrm4ibubbKcb+Sa0J8xkI5Kh
	V1ks8soOhTAcUuJMZRQRj+ty2m0WmldFq8KVs+vqQi+6y39NzckLQwgnlG/ZCrJf
	wrB5pTAm8gDFN8G6h2Aw++RJWIufaCHj613c6IxeSV79yDbZfQm/Da4hricqqZt0
	heOfXQfuATmI6u7oyw2UOpTiZgYgH/Ajv1oE50nOCsHMO2eUzXIdX4u8X2qDcN52
	pfo+YQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunabubg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 09 Jun 2026 01:55:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842692bf60aso7326680b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 08 Jun 2026 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780970149; x=1781574949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1E1VdvhHSaZdxpy5zAZygV8cj8wYGawuEdkXG1KsTL0=;
        b=aOz/6edyFEVD1cyQ2agKv0YHuPZb704QlSQ2DvyilbIngza0thYdoLwiKlkFRN7k6x
         ScwVVeQRx33AV2qY0zkgFBQbe6CsUW3s3/wtfydTRseslHiI2XZRaNUV2oj8gs9fXAex
         t0kCB2F9RYruiPAW/46V3oqoGezWC76rXcxo/qpq/KgRdIMQkuvhDjDDaxCIGZF67CU0
         qXVt8xK2J0ZOe1NuSd9bE3GQYwnGVRIg5ErdRk3pLV7ZJOKHW2Z+jIgTIdAcn+6jshgH
         7tNLNx5IcMFJTOaP1wnK3z8ai7JpT+aKDIRGt//BOsBUD/LQ/lo+xoCelw6VGWHJlaQ1
         6F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780970149; x=1781574949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E1VdvhHSaZdxpy5zAZygV8cj8wYGawuEdkXG1KsTL0=;
        b=g4tKeg//dR/28VR+KKGwYUKjW7M7VZ5ZaDBiPR+dGvACOyhnUPGhs05Clu+TxoCcUp
         CZd9Gy/ZQtaLTkeFgtYqcyKaApxk6lAL+lveppCZEfkWkBc4McKiff4H7ZLkBniQT4Zv
         D4xEctDOEaBnPRi0OUvz8of7u6rlxb+KFlefsIoQZg2V5tWflxiYrF6z4Sk0DWWv7VfP
         XqaBLwBH4WeFAnJ1P7kkYQ/jwXW+PN0/9X8cA0HZMXbgSEWBF2KwTSq4rlQvaaYHM5fI
         RpWO/57H+35pYXQV9dqVlthnS687RB7NkBEsseaGTIcoF3C2jzn/Za3D/ZloXqVfDIF0
         grjg==
X-Forwarded-Encrypted: i=1; AFNElJ/KHlZyrzGy24j6ES3qIIavYAhbFIcvFYMr0pxOTqfuBvW+2eWeni4zXMWigBdDxs6b0O0mxAdECNNj@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMyQWzew72HfoZsgLw5h6NJOYDTtz+okNWX2kkpGsqbSFgkFA
	hlLPEIO83+tKJoLRpg/aZ+lRSixAQIeTdurrGc+8xlkxhzlRBtLBbRJvBc1qrtpUDoVGgXEY/Wn
	ybhk5WF77tKTtWUg6JXLgpjmF5ulOE+peA4m3jWLVGuSNT/Ddm+BbMKvyBz2N4ZOI
X-Gm-Gg: Acq92OH1pXb4BvHFwlb2OMRYFwwKb4GCMmbtXxSzUhfaA6PqZptwXbEsIBid92ni8Qw
	QlFqBPiG2fGjo3FRmDNT+ukOf55z2qjj/vZG62flz+nLk69Xat81lOY+UrfHWrfiXe/WdNBuF3S
	dAROd7lm+InYDPycaz2kFepky8f6hzFfHt6UWw4C6wG3sf/lT+TKYME48Q1TdqbVDJhSpPgksSJ
	omkFafNI23w/qwup4Zwl/QbFelEdo6bNcubrDxfKG76iHWLvOB8oDMdSsGPouh9RJGOO4Xc87GT
	NByrrp5CSGDhv9TDmYvkJ8yju0/Z8QcPEWnothFi1M7rNIPx67m/NzikqhhOQjMfAj5bUn+gnZz
	x1rx82jaU24hWeE1Ag81rwQasNFcF0QsIMTua28ADmXEZUU4aXaY3BVTvjlvcKe1ZUe3f1LJYti
	oxP5B9ej+LamoVDXLeWR34lOAJ3w==
X-Received: by 2002:a05:6a00:4304:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-842b0fef2a8mr17578439b3a.45.1780970148612;
        Mon, 08 Jun 2026 18:55:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:4304:b0:842:2bcf:1d76 with SMTP id d2e1a72fcca58-842b0fef2a8mr17578401b3a.45.1780970148124;
        Mon, 08 Jun 2026 18:55:48 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282883647sm22377974b3a.36.2026.06.08.18.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 18:55:47 -0700 (PDT)
Message-ID: <158c6055-b0e3-47d9-b695-929b59283ce4@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:55:43 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com>
 <uh5yq4bislnr6ftoscklyvfyjps4topqrq2wb3oointellre4y@qeau2jz6ihu6>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <uh5yq4bislnr6ftoscklyvfyjps4topqrq2wb3oointellre4y@qeau2jz6ihu6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAxNSBTYWx0ZWRfXzAtgXtlnXK9w
 8eMpUFPpqrMWrLggt5/U2+a3aicVA8rwtfzJc0OT5RCmEx5Krzrf5pa04uSSm1SGngIIapIzJwV
 Tlt6Wbbn5hrn3fh8t3RApoMM3MqvI9Cwtu6SaYKYZktrjQNn0cR4H2V6QSEQpHQGWOvImBRLooP
 /oJSInKCYnk5MESE8PGf342CqmUG6dj+NILBdoTS7JR7gP39zxndP6MBBxQjpNBhzZY8XMVzr+b
 d7/WyY2eVaGA4mFPhhcDUjW2KIv7PF2LUEskfU646yYbzI+i0Tv58knUKAbs3vZymrzpKAbQRht
 6ukXyr5xeePaMM+nSqmMq8v7nym5mrBY1w+AqPy8L8qbT3bhkEcq+Iwd/663av/9lsq6QEhmxJC
 +qWrENHYZ358IR5W6b+i3SqYmptfFdYGuHxEdm0LBuCBmmm88kMQiqIbfNdYsBREZXcAG51Jx3/
 9fps8+Qh/CKOp+S9d9g==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a2772a5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=adD8Q7AqBrQjPfmcjFYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: gQbDqNGvwZwm539P4mPZIUT7gP2qkVKp
X-Proofpoint-GUID: gQbDqNGvwZwm539P4mPZIUT7gP2qkVKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8538-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:andersson@kernel.org,m:marijn.suijten@somainline.org,m:quic_amelende@quicinc.com,m:linux@gurudas.dev,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 364A165BC4F


On 6/8/2026 4:24 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 01:18:24AM -0700, Fenglin Wu wrote:
>> Currently, when the LED is configured as a RGB LED or a multi-color
>> LED device, the same pattern is programmed for all LED channels
>> regardless of the sub-led intensities when triggered by HW pattern.
>> It results that the LED device is always working in a white-balanced
>> mode regardless of the intensity settings.
>>
>> To fix this, scale the pattern data according to the sub-led intensity
>> and program the HW pattern separately for each LPG channel.
>>
>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
>> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/leds/rgb/leds-qcom-lpg.c | 174 +++++++++++++++++++++++++++++++--------
>>   1 file changed, 141 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index d7d6518de30f..ca84da563e09 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -148,6 +148,24 @@ struct lpg_channel {
>>   	unsigned int pattern_hi_idx;
>>   };
>>   
>> +/**
>> + * struct lpg_pattern - The LPG pattern normalized from the LED pattern
>> + * @data:       The pattern data array (caller must kfree)
>> + * @len:	number of entries to write to the LUT
>> + * @delta_t:    common step duration in ms
>> + * @lo_pause:   low-pause duration in ms
>> + * @hi_pause:   high-pause duration in ms
>> + * @ping_pong:  true if the pattern support reverse
>> + */
>> +struct lpg_pattern {
>> +	struct led_pattern *data;
> This looks like an overkill. Can you embed the struct here instead of
> embedding a pointer?

Are you suggesting only embedding an array of "struct led_pattern" here?

The patter data array consists of a variable number of "led_pattern" 
tuples that set by the HW pattern trigger, and a "led_pattern" tuple 
consists a "brightness" and "delta_t" pair that represents a single data 
point. A pointer is needed here as the memory for the pattern needs to 
be allocated dynamically according to the pattern length, hence it needs 
to be freed after the pattern is used.

>
>> +	unsigned int len;
>> +	unsigned int delta_t;
>> +	unsigned int lo_pause;
>> +	unsigned int hi_pause;
>> +	bool ping_pong;
>> +};
>> +
>>   /**
>>    * struct lpg_led - logical LED object
>>    * @lpg:		lpg context reference

