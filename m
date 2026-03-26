Return-Path: <linux-leds+bounces-7524-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMtREJ8AxWkz5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7524-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:47:11 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705E33297B
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA51304D94C
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F834E763;
	Thu, 26 Mar 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaPi3zxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVMQHxar"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5A34DB54
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518070; cv=none; b=jBAov7Vsy6OmvbBYNYUlvzCB/grpfqWaMJ5nqFTpr2NiGWsks3nP91o7yBRrlHKV/iF7DpwuTjq5hfPtWvZaU4/2ufB6NnvCu3yQIzMLt04tTcHBvBUikFemqaAVc6e0IiByoqVRi46GLYJE3Fy8FhRFEDW4BIKxz2btC/Opgf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518070; c=relaxed/simple;
	bh=Rv5UhyIkY7LTM34sVRpkamMs3/VFT2zqxDOaYbDuLtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKC9HfNHVfzqAHKoUSF2pJQ+6P57gYlpGmi/1UrE6QQq1y38R6wAzAc4hEtAFRNOtYtunVAzx2gryJtVxoxCRm+nCsYNRIlBMUjAMLzW2m/kBan14G1yLhr270xf8lj8Syq9derX1bF9VsArFznvww54uVmIzmFaxNoUc6SEBdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaPi3zxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVMQHxar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5h4jm1175631
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=; b=oaPi3zxsIT4NpBYJ
	bw6CS2FHFtyBZGnNKrhUKohH32lG8VHBHOCVMkU8y6fvLtZXNRAeDYfxxdBNxyyF
	shi/PGumyUgX8zAqIoplLczOPvcHJsz/sXZBkSZvDvU3/YbMoFbfyPpYwNwRsUJS
	FRjWg+RTbtZw7YeWwsEEMoiijjqCaTOf+T4JkgCSZvBq2+fYalM6D+Pd6L0s2VDt
	1zqnqlFeWRlQyf4czl1XmQJAYI43vXKajhROZcidfgUGOPp4Xf6h+j9/GK5NcvbW
	C295A7Qs98awyd0lxLIPjbmgvonGH5U5wR2gSrh+Ker83nwPEHASs1yX2owQVr3A
	LuG85w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76t6w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 09:41:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b86b756c4so2785211cf.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518068; x=1775122868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=;
        b=KVMQHxar8DN1/nJ+7oXouR00s+WFPPsWK2bfGclBC9dscbW4/+AAmuel6L5/P3IN53
         vIgJSOcs2MbDxYMDsuf1O8z5vqGruqy+rTvpuT7nA+3UdN1D82OkXvYlngT7jPgS0nh2
         YQXw6XKHfjiBelglmQaxfDdCtyKeopGlbsS3udZybHg12b6pSNgcKd/0eK70g2pfOXQ4
         VdeOU+K3eOREsoA+fpEY6IZPYPs6dUe5CR+C9G7EdfxnmPJJyQHVqXNJr7HZGGMs6hKz
         Zri2OVDm6rGJbJd459rMxQw7dAHxI2XlxP45B2JngJn1BSvohMUndbSdsCxOxycneDah
         amuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518068; x=1775122868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMKFa/gZ/0WtlaOoCfp9i4fst9ROmtc3ezJMiPBlmEI=;
        b=jlKklswO7ZvGR1JuOdGa/qIIb13FXXh8dARPqCGW2d/0GH+7LF1Uym+p2ItszKZEhM
         uvFCkNmlMsHACsu7i1EARfi4pYyUZyzo/S4/5A7iS4d5PmqubbX6puSYa/heL7B9C/e7
         vUfOE7nKWEK78LYH1VMOniJDoU+m5zEQxLLUdobuWeK8mJrrI+/6v2fIpeMI2mOzIGHk
         5oHfBZ7a7/FmKFFTaHA9kZKk6gUZwpStJkyzD98EUczH3GEwWSUVs5wsIW3nmMOg5uIW
         imozIhpsByc8t6REUb/2DZCpHI6WtwLdNwoIu4cqjw15OYNAWrmOtUqFVUX26Zg6kohB
         pzuA==
