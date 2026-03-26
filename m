Return-Path: <linux-leds+bounces-7521-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 62q9K/0AxWlZ5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7521-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:48:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBCF3329FC
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5184530E7CB7
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA55347FD3;
	Thu, 26 Mar 2026 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1yERFpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnVFsRld"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16588346ACD
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517952; cv=none; b=YPMI4wAgvQATBjqAvoXSMd/LAwRG7wnUYz8rGsjMjK3hFwgXBumHcy++9Cp2mRqybUImH1Zw2KNpp9nOtskqZw776tg5Bhh61oqED3E3IQj+dSslUNQS9Ta0+lIa6QNBIcVah6yBVQlmNqOZoR4ON+aDq913opD8+u1gEXIcWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517952; c=relaxed/simple;
	bh=J1mg5KuGxeqiUBfNMxCkrcsh6ySIvujpPY1Sj3t3DAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5ktTdT4CQc8FBp+30paW+Q2lF2zgAqAMGW5qU/T6TUgmyzD+Q7qQ9QkVsVBG/mCdbR84i/U6c+0QIlA0ZSS79U9LfIxt5Uqm9/v3O9XCgRYRrJtuIF+dRINDROygR3BcTe1mLWVKegZgB8zhgfUfTF4X7d9wcHw5H79ZqRcJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1yERFpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnVFsRld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3a2d44015197
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=; b=J1yERFpIYWGjXThP
	vcGlE+YjOw/+YUu+m8re6aIf5FgpZaEmoTX1As+BiG4lAMbcA9wsPkR1Z6bY3ZEl
	tLcy13GWffHxRUvLqyOvhjXVz2FSkp03EGp/nA5X7DLGn9zKe44h0wo1ExPhI+eO
	ck7k71QIVEV1E43UM3e53Uimfv/kKv+F5SYj9milaIWp/rimSQOecHidlC+gF9jy
	lfr8HEOu24qbaGoazV6pFabGhaqk0TbGLXHxPrgkXif6JgStGP24X/IMewwBfAYY
	B591IGEx0VnLbIEMViZoccVxqCD/WEw4hvhD/MflvmUx6WjSHDvyCFvoDuWGB2tE
	AsXHpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q95qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc644ff12so17934685a.2
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517949; x=1775122749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=;
        b=DnVFsRldAVWgGdGFhoFYmdj2EbQWsiJcZStNAj9SzziQF4YJCWLrLWPlUSUiwMurUH
         UpN1VVUvhbjWKXl7C4lRlyBODE11u9dqNrwZFfsqHcUIqQ5+exa/Vr/6OMRJgFXmdNVi
         +K6Otl2k7IV9hfwChkhucdQWK7huOk84ivI8NTf3WwR8BheoTbo6sxmllBiG3G1Lnwq7
         6D5n82nQEZQZTGvJZ7izI6dxviMGdK5kFa/KTNfLqBN4p29E4p3yN3/Qmz2FiKd8FATO
         gM3rMw2z3uSlwYHzrrvEk+DjcYDSDmukoTixg4eH4uO9HBlbgwp1+mh9ozHJZwMQUX0O
         mTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517949; x=1775122749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=;
        b=VvvozhcI5NNNtwIUsZuy40yVXKDUEOgh89+ylhgtv0+HL0XKENh3gaQxAukfTVul8w
         j9zKGYexIG0Nlievl/n4Irg69jlAqE9ILFBYRj0eQ49+imnZgQExJHQNZbmOPBoOlTOT
         acZZhM/mO1cWu7MTz6GFlacH86tOXHetdiMZAgf4hrp7IjVD8hBLsFWfseaGFPuC1cwp
         GsWOSZRKHYR6Pfm4F+VkjRuxDEtGTrqJ2ooG1a6ZQJAWVkWMuxWBXpMB/QW3WKNXJnac
         48h8xfPBoTLZeNVXTW8EmFCipqkpYqCKTpzaoxOoWE4WsUIPHkL4ITuHYL7ngpOidzr4
         9xyA==
