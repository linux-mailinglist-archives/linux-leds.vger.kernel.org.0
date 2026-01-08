Return-Path: <linux-leds+bounces-6573-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BCFD0229F
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 11:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C26A3311D704
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81D1432FBD;
	Thu,  8 Jan 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYqkHID8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBFKmzmT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E34352FE
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864186; cv=none; b=tJQ9KQ8uqbQy2R5jlPTbD9UbfqeuULa4tL4Lbk5o8hNU+17+5a9YLiQakA7jWutirzv7yUigCWQGLQaMkC5j8zsMFlRHb9vbpOWQon2LUUp0VLfrtvDuPkdyMx1kXAHy7VydTk5jxzaUTQJXeIyy+x8jNo2W9gpxQdIrJ/AiOxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864186; c=relaxed/simple;
	bh=rEK9eOmfwrcdm9xKIPuyi2yOvQ6nKX2oKik+EL0r2Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIfL9Rpf6IVY04ca1nWonyQw0MEcA/eeNm5cwu8yu/hPtyHFF0yG2y1y9HzODMb1rp55V6uomPUUy8N1u4ymEeXHVCuAM0p6uAqwhmuf1FbGgmIGd0ryhgbjlJjaem9S7XnUrysHeBM/OR2hasbnxl9UrTcewC4cisIf0z4/bJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYqkHID8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBFKmzmT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6083uO4i2593330
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 09:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=; b=mYqkHID8mg2NfpF8
	gqQcF0cxspHvu4+F2yjd6y/tJ9Uqj/hLpuU10za9QN/bjEQOsCrGJP0GR73LkmRl
	4UVnKKZE3pantLlDnLBq/eZAKZvrWhVa+1AgsKaGaBnd0PUBcZzKHo3MjqemZR0H
	8fIlZ2W6U6i+bUDhihG5ZkUt6Xl1IZ+LrR2y7zke+srPFoLchlm6oplP2+iE1e/2
	ESlPhKZbg0f9CQdZHSxbiqSas8groGlYgpabrEs0etQ9W59QUWMfeQibh9+usZyU
	5PiB8cxZTANW1A6enj95UlbHWFKSsUqWhGUWmXs7/Lv/WdLxdKrgZSbTDfUFd7vk
	tjKeFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29449j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 09:22:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbb6031cfdso90882685a.1
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864176; x=1768468976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=;
        b=XBFKmzmTNIO1g50RLe6gqTF1W/AbhJS/feLzFeA4mzph5YHLI3h0H76Jf6kEkmZSb5
         8zPYvKka8rGKw/25GvORKgANOu7IaJ9qdClWxd67mZKLf7cyOmD3dXP/raI1tfcJ+ito
         7PPOeveRtstlOYnRmCaL7IeQag64tkTy9Lwi1MHjIAUwOJ3m04doXhPB41YJ3YDr+D4P
         QwKSxTGolw482C5B0wpNip4LhbkcriJt0ulJYL9Lbh6oQSfbyqT9O5ChTn8EYkKrLl5v
         zfEvE+jw6ydDOFj8mNeelqjXPfTqLg2t5BnNw8x/NKgS4NY7mwfdEhBWr9VUMX58H2Aa
         KeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864176; x=1768468976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=;
        b=aUlF0XUBTsP1mNwU3nUSIYmTOqGtO97mX7qLcivqUkxaD0HMkHAXch85Vv6ke83zDm
         KfejvjUxdwYCN+RpqDQEUcA2agZEOskqj7doVxWtD59s4N3DigzdMXsVr6tx+0jV8quk
         AuhzLe2Lw4gxnwvdwR0cUjOicJKy0QvW5d1FJUKhw7p44dX96qDRS+sisDL0ViOkvmBL
         XnbBSBB5n2/HlKYwCjD5rG+ysZZQGBgEIQRb9KTCPx7p8I/QZMI0ZYQWkLtYbiIRndK8
         pUsoGC/6QTE+4WWqJewvaKlWHm5g9Ye3ju4Yhnzvnicg3qzQaHuvQa+FbLwYjE1P9suB
         D7HA==