X-Forwarded-Encrypted: i=1; AJvYcCX6T6+4DXTcz0ctn74lMNmLVkBmWu17m9aWbGS6uG/xDCDixeOJ7gxJ7XShAHmovlgUyB4CHZp0wdN2@vger.kernel.org
X-Gm-Message-State: AOJu0YwVuKGIwOcy90whGxg3Nf/SOCQpEPwca0sILrERIp01R31Hno9H
	0mKTPNaFPh8x/IHBokfxGF7BlzQ91V9YTtswomEe9nQxLXxibbMCabEgP5abv653H1wKFtd66TW
	Zd+Xh1FKpbiIyDrew66wK5fuua5SJk34zRt6tHBuBtu5LXwVrsTdlL0hs8/RZuPxD
X-Gm-Gg: ATEYQzwu1otCvi25IhdHE1iK/MNYnsFKOP4BBM9nG+4MWdCCcI6xn/XsDy/E6wT+imc
	b4fk8Wwe5d2Iqxxgj+w2SzYUbE9g2lH+UyjpICdti5fPDsi7B16THZnNE3bhxr5t+zWdtkgEUkP
	YtR/MQ09NBG6FVvRY38PXBzXrARxVkAU9tjmcoreWGDI4wcljQ3506qCbYao9COLW1Z5gxCNoo6
	RpI6qqspzwLSWlmCqFHpNgEplIw+zHYXWUQC6fpehTlOSPEMnoCKdfCnWH1Zov4I5wme8yFQu9S
	RvK6AlZzQyGGvc0g7HEHiIMIiO2qAstML8y1UmL69szKQUR33Ax+h3fCiAq+CxzZRJ8HulteJaO
	lUuSaTWxZSsGTvjg2qbinw8irMai4RBsM2nxEHR8urietkJidpUI8Ka3JvPLYGJlt3pZEDxDsFs
	cIfUg=
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr45595001cf.6.1774518067681;
        Thu, 26 Mar 2026 02:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr45594771cf.6.1774518067265;
        Thu, 26 Mar 2026 02:41:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ee83csm94343366b.43.2026.03.26.02.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:41:06 -0700 (PDT)
Message-ID: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:41:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
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
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4ff34 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=J0hDaVVMoxkQcXr8FO4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: iJBlFzsodGUYKRLlPuFI4aVCbBU94ZpH
X-Proofpoint-GUID: iJBlFzsodGUYKRLlPuFI4aVCbBU94ZpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OSBTYWx0ZWRfX7dd367ow4UBF
 10yDOMd1xZcaRejnZqE6yzXU7aw/1xJRxAA+bjgMJ12X+xhcje3HeyybSvEa1jO2UPk3u99pOh5
 snWwJiSa4DnoFdEZYB5Dqvv5X6L67kA6p4Q8s9SinEz6oyGff6DTlICmK3+PjDtuWJQJS1auK2w
 QASBOVZ19uesd2BPvNKyADeM7Vwt7ytCuexWOA9mmI209lZh9cgWU8h6kS9qi65/OPs7lKuQk0M
 h/rOlB5BgumdCuEwFIYCaCFKODukfgnNWarJ6LGwS0wEXLvH6Ss3dZqIgFzie+kvWuKB2c3t2F/
 y7KjYzA/LTwsNCoE9NL+eKbFmknIRg9EMovzyB6jLvN7Y4UGKzOzx71+HCNNP7OUH6SP0IY/XPf
 G8JAStu5OLpvKCAgNjUOplxy1mKkzYf/eu9Rj9OiE272E+HB9lqRl73NPPpw6GDiPMSx+i7TNYh
 EFtBhTZsZl02BY92Nlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7524-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9705E33297B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

I'm not sure what this is going to do for other 6125 devices
that don't have the Type-C infra wired up.. Does just applying
this commit alone keep peripheral mode working on your phone?

Konrad

