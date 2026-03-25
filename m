Return-Path: <linux-leds+bounces-7506-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ELaMzplxGmBywQAu9opvQ
	(envelope-from <linux-leds+bounces-7506-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:44:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8EB32D2C9
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22C43304B5EF
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8377F38AC74;
	Wed, 25 Mar 2026 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFJVtxNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnVkyYGO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A68E3890F2
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478574; cv=none; b=ORiDQLm5MmBD/dpsQgD7OmFccmeyRD3rUAozMhQALcj/stw2FRA44fgKJtr8Pm/BzOZLDK2UV3FoBNKPcna2gg6McIm3lkCYd3i0dUljAyYFcsrJL+TPEU2beQeT3F5BBYRaHmBWTmI10Qq6PUDPPMp4GnUNYSwcuLg91+LpXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478574; c=relaxed/simple;
	bh=2Zv6b2uFyPwk92Vrj2b4m4RCN3u6OwSUTKvaWzzk6gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqsSAIioWkRkz8hE0vFTuC5jU5jX15nCe2EOC2H4Nn+kjLHhpdQcgNMa11JoKdmnfgFvIhRQ05jgWDY0N5pBP266fpHWw0HP1A+ZeZhFacnzg/fbatURXLfps5cBgSc/ioNLHju9oBho1a/btXQTLySguN+dwaR0sT87B6fud5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFJVtxNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnVkyYGO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMHxFB3069769
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mcP+C5mmyp3mXG+oZ5U13jAT
	3Ccsoj1xoxf8jggQrtw=; b=LFJVtxNnemQhCUukDOSuy2mALYTo/ynQnUq7jyD4
	/UsDzSEA2cJZRsRRPBGi1l6t0Bx3PfTvQFZDU2q164M+PA5JDOEU9heY9HTAHVz9
	uu7/MBhUH9YvPiF2by5+1iZE3GvYyzD0OfMUunRdbs4jrMUIY4g6e1TJQSW1N5f5
	JTxAQWaOKl/5vM5TxWQrhZj8lNNcsBNwrAaWautqrzSv8/EcibgyGtPfkrFE/rKL
	NbPF9DKdjrjwrs27TIo9EBd9Jra2ekhQRc6c6G7VT9Aa9fRoarFtaIKFbT0/03Dz
	Y7DLikqUWHwPk8lQsz7SdU3QufPJmHOK9w95IgeTRPmHdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn022f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso13110271cf.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478571; x=1775083371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcP+C5mmyp3mXG+oZ5U13jAT3Ccsoj1xoxf8jggQrtw=;
        b=SnVkyYGO+FgXwjyljnITNcNGvgc3QawI3MSiCNObVSUQN3VrFmneUWx2yWidvxILc4
         ZPsKfk/fvNh2V0+lWatCS3qLZh+IBx3b5QLnRmwSbuGkiN6566V2HwqyBh7KVAtTI1qb
         r5HX1zgLM6a/se8GiW1LJkwtbUw4ZaJyldBXAYCFc+O6sjZJg+t5sHN3E+NOrWO70cDX
         z1fYjctk2HfoCr8/J7iAJUjwrNSnd4w2fEickgi4QGnOQ0s8YN99+72YN+xtbWPDl5A/
         Y9rj/Qlj0xR/YAYbi7qYDgy4lPkajpU7JykBmVmIO+7PjJtJWMUOS+/mJPBs9lh2RDgP
         znWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478571; x=1775083371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcP+C5mmyp3mXG+oZ5U13jAT3Ccsoj1xoxf8jggQrtw=;
        b=lcfcAtaA/+YHeGd7LRQa6P2t6UtI2hUZqhBXTm6hkw190upcGpPKTqe2Ap/J03qz+d
         U8gSE5NCC+Nwie5Nv4wVTysJCU2ZXDbwD1oTLodkXz8pFZBECew66s6as3dSJdPqCliR
         QQsxVBtVfxdJ18SfnmqsXpoM/qzEZ2IdBuZVtWCO/WXUkrp167Fkhk1lyl1x1h9aK7eA
         9zlU9YEdqIdhg3LrLDg5LW93/x5NM1wq0NS18n+IqrRZNawIi0fB8tQHYiALnYPqXbaE
         xad+/KnnQJgcJDh4JU4IPr+uaaoCc+lymdaRfyZRRJ0LFnBu6JJnuLiZUgAgrO345qzr
         MzZg==
X-Forwarded-Encrypted: i=1; AJvYcCXIZQ66q9eR2/wNbktrhfsQWdS1UIFw9x9/UPKP+6ypasqDIob3GCqusjlYt+NcZzBlPTdPi+EllnsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/NdVKEVfKcYHoMZhJ+tGFCFpZFBtrAsFeo7YHKZXxXT+Oeac9
	YjhstHdre1H585Ng1uiCinVZbBi2drDq4ApUgw4ftLZaBONGvPpz020gDq8oc7+kz/zqaFuy5Qs
	d4AfAG1J/Oe4xvuS58CjLzkTjPL83jW4bLFhByzf0j/CxStW1LVYrKfaUyqd+wCII
X-Gm-Gg: ATEYQzxi3hyyluvrSEh7VWGfricBYlJZtZaLTpSJ+nLDd3qGIUFBUUqqoqmIJlGU7BJ
	pR7hSaKCS3p/NEBnH+ShdmYVVXcqR4XCx3HL+g4zNIkmxTu0Bw+LoFcFcnAYanx+CikdGlrFCJr
	gqvcXGNCHzev6a9QesO7vht3rJ+7DEdSKPPJwu27pq/wuH0sV8owtmJSDv1G/NqqlkAc7pcJfjT
	/X80tuCx34UeDCacBj26xZ2zjSVN3csqkXrh5f9m2l1WyXUIjfTHU/X41IUGRuZl8vE+r4OLNss
	50mfBwChH++sn2MfJLlSrBqAjGZYgbsrZJ3msOaVbGFKxbccKE39YGjRAM0InNEfunlHtEXlbmR
	usgmbqibHLZlWbITo/gFtjlprxyUbPitPeoLotP5caZYZmB2yI/cbxvKmpabk/e8r2kzfT7TsVt
	IdUsyAbORu9bBWri96c9jGccif8boKfeK5T3o=
X-Received: by 2002:a05:622a:15cc:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b80e4b3a4mr74064881cf.37.1774478571622;
        Wed, 25 Mar 2026 15:42:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15cc:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b80e4b3a4mr74064551cf.37.1774478571250;
        Wed, 25 Mar 2026 15:42:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a069903bsm165984e87.76.2026.03.25.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:42:49 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:42:46 +0200
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
Subject: Re: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Message-ID: <mc7myusw7ehmcgarvndoylyhqdplgr37w7b4nttj4fn4ygw667@52nfrzyejqwl>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c464ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=TIRtq7bqiOsBIkxYvl4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: TpsgzSl0BfCblPxXyG0BJhdTd6wYjfOs
X-Proofpoint-GUID: TpsgzSl0BfCblPxXyG0BJhdTd6wYjfOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX2Im0QgcK55V4
 5pCnLLBr9CVemycwOcxEMHHS1C6l+n/s1XjxBN3G7h8sSKHrqoejZh+xQrvEswSgYb1IJj678kc
 Jr/5vLQyRFRWUEhA+YT2/tDIdEHBIL9IYEyD66Za+bvjwbLydCBF1+OqUqKb+szpEvqqpSsT6jK
 B8AJbptXJLk9B/XgelYxdocye1puKtTeC/lEkrTM9OM9DSh5GAoQXfURFtk8t8TthVV8hwZn4Wi
 7Qb3gevG4/Bf7gsx3v8wPIXaUCjZNvMJyxWU2pU6oQX/MzTboIABNCNT9bwcDUQ8z3BVrL3UWsr
 c6jrUqRtczn7t95yKZbSU5nLLo7dgmcdFhaspZCwkB+XBf14qion6Co5hmWM8QmFwF000hyclB1
 aMTdhJXJEo+s8ZiZl/QIudJR7qKpywCvKt25ThqTXv327/b8YShj1R2YR3/F+HR6Z3xnrPItOhf
 aNn3yAXP4t5tWuacIGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168
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
	TAGGED_FROM(0.00)[bounces-7506-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 8B8EB32D2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:30PM +0000, Biswapriyo Nath wrote:
> The '#reset-cells' property is permitted for the SM6125 SoC clock
> controllers, but not listed as a valid property.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/

Fixes?

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry

