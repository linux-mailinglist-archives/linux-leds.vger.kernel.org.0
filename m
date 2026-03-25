Return-Path: <linux-leds+bounces-7496-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0vNzJr5AxGlTxwQAu9opvQ
	(envelope-from <linux-leds+bounces-7496-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 21:08:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 191B132B991
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 21:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 801C7303055A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 20:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC433644CE;
	Wed, 25 Mar 2026 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKSJO4vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhjRPYSy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F2352C29
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469305; cv=none; b=qLUcfuLpph096RMOaVphoQsWXCiVT137eu//mUO/XQyGkTW4tvipkBRh31PtKTs/UN60LXtEvyicVMGsmuRJXOLf6dp2CNyHvAGD7cmEDiAVextgb5z3BrqcKUk8RXNHdkdtFHLU6EsBLrz9nyKsrhD39oUwShIORb+vklPdvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469305; c=relaxed/simple;
	bh=lD2t1AMxlzRcnXK8iTU1zKwGBKi3PFz6qWPKGrIlIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUUXL2bUwQAZaXB86KGmSa6qkr7i3QHC/Vl8yLHl40kdBDnqVGRQjSx39CipSFBGhuD9Dzmcbbsqe7UGo2qDlgLXHpuVGpkEQ2vFvOd+vW9+clKU7W5ZfH7E3pC1w0xoab/NrVBt4DFBi0P2aHn49flOxQvXbmZr97CwJMo2OJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKSJO4vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhjRPYSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH9bn2432215
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d/+7PKEkluk0xu811L4V4ceE
	Km1CSLIwU5nrjfkgJ4U=; b=QKSJO4vx7rXJhpV2pKIpBT8E1U1AfJ1BdUCegOnR
	kOkQbT4y9o2wrx4FQodSthzyrWATXm79MDb7loobcCIVGnsnTVQu96+8mSUX6C0Q
	iS2r0qMVyUMejqNqpDXpfpWKfgm1sHk90MCs/aUQDw76bsPkG/SIcYAkrHwgcVrO
	kmQcjyRD0rIpcHr59OVFqheVtyiA6PiG8giPbV2bIVGMvD8ebMcQFGXBieUAKJhj
	hnDTDBE+xUX6UOcgn3tVeVPYcfgoHMGtXfNER+RiSY7O6aYWbnr4RryqDGtxZRUZ
	Z6ozCgdxPQ5MD/edpSFOxt5yINstAXrTn34oRbBvntYEvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mkeh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so7395101cf.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 13:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469302; x=1775074102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=XhjRPYSynxRZYwbCWm77DykOxkbu/u2faJJM7VfyuswVI2m6zD6gsFxpxcbM0dkBsR
         u6HvMOgV+fm+0QnXom1VzZjrbSU8lF4DoncgMTenvPacpHZqAj+zsJKd9g61FPAgtCk3
         mvR8+6DhqhYI4DgVlvzz3dSi2gWgZamQ1h8m+shjWFfTWzAwuhi0DdDpZtd+4SHHdM7a
         bUVK5qVG4L9xqdKTQHdWW6mHBVGp/+IvOwdSbhkle7DAQqwF+zPUrCp5LBpEUxvq5Mfm
         6tM4Mk3g/L4Du9wMA7300NvzDsMVHHb0d2cF0dATXaf7EArNfVlqmF0wdQtcfq+Sma+A
         6Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469302; x=1775074102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=iwHoIkprGmJwk6PB3/rS2bhYuIiBEoqeTeX8Myw20m6srV0VLsQdG/l8mmG35CWRqT
         is1fV/1QCQdFMUkACuAvYInImR6yFax5L/uF6KZC3YlBgbYIaI7bKqM7+3o3XuYThHGN
         UfaEos44DN80SdY0fjActUWvIybFB+alxtT8/U7ipWvQwGXUowKbGT8ZzwP6vjW2/523
         RCeJOYxgnFV/k1zgetUFURWb+Uk7JABdFljUfIOeMPn1CcQbEUy1jf9cU3UgmXzKaEdj
         /fCoyjUajHAVR0AwiQz8cckITBbA3B3FzzzvcUf5Lwu+TzvjlmvkMfY4MNlU4PEZSWIn
         7x7g==
X-Forwarded-Encrypted: i=1; AJvYcCU0s9c0CEWAYsqjdGroIB6DF82oX1PmTmCc0D8olqmk3jlVO/UL0a3+CQQkG9MC/G7Yq+OuTPiyFGvI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+GTbf6+WsNYGZr2NNAA0vik7A84mJxRMhVQrszQWhboBd99r
	E016jue5EMTJ6WgQ1ypi23Y8JPWzYMDgXf5pPSJqvvX6G9Xg/sJ9Stbr1LS49JWkptJf7CnuJvN
	IrgXNuIxkuussUItLWxV16MwEi5xvipExhkKI+KT3epauehushWtWPxZIeViJLFVg
X-Gm-Gg: ATEYQzyoHjGQqFGv+pzuxEjAmDjXif/74JjMPHO5K1VUdFhRoqUr4xTvHW3JTLDmj8J
	wSUGPMu8sLUGmT2hHDmQx7371tr0K/pBEHGGXHy6RenP0/6LUh+r+VgmMsNrYc1A1rSkU5N0V73
	xA20FgMNiKCxYCq6WSzGh5CBtgfss5EpJ/GmflACyzOBegVR2d3T9Cz2GQEsFfVadG/He6zqo1P
	3dZPMGFnNnCbkpbKOk9Y3TxJoEYk79Ij0xAim2JH0ijQNj5wXHR1fCynz+AftOPjm1Z7OvLDs7S
	G1lVQm+3KWyKv7Yg8oKSkxF9KhsQC5AUb64G8cEm24DMoVhlT6VPzjq6ptLebRB3R/2p7Dx96UO
	JW6lMxmdg7KZwi+08lU2RbIu1Y7b4Pf1h1+veAGmpEkLGiwEbU3fAtvZ9AzUKkYOwC4kOO/c8aH
	2NXD0+j/UtUb7KJ3PgBL4a36i803qSKXKKE2E=
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468881cf.13.1774469302072;
        Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468391cf.13.1774469301627;
        Wed, 25 Mar 2026 13:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5332d99dsm1145711fa.39.2026.03.25.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:08:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:08:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <kirmecnwddfikawqulzwgkdple3jq7euvl45meevjmak654mse@e4wiaodqodah>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfX72tROZrh+Qld
 uqWco6u4Vmqwv8MOVTVCdI6LED+aVZk6Q6HXCIxdTXHWpgoPGp0Ut0WtgQZvZK52I9j7Nlr9MgG
 7+9JwHSIu6feOmkp58782iR38A8VeFMjq6OaHLSFgqPHh9c6OSLmnPTvnXZkLhlAxEECF834Tr1
 f2LLN1M74sbGlLEp/lobvFxqLuc0BS75fWFjfQRJOEQHViezUv9NEHW8EL4on8b0xB1L8z9y6kU
 qrSwik+SPLybuLkngXPgVdMx+7MyiDZfLRoGg8CugRjE1ayYQKWWjZSMpQpSFOrN+miKeE9CBhz
 etJPxN3n+j/D+3v4ecRHgoJ8aTWKYfhFr9te8QR8YY+3fSFxKCcMVrFPCIjZK/zHsXpC+7TJcmG
 j5YeiH0t9PXeVC7mcQcRdt1ZVkDze/f8nEUZihyiDX6XoHn01e8KrY7pQlRS43p+VfRxGOCzW42
 WR6iWX1lFRxP9OLhy1w==
X-Proofpoint-GUID: 4Ef0Cx7OjlsEXsgfXpzIRLJ1vk52jas6
X-Proofpoint-ORIG-GUID: 4Ef0Cx7OjlsEXsgfXpzIRLJ1vk52jas6
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c440b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250148
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7496-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 191B132B991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

