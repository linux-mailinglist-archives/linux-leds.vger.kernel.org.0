Return-Path: <linux-leds+bounces-5482-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F407B51783
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 15:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4874D4E09AD
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DA733F6;
	Wed, 10 Sep 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgC4HxJd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262C4149C41
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 13:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509264; cv=none; b=nHfRlj62zqROo9ceLKb4aizNKR9nz4k9AhrJbZWE02JHFMi3ZeBg8co5EKDhDEoPdOcx7atHRBD0idnPdlnmZ3ELKxXrop14cimLQRxqJtjW0vJP6LhYSumI04DmrWC6OzsfUfBVR6ifpVw/vMaq761kdbvrwZ+UiZvJwQYNWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509264; c=relaxed/simple;
	bh=2T/8Ztsxi4AWL1kpHNyrAMiLhaqvXC5D9zLHqmODIVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBboYfh0m6QXjB9kXTtQA4uHCr8ilVFKkWkso5q4NTnZICJBsIReqNFE4q3ES/f0AR3XLc7XppsUVV6uv+vgeS+pLIhFCHEPjDOfqIcADS15imjGMwfDZJwuab77Nxo6ibQDTJGhu4ot9xErWsJ2eMdHeYVBaiZgbxZv31iEP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgC4HxJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgXSL013799
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 13:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJorFgWZxPg65RyVPLB0lRHsqzbMwIYmxp3OdkMcOE4=; b=LgC4HxJdACiZFbyG
	MBQAE+rnW0NKD3ZlQlnjLhAtpjtWzKyCQKgB16OaR3RarZ+ncbEHTVFvnRLLVKJJ
	R8AbzTAt/vAdmrElde1j/5a//MibhbGMe4jArQtKJhuAUAJ7M+IkQjqTdPGIfyCP
	Gi80tlSOMTtiKgUhmtcu7SyU19FMZQA8Xa9rMkhiX6l0kTkDXU1fv+iWI5O5IPVP
	99L1KLgmulpc6UszGIetpXr2N7UA7bwC5UIyf8Ibdaq1ULK54GB6YGKiyppeGQOr
	MOxCDBaxkf6vUBtQObYlZVhDPWQIffz6RDZJ8KJaDvKiSRwysIqiYIjhHaKkTcSW
	lnWaDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8absya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 13:01:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70dca587837so9999256d6.3
        for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 06:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509261; x=1758114061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJorFgWZxPg65RyVPLB0lRHsqzbMwIYmxp3OdkMcOE4=;
        b=TLtJScBB3jjYkDWu5ty8aXYQywx2lyQyrcPI2AUoWQW8vjt+jHSnkN33OxNQMmiCno
         rDPKtP7lkZ2k6ZZSku3bwKdni3/Skd/QOFJ8k3dCdf7zFvAoaz4zYfsj6eidhM8eslbm
         VRDljgrPSu/OxWy46Lya7u8FNaIBepXxlY+YrekgNcRaoPp83WoD/ui5mCzLxaGK/vZm
         bHIJOpTHfn90LQqwYET5qyxzEmAy7p6edi/UQ2uUGomehqpMo+dh9bQyxL8Y7NWqULaY
         kiMW18j11xMTYB4ztAl2VyXsA7pwMFwOQ1wjfhjkslqrg5Dkx4creEH1fvWtVZJHK9nF
         ao/A==
X-Forwarded-Encrypted: i=1; AJvYcCUXVgQLwpRcGFbsVbqb5k8n70WXkq+pt2MG0Fa2lrEr5ae8bRRe5AkcxrlvPlQlGtcYlQu5Qpu5LXYb@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQr05Gl5YADIqK2GegqN6NTjKx4b5WVpkYQdwan8tPFJnrITX
	aSckETu2uTTAFS648lyfgyaAPsy25WN16dTKSY3qeowv69jg2IB44x0sRky0enFzj6zL56Oz5Wx
	+mTbpkWtjC2F4IMUAjOqEZBCAm/sQmCLlcrqAKYmHHCgcYPrpkjKdVl5M6UQed9yb