X-Forwarded-Encrypted: i=1; AJvYcCUA2BglT8PHwdgU+X2Fu9c15wxI7LUJJVEqREa7NJnJkOZrsI3RS291y8iS0UyAvtNINlea24d0pPZX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gE1SfbZMqINI5/7Y/MVTrNlwOau1LFISntE4Z2n+CgcuhT/O
	gS6Qcew0mMU19EFzoMxu4SlXN7CpmM5aBhib68AeFckzXhKPinsND9cFQmeKVzzewdrJaghePs4
	d9KycM20gDdTaUp1dqW3hKCEYwDenJ8yYid8exw/K/wZEk8lXm7uSkC1bwHBRYmz9
X-Gm-Gg: AY/fxX5Y00E3QDeiLQ2uwcr3AiDmDw2TNj9TZhf7Os8A+Pk0lX3xz1TMPZ0/e9U3Tnj
	1YphEr2p7Q0YRNB7HYsFa/1RsNQrrnviE5/2NJTdFuXpCD4rTtr3v/FYn7n0jw3KcU2RrTXEI9A
	LCDsSH7MlP36TdWv+y+j1JRlSLKJhLiqavgpA/SIo5Kry4dHfLkpTYWUHxCs69wzh2DP9/fJ7xv
	/ZZ3tOsj0zxQmmHdFZMrKKokLSFarRBt0q+Qjas/ilEdg7dDEaGn4TCmeWoQrtKL8UXpXXdKRy6
	C63y3my9UNqBYL5g/OmJvK9F4r/OXIdscYConcBOpB3voG3cU5r6B+OyjAiDsEhjJPT0f9gR7Rg
	0ynicBKpU2noqUVFbMqkXmBtpgtPQ0z/PmFtYcHDSz/7kzazpXlhGnlvNyTtmYhnE3/w=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr508523285a.10.1767864176216;
        Thu, 08 Jan 2026 01:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzo9qVwE2Z0L9gMrnjAB3lduyOMVsOLQ8jFn4jFHZjA763oWPC0dpsRmyX5dSTtMfXTGlU5w==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr508519885a.10.1767864175781;
        Thu, 08 Jan 2026 01:22:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm767583766b.2.2026.01.08.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:55 -0800 (PST)
Message-ID: <0b768afe-8bed-4ee3-83af-45bb51faecbd@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:52 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] backlight: qcom-wled: Fix ovp values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UdP6ky-yLuEBnCzmYB_2nnWhnvxAwaVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX24DPtp1aFTzJ
 yZxNa0epcCBPlsAaAv09gXwSB5QYwLV3qXQQD5j4LSkMPf2NpdhWUtVZDHrj2SEX25EKaSNYSEF
 1Wy1cIxek/v3Zi6xoHizd2urAhkUIUaFC/s+k8kLW4Fo5VAHr0/l2qqpEdvfs8qz1fd0Agbg0SP
 72URJeYoKFqRHpv0SSmNyWU7hU+1iqp40hZQCCHkj4U3yDXpIlxV1yo3kCx9twg+aNMl32emUn7
 iQxERMXSSFmSXLq0dD+if5FmwZedFZDHJJZOJSonsvkd7S0lcXgryeqY3SWpThgpi0JP5GOWx2L
 P7GgPS/culNbMZivVFIeMjTKpxxefPDBBNMElhglRe+18GV2iRI8G0ouRMLDmZsyl9lIKyU52/X
 ZDF/DgEL8YmyS3JAShGaergsuAzqnAeUwBfkEtHYhKKcOQ+fJTnlvCQ6GTdkN/tuIo8Bw/H+3wY
 iS6yVCAyZf2i3sTofbw==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f7771 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: UdP6ky-yLuEBnCzmYB_2nnWhnvxAwaVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> PMI8950 WLED support same ovp values like PMI8994 WLED.
> 
> Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


