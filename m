Return-Path: <linux-leds+bounces-7523-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFzWGlT/xGkz5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7523-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:41:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D33327BC
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 143FA3034DF5
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17FC348465;
	Thu, 26 Mar 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4q2i3cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNPli95R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA107347534
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518016; cv=none; b=nqUddiIHOjfByksBnn45jv6yeTHcBVHNbBqzSYYX/vRDKvlWVfc8th4qheonByZGaBf7/oRu44ynDHR7vJrMYchQAlNlf3qXoKJn111UdmfckLDKUHqmPR42GZKK4HUQjodRTtk3EWozYvKzWjqi9P07pOWlKu8FrrmX/p+qUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518016; c=relaxed/simple;
	bh=cIepne44jy0x2zDmcPWadh5Ql6TCY2pHBP38cCOEhhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRmsaglz+E8u3aNwk8I7BCEn9/vMvqPBKsHQh1fMqW13R8/ucIq60hG2v826GjDR4QGxxF4k9cWDtkMqb1D3cQv9uxuIysB9do27y4Pri6oTxOcYSeJ8zjKNJ5DUwCBcoB1/wIfr/YKCb9yxLV6J5lIN/XB1Ind8NUJyUMxmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4q2i3cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNPli95R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6CXkx141341
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=; b=b4q2i3clmFLWLUal
	Fw9ajmi1yQdy0w3xl3tJimwEnMBh1MXHGgSBxql+fTAAkDJzrB2L9xRaVxP3hbUQ
	LrpgOeVS62PLtU8ag0E9FP6NQ/S6JdjnPLw7F+Av118rTWkuhZfKPlKG9CWExApH
	iXjkIFdScIL1unNnPdPxbqSS5MPLEN6gsuYKxr291SZ7TiFOcBDhbHIGAGXbqWm5
	8i5lKH/v4mZ48HSdUB7QE+HSF/uTVemzb3WquA2iwEAucOPiBttksnMTEP2mLwWp
	k26hIWziTGYqLQTMo2FT+7sxUZzSmwFRbZ4/40wLkE/Q3GXdjWfhxDRlvu2ZC1QL
	4WBX9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q09289a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:40:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccbfe176eso2386506d6.3
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518014; x=1775122814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=CNPli95Ri1ZDalFJJWpVS6C3KvkNdkhblbnz0l33osZvNrRVYXzG23Emix95Z/6XxO
         SkmQjEakwBh1Thk9QnpYhXhjjZIUge50wUy3bTV3ddHaaVOb+g2E6wGLVrRvBDCkW36S
         PnPgIOkWevldPkOgSubob6fB/y/ql3a8WsJ36Bks9gAX/wVEijbxXwRIPrHwiL1XKlo2
         /+hm8keoQbFt5cqVTeyXcnHDXCjODlrIy98beX+mIeCaTqH+zZyW5bCGtaAh3NKikZlv
         UEWvST+MuNYQAaVgxk8tq6hsrSEwag1wPKQ/2EsGcHsmc6hfC/9s9OUdynjbl99B1HUl
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518014; x=1775122814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=Ho6zQvuOAEY79ZewlZKruOkgsfYiTQrMhbwn7GTEZy359le2Ny6ZkPrqRUwfNVNipW
         3sYS+MCZNVOHs5rJWKLIsLyoQLDB8ySqx9opPQN2g9aLVhrUcEmENtEM/9uCgUEwQ+LC
         zSXO/b7DN+3/Y93CmcyGCaQznclefs1nCXNCVwZbX+ho78G5McM6exJ/snFdN6zA/yDo
         +1GHEzP9zEt+IQlht6yxstDZGR476SoxDon770PfNbGaus40eTW1tpwZeergpv6nDgdv
         Pg8poFOMfY09imseBO8PL9wqKFLzm6DAi60kzdPhYCvipofrU7m3WJV4031EtBOhp06X
         td2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwWcTwUl7dozNHluw2AxurOTCBV8bTAB1WWp305Q0BWjH3x9p5EH+fLEVmo3QxyGMYSZoycTaboZif@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJOdvW+3i5omJOhZDFKMizxqQrtCF/duL4akTX6KcOuR9gvcY
	UwDVmjLDMupxoWuydU8dZR+UFaqh+lWt82/qcBOsbYyew8Zs7nCj4g+AaIIQNEe3ieM8gy/W8tp
	BPSFO3kkTwmZyxWtmOwkomz5w/cvU2Y4xrj3oinKupAAiN4pyllca+3keAd4Te/Te
X-Gm-Gg: ATEYQzyxoPofzuo9Oju59yM0go+B72uynokM2F3Kr2q0onx87uPvIfULoYvNLsYbs0R
	3I6Dm2miBl/+oxvKDZjYDuXZHMHBw4qPK6UbUdaJuq8WXwDwR2EG1H+c1gM3nUvbDq7Nit/v5HE
	Pznpgwi7Glx62cg5kR8cgjn6F/370PYBLuA6aBwdY5J6X2Xj1qeVtWdDweygsUAg1n/Gaw8LxQd
	HgjgPVdU9jhrKHXSNsibEjrL92eLKgBIvZcpcuJcvOeEbTyf4CcOXESi9Ab5mX+pnt71oHTsY7R
	XRXbvbz4Mb6VzXDWOLG9eLUE4JKFX5/Rp/QitZ5huLepwusQmCegFJzfWvFfVYJIKNgx08uyNSh
	/TNsM94sosC5djsOh90zVpDarm70PZi1NSEohFkFj/Tmd+J/j+X8tElgiGaYnxRcyGCfyzlKezv
	SZ+0M=
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673706d6.7.1774518013933;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673456d6.7.1774518013540;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20264ed6sm94765266b.20.2026.03.26.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:40:12 -0700 (PDT)
Message-ID: <834f159c-c1df-4738-898c-13e89df53957@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
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
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4fefe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6skNi_Mt2WqB1r5J5RAA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: sZPTgdpn_ZYDZ6o69G4G7kN_V4QWUpW-
X-Proofpoint-ORIG-GUID: sZPTgdpn_ZYDZ6o69G4G7kN_V4QWUpW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX8NuXNlGMdV3K
 J+7202kS1wW7sUbbTr071EFVtt6oMfVicLlsH9Zdc1E7wBvJJxnuA3GdNH5Sa6N+Yrd64ft6qkr
 +NBQAz/XU7XQb3ulj2sLiKB7tZjxMxQalNQkgam2QwgD2T1aTlt0AIXro3ewlW35P4gzK/Jc3ib
 oraf/NOvgL8p6Oe4e6FYLAkVk2aLGGu2TMKye6cJQziW1R8uFvpFnjZGxra9xGR+QjCDviBYOdV
 VvrKwKoSRFoB2ONEWAL/wf+l55g8rGFbN9iWQ6FIO74PuYwry0mYq7LhTTpJK1tmSrNJqb4j4qX
 CdKJ72xtv/4oOTow+Hg/skxwTuw8CbasLIw+lmujEt/LogH6Zru3umtdRbK09Ha00JHRmCVtGJB
 w9jVG+KeUzkvyNIV9J8DMcPSbEUZY14G+A1m7/C81gjnYLS/zLwKUYAikdi555P8+85gkTopHZB
 TrrhwWkrtpNa5JFTzgg==
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
	TAGGED_FROM(0.00)[bounces-7523-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 102D33327BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