X-Gm-Gg: ASbGncvFlQ9LzGARHGeFwWcY11qOnz5ZCRpFIrRyVLrtzbkfZU6M2/lnMtft2YeMPxe
	lh2yxsE3iB836PnkTI/JyUY7J9suf/+qx15NQvu+WBHNjpMdj/YgDg6HpqOf0ayHTXC2P9v5G/b
	UHGTICraPv83bCLpsKunhwlMARhcryUP2WGebuSUdmtNaTa97xqVd0/nSg4sAZf/ZK9Ly56n5Tj
	oNHOp/E62t9jsVgvTx5HBkpudALmTm7daIWWDGNJnLfVf3Di7EBCAyftJ+muNolc5pFiPGokO2H
	pdXXN911/uFI+U34WHqCQVJ8ZoKqx+gYKCtssJdha/LxHbsim8r7fw4jq6RVW6f5GGFOyHCVQk3
	FCu//LGKCwd9dKb9lRArsVw==
X-Received: by 2002:a05:6214:411a:b0:75a:9c0b:6b7d with SMTP id 6a1803df08f44-75a9c0b6dc2mr32858086d6.2.1757509259842;
        Wed, 10 Sep 2025 06:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGyPmSFM50615M6RHwW4JfpvtlFW1/WulsS/UQRD9mfp3W+5WGHHqGDBmhseR7J3icQ11+sA==
X-Received: by 2002:a05:6214:411a:b0:75a:9c0b:6b7d with SMTP id 6a1803df08f44-75a9c0b6dc2mr32856966d6.2.1757509258861;
        Wed, 10 Sep 2025 06:00:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f6a7esm3289951a12.42.2025.09.10.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 06:00:58 -0700 (PDT)
Message-ID: <634ae260-3a7b-475d-b40f-47401a70a53b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Thompson
 <danielt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, threeway@gmail.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
 <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c1768e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=I76Qk8w-AAAA:8 a=vFEzn3JI1hsOnF_rj58A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: sIXKakoDh7dOmlUwcdTh9Xsr8BEUbuZW
X-Proofpoint-ORIG-GUID: sIXKakoDh7dOmlUwcdTh9Xsr8BEUbuZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX4uMSXdIhbNDf
 RIEMth8pF0tna8iODEUySAkjGeh4PC8M9HSdRRADU+zE1+6egjaBNlQTmXnt+WhyIOiqu3ox+5O
 N0/BOCrnbbVkS9Ke6Y+8o5RT1UeczGLp52J406LYvbG8pCiGI6Ho4/OmLEgnkd/McBdq3gPt3g+
 tOhF6z3mvrukcFkUH+PcM1TAoWxBY+DYRaHMeP9Nnl0/8Om4r16XH1CbYjHD9zZGSlA4Yfc9bpy
 nb6fDwhcFJ71Kxe1QHJ3Wl+ZxcgXVAG9IroFR/BVvEU20BLXl5lMfVtf1qd2zFXFAc/SdS28oYG
 FbYyT8DAeA0uHghrDfIfYns1qfiE+mgeh0jwRKJMeClYu38GM5bmI6DPuIotYkIU086UwrLJ6Ot
 9KrlBUr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/10/25 2:54 PM, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Wednesday, September 10th, 2025 at 14:22, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
>>
>>> From: Hans de Goede hansg@kernel.org
>>>
>>> Add 'name' argument to of_led_get() such that it can lookup LEDs in
>>> devicetree by either name or index.
>>>
>>> And use this modified function to add devicetree support to the generic
>>> (non devicetree specific) [devm_]led_get() function.
>>>
>>> This uses the standard devicetree pattern of adding a -names string array
>>> to map names to the indexes for an array of resources.
>>>
>>> Reviewed-by: Andy Shevchenko andy.shevchenko@gmail.com
>>> Reviewed-by: Lee Jones lee@kernel.org
>>> Reviewed-by: Linus Walleij linus.walleij@linaro.org
>>> Signed-off-by: Hans de Goede hansg@kernel.org
>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>> ---
>>
>>
>> I was thinking, perhaps we should introduce some sort of an exclusive
>> access mechanism, so that the e.g. user (or malware) can't listen to
>> uevents and immediately shut down the LED over sysfs
> 
> It is already done by the original series from Hans (linked in cover),
> which was merged few years back. It is also the reason why this
> approach is used instead of typically used trigger-source - that
> would've indeed allowed anyone with access to sysfs to disable the
> indicator.
> 
> As per Hans [1], v4l2-core would disable sysfs of privacy indicator:
> 
>     sd->privacy_led = led_get(sd->dev, "privacy-led")
>     led_sysfs_disable(sd->privacy_led);
> 
> 
> Of course, this security only holds if one has secure boot enforced,
> kernel, modules, _and_ device-tree blobs are signed.

Great, thank you for this context

Konrad

