Return-Path: <linux-leds+bounces-7539-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G/wH8FMxmmgIAUAu9opvQ
	(envelope-from <linux-leds+bounces-7539-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 10:24:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 380FF341A6F
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 10:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B257130C8ECA
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716923DCD81;
	Fri, 27 Mar 2026 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6HT+idO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP844j74"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0906A3DC4B2
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603154; cv=none; b=Qg1/iaeciQpikVh2kj/6cDIcXmxC4U4dnwSdF/tk+5EQhq60e85fB4Ab4Fr+InDYcV2muqSPQsS+AlDiUwuKD0RIDf7NA/QgyEWW4/J9X4DZDfUQVHIj5AAvvhLkO42fdd0VtzZ8BDhF/R5pmaxo02WGgGgVlR2D+kaFaUKgWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603154; c=relaxed/simple;
	bh=xXX6viTTK4rT+ZYOh0YjJH5pssE8usT9kMlI3qREXKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTpEtndql2oH8ONyQZdPDGryIKC0KVqZlA2Zcfb3yPSZjFua/GmCZ65+2lgt3M6dYKFEbn91HY0ZHKODxB28FpZLdGvL+NC4RPbF++12KzGsDgj81YMOQGhgi/hjGmw3uHOQaVH+wLKZ9obPOnlDOsj0qHyoRaixnpetJG8eviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6HT+idO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP844j74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsgG1226370
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=; b=M6HT+idORQ04IMt3
	269W5hBiYbrTuYY6bJkV7cXYBNGp4ZiLvnf1zPQ6vxmqz5MLoN2HWEw5EsbnbxqT
	oNYMPjD7dDx6+dPX0nivQixL9AMn73OvvfqE5+KvnrP1FgxRqh6LHTSGNNo5afAk
	Qth5n6YDaHTS4rwZCd+ulTL9624A45lClb0fNtSrBvLEEVgA99g4JMx/hVbBGZyR
	uof+ENbHxetLIBn/vYpI6Kdr+U/W3tnqQK1YPZg/I2Y7NzW7iHwTRXpi/PaoRZBx
	n+TqFiszV/+4BW/cJtwGZ7DTf36bG0vQoiQn4LznKcJi0/w5hH+YN5+HWHEEPcoG
	t+Ai4g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1aw02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ccf10567dso8199736d6.3
        for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774603147; x=1775207947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=kP844j74KQst6iVXFiTsD06A4p4+C597LHqHrHGajNC1bEJkPXBenypqsG65+Zx5KS
         p4bXxfR0S/iBC27N+IoC7E2Gfv+0pvZciatRGZSEbmz53uyOBiAaw7ba/4s7v61KnO7x
         ABkD884ZVPKE+zLV9TC6ikM/RO0+qHbvu+xTRMq6XT9tTJYKzFVZd2d4FyVNx/iW1JFN
         6HvHs2jmLalv5brt1C7LiKaI2vcKoUPrc9hvz0pRYH4PtQXpAdU6Ibf6WTT45mxLxCfO
         S1QMtxoaMBmfC4mXcCJEt5QK61McpjU7lwBATgyWkW6BkyRgkP23jN8rVViAgV2NfyGP
         w+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603147; x=1775207947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=cQkd9NMKWIb/D9v8tGS+l8/d0gkd/Qr/IeIhccCyD0aWIim3tFO04CM87dK9RAbMkI
         TEW0HQ1FStUFUSsKIZ1EPkksUjy9i18vOx5vromL/CFvtycgiw8lWD7KGIaR6y9LP5/w
         T3QNCa1M47an3vOgzAtGqQYEjzAiXeSgLOeFKl+NRw597+EHm7bA/g/v/QUOR1xfrUtZ
         s6Qbh80g2VHG+O02mkO+Pk07sQJPksCsRnNmNZA5y45RBukbjj4vsVaYvtANovjncigp
         iPBcVTQmHu1L2K0k679tZjdcnMAwmx+T9v8EhW9uPJZjh1+ja5WSSCTRQY/uGGRTPWAg
         2aVA==
X-Forwarded-Encrypted: i=1; AJvYcCU8IIcvtlSqKmgHAAY+sve5nnB8agL07kuwYhcngTJ2b8Snhk0DDfcJ/73GqTUY7xmnO+UBFK2selh5@vger.kernel.org
X-Gm-Message-State: AOJu0YxIXeL2f0Sr1EpS/vtGhflNAeqOXQNdpSQPBw8X0pr5YUGNjcCN
	A041USHdd75te++7yCQnOzULL9yq+uqQdqS9spCG70zOzfm8+opFAcbqRMizXqufnvxJ8YH8EZz
	t0VUTiAvM1M5GlN7/KJFNN/lKFIpbg9waj/1ODYJSqoJu8knm/GQ86a/NmgZjF14s
X-Gm-Gg: ATEYQzwIIEDta5uItmsPJW3z9mNC5VLr2ek3qYOSdkVdUJDaE4O1DLOR4d1gJIHqY6U
	LAaB7qQlemjdCKjmKr8K8wZ5JsoN6nKBlHGBqb0H3Zs8ePkkZNgTo7bAAxOOuewz8A3O1E9Ct0i
	SWBp+xGryoNAiV8GnCptsPoR1GqNGC9rSl1Es4fe/N5k3RbhjMwRTE4pWykUBuhBqHEHn7tSGcf
	drNrMhsWf6f51p8K1yIQ645bS/rBUzQoAgAlYcEQQaxHZnTTQCHmHFJ10rzXy1pZEh9tp6w1eTM
	03GRxKVYuyfpPzpJsevzwImZJd235zHpZ8EhfYUR1WM5NSGBvDIbjyMJ10Ixa6nR5/zYXJ/F0Wp
	SH61mEykgedxOcQOl92OJB6J/Gq1uC8Qf5XjWHsBo4eTSquhgA8k7LCWE030fnHq1+cExksBFEW
	NXb8k=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161916d6.5.1774603146759;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161476d6.5.1774603146205;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663a3sm217738266b.25.2026.03.27.02.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:19:04 -0700 (PDT)
Message-ID: <5f054c57-edec-4847-84d8-f0c769f917cf@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        phone-devel@vger.kernel.org
References: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2OCBTYWx0ZWRfX0FowPU9QwHfL
 Lht7QtXFsED+AVRudrq1H3cnkyghfxtNH7upFNpaGGCQGSCZI1wxhYHN/ONj9B1kMby+fEUM330
 ElE2oq+Q6H5oajlcVbScdqkozeZVkTfsDUsLEjZMwSagbU6cHYzRcUvcDMVtEI6SUBI7JHrCztg
 gqCAbAuifxN+VCKhKAiOYbe9YNHaBnjv+5dIr9vt1La6H1+uUUa5fTJsa8OFw0DnZ3VBPol/Rq7
 W7WIB9nYOh/sWlMGAwdycOxeKNSTUb6ECrvSItdPAQb5ybS/eCP3qvm4DTzPyZ7yTLy/1FMIZ7B
 h5RCpVS5o9CbdQkTRs6moishOXb5kIgLASl6NqKGms9foajDyqDmf/BY5tfTKJEUJvs2q60h79n
 EnJrrvyCZWJrmoL4m8p8iFCYfRgzZIsgF2u47KM7oxLuR5w7sVy2FzBOG0alOosb0if3kEzWt12
 j5Bz0Q+hj9rOoBdNKog==
X-Proofpoint-GUID: IAUxBXNwEfaXab7qSUWxjDyXCQ89zIfR
X-Proofpoint-ORIG-GUID: IAUxBXNwEfaXab7qSUWxjDyXCQ89zIfR
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c64b8b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PhFLAuRYng8QIqNMAF0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7539-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 380FF341A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 7:41 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> The IR transmitting LED is connected to SPI8 controller.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&spi8 {
>>> +	status = "okay";
>>> +
>>> +	irled@1 {
>>> +		compatible = "ir-spi-led";
>>> +		reg = <1>;
>>> +
>>> +		duty-cycle = /bits/ 8 <30>;
>>> +		spi-max-frequency = <1000000>;
>>
>> I see the binding allows a power-supply handle - do you need one?
>>
>> Konrad
>>
> 
> I have tested the IR transmitter with my TV and set-top box both.
> power-supply is not required and not mentioned in Android devicetree.

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