X-Forwarded-Encrypted: i=1; AJvYcCW8wj3+An3+EMOIrp6mpMUjxqby74xOzCzAGHWNshqXWZluxoXid8KABwMXKoQRItDv66otcP8INCWz@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBNdgRdHAhhttwoVJv4a6HLUA365z7FnWIZwPAT73hnk9p6+3
	90Pg6nO7e0TEi5cVXdM+xs6U0AwONms/rbu6a+BfboCPNzcbo7t3pd2n5vzwpYIQ+8nc7PXIOdF
	3EgRMFblSw7Xr8kI9YxtkGcOmLk5hzG1R2Imx5lzTTRNGpcAD+Iz1lwy0te+ld+uD
X-Gm-Gg: ATEYQzwJr0FMSLal2DIoDgUYLMzyhNWl68851H3MRrLj0c6PYKCUzuXjCUU/MEqRaOf
	2nmmlQ6YphxI+4xMWqYVzhTJKOhHEui3ia9bKkxUMjW3jYj1xenXOS81F7kinw3Xfb5VTNzHTTs
	j8H5Qq+3tc0Xjbru8bkvPFxwBSLpUNhIU7gUlyzeP0T4dERpsYF/X05bEe5k5DS3tunX3VguTJl
	lXj5u+lKv6G0AIL6Ly0cf0EOhamjzKbaWcIK9vNHvWNX/c6DeDyN0F6kzbmttNoskhyLqJWzukP
	XHYlEEzi08qsumDqpHG2c+TXRq0OaB0jNxMp9SOE3H60dYGfxXYUluRCCyly+MoF+KCNUHvo4AH
	/6yafdxNixw89lDp7BDnjWUvWTyDNP0dL5429i+dLlPYUN+DsM1asIZAxvJgNdsuhT24aTu8shG
	fXtEg=
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr64090131cf.9.1774517949409;
        Thu, 26 Mar 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr64089941cf.9.1774517949015;
        Thu, 26 Mar 2026 02:39:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663c6sm99356366b.23.2026.03.26.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:08 -0700 (PDT)
Message-ID: <c324b4f3-2af6-4592-bfd4-2b78c7231eb9@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:05 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
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
 <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q8OVeITAkL9wB2fMyBXnqs3_6ROS7-00
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4febe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QifeDmTRV7nuaQTzNMIA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX7zEqYBZJSfXC
 LG470LOZpMsCm6pQxhyxJVazLcPhkDkD/4PxJnTKMyuyD7i9/H/Dr+p+FqwZEJAHb0LWo3fFgAa
 tQy//oyqHZp7f03mok3mq/QQx/e0CmxdZ3c/BzNfbQmqPkMfNnd93772xO7ikmfk1fxR2497elt
 kdqUmbG6/2nh17M09hSIblggiHjpyhwQnz3L/6XWRdD62p2e3kT4xyaveHN6rstctnKaRIkRz4Z
 8o3KaBH9mi39O8BrAQP0yxfGPx2+pxElw0YSxBjGpN5S8wjZt2GLOnSoTlPDRES7ttBU0tVUw6R
 QSZ9XEb11J1DLw3hMCdWJFHqnw0MvX78RdqdIk6swz7J5iKjXiy87oYkGaxBa5EIH1MIO2naEUL
 CFELmaj1WXkDrgGqBLazqCAIU37c5AFL5ZxqBHRszWOJjdhW1iwwz6SQZ+UseHHav48Qf7RMF0A
 WIra82LqeMMJ3geXUVA==
X-Proofpoint-GUID: Q8OVeITAkL9wB2fMyBXnqs3_6ROS7-00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7521-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 6EBCF3329FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +		port {
> +			pmi632_hs_in: endpoint {
> +				remote-endpoint = <&usb_dwc3_hs>;
> +			};
> +		};

I'm going to assume the SS lanes are not routed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

