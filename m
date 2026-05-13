Return-Path: <linux-leds+bounces-8091-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPcRDM+gBGqbMAIAu9opvQ
	(envelope-from <linux-leds+bounces-8091-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 18:03:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898F536B20
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 18:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E0BC30A0F8D
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 15:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09404BC016;
	Wed, 13 May 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7gAsYvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+ZuQFZw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF4130FF05
	for <linux-leds@vger.kernel.org>; Wed, 13 May 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687655; cv=none; b=c6FstTylmubCf8nIvq6t3GxXycDX/TbGNWG4dFDzK/3l1YXUUbi8KbdvphJiUBBJyAMuEVUteJTBkyBqxj2ONra5KEQV+1WXmZFYV4GMR9D8lyDVvVz69ok1bXMDuLW2mUdnqrAQuV9WDn8FMfoDeI+ygocV7usKX3UCoez7mR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687655; c=relaxed/simple;
	bh=MRJ8g0F28i7tTvB5DB7EwkSRP7fsko+i5Quya/vT4pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vw44p797hbeY6UxDCnnJ8zBNfZ5DiuPUYaaScX6W2TyplVTNaIbouSbt74N3UDbn4ZZORAqe19e84mRvIXk9OgXPiA9D5qgVU9vYnESa6Cot17FqBx6Zogl96Es7+eerSzfEbsMttMpSo530mumNjMXJ0OKlkFHwOigMj6Qd8/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7gAsYvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+ZuQFZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCIsp82965299
	for <linux-leds@vger.kernel.org>; Wed, 13 May 2026 15:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=; b=X7gAsYvApGS+z9Rt
	TnNMVm0256GHawyhFMcb4BlFUWowrdmntRtghlTVq2XHEXyqGxohcRd94gaTu+zO
	ANiNkee5FveAgHngmge6BzaPYk4EyDdsvuhxgiW5hFOHon5yp/i8nTKZdQKQhMR6
	1UgurvO/6lKvZUvacPCmPZ7dYSZKWFDraErEOpJ63eoRbo4k/y1o58kSRKIb6pyQ
	X1/9weGGlIdborSDO5AfPCqkBCTdbdU6mN0a3H7WgXY527YJNlAOOcnozSEB5MJQ
	Q10IAuW2yV/fMEf09o5NZXSShfnrfNpmQzQjzm6hArQaOunQ4H6iD3K2AwskH8ET
	QKWPHg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5a5x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 13 May 2026 15:54:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312aa1d7adso4472524137.0
        for <linux-leds@vger.kernel.org>; Wed, 13 May 2026 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778687653; x=1779292453; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=;
        b=G+ZuQFZwbPrK9NOa4dWz+TQDQes5XROWY3EE0ANNwjFP4J/VQKJMvdnH5KTUMrnMmG
         hkvQb2zjWed3d9n9zrZvpn072KSOLDU59ouKpkAt84UIj2VEqnR4BMhHXWzHzCfgPX2h
         +2A00ff+SgljzDcogSbMzfHdsC2crFO3lPEbY2jczTthqE+8oW0GM8X/f7CmEqaOIEcB
         KNpcuVF9NiwdWxzNWcdTt3bnMoJHp3jy64a5u1zoaaHBcNZzB7WGMnmOCCADG5mQCqTV
         QS7djEsesrhzZEI1bZQbOJpCVD2kspF+OMs7hfAjClNPfydmKcw0e2OlRd2d4VRc4tiQ
         3aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687653; x=1779292453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fO3GIoebdKzpsBOhpeDD2jjEE1BJjszUQkNE/I05Ws=;
        b=THL0aQ8cYM1z/DDlr4pYbQQNUknGP3LJgk1ACAPFSzVDQAWbNbIgHwTqQ2SAR4tWs/
         FAnT10f/csfn/Dc35sV+DqRSBtJvjbx6oPXRuQMBbToFYlpoanvOH6EwleHJ3seUXPfK
         okkHflmfZo/5OIW1DhzuFHOQ/7UHIiCLVNTytUzVyy16XYxP4RlnIPSpJXOyDmnhopKg
         IABra9p6ZV0r2ZiZ9Z+TpcMmu39/MvevxOpP2SnShil5Gy5UV+4rLxz8RYMDd6TqBaRI
         Jr5QlU61mqRfUaXF9ZZ48Dbreq22x+pQarys1Es4sHtglVxiNg0WJXM/lx2ouvFCrNgh
         xcag==
X-Forwarded-Encrypted: i=1; AFNElJ8ojtUbh2YKnJXhvVqEVzYxHBkf0+5Q5Z3BfYq9J/3vbxHpwpNyeUMQ3yh1eizAvyYK468m28erharA@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvvGiwAV9IIjb7cdY2/uGdTIKs5zoMpYsZ2Z3/HnHqZEELio8
	2Davu8OQ69mZBg1Mfn/WQ0p2JaQyrcl+ofdBgn/8YzpwsuycgsNj86OVm8oR74n8C+VKJCk9d1R
	N78LOsqq5IIRThkUCAoWaePq+JhfYUC1UFY4L2E/U5OHRNLGBTrbrRiDJsm6HkPil
X-Gm-Gg: Acq92OEpU2n5t7y92uFE6fdicgurnh5PciPlVC9u8iHJNTnRtrWGr28xjCaIa9GeV9a
	rJaps+Dfa381eVLeIm439CmQqMVjfmyyEuPeVDq4nx4ZvymPJzoDMVxdg5O3GWX0sTzmela7zqU
	I4zPgpgoq4/Xpadx6SCFrcNGMoy0BbTa2M4BQ9uyL6F2QLv7z7mKqEReM2p6IhGO8BcJGJfVEpe
	jiHtLnDuUlSmO9hYxiH6rfhcNOrQwz4BxQCMGdpaLTrDVO/yH7mygkT+6TA2z11A+0miN9vRRZj
	8ru0vNYPHNFoxhAEG6sdx8T68+/CrD9POfaIlhwIVPVdSB5yr9gPqc1iuKihvGq7IogbnzcrcDZ
	ilklkd4/1uqydfO9/o3hbehdvlSK0AkDn2F6ByX61TyKs0aR+5io2cPXKmP7VyGoCvxMyy6DNFh
	R49rfJW7CHNv3YwmCDkegXex5tQIPQnk8qi/c=
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2051105137.5.1778687652729;
        Wed, 13 May 2026 08:54:12 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2051076137.5.1778687652271;
        Wed, 13 May 2026 08:54:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b325sm4032979e87.79.2026.05.13.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:54:11 -0700 (PDT)
Date: Wed, 13 May 2026 18:54:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linusw@kernel.org, alexandre.torgue@st.com, andersson@kernel.org,
        andre.przywara@arm.com, andrew@lunn.ch, baruch@tkos.co.il,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        gregory.clement@bootlin.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, krzk@kernel.org, lee@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        paul.barker@sancloud.com, pavel@kernel.org, pavel@ucw.cz,
        peda@axentia.se, robert.marko@sartura.hr, robh@kernel.org,
        romain.perier@gmail.com, sebastian.hesselbarth@gmail.com,
        vincent.knecht@mailoo.org, von81@163.com, xuwei5@hisilicon.com
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state
 and remove redundant startup pulse
Message-ID: <pvwvewdkqjh267qwven6gs6tptbrmj4et5ab23urfx3jqiqlgp@wl7khtx5go3j>
References: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
 <20260513144414.244968-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513144414.244968-1-jerrysteve1101@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MiBTYWx0ZWRfX1cGMKJMdwUhY
 TGFEM9gVJuWknsmVe3idcu0SDT1XwbuSJkk9a88+QXMhGUqmX3jFyESzdKLTl60pbb/BsXwkx+0
 SvwYCuxwnFX+c41FF67tBRBHHpDepOh8CdbO6cfRnibbNNfC7v1RXUIGKe42+Tq35NXk0QiWtjL
 FPVgZAdlfHjCEhFdEYGM711vEOxGSUpF3gtgpLHXYVeo73qfy7p4Y6c+0f5B4hSCAmZw6oYNh0P
 J53lmxuGO6oMiHYg/Zv8hYBqdriqQaQOSNBStejw4YO4tr4DwrqJVTKmCdqqgUTnohW2Zptx1My
 8APfbdrrgEsmBe4itSXSV9+FOwmztqxv7uvPW+FM1VgAtWbRP9GGpM/Ja9tJIVa/hcNA1hi/Bfc
 hMaDOzfqTX6ic98stz5YPKOE9M9qFStFcMXyHJIyD7CfJefcKkPuCk1D4ozxeIZJABxWddPSYMk
 ZZ+xvYnKWTJ5OsmTB8g==
X-Proofpoint-ORIG-GUID: bH2kYuK3hz4U1RFWiY32XVBEPQf16D41
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049ea5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=-Ea0i9WH77qr097UAlAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: bH2kYuK3hz4U1RFWiY32XVBEPQf16D41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130162
X-Rspamd-Queue-Id: 8898F536B20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8091-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,st.com,arm.com,lunn.ch,tkos.co.il,vger.kernel.org,bootlin.com,lists.infradead.org,sancloud.com,ucw.cz,axentia.se,sartura.hr,gmail.com,mailoo.org,163.com,hisilicon.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:44:10PM +0800, Jun Yan wrote:
> > On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
> > rote:
> > 
> > Have you checked any existing device trees so you don't
> > break something here?
> 
> I have modified the problematic device trees and CC'd 
> the relevant platform mailing lists as well as the device‑tree mailing list [1].

The biggest problem is that the DT is supposed to be an ABI. Older DTs
must continue to work with the newer kernels.

> 
> [1] https://lore.kernel.org/linux-devicetree/20260508152435.21389-1-jerrysteve1101@gmail.com/

-- 
With best wishes
Dmitry

