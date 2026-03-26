Return-Path: <linux-leds+bounces-7522-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QITMMj3/xGkz5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7522-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:41:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5DB33279D
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03E2930651A7
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929D52D948D;
	Thu, 26 Mar 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBtpIHcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/Y5cSgz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9136434D3BF
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517998; cv=none; b=AGVxbZeWTDFP16jqDQxn+cnkW1bWyE7yL+SA/PkRUNQ7Y7RhrO63RyuepJ85s/aUNYteEAHuY6UyTfdAeqRbwqrrCBnr9q66RyCMaHqOhvAWTTFxaj9nX+OtS/za8PlONbJqxeCZOJkmg2f12Pgjc0LUgSV+/tkS4Ae5+803OZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517998; c=relaxed/simple;
	bh=X0urmZHdfzvXbY8NoOrHIuzCFP2iZaoFZvgdfLjlu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eN8NKHhhHm7cyREK1ZFVs83WjwlhNr8TaRjU9Tt130n6jooRRSRFP0K1ZE+Hfa+3WmC4rTfSJRb3H35/vCmY4FsYHANiO8CowCeVGpcHCc0YNJQkI0Ra9MaPU8AIrc61XFQCtRA3rPAxWUGPYBLW682/P0RfsQ6Ss4vh+pcjVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBtpIHcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/Y5cSgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5p4kJ141456
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=; b=PBtpIHczdyrevmQl
	BeL9I8yTP0fa/ArJfwHQ+AnONo4FydKH1//vkEq2e4qY4CrJWTKcLPFrbZwVr07K
	9vhvDgZZd/Ol4u+H/bbv3irdDXyLbrpMnPuGJDJblSqZpY1Z7Hto0pPlj2S/Wo1x
	4Sh6WiQJtnIsd9j7aNuUWFTMIEZt7Um6T6vhwclUfDWZG2xrAcT8LBVg57MuKUsg
	XrfO2Wjasn4xR8GgSLo+EH1xFRD+4q50LStqGMRKrApnkNo4vn+We6wgZInY2I2X
	gifpAueI/+YHKpslK6QX/QZaU1Mo5TMPQfz4+AJ9hxpBU97rs5uYA/fq4tYnOdmS
	S/knZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q09287t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:39:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd003bfe2so26534985a.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517995; x=1775122795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=V/Y5cSgz1b+arjKTut5rr41OZ/XYglUY3XymGErlrWyg5B5gIYYsVLetXOrrFHiMGZ
         7yw1KTibAnhnJI4juhswn4A0HOHItYRVs+ckx8aeK+NL9IMBcvEeWnAa75S/pPp73v+z
         ElgJX6/fOB/HJBbRkkvicnaWLENu8wFoNlLl3LRIYmtVklwdzqKOUzvM6atN2l8CY+Lx
         DnIlVGRB3bHbIW5IEn66QVnjWwipyUiI4wTytG9K8hLPys5dl02uD01URBiECRl51qvT
         UCuaEOuftr07H4gOfd5T8xI5KdhlBIp4rviafJmSl9HHUsLQTyJBMasc1lNS3EDZghrO
         5QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517995; x=1775122795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=h31h2m9ZRZAE+p47xvEJTwN3LIG+/Qr9i453IoQb2+AlXF60VcnHlort4SfapD0krR
         wXoh8YV8Rv9pOGEdE+453f2oYhinS3mrEOGtdpnr12zCpCjGHTQshSH4bQI1s3VpK82/
         nD6cZ+JRrwlNZLrcxFbufQ1Oaslrvr5nJhspU8bzLvvTp8Vx53pB1ZOgXR3ZRTOTbAyp
         fOcjNFoWXOYmFtqnvf4t4xJD8teUgSYKEwxm5g5esM3GaJGv8WIZlBpRDI7mHs8knVDN
         0uuK5EYpjsB7j1RRzZbDke1Xt7daWGksh3rxqFXWoNfg5g+xTV5juSXKs4kxxJsLZZed
         Nkfg==
X-Forwarded-Encrypted: i=1; AJvYcCXvulI+t0ef/GGeTMT0CHPHZGNltn4R789n6qfg9yZ98wYExjuJk7eo/NYQ4ZcU66st10foh26CHapB@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5HbKsUUHxJWd109YU6JIqTiMb3BofFPC5QtkINR0FlrFVbh3
	qpQG2cb9x9QlSGRdxcM8dbMtAd8KCg1tvPbIg409dRhhS2KpCcukcbwLjBUilfTpRtLjPMPyxs9
	OGKQpTcgGqPD3+WACpSg9gQrooL4HF79fPcAYD20MKdz7U/gZD3a0jjs22zs4nVIX
X-Gm-Gg: ATEYQzwEdwMQpqfnE+tSAbgH23Q/PdIikhX80Xlyw9i6PjW8gVxhv6W+fmR00uOf48T
	LbA56WLz0K7TR+pQHeOU4fhYaG1Q5VHa02MCwHXBoNg1Kc/UmWs8lhJQrGnpjCNomjop0Z8V1Xb
	mTViMIa9bE0WA7q1a2s+jKqfZCrcMqRjWIQ83Vyix1GUmSKyGuFNjZfatVRexSF6LwwJgO3i1kb
	R3FTVDnMfbitinEXyMUCfWGZbYpleAGGUmx/ujD1iKz8NAVmtOk6mQ4UsIKcMRodfmXqUiqWb0C
	PudvQlANuBmAle6OB1inajO/jAJ4cuucx3tU0E0ZxWevAh48zJIK3rqfp5E6ZombXy6PjFr45XM
	zoHTnRnWGxx+Gua/VNT5txKjkBP2dottl6ipQv/lCZ2kIalzBftUQaqKAAr+JaKb3VQ6GFp+Cuc
	00i7w=
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648083285a.3.1774517994908;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648080285a.3.1774517994404;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a6041esm837284a12.28.2026.03.26.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
Message-ID: <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4feeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=2_2y1rQ6RNr2V2Z6SLcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WJybV1Fpv0gp5BxtS1BWSbMfXA7823B8
X-Proofpoint-ORIG-GUID: WJybV1Fpv0gp5BxtS1BWSbMfXA7823B8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfXygr8nA4Oirr5
 MMObMsHB1DcqMHHl3yL9V1lr8JjXUrxaWKC6bO9AJbp6rbPyxY3zUtViCOkXLaUBV15YHWAYXli
 KeCCo47UX9FGG8yddUw0oM4Bdjw2mVf4GaegYCJl64bKqO/VvFn1Q+NT/qXOmQ8a6Gd/UbE7elB
 NvRZP06AwtdgN8TqsTBwadaz2Rm0hBsg37tACe7aKdchXSgotEZy5nmLqF1++f+j3kcP/kPgTJf
 q4D3jscfaPW9M2w0PC1KC278Ev+fVTle3gePki5/s3hjHTwKDDOLJp8+ZNbf87TSTslimK2g5eT
 vanHvMJwVo3d2ZiYqNy43fDyontras6WYmcLGuxgFMfzVCvvhvaFFQEbzcNJnE0Hu6Gb1nmSM6N
 Ll2+K/7Ujk1N3nI6S2P7el7FulgxOduL4Th7hHy8QLiUE0dH1yp0ElmYcfmmZ/TssYpQHV/B8pD
 FSn6ZBFzZTeaeYlsoSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7522-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 6B5DB33279D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++

I'm assuming all of these changes apply to both ginkgo and willow,
which both include ginkgo-common?

Konrad

