Return-Path: <linux-leds+bounces-7527-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHzBFiYSxWkI6AQAu9opvQ
	(envelope-from <linux-leds+bounces-7527-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:01:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704D333F14
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 12:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7A9330A0E02
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F5C3EB7FA;
	Thu, 26 Mar 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npGZEmkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F29cA1yB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738C3E867E
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522497; cv=none; b=T2ItsK03UyRbm36gQbOBW+0nVyDEBu9gLSH+qUsqeN4HptpcGXINfRa9uWmOqB+f2TD/xPNbSdHy6E63yNMkoZ7s1nCL9q7ot6g1dR43OhWYM0owQc21R85sw5SZA8XtkPJgIsGPwf63Pg3k5SLs1GEKV7TrCtE9uu/U1d/Y0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522497; c=relaxed/simple;
	bh=v3ZRDhp2oZJRs8U2iTSL90RVhKSPq+B8LB8nxAFrsRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRBcQqxuElOhUs19brJ8pxgrhQGCmxQ3vWozPZ5z1gxzdECUEKVot5Wn2igtmB8Ch0FhFTZxAf9MK7qA7dzgN9EGJTb2TvXk+xhbz4PnlJZZfB3s8bJUYCtAw2BL2SBfODv676D7cz19lsTgTtNFLjVnueBeSVeB437+ZbqEqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npGZEmkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F29cA1yB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5udFl1965191
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=; b=npGZEmkHTJNDptts
	mNxhz0eAYUSy3kWtR+t/H1NQhrF7ixVuQ+W7xnw+w9QMivmg2kSdAyn85e2ESpTm
	fCkh6rqtciQ/KaVH13PZcPnZnnQ/ANdk8NTaAFfUUp0jZVchrm4KJqWYURIsc8RG
	j1HxY+QNbo4pg06hhzdD4N8Adl1Uhb9py7y1b+e+QcU8SmaWtkXlAL9EOX4kMX89
	dncgDMpXW24LbjgAt2mCismwnWAUagyR54vpETuUdEFBXE6L3qGsPSXznoD3baqw
	9GmUffXvJ/zIECcSaV8YtX80q18923nvKjtzjtTExihBlxxfW4aFg3bxQM+eqpvn
	dozh6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymjfu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2a1f123fso2603201cf.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522494; x=1775127294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=;
        b=F29cA1yBQUPX0jGvpvA3DBHyEkiv8P+LBOuRvije/SZKxTc0erWRGxfx/1nMKyCGLS
         DNMNrxfBl/n840hnC04eazRkjssrj/fhYA6J0w/xfTOaDLapTPwxlzn/KCQsykCizaPL
         JZ5Xap0ZqWH9VFSEbLQPxbK5Bha8yLHp6mierWScV+6UosO47K0nZm7tKmBUoL1ZPyKC
         vVn5IxcW7dy3gyAiCXLUV+102PFYdB7JUy3sHh0fzI2iewBVhyyWnCIiYT/njrXHVghk
         w1oybsa1GlwnStsJeXQTxrVU5Nf0QRUbFh4e+8QV53tuOM//GQBSgBw+KtCQMLQcUxHQ
         /0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522494; x=1775127294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=;
        b=NkSF/w83M8LLu32bD3a5G0RuBwFySA61gjGXuCLa6cUZbtg1ih7+ue9nKEiI+fTFxz
         uN5KxvhvgImIyN2z1g9nqRf8nUdGzYzmv9n3UUXiJ4vYzpvtJWdNTgRrP9t/pRPvp6pV
         8Qj/ErzuIucm4OsZ7DaGXQPZ06ecIVlVAcQGWzkIr40RWeXcpP/ZDW6DZ59fLafWbneK
         b3YDwvEWrMgVCuXavb7SgWYsmRzumqqKSZRWIjsn/ftoI+/7PuFgLix+XrqO+RypVnfT
         IdSeUmlQxCnifLftUqja0vqJ9hvYp1aX+XO+wn0Zl1srgI5fhDNVMJ9wf4WKpX5Gg2r7
         fgLA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Wd2Wmln+jm15EiHdR9HWeLREREWFXAx9eTn/uveXLES64KWnXI1lVuDrmxSlmYYtY4ABaAU3Qvai@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXoA65MRwyNyYmwtcvK6xfu6Tqmwu19BzVyAJYLpZx5Ix3iiP
	rwXff2zgUDMCPQJ+DvMjDQKfqCnaUNyJ4dFnMNO7QetTNRis3Lgc578dRDLHvXBH/V4bhPJBZVn
	GPjQnKoGA0zTkL1ydRe5Gb8ISnBKp7A9CkdjGw71z4IsH6Y8fB7d03dlDDwhT84sY
X-Gm-Gg: ATEYQzyDdKLBVfyzwWYW5mI7B5LcpkmB1JjrzLvHGBhQm/KAb8I+ahGybKaradlVz0D
	hGqPtV8eLhTrhMMCmHG6yrmPWIpE/EFBoFXDE6pfroFppNKOHPN69S6+yc5LpemDxlcQuRPpyai
	5xCRVAlkZgTCaDf7o3A/y5+NIbumtqqAtnm8MLCyjxkfJuD44bPZ2SrJzkwe4CGuIq6ETLuNECX
	aqvMUfWsblWEpaNolEWVCHIDm5s7PfFgHwpVXw1NLxfZwKQwJzfUoP46eW1HOEuQxLJIHcqekd+
	CqvQdjJaYK8ruWIkJ09sRMlBcMIfWq7EWeB3VbgdWij48LOimdIghV9TTcz73AfdssLPW56iY74
	MXJXRYJynQ4uA4rdR+hXJwknFvOIckEu0E1s8CdeEOYEaeICCvjJdvdHXbnATDWJHcDAUPFs1Sl
	zTUVY=
X-Received: by 2002:a05:622a:6681:b0:509:a3c:e390 with SMTP id d75a77b69052e-50b80e75f0dmr48907021cf.4.1774522494351;
        Thu, 26 Mar 2026 03:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:6681:b0:509:a3c:e390 with SMTP id d75a77b69052e-50b80e75f0dmr48906911cf.4.1774522493899;
        Thu, 26 Mar 2026 03:54:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad67522fesm881241a12.14.2026.03.26.03.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:54:53 -0700 (PDT)
Message-ID: <0b1f733a-dee9-4ac9-99bd-7e18ab403d7e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:54:49 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
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
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pVXwSJJKOQGQM2601Ld_gNnjwzQ8PRqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NSBTYWx0ZWRfX/ZOpHliKDMyJ
 zgSQXHh6z/B9T0e6reb/DU+yavdVvWMfFe7G23Io76cRnts1rsurO9Yk/uzBIKTRxSGMrAEifse
 MBnWf5Metzm7gj6mobAWOf4RG4quj14DkO1Xq7YKohjxFU/V4CpL/UnaSr//d7EOHUI1sIIrs6I
 WeeqGjFhEbAjcHTKn7XkW0fo2x8+8q8jbvqfFBqxxl8QiyHI1R/yMMnlVUOdVur8FBSCH6BWEkL
 8FjkYrjXDzh92uOk3PceWm3FdL/IBvaZtC0soMNnjF2slfAEqOdox8SKcSdbsB4+CKevxsaEu1F
 qrGSWCCBidcZG1vyuGNXjQSwCDiqghKjiLzBf7bsJLffHGoyaxBEZXbbgxtvTh/3Cnnw1wdvzae
 FqSELqIg/7+E7i8Qp+AY0oUnIrAXDofCthXcwmxziL+Z4/qTQ7e0YKHPpB/d6W7IaNg2fxqaJsN
 qxeyAp3Ge9/M+yRHsJQ==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c5107f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3mFuQuvshfmmPt20Ni8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pVXwSJJKOQGQM2601Ld_gNnjwzQ8PRqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7527-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[lkp.intel.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4704D333F14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

I think this is correct, the address space is definitely larger than
32b, esp. given the SoC can take 8GiB of RAM.. 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

