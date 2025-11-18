Return-Path: <linux-leds+bounces-6179-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05822C6743A
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 05:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 845423656ED
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 04:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D6E28CF4A;
	Tue, 18 Nov 2025 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeNjjjLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbVLZ6WS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5597826FDBF
	for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440271; cv=none; b=JLxYeUfdhDjZeBevnQzC+mhM7A9o1hqHYYTFDWI03FGN66ltpcyL/mM1hdUoMk+mi/IjT3BsIJ/VgpZzOTz6XPGshBlIHurbDO9F+SS4KwCgAa/oLkmQbeVKtI6lL/8f83T1HlSKRTYRp4tEiKBcB12A+O6h4Evogl4pc2yxmiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440271; c=relaxed/simple;
	bh=HavdvHtaUmsPCbS17TWupL2hRZZl5Of/xAeauK0azg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6bfcJ5eW9BtujVAQ9JdEx8aD3zxaMjZnFEJsFR31BKnN0xUCzB564XlELZtBL590C4aD13LpUBx+Dp3xS+nV7UvLtC1gvGWq5Negn++KJfmL5MDaePgAm7rHv6GuDFIaesY5Iypr8wXNBxawtnIds6Xnw73+V5Q4MXgRH08GVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeNjjjLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbVLZ6WS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1b9FF374189
	for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 04:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XOqRyNm6zGDnKkA4W+0GBFVa
	0Eebq9X1l2piDS1JtGA=; b=TeNjjjLXQ1iBjHdBfCAZiLw8sAYXTKTvvseUi9p2
	yU06+wE4RF2P4fgZ/lTDhhB2bJjLZ2UaGGDLNLtC0DHGapL+WGtNYpglphnZRG8T
	5f7nHzdxbDhX241wNVe3ivXwtGXjsd4TGvBhZVelaJBNh76IAVd218gwliF8OtP4
	NJQbV77czO73CaLYjsvbVzDTmtS5cfFK2fnLv2c9C/J8l/tR/chDygZPig+HY/ym
	xf78Wm48L0nzV3pr7OVoD6cm3JZvphGiP0f08kkAtSzva7ZsfvgeGaaI7C5ALNhB
	OtmsHaE+7HuFXOKB6+35eZvXplj7KJ7iSwoTAflGYNSXkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag599a594-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 04:31:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ef6c8340so497520485a.0
        for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 20:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440268; x=1764045068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOqRyNm6zGDnKkA4W+0GBFVa0Eebq9X1l2piDS1JtGA=;
        b=bbVLZ6WSMfn++wRgaC6LRnsfCBgQnXyDUNzsW09ZUirRjRKru2me8GVmxLSCs6wPEA
         w6IfSqpgHIfLcyFJiIynrJgulbgOeUgzo9KEltyGhmwDQhUZbamdKBmxHUBU/AWdvCWu
         2E1zfznU7kd0xjR8nk1FC19XadYIUspL8RhjvRVpsxZQoMMrIXrqtawnwLxKkuGQz4LY
         o6xRVaAT9q+u+kYPOa+wN+UJppd1WiSez90g5wGL9crlt12wD+kobmRm2KROprzZMoBY
         IMOPlSFHPRatNFqNWAnYNRbV5BX2JSzW6cS6T+7bGB2AcyiuO+oTcjKh4x2fHR7wnkjD
         3R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440268; x=1764045068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOqRyNm6zGDnKkA4W+0GBFVa0Eebq9X1l2piDS1JtGA=;
        b=cz8jM8DbC26uKSnTdBN2KOvv/tyDwwO6AELdp0SoRk/u1Wd8Fdo+cX3qxeyzRDvwIT
         oxmLRvMQqWjqlh9onu89/w4kzRhu/noFupXuj3fA7g6hi51He6NjwsAcX3z1mDQ+iL+p
         +fkfyCuiW2C8fQsdwZ8XAwgdaXVne7bUMwQFfHO/C9aygL83ozwN62kul8NXLKp34PcS
         0/WI+PuyDX2eXdehl1L8rQ6R3GzfH6oXhZeckjedQ+0xJxX81kAmQaca47a14Z5236cZ
         PsjwVBcZqCrXX7cptbRRxJqQwx11Uc5FQsfTfbOdj+TwfvtsT0Mim+qI0cC/q0VFWx2t
         x0PA==
