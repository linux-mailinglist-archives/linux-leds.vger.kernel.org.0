Return-Path: <linux-leds+bounces-7505-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePQBNyRlxGmBywQAu9opvQ
	(envelope-from <linux-leds+bounces-7505-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:43:48 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6532D2A5
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 908A1303CC0A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEACD3890FD;
	Wed, 25 Mar 2026 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n01125Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMYiB+qQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E238239A
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478498; cv=none; b=VULdF5+lChBQgFDzJ/bEvVRWvYH8UKP9W5HkrRdOg4hiL/sNTv1rMBTEPtviCn6MIDxXywXvoFduHIGouL0NVcrJypxWImyF9xvTMFYdXkUqNmDVd6qfMagyXMOIxoycv5OmkF/16zMdPGRZV2Mr3Dn/nRXWqcakD64wDX42Krw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478498; c=relaxed/simple;
	bh=reMknFJoiqNp4mtflM/9KnhX9fgjE3GRwZFkcGD+Fb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj6NVP0aOrSHw516ajwQP/UGzECf+ffjYQ0sLVSMjQJ7hVu3bqPR2ZcUzv1uvX1lUtSMGC0tfDlnW3inEdeApaIU80ULSxMKpnKntk1fyJO1AGlvSkjngoS/dXDF6TaJI9EeQrreHJdyrYFLL7JNlL4DMEHva2/C8hSUpP4cKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n01125Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMYiB+qQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH8Yx2737579
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MskXGsEUY9X26Q4Lhi8JX7q2
	GLBZq1hRtzx+iwBExXA=; b=n01125ZbN+KnMlSr+OetFhmadiRmMt0bJWr64P00
	89KrmUqKceQyI3RUVdKojgF+ZgDVUui7OcFniBTrtD+Iz24GdHc7doAns7E9CiTk
	nt/KhkxExEhNozicRlFIC0CrkSuqG8Gsu7vWOUNpLejYRkOOmTQrdLwkDjN9igap
	iJK37cBClmOt7kgs6JvhImYfbIWAulo3li7Ybuh/sIlHxHs4gyz6n5zgGuu1kVTn
	hLC9y5iz2PoEWn5HEijPeBZTfS6P2YtgW2wAjE1zvAFpQAo+/++1MHyWBeDAvDP8
	+igEx5FTlJV9i26rCyMGYf8/R4y9/FH9XL6UIe5uJjmAfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859bvjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso15315171cf.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478494; x=1775083294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=IMYiB+qQ57eoKocLtiELbbp4jGW/ZGRka0bjB2CRoh093YghlQKq2cWOgmtlhLQE9Y
         kdmREAF3W+iigqOvD+RzUc87L6GIJ0W8IWSN6YyOz+yCm3qJVyEBDMpCpMorqG45kIrx
         pUYcZq/w5EIO3dmlXipZwBJOFG0OC8DAW87EEB3pZ52CA1kwmsxQl6D+VkaXyRpDBw/9
         b82EJEtvBlQ3Pom64I/my7z/UCvSN5vC/RHlZi2Nw8Kiyi82D1yvT88yA9GgfKSo8FXw
         S5HE+TvQ1Qgd6SQ/Es90ncOGcLPwUDdPw5e65uMLEeovMHs2K6PmuVD9xF3VLXOxxhJN
         ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478494; x=1775083294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=VGXWQXdLhaWPykl/1pjat24D1WzoTHqv5iusO5e2UR7tv6JlQqlEPM7I3KTsHyzLG6
         vSa6yYEe2ARwaNab5qF27+t8fnJVm7dhLSb4cP8jeaTkZOxAIT9ab4dLUH51NGvKKAsH
         Mo9kscGk6Iv4jc81xreE1v9TIL9gvl4iflSFgQFAxqPvc/rbjVfILPZu7J1Q2nJE6Ypi
         iGekGH8v0Zc3BPnfu4e5MmFl20i32bO7PQkOpWa+WudbQ448q1a4SWCjLjfW4pnVvm1P
         blYgw4NkQUdG/3OI3XOhNaoMZ7Nstz5jbexoEZ0yN1IoDokGljy0Id8B8LF/krCCfu8c
         ydZw==
X-Forwarded-Encrypted: i=1; AJvYcCWx4NkZ83+Oqs6Umjfm0FSk7Wgf5y3DUuf8+4dRisYjDkLdhjnYjNV+TP8TkA0c55PiJUOPIWfO2pgj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7QLkLpLRhwZQIOj9YQRIJzPX+i3RHRw6WDpg0BhzQo33OGQjW
	epbO/2MjstB1Iuu2P/xrna7mYOIROPRWCpdqJl7M3gLS3yKW6fWkSD3pYxuWyLSSsoJzxdAMqdJ
	WNbK5ZRqedkm3tqmCqDE06/08gbVW2DqksuO7Lw2b1EyadmFaj3HAkK2aLQVtRSEf
X-Gm-Gg: ATEYQzwC8+P4md3ml3JI0LwaswpzwyWPYSfewHvZqjpePCJiGZ4CEtLNwtqxnF8gDR/
	4oU+TduXZOiEQXdH8wImvnoLmViC3+p/pLZWNfRRJWste8VDm7hEbEtnngYqFaQBzoNywd7lHz3
	RxoLBJ314MhVFLjTrto2fPedSA0jgjsmivSYlKTf3D09R+Mtr2Hxt1ewk8FfHCG7EPnsrD8//HM
	FWP25u177fTUjiXXh9gvZwKF2ycKqw58jZV3sz/AKUbxulcK+M7Ai1iLmbSLW/+Rp1F+URB3EIN
	maospIjXf9Z1KquqLC6oikcdAjIq613KBFTpuaGwOsbDQlrUU0yK5dHzG3T3OWXG3kP6qJnTH+R
	QptuLRYFlgDfDQyNwY8fO/h3RNWKocXozkZx210oOuDbUgDtnAxlLlCGVIVlA1n5fWliAePxNZb
	rIq2evJlZ+TJCJ2S3yAaluWR+xe88ShSaZu8M=
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553991cf.16.1774478494532;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553741cf.16.1774478494141;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064534dsm171727e87.18.2026.03.25.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:41:31 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:41:29 +0200
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
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
Message-ID: <yfm36fgq3muz6cw2bizgg3h7bejq2tj7sxjeorhoi7tafbnnjl@qeipinzvbpkv>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX5QsdjJwegrtK
 eXdBz0Z2PGKWWlKRymEfKrHqaEihVOhL70qokaeCLWw7IQYXGMJCrNpV3+wPMk3r/wtQG9ryHAA
 FI1GhEG6Ssxhgnj1SwOYFhQeAeipEEyTc7MI/y72UGJx1Swxi963f+h2F6KA3QTwc2warv89jLp
 cJ6H5ft6oHZLPuxPXMkCgQlgJCU0YInJFPatdrJOXEZZ+aPd71x8C1ye+sFo5IX9eSf5XO+AeOh
 KuWKc+PBcU4bKsCb6M/2SFnty1Jzl/lNRcGClFLWERZ7te411y//im8xHxANaO+0Ku5HaGUyI6U
 Gr0ousLM+qdG/AzmSii8WNZNDPR8iTkWgk7pSBVI49FGtnOHQZHHNWCoq4LsoxGgGaNe9Pe8upp
 M36vtfVw5eOWZTWrePt83fNB+vZiEFmxgmS4u73ArpEYqrDxOMsIvOT+wdOBz2hPmcIBkHAUSlS
 ZJFLFyF/p+Ye1j20AXw==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c4649f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=3mFuQuvshfmmPt20Ni8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gKM_lzLlTx0iEnVuJ1kT20FUa-7LfeyN
X-Proofpoint-ORIG-GUID: gKM_lzLlTx0iEnVuJ1kT20FUa-7LfeyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7505-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46F6532D2A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:29PM +0000, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/

Missing Fixes, cc:stable. Also please pull to the first place in the
series.

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 153 ++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 75 deletions(-)
> 

-- 
With best wishes
Dmitry

