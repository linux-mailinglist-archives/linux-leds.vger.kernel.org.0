Return-Path: <linux-leds+bounces-7538-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOPbMNVJxmmgIAUAu9opvQ
	(envelope-from <linux-leds+bounces-7538-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 10:11:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D373418B7
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 10:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B340D3057906
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 09:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948F83DB644;
	Fri, 27 Mar 2026 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zu5LjdEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tvhpv9tn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291FD30EF63
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602687; cv=none; b=df9QRcaNIrGDj5Ny1oKZ3JgqxRxY+jX3JDBFlaWkZHr9tEDGNsVmndShNCKLc7PkSM21OAggDIqvePaXc7Jm3KZnRnEc/pm6kP0Ce+hQxKJUHisOMVMzDZlyaAZiUC228g8PYTgLGFcKH0iiz/bmRHUSxwXbsCC9wSD43KsovKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602687; c=relaxed/simple;
	bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=craYyCL4U+8VTSS8WkGBdEZnob9w1Q1CT8+elG1EyuOhxa7qtDQ7G2Maz998NNeoT817wdOKfXw7oF9sTJEyvARlR1iR+9kpmJx4+m7RxNCl/lvwbrhSfJe3e2CD5dr9UC6AexhdDsKe4S1WpHFHlB3zGKTruhpg9BJ8CQouh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zu5LjdEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tvhpv9tn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsec1226370
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 09:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=; b=Zu5LjdEvkNdaQE7m
	0avCjzdpdia1zX2iph2xFjSvIgvDwUNyQVXQjcQ3BeDcbFjpgAiPFcKcjJThvFuF
	Zc5UiJpVpHJdWdlVigz5i76brJwpa34NdjNPTBFRXreHW716GhZLkv9QPC50fG9O
	5aXkL8c//o3BbOOsFAlQuvHXO+aOdtK/9azBx69+WaMCmY+2rwaGfrwzyz8Ee00o
	hvDc1ZtvJHlxKtwiYYBWeOSP39UGDtg9Fl9ppiACE/yDCq/d/3Cdm/3SAnfTuMcf
	iEqNp+xYQ5KxMlE0sNY0VZVYt+ZpD3JdQM24eza7O3+GT5evxkYSMdw5B/uMzUbI
	K+r8Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1auy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 09:11:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8ea43d4eso42292485a.3
        for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602682; x=1775207482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
        b=Tvhpv9tnV6jGXr1unO2Cc1788oB+uuhYDO10MzIw3j3Frlp934bJ8R0au7KUDoZ05D
         ZjTD/PfZKMm2EUmfmTJWf1Yk/SS0fVPJZUraRm+mCYPXx9oUiHa51ferhsSX2ESr2CLy
         UQRxAZ0gvva1nCu4CPEIp8E8UDY1Dm9ndA6LLO4gZvNkXzbeHq2HwbCCAkeoQHIinK+f
         77V7IVCX9cRgR3u9X+oK4ejwVCaUvsrO+G1mX+qKZwpfD/vuKSM/BeilWplSaIEoHKa8
         YknADw7pFpFNiYi0XMahg+UgY32BYE/G6r6aAmHc7IcvfPnNzJPl1A84Sb49nhJjpgw0
         FL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602682; x=1775207482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGozACJjJMX4KDbiacyy679zPy64q8SfwO9CEBpk+tk=;
        b=KIC1ZB6YSAktIPaQmnTAj+VOuHyox4XCif92uE2UyUIl1dj1Su+H9LCvlPogjtIhoU
         z3Wbujtb9Kk9Do765nM3n4dDFiJP1AaWxKgl6jhh64OymyxcBrg1X5+fB8/z9DESq0y7
         MijWyG0LzHGq8GzOT/EhIctj0bU/VjSPN2c+QidW6b3s4QRVUVS9W4ZVfFDaVWeNP8Rg
         y/+xYb3M78Vh8DBiXlm1CBXyO9c4yy+DLEMBmhouSMVLzvLfclQ8dx5nqGupAI46gqCJ
         T/Jz1l2zH+MxinsW3K62FissYTOI+txsfCdiU7r6DZgRm8POzcPYkGX96GAQ/EFrbeVv
         7akg==
X-Forwarded-Encrypted: i=1; AJvYcCXQow4WdmrTcqa/OlG5B10mg9xrZybs4/RwHGmClFkiSbjsHICBsABj2DkiGhiTEVtVG1d3sTlOBcQF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yc6MjWNb8bpZim0vMPI35fa4of5D7LXaNJBnTzkGxa/0FQkM
	EvwfEq2Y8T+UaQJUHUGJmV5l04g80qPHvXTmSrxi9vwq8qhkh9D74GUzDJNZhsqKXsfkcoWJHST
	Yaa8qR5tLogmyPm2Z7hp2gyqFR4NJeZOX2gTMA0e0KTNAAiQsp6G3YhbKffcwzVFH
X-Gm-Gg: ATEYQzxeoFU3pSKe5G9p3l0jeJ9tqUmSg/JjTgIQln+W09erafebla6t1iZWoax8ji2
	y11qAq+sPevgHkuTKYyQdrbae4g/4+u+RNtAnm5/H1q4YgE42ypKONVfsUOJOQT5msfs7VRgCRj
	LkypDAZphSWbE0ydUuYXdbAZDe/xbKl5Q1glpEh2yagwc3MpUPlDsHVQ6R2M7fbc2Ic2YRYA0t7
	VrwuksHmsZbf1MmxQtMUIC7lWrB1TYJyJygZv/xvoO5UJ9WCvRKySYo9y1hIIfkgyEH7AuBgSPv
	rEbkqNCtJKn77xCb7j262s574lmv7cpF80fkwSxzFvSVTJFzdu7O+4Vy5qqsaC1hNJ2NOcVIV/u
	ULgWpM5TbLjRnSnfkC4dZmVF7QenxEJHRzAJlWTXIyw5EpHi/Q09ayuL/Lsy+25SpCiCeCTG+1S
	4nUBw=
X-Received: by 2002:a05:620a:3181:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d01c39ada6mr134835785a.0.1774602682188;
        Fri, 27 Mar 2026 02:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d01c39ada6mr134832685a.0.1774602681682;
        Fri, 27 Mar 2026 02:11:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad60361c6sm2072794a12.7.2026.03.27.02.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:11:20 -0700 (PDT)
Message-ID: <e063e7b3-e72b-4a2f-b307-080748cae2c8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:11:16 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: barnabas.czeman@mainlining.org
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
 <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc0d9e1d8f85bf2b67df35b8d9c2110c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfX1Cd1b0qyXKHX
 j5vF9Q13frGFS8WeaRM8QyQaDKLWnaURyKFQBRGVLm5BXDMFEkn39YMEoePHM02IaCRYnfKszVQ
 vDPbqMU3ZV2mrAw3qnUrGW5ADR05CApna5eV/I8Vt7q+7jmi11qJnT6xBACzZaYFcE4MmiqtaVg
 YJ3UqhWd69y4c0qpPL10JWPBzzTFHsUoQz0H8Eou7ctS5ApyZpSMSulDZgGGOZ5bxDKY9glG5MQ
 rgYuJdEcsugGakorlz8+Vf9aWFnhd6s0Ye6ao62egMnpGq46oto+sCoKKy10eqpDMjI9R9T1hdz
 gu8PQ12JV0SvbPuG/szfi84D3UHtAN+64lr6veuL+nh5jqVfdDzrBvfaplLjjVC1oXsK02IWliW
 NzJDSCfvajW3ViO9WXaWWUhO7hCwinU9nAUuXxi/MKkFLfRZoYt/Q3izKaL6ZYw90zoHaCbsxeC
 NMMVpCO3ozzGwefYrIg==
X-Proofpoint-GUID: DkLrme8nyMdxiS3lxQ_YIkyjRd3TbDMa
X-Proofpoint-ORIG-GUID: DkLrme8nyMdxiS3lxQ_YIkyjRd3TbDMa
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c649ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OuZLqq7tAAAA:8 a=pGLkceISAAAA:8 a=yzi8m8hClloKuEgN4c8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270066
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht,intel.com];
	TAGGED_FROM(0.00)[bounces-7538-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76D373418B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 6:48 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-26 10:39, Konrad Dybcio wrote:
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> This patch series add support for various components in Xiaomi Redmi
>>> Note 8.
>>>
>>> Most notably:
>>> - IR transmitter
>>> - USB-C OTG
>>> - Vibrator
>>>
>>> Also, fix some bindings warning as reported due to previous commits.
>>> These are tested with linux-next tag next-20260320.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>> Biswapriyo Nath (7):
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>>>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>>>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>>>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>>>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>>>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
>>>
>>>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>>>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>>>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
>>
>> I'm assuming all of these changes apply to both ginkgo and willow,
>> which both include ginkgo-common?
> All these change should work on both, willow is a ginkgo with NFC.

Thanks for confirming!

Konrad

