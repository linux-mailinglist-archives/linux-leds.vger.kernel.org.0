Return-Path: <linux-leds+bounces-7504-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HRILBZlxGmBywQAu9opvQ
	(envelope-from <linux-leds+bounces-7504-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:43:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68832D290
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24EF930AB673
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5FD38AC79;
	Wed, 25 Mar 2026 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmro4bmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6G5CCca"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB77382F3A
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478433; cv=none; b=NRN64yuTUqzuyysfN2r7hBwY3ETU4RIS9gD7OCl0QTOhDrZtDJs45oYjSbjpHraLAzFR8XBmtDFQjWLWMWEG4mFub8Lqk/wIbhwOvzsBGcEMsnZw80IP7fS1g5tiuOWuQlbNdYtAK123xsT5Ak1IRXjXP627JKbEE8ocylCQwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478433; c=relaxed/simple;
	bh=M3wrH4b+LRUZF3FN2M6DKwvla4BfXgDsUeFyx4ljtkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do2zashTYWbEKRIlAdJ/X24+5YQhFfPielsUQH3eCSvidI4YvR30NLjnhaxWVeExwOo2Z8IVuxm0DxP3iyBggWs9DpCnRaQZwizxL4BZ0Ki/fP8DflU8iKbhWZJvG7j3XyJcF+L8oy+gpJQ+cc9/yIUAf4SkzL9OlZQCkyueIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmro4bmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6G5CCca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHJoV779839
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKYqQ0dwW8xuJgMJdvmszTAy
	PcSofCCo8nVIzS48A1k=; b=kmro4bmonc+TqGDtD/9KUXC3tqseV7KpjWqogEj4
	a0QCUv37Nc03txe184DLxG3DcNMAEoMTWEjzHgCSmvePIvgsJHaF8W52m6k3v3Dc
	9/b7KDE/GLX5XqOQpOT3Vbc0zidboUWQg2D4Sw18NjSctgF91TSiOIRzm1XCnGAX
	4lO4YHdu/cCcyynOe5pr0vTJjSakbAKgZJDwQJ1RDaU2wS+qKW8MQtD8ofruTqO1
	FTqxL6x+n2LuTOXcPZ4IWvv7bC8SS6T0Ltp/uUP64z4DrIjp196uQhYvUpN2pkNF
	QY0MgplrkHC0MbmUB7H4FRnX0tT/Q13V5MA22WDY6NzdLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp2tdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 22:40:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so12079611cf.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478430; x=1775083230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=R6G5CCcau/Ei7EWBPVn13nr2bAFAaL9Lnje3bLaniCl4dXD/R/cf9sQDkqi7JlBaBX
         /jf+VS5aiZdJOioLxD8Tx+IQEVttNC0bofzg/V8Yi2kwMALFaTmYfRjBU1WSbA4XsFg8
         INSveh9k2z6SBfgRNYiTSkoILXrTnGrRmTZnJRKX0k7BGpB7XkAhREyQPYSWzxBizzdn
         UAMHTlrRjCzq2Gvs1IBsiPHvAdlES2gwQ1BI3ATv3YB8lzhF2TSPvuXHqzU8qzDnG3MM
         nt+crF+lvnM7FZ1wZvmafKF3+tO4Og+qSpUBt3HF9GNPwSBtbEEfWdf9qc3/ISfLa01Z
         a2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478430; x=1775083230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=RQf/iymT4PgKPy9x3RUA9dU8oLfPYjwRtLX4po+WPealTryKJ/MRXd7GKKLsc6q8rf
         3NqSKgD62Onk0j61LG12GXoIIxO694qaeK0wLfZeNV5Fy1TFWHGhDgfiwJ0ROM5hPr4H
         9QRlUgFkWm32VzPa/MR4cMJyIQCeN4/DwteaPEcGRv2X2uSYp/2LDD2U3rrPxJBKdbZj
         BRMyOaFq3krfRV/u8b7Xp6EIE4XzLsz1O45KjLNtbVyTErlpuSQ0+kRx9eg0XlxYS2W0
         ZUxKyKzqZOpoTbhL9+MhFg01oCMknZT3VEC7ln+jHEsw4FrBvHY3oTumdVjkf9mivuFO
         6CHg==
X-Forwarded-Encrypted: i=1; AJvYcCU1WqHeQciknPtx/vBUWipcRCIbhrsNvgQ20xVXyU7HiOCDWs8HotOxeIBMrMBaq6bUp3ahI1xDe0lf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jdqwu9CZKP+rXkfoTbsse0ARujpyGmEKJi43Ll4Yx4osJ47R
	VMvuy21gG4cBwYefORkyy1RZE6yHdDP50HS+rA4AKdRrPYL97w8ZlxMvUMp+IHCxDkqLMrI/9JQ
	a+XN72YLgehNgTJjQLrQinQI3/nDy0hS2CN/OVAWsC8W3UxX0BM3X7egMIjOLLZ6p
X-Gm-Gg: ATEYQzyVvQ1TJPCRnbfTV//XjJ2bQD14w5+yH8HiNGgc2Qe5lS/Znu0X4o77OUZajOH
	2jiB3GbV6vHw0E7FAMvZOy5BbP2C4bthSdFL1Ti8wswxeaUwv9cAklxz/PDQhSRgxLfjDlnWt6q
	roJcvinzOIQXypjZ/MjTw6vaOdIQRSUrYF4Dy2h5aWBwcjikRrVEBYlCop0n9zsbAbbSZtLdzc3
	hx0MF5OEhfy9yJgDgVnri/L0Jo4lvRKvVSi3hLoa9+iEKGQvt46MZvhRU+HtfAc7p/jcUPLt3H5
	z3E0UHu6SFFnWT5uR+O6mkM79eEB0nmrAP0ZMCtSs/F2DWkmfqlCSyY3AMzKcc6sGVZEv/7BYq8
	WCdsFTEAaQtKigv8pRIPTQbHbTyGwC3+I5ajTdX/Ag1VZirZqWw50GYqhVSEGZ8seCXjhLGQ=
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662541cf.4.1774478430175;
        Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662151cf.4.1774478429762;
        Wed, 25 Mar 2026 15:40:29 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm1810051fa.16.2026.03.25.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:23 +0200
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
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Message-ID: <67d4gbz5tccughmlb6tkzv5fgduo7ih6ht2avcq5o3deiwjkad@wt72gfijbx3u>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: 5rEJovSyFoq3hWf5Kjm3Hrub3j_Qgb_D
X-Proofpoint-GUID: 5rEJovSyFoq3hWf5Kjm3Hrub3j_Qgb_D
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c4645e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vaqIg2kkDvR5jWT7QgcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX9ocRFKzQO6LQ
 uyh5r0PrAPEXY2urDrZiC99vVVH89aAbIEKwVLI/6q5Qgh3ZpYpnytpDh2TLm19NocTIJjJIimR
 r8lnlKLypW8b6Edy88IqQiTKlKYmdVVOi/ZqJlUVxh1QKPBpbfWz9yPcqeRHzetnl4cEwDAH7ab
 Mskd105i0QChbrQGtt0CZHKbKRk4d4YsP5Ts+iuGP33kXI6qRLiT13f5br8hOxif/BYLP8iZGWj
 7+tosJwGFtJy+8urB0mVJgobBZCWuxIbw3TOL16zg5+QFgJXbQTmus5DKDXMzT0OmF6T8TxW5O+
 yGQBDRL5O4JBUj5ADnehvvI2Ai1NK+m+Z9lI/vogv85OOqkgAOGuxnKu60Hf0T5KF0O5wp7wl32
 5P3xJ3QJPfuswwixzvnQjXlcm94I5XtELWvRuAIs7j6e2Fue4h/ezbmAx2zvu+PX1CyrNF/RRns
 nIHpa55BSVWUN3yomoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-7504-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 2F68832D290
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:24PM +0000, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

