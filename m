Return-Path: <linux-leds+bounces-7565-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCWWDnD2yGlUswUAu9opvQ
	(envelope-from <linux-leds+bounces-7565-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 11:52:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB707351741
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 11:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75F7E301753E
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC222DF14C;
	Sun, 29 Mar 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBXDthx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnXl+ouP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B332F0C45
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777963; cv=none; b=Q6tH9dtQ7JZDdOm81Nt7h4o+CyNLzMHi0CsPwGQxSEoYNBpuw7P/qFJ1BQg4/5I+I0N+NeGDKZcKA2mgPEzFQxF3HSL6/UYkjV81Vtc1WamJ0Jn/bW4F8i7uazFtaDnOH8k/YZC1cegtne4+7Z2j1eH7nq4jB/xp4Otd4wgDEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777963; c=relaxed/simple;
	bh=7I1eZDkRK/wdoYxZ7s+Ps63Cn8C3cZQaKdTWPLvtd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2W1wndfhNM6vp8O+/1wQvuLs0mWUZLFuklLb3cKNGUxseI+2YZzha7OstNMW9pFBJyh+vNA2tCDHpWnEXOgPXR4uaI+7OMLN/IHo3AME4M7vJIpWUDkLwnP9Ear1d9rdzF+SelLeR9DQFn+aaVIyp3A80HQ71OjckVBiEUb0cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgBXDthx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnXl+ouP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T7TfQI1228532
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hAyNkY+C3fVpD3lC1c6+6VJB
	YgiejZKZd/p+VA35QAk=; b=DgBXDthxv5tldkiJRuVhdhJOm1JntCp8ib32vvFd
	RoBiF+V/tECzgqQFTGzs9azaf3Kb7oG6v0MhZzhdQGzhNXEC6b7ubvFu+QNZ+TUt
	N+tVoeifX6wP6uTT3yhnPvxuXtNw2UV/SNnqhAiIcjk5PA1HwzB6n5XMycT5Z4Fx
	cOcTh1lVqwNYqbp0UJdo/qMTZeeTPXm1RwtRmN8oYkVW9ufbYq4WbkneiLkTuiQx
	OufqQEIixd4QVQsZuGxRhqWwGp2Nok663vnGN4CcncCmNxzvFj6hIhSBpTJ98c9Y
	cyAmjXYZk2XxDjitYA4Z/t64eOC74HPnFcFbOOs9o6UU/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672uahwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 09:52:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso104090141cf.2
        for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777959; x=1775382759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=dnXl+ouPVigFEwqbh2pAOGlvFbzv/+T6ea/PFG9zJhKr3bSLktCImrQvBJt+b+U0HE
         Y7gPQ2alC8JUaluNfdvvSipJtiKTtDh2feUz5vpTypmLTjU5BnkC15neFXdjvKdFUXBg
         50EBgUJcir1xyih6Ju6AMI/PXwo+wj/tp3MB4EywvgX0fA9TYCbt/2lnvnPbrnieHFX2
         BxeogZcOVZB94yD710xJNzrLYwZ5ZZuUPy5j5MAw0xyqQVji3aUGij6EftjOJGG8ifTC
         Iv2mmBp0kadMF3pR8dQCrjYJG7ecg0coMpDgkP1QmMvrP2/zrqLhveKglJwSPANd71DQ
         i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777959; x=1775382759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=TJt2/PAzCjk8UBLWCeiARD8N+4+3z+kjdD82s0kMa5HlpJRn40fNbkojzNoNowDvjx
         GOvW+xmMEf69VkHNodjAFf60Erk8gf/0M0UOMwxK9aGS3rRlR5dTdrAvY98ZSoHy3YOl
         zfyVycHbPhESTL+7gFOk+NIfoX5gkyxRkWvXrFpS4iFjXAW8frNDQgGhOg73IyCIrX31
         0TgGMjmD+SwuiQfgDcT417rZh+QzxFghhuT8yBOsQClnXMwuZcoK0FACgSWDO+mlxmXf
         T2WO5L9XuqFErIjZhQXFjr6IQXeJRVIyeKbmOi/VB3bD+C58C0TBDGQK5YCMmW8t9xp1
         mXHw==
X-Forwarded-Encrypted: i=1; AJvYcCXO+M0venTnj0FGKUXda3p35DGWrdHB7up+9c6dsWa7vXliVNk0jDhFkuTMYYjhnjrSnDmCG59H65Ai@vger.kernel.org
X-Gm-Message-State: AOJu0YzTi5bhc88VRiKV6pSFei9bhyrYP9R1lf2KrxvBdkXMOIU74zf5
	1LGBYuYWij53hcfkh6wmdeRG2x+l9lvQoS8b+MXzBpsTF2VsFL/wXxvJ9LRFywEtUWhy7z9ACyI
	eF+gFeNdy92U1gwaMzho6gWNzBdbpNftMBU9rDUDW3r9WwZZvriRQuG7oS87ADKFJ
X-Gm-Gg: ATEYQzx2+YX+kBFKGhGRDEyY45vc2z2FnopiSPi/4Vvbww9JlHT3GYM2CNAuaEuODNM
	aNAic8z+8l3NFEIuD4I3f4riVA0dsxuKxfURXHK8lRUiZiRZfNEq04KqNsig4JeukuwY9HqMbX7
	GFNBpBIiEtCVDRfZ2Ir1OvGOZX58r++b9nGJHIQfN9sTJnWv0YmxYAcTlxTvvaGBFcKcLY/V2tp
	oqAUWvtTlmy2p/fwPpomZiwaAdL71coUda3n0WQvZ9rXi5C/JT/8H3ZtXiTl56ser9FZSQI768z
	OKopuoAQ9TzQiUu9Jl5Qa+tntHJn6YoSJfz2VF5K+jFDdWds3tQi1J98um/+fbLQmyBbqWd3srd
	opVUHX1Zs9wNkrlN18PR95LtnoQA7nFYL2faVdFpB9KsYct4Thj9VRGBv/oROmYmLA7KpQB9Ne+
	rDL9KXYMz1ZCI1yzm1yQ6wf9mHSmSSvwwZGiQ=
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867861cf.4.1774777959413;
        Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867571cf.4.1774777958955;
        Sun, 29 Mar 2026 02:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm8782231fa.42.2026.03.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:52:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:52:34 +0300
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
        phone-devel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add
 PMI632 Type-C property
Message-ID: <raecqyz4r7je5s6ecyclffwoi7kqt2oqwctj6aevj5tsfuxfkz@5i2jb5i62thx>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
 <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
X-Proofpoint-GUID: n-Z4qr0EgV972ZsVVb-lQTm6ULM8mDSN
X-Proofpoint-ORIG-GUID: n-Z4qr0EgV972ZsVVb-lQTm6ULM8mDSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX7e79l9WQzIAp
 3X/er/zn6pizvBIArmCVnyL8w/YnYVt4av92ckmNW+DHPqRo9nc0vlsw9oiaudkODfzeguaiyqp
 hJKoZLeniJTvQMKffCC8DAZqt/sqmlqzGpMRhCzCRa6BWSwPsxLAlKNxnOkwPnq5f7bkZb7tR7H
 2gtpn/UjdC4dnqhMqwKaJz3v50sYDwEwEqOUTO9wFbwZqDbVEbgRpAWl72v0SEGouVBi5qvtjts
 zmNVy7RG/ew4bJobQRFUbjJVzeKvZHGG6GFUd51lEob+ov36nzjHKFX5Bf3Zf+I2a8Qibv9ZfaO
 F+c2AZYNmlqmGr/WDT0IyGpugl90LfTl7huJJzh6rfnrNzK6Y8VkWM1mzVA+uMxRUqXzXUP81su
 N0W4VWhWIXhX8kpMOqshzWJbjUDmtYjJvi5MvHKSucM5O59ToHpAEsJwsu6xw/UP1GplOBWrsQ0
 kqg7RKDAuI8fD9zKVvA==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c8f667 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=4paqipjyf0t-I0uxfbgA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7565-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB707351741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 04:48:00AM +0000, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

