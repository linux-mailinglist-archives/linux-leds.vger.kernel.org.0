Return-Path: <linux-leds+bounces-4731-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70835AC792D
	for <lists+linux-leds@lfdr.de>; Thu, 29 May 2025 08:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B517A8042
	for <lists+linux-leds@lfdr.de>; Thu, 29 May 2025 06:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA59256C6F;
	Thu, 29 May 2025 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEc/H7ae"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165B24C66F
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501220; cv=none; b=PomVU6FpfPGImAwMy9zu74h0YkKL3KKxCQC8Vd1jTwjahQKdGMsZUD4OVt36tXMOSHxjjgOBGtS0FIQuozuiGfXqex+AM5uQ1Nr6fXucsrk0LhJMOIxGaNyZujaj/6UiCdBRNT656xbdTd5TUndR2dWmct7OrYmVULez8CC0aU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501220; c=relaxed/simple;
	bh=psTx5DnqTcqc7rdga6X9dADCvyDhDYFwQMHtamg1P1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahIz9L6V2ufNQ+D6igMkNAZ0GSeNRStfThsxBJ0hAl8IDHMarCIkMZM2IepJqffEVqGXG+ZgsDhX5m/selquc1jQXA7as3ASMDW42uKIpBnHBqxReikXhaiRHv6wouX+GT7wgw0AB9CjqU3qHQQ8nWgsE/8CvkS5Yn8QVEHE7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEc/H7ae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2J42Q013944
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 06:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8PGsXyBDZ5H+JaRIX2npxMFHOrT7ZZSDbAslLTPf2k=; b=oEc/H7aedWKsUc3D
	2rSog4WRZQP6dVmuO16IWE+UffwL7cHKyDWipnoKE/GreAM3eyrw32j+Eilhoxoi
	yS8wJISqBvEx9IEWJdFDZJLEyvFJwjNqy1M1EY0l/eSZ4cesxxwfRnDYdQbTjhbM
	YVuI+VvB87LcdZ/GxMLHUlmgcYNbW679a8rg6TkmXFCLdnjBCNVbAA6PqTT5UIcu
	qAAujQ3ZMjcSkK0CA1gVSGqQn5jkW2XbfmcQkHBJc0hinmQtm2lKK9q/a4qGyIKf
	gmItCi9bSKsJUCPC8LObmC2AiNj4mLJPWqDrtwmdfyN3picgfaz5AgQr9kHQEPIp
	ecLnsg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549mqg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 06:46:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso558418a91.1
        for <linux-leds@vger.kernel.org>; Wed, 28 May 2025 23:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748501215; x=1749106015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8PGsXyBDZ5H+JaRIX2npxMFHOrT7ZZSDbAslLTPf2k=;
        b=FqBy5hW+GTPFpfRtDTcwLjcdRfc6O8CwPR2DHc99ovi2VaHCQ6H+nFe50O7DNnIlsy
         n2KJ5z0nFaPcQklIqJdpRwkRAhcVzv8WOrvogv1FHGc+rG9oEExypb/ejiqTj9FU3js5
         aaPBe2FJscIWLbn8eSCcRxuVtPuQCDYriFAsKhibcwWLyoMRS23dU4YSiYPyyn38YagM
         jEDitRWrpex8CubxsshofEPMA8l1Cw78tQZ0XrkJ87WNkYmG4VCI6jMalqsP8K1d8cWF
         gTJLxSVxGh4PvCAyBQyEEDp2dmJv2IzzXYvVLbP9lL/JZ0t58/CS6Ogov/sbLYDNaPMo
         6lKg==
X-Forwarded-Encrypted: i=1; AJvYcCWvxJAA1utUrQStJah/Q2+gP6fMhaPgc9W8U6MvzYlsJOcV3YegKayxUNCauVOeHLgx4vY3WHhVjmPr@vger.kernel.org
X-Gm-Message-State: AOJu0YyoANJsN5gV1l+I46DAjKLBMnuDZiijc4gFBphUpZMvv8pdg/8q
	l54tix6cyoj8H02O5TzY0/gm/tYj5YDAnHGLjGir0sMFM/IYg7X7vrjIiU/bJTuE/2m9yuFRKWq
	meb7XRM7OPcTTYLRjnAtcgzy7ce+FSNNB3cqKGC2FV+MN3P2BnlpxPXcEq3yjSL1z