X-Forwarded-Encrypted: i=1; AJvYcCXMqvJ5Htgc0jJLkr8HsWvigUoqK6gEOMn1HZm/OFaf5zWCRdjcNLjlOSSn/VaQz3olSIDLAU69RK+X@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTT02qilM7889bs1nJk+HXpMZwOgnX/iwLNNZgEwlD4wvXPvn
	tyoJqKgz8Jg6pUawCMtIkjmUnGvrosw14S3iOq6b8dVzhg+tUPT7oqUOphPypyMLjxZ/mvFc+Yu
	kmbyAlCkwkIUKQyps9WJkdnOMUwPRUgP3Kye7hicTyAW4FdzmhWB6KLQlHLZOZPK+
X-Gm-Gg: ASbGncuE+WVYPYt7JzLV53L9sYsXrQegCc42nHON/N7TWvWFbUG2iebXiOe9B+5ijJH
	K55wz2rspRJUqdqHsRw1h/zSG2mupCJEmKL5v1g2QmG3T/kcoG3N7R3n/ggdwUTeq8TKRGnjg2p
	d33D/18SrFLLyiF4vZhxkPh+HiumKZ9E/vUHRndHlgdXckvBTGw7ItanIT7KZvcGbMb7XKsMgwu
	eENpzxfyMgaD5BdjTVLtO/yUTpjWGIEyiC+WCUn8QaFrpQO6cz2uKfidfQkUukgCgeW1riZWIef
	YaO8SJZxp9H8dRDwTYF+d4JcKmQEXeogZzYUzM7h0xH5Jq8CKg5cAYdF/w2SQJmbVtJsadV4bRm
	U+VrP7OYcOVxXlchyB35xqxu+6rjMnBsK1C4bqpiTSXM6uyIAhGk+vhmag+XG3M0/XBa+0J922I
	c+wv1O3AJjGMR3
X-Received: by 2002:a05:620a:414a:b0:8b2:aaa5:e88f with SMTP id af79cd13be357-8b300f31428mr232180285a.30.1763440268427;
        Mon, 17 Nov 2025 20:31:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGINp4LrB+FLyj7KzZYhj6XUNXFOyCPdfbPL47E9cNSd2RbBsvLl0Yedu+4HF+/OLtvSbzn6g==
X-Received: by 2002:a05:620a:414a:b0:8b2:aaa5:e88f with SMTP id af79cd13be357-8b300f31428mr232178185a.30.1763440268034;
        Mon, 17 Nov 2025 20:31:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040049fsm3651658e87.61.2025.11.17.20.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:31:07 -0800 (PST)
Date: Tue, 18 Nov 2025 06:31:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI
Message-ID: <27lvlcu65hdtm3nlovi43pfzi3kwelgm5ruzhnwqpmxdaepnok@lqeq3y2boeyf>
References: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
X-Proofpoint-GUID: AVIuz4MOw9LDZsZUwaXNtX7h_tPYuLkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfX7q/FDMgF2I/t
 eVm2wy+gppRifT1vYa1xuFqdeH2aIOmixlwKvAENkDIt2IPmSpXxuPzvcM9sQluhGsw+oJWi83h
 bKt0NDcP/Z7dvzOaiHl9TMW9f9OrakblGiesS88qNYB3H5SgqwWUtmUfEWxrFvXimA8hQLWiCx6
 MFPsEno3FBMMj1hktaCBWkg/DzBG3nxc5NTW1XIN7+ous3T6nIYxBkvev8caksnbONnk5SmILh4
 YzCu7fJxwgNWtJNwVF5KDg/A9H5oYaeK89XL34a3aX4UfuHFgroQsFDSQNMLKrGVGbDIgfY0ED9
 H8PryQ0kdoBtpSoFzS77iqAs2F8V0oi2Ch9Gqv9eKYJSeqovB8OUzzjBCBSumzBk9wtPGPT+8un
 a2KbE4FEfFHUAN4G+Di//p803d2vOw==
X-Authority-Analysis: v=2.4 cv=HaMZjyE8 c=1 sm=1 tr=0 ts=691bf68d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tMveQlRAX1j2jsrkZ7EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: AVIuz4MOw9LDZsZUwaXNtX7h_tPYuLkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180033

On Mon, Nov 17, 2025 at 02:45:59PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's nothing special about RGB multi-led instances. Allow any color
> combinations by simply extending the "if _RGB" checks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

