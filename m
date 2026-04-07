Return-Path: <linux-leds+bounces-7647-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ4+FDz81GnOzQcAu9opvQ
	(envelope-from <linux-leds+bounces-7647-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 14:44:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4F3AE95A
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 14:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C9AC300DF55
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 12:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C00F3B3C18;
	Tue,  7 Apr 2026 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQFqu7U5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kw6Jmf2t"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8F3B38BC
	for <linux-leds@vger.kernel.org>; Tue,  7 Apr 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565778; cv=none; b=GgQNzpRhlfwDOEz/vMWYV9QFQc/ZDXjiGd4VkXV3OvLvOpjBziRX8KklFTJjaN13sCM8qF+SbsTrinaDBnj+uq38+xAeut4gywmxtqQNj0/JgSK/cmqLRuq++j7uMwmiezKGBM19qku3lyPxfy+fKBYRiPUDMfZ4X4TW2v9gq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565778; c=relaxed/simple;
	bh=MTT54qIS+t6oJQYXz4xG/ZMV/EavHwrBjWI8fqzvKyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lz4E5jD9Np/b9AzGUlb2gw9EeoFN4kRRU95mnWs9sIFFK5Lju6oBpcXW2x8Bf5YYne8JkW1884emf1ElqZMjBAqHHFD83bNJ/hdRq7tFQSZJh8llyT3P+sQlJkxqcdKYifzkZFSD+V9KDhcoK/IglAES+YHV8Dc44R9huu5d0Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQFqu7U5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kw6Jmf2t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376nrxJ492864
	for <linux-leds@vger.kernel.org>; Tue, 7 Apr 2026 12:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVwtfRZAX6duvG0tVxQLeSop/BMlIPzkN/3zXE3cXyg=; b=nQFqu7U5rPRkXDWR
	U+TGqSxmx3ZGrQQH31kXkbtTkfw+z5FZzsIyfodjV7BHft7f498nRCuiVVVS1BQ8
	7m8ZQS/7LFHysxD5Cqc5Plvufoi+eY2OxuGLVrtf8ZZMlBl9wrF5icpbLFrsBF+K
	wHZVnlWoRso+jO3L6ii9OmKF6j6bWe2W4TbXD0qi2s7lKfVZBkDVpq2/SDTTg2I+
	gqb2fmtwOBGutmgASt77HGHsjdzaHwBUrctlsvStg3oUhGD19hiGjNPKJdzRiSF8
	i9oI+ofMvshfpJdWXh7NWYNl+eDLOOjVp4DLtcy2WU//wXbRUc/5yLvnrqqfAE2n
	22KfTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8tp8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2026 12:42:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d68dbb77bso26182131cf.2
        for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2026 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775565775; x=1776170575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VVwtfRZAX6duvG0tVxQLeSop/BMlIPzkN/3zXE3cXyg=;
        b=kw6Jmf2ttLZ88HciHPKfvOkO0uXi8sC2tqHAvFPEz+GwsMgi7SdTbwgHXi/MhMrg3j
         jvKRnY1BbD1Ve75JTpP6wBCaAqSwx6yqXl4uMtRQzoTgt6Rf3N2/UdhhKt1pnTfwoxWz
         VQbNvs7UNlPDYNqA20bC4mdja6M7ERdzK4qppUQtxYgVO2O318d4wrD2esmHNAQjuagO
         LIgaI5emYLiIsFUJN4T5bzPw9YZUqcc32mP1KwdGKMIFGWchVqokB2kXZoVncbI0lNJy
         0USwg0ruVz6TlobFIXywiBQLuwGdV9nfTJMRGGINRUVMQCAI9tDqCnMGfBqaSpf7Ugy/
         IMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775565775; x=1776170575;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVwtfRZAX6duvG0tVxQLeSop/BMlIPzkN/3zXE3cXyg=;
        b=Y4aZiX3ko3Vsw9raZf0vM9SJI3YaznL3tn0W+fInmWOnxGeA2X0XhHMJqUYrRNT3AT
         D7NoiWa96NXlUNu6kze0Rr+2Hbg1ctI3Ps00ytAb1WRRkuAH6/599gV5qMCX4ig1VVCR
         yO3mogkDBvjnvzKeHUvpiV7IOkjielMc6H10tOyMwuEwkCZoqBO6ibh3zAl7ureB2+Sj
         JQAZUQZ0nAv/54f7b4HV8qja6OKZBpdCLXO4oFmCjJcUJo3J+hlqlzqv4FZWMh5rEFyY
         rNzfKnSqIw4xl0N4sCrMF25mAPFIKE4kIPkI/hVBwtJo6Afuo1PfC03nsshomS5BCHLZ
         apXg==
X-Forwarded-Encrypted: i=1; AJvYcCVf7d0GTWmgi4N4iGoJnt6kMgFa1LY97J2ay8i5P3n8qPhncWhUYV8NpEB4Pyz2GQF7ZejSox98U/55@vger.kernel.org
X-Gm-Message-State: AOJu0YynONRHjwLE77+Us5SCl9nDO1+An1bKCg3KaYbw2E41mPxXqIeA
	SCca2EB5jEEcJNEkdKrmzx2IRWcl21opye25rDA5wTgMPKPLcyIloKtjb9M/zXCsY1q/flkDs8a
	oKZGSdkqOzM25P5VeCs+2PH9lfP9j0+BZekTL9ZuPNEkc3Wtt4rNPNSdJb40PbBXW
X-Gm-Gg: AeBDieuuWHK7GfD8MBSrZfAro4RyjxpPykCrH7YUx4dUkm4OG30GSnDty7xGJ7PnGW+
	3UzLRHrjVxWPBmBTYgMGk7+n6RCAkpVH1aonSP2IBAPCjLWDWclgMYAoQtf/qkgA4MknW+VoN1X
	mwK18fDwadevSUtw4lM/3y2tq6JgOWn9W+oQimjv4VCko01NZmUWm4WzBtpxwTGRXYvjed9qCXK
	w2TT9Au13GcVnTpCy0ZLZYPA8Rfi6vjD5IswfxmE9Lzr07APBidpZEtyxRNPZL5RMgOsq9Y6o1b
	j6f5F40Go8M4hYA85Iruat00ouKiRLb0CAgrfhZFFhlRWxtfJlOY2CCLzfbZr9Dq/BkzlCKuOpm
	VeLzy1AZH6w9y96Z/P66A+pRd6DzXwVtN4uc1JdT6/uC6O4Pc
X-Received: by 2002:a05:622a:14cc:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50daba8350amr10338681cf.48.1775565775543;
        Tue, 07 Apr 2026 05:42:55 -0700 (PDT)
X-Received: by 2002:a05:622a:14cc:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50daba8350amr10338141cf.48.1775565775084;
        Tue, 07 Apr 2026 05:42:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889f6843dfsm353259755e9.12.2026.04.07.05.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:42:54 -0700 (PDT)
Message-ID: <cf5bd3dd-bb48-402b-b829-e13bef3dc711@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-binding: leds: publish common bindings under dual
 license
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
        linux-kernel@vger.kernel.org
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Lee Jones <lee@kernel.org>,
        =?UTF-8?Q?Corvin_K=C3=B6hne?=
 <c.koehne@beckhoff.com>,
        Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy <dmurphy@ti.com>,
        Gergo Koteles <soyer@irl.hu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        INAGAKI Hiroshi <musashino.open@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Roderick Colenbrander <roderick@gaikai.com>
References: <20260407113941.43239-1-corvin.koehne@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260407113941.43239-1-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aXhe_WRApiEFKiqsSVhx6An5h0BXfBYJ
X-Proofpoint-ORIG-GUID: aXhe_WRApiEFKiqsSVhx6An5h0BXfBYJ
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4fbd1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Cmw_MBCVAAAA:8 a=sozttTNsAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8
 a=hD80L64hAAAA:8 a=Z4Rwk6OoAAAA:8 a=CvQ3IjafAAAA:8 a=Fr1VFZQNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HmPd8ZQ-4yLvt4X4H40A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=ZJSrCmYe3mwGoKZA4Vko:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HkZW87K1Qel5hWWM3VKY:22 a=BG2cHyFXwb1O1LB579zk:22
 a=-8IW0Q_vOObYtC2Sut8m:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExOSBTYWx0ZWRfX111orxrjYJW0
 wmD7aVKSpXb5fuIRRilhioLMhvqAEnAApoh7DJX2CwYxbhdtYyiftbqOodsUq8LTFLndiOKY3Do
 0UUw+lpJM9DcPorx9reKnFSBzW93C8c5+OYWF1ASLsvL492VdEvWrl+8VsXlgox9P5tN7SSgzYX
 XUC0tEUlLLdWWqn3Efo/Uz7TjfzTPD1J/SZxDuwY07iZ64AA73UnljCCPyMYA98urFvQgZx7j0I
 C25DSHaUqtb3a+IJzOlTJzqBe6d0x/OZBgIKU3FrGNJhQ/xOEo7l4pNFq6HkX/JFzfN1EDcm4de
 VGTOHKEihA+yx8ZTtC4ch+zdX0HieJNWvNJ5o3WlY3vp3jw9IzRh+iT2O3OghLqtkSyeoIV1kus
 dsrk7m7lLN2SJcYEfcBN5wXolIIfAaYTutVZEHCRpSOGvw/v6VWtAf/9fB4PXwzmkrj3r8xYc6b
 nQJQl16uFd7wsJy+c/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7647-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,beckhoff.com,ashleytowns.id.au,ti.com,irl.hu,linuxfoundation.org,gmail.com,linux-foundation.org,schinagl.nl,ucw.cz,milecki.pl,gaikai.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAF4F3AE95A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 13:39, Corvin Köhne wrote:
> From: Corvin Köhne <c.koehne@beckhoff.com>
> 
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.
> 
> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Drop, adding SPDX tag was barely a copyrightable work needing
acknowledgement.

> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>

You can drop this one, not a valid email anymore.

> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>

Drop, this was a merge.

> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>
> 

Cc list ends here.

> Cc: Lee Jones <lee@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
commit msg. There is no single need to store automated output of
get_maintainers.pl in the git log. It can be easily re-created at any
given time, thus its presence in the git history is redundant and
obfuscates the log.

If you need it for your own patch management purposes, keep it under the
--- separator.

> Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
> ---
>  include/dt-bindings/leds/common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