X-Gm-Gg: ASbGncuV6Zvt74xIdP98O7s0s9Gh4RZ6Ei9hw9VMxaVMswFOcHG+HNnTiF8OXol7ktN
	M1Ms5KXIar2ySddX1dPz7zfDzqZMyHWT2/7NxZHNMLmjRlXx5GJp5sT6veEv0r3PtNZscrfGP5b
	nab0ou/X8qvoJQqT8K706/+J4QmtSIoWXV7QMff5TSKRjipBK70pZUZPReYc4DCApV9Dx64jrqm
	Y5eggpj1U3DHVRjPXqG9oxH26tJeTBJY0kFKTf8Fcx4hGQHH3RbtzCwLUr1MciWVuq9OiIveAyX
	Ncewy06q4CSZbDgB+lkz4k/iUyWevH2shNcMaysT5xQJDtuQDYmyRN/xt11feOFzVrBzPsxk8k5
	F
X-Received: by 2002:a17:90a:ec8f:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-31214e70c6fmr3707565a91.11.1748501215067;
        Wed, 28 May 2025 23:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3+tA0etXLR8LyoSKB3yEpu2iofzywi/K5UpRcAuWOpAuxadNSDcNeFAVT33hT++YFoC4ufA==
X-Received: by 2002:a17:90a:ec8f:b0:30e:5c74:53c9 with SMTP id 98e67ed59e1d1-31214e70c6fmr3707541a91.11.1748501214650;
        Wed, 28 May 2025 23:46:54 -0700 (PDT)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b91b063sm710878a91.21.2025.05.28.23.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:46:54 -0700 (PDT)
Message-ID: <a9f260e1-c632-4955-b7d4-98fb024e2989@oss.qualcomm.com>
Date: Thu, 29 May 2025 14:46:51 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: flash: leds-qcom-flash: Fix registry access
 after re-bind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        fenglin.wu@oss.qualcomm.com
Cc: stable@vger.kernel.org
References: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20250529063335.8785-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HPIIzbey9_WB36BJAtjeQ8ZG8POgZYnL
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=683802e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=nBHSmvIfuyYwa36IIZEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA2NSBTYWx0ZWRfX0Tb1Pvlz2nbu
 exQkMq8a29VtqwM8u8SIGmLYvDeUGUdohjjBshz2ZCYWsXi30K4HTQhsmGoRL76pHF9SmrpfvFp
 Y7xVwqfPIfuw/EjF7Qd1fGJrniLdoO9dChTcYljvvxRhE7ou9ndL7meBbl74ycoD5Jc+j485yZ+
 N/yeHk4uMKmSfQyafle5Ezgd8DHqE9FY+va1g1Wa5ALYscML/opxKhc0uSUPEdUuW65VipvdCgE
 EdehO5/D6jtejGYFhMxnEV+ld6qm9tp7KbL504NPy1jG/fncwGAYmqcco9uqoMnI1o97x3fgE4M
 tXRz2rnHInGh5xczB77cSZkg2KpFeLFXAymXwroqTgnaO+G1b1hwr+HdNiSR/hIkNOhB9+8dEjn
 AhkFIJyLA3DUe9AIB8HpFhKQZsNm0f5SVAlHRLCK/VBbpbYEgtKhryOdZdC8DkwzIrbC2LQ7
X-Proofpoint-ORIG-GUID: HPIIzbey9_WB36BJAtjeQ8ZG8POgZYnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=579 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290065



On 5/29/2025 2:33 PM, Krzysztof Kozlowski wrote:
> Driver in probe() updates each of 'reg_field' with 'reg_base':
> 
> 	for (i = 0; i < REG_MAX_COUNT; i++)
> 		regs[i].reg += reg_base;
> 
> 'reg_field' array (under variable 'regs' above) is statically allocated,
> thus each re-bind would add another 'reg_base' leading to bogus
> register addresses.  Constify the local 'reg_field' array and duplicate
> it in probe to solve this.
> 
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>



