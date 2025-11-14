Return-Path: <linux-leds+bounces-6130-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CFC5BB9B
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 08:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7FCA4EAC38
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 07:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FCA1F91E3;
	Fri, 14 Nov 2025 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3/9Gpqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hm6emikx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19EA2D8385
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104411; cv=none; b=oiA6zIamhk4Wanp/Hyy6y2W7DUbGbyQDhYgTCGaLwfboUT3UZLxjZp0CwUfaYkfLTtqvgDiHMDFT0pJtkkqJz5dNPNZdiXerPTDX6BiBJi9D1w8WshIrbHVelRbBIwfhg8P0iW1AuOwqVzwWWjr5A+9nkfvDqeP3OQihrP45TLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104411; c=relaxed/simple;
	bh=eRfQMJPrlWZD9qT9sFEbNGw2CvUaM7p8exjInRynVmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVkYexloq8IGDrwQ7a5CxHiVXoWzWmZIzgooLbE749xifOb7pwR8veaak77Yso4LRhDqg0nFN69Kdhxu+IhLY/trCT3J0WE8aZ/Jv3AvhxYJvIzS9MjFmIxjig9rk1l8wxlFyUHCnx3SQpSYzXnCFW1exgmEyjOCMd0TcN+3WsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3/9Gpqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hm6emikx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE41H7f2263210
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 07:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56/QuFHocDcbRQgDfdO8RLiyOK64sVLRzXkIRNrROAQ=; b=j3/9GpqsdgGiTS+Q
	3Sn/kOi3RJzebSJwarTUyO1oG2qSdPTT2aatF4r3qVCR4WLQjlgn2SvbeLvmiJQE
	K+bhaLJVowIvSkLtAUwQf1dJONrEiFL3ETi9f3uHWOA7lQtXXQZFF/1St3G/RQWy
	W582PmrdtqgeFEfGZN91PsKr5SLdn06N2HZc7U2SzVyzv7aJSuwuTUDGrdY35cE/
	0r0zW38wUzc5sjXKJ0p9Uz713o8rPgvY1RMqgiwCYYlfqhi+2sKiP5NHgQ8DGyoh
	iFzFWeJHoIcVcU+MORdv8hw6NHrfgUQ7eSjbIWJn5EgJiaMMUpyDbcg4AgyqphBz
	7P1OqA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adw1j0f23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 07:13:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b991765fb5so2147633b3a.1
        for <linux-leds@vger.kernel.org>; Thu, 13 Nov 2025 23:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104408; x=1763709208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56/QuFHocDcbRQgDfdO8RLiyOK64sVLRzXkIRNrROAQ=;
        b=Hm6emikx6hxFwtP/VP/zyWpNF/gRyjUv1XewM/s9kJTuH7wyz/+sorcfw3fKCWE7qk
         xnyg6xkoXm+ZkohIWwFfbCrtINAjga5TOHmsUESx/cgc4p9n+q7bGPZqpDhMqsnYLzV+
         WIg2Fv0v9W2shaVfm/7XyW2xO6gacPoDI4zky38zS3xOQPg56CuUlqG7JYGYZiIh7lT8
         GfUNN3W7KTmArsnh/hP4Am4ZC0qUYjOXcXpO6xlx7+21k8zvr8RJkj8BPLjJ8axYO+cn
         uMYrpba6oW/3GrSLed+YahWTioyqBlnU+SEG5BJKHurqYrLgoWRyVroAHBjlTKVG3Vun
         TNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104408; x=1763709208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56/QuFHocDcbRQgDfdO8RLiyOK64sVLRzXkIRNrROAQ=;
        b=SxZ1bSHRIQwxHNziBozZBeGsXt76CryOb8sEMwaXFvNayeIYh/4Um1MU0yYDUeISVF
         9dFB+JZX69FsHgw0RmLdnyZ7BRWWqcfuCgeCJosBpu5y2BjlO5+abm6X+nnVZhomQlB8
         QXtGAa+wMR5hSmDVFllXexzvlFPmqVGpzApZ/zIC8Vg63A+WChUNsb2IUyqXdpus8Q4L
         IKQ0fCQn7o3B6D/7h0t08KaysZaM75TxAsotwOe35V+7zIIyyZBdRLGh/Re8oNeMDlyy
         tonpkxk50bFPijr3cd/p6ZoKlqRySoLkmOkOi9DopzeUPCgihOcIvKiNHb2SUteYFmAr
         cwqg==
X-Forwarded-Encrypted: i=1; AJvYcCXfQvL92qOsJF92fYw6HiJL4xo8626niuEctXgdstw+RBksQp6JUxFdUNNvj6w/EKFfyv2RQ6PpZczG@vger.kernel.org
X-Gm-Message-State: AOJu0YwuOmQjWhZ73jcbazYNlDgQO2n3gfv73KwqGSP9TmcrnmTo2XWn
	uB/T8/gjF3vIzY6Ee4AlAq4VvPnhT5GFHBOn9CnjTnuN4DASYKaybUKoxadO0bmtSyMTpUJ7Ndq
	UQDojxoz+tfgGbQXVeVRsJqQ3K6N7FmNinGNfQacKUHikupY38MyVP6qyBkEVLaoelv/mfDUxLp
	s=
X-Gm-Gg: ASbGncuCJ6z2IlFXSVl7eJYv/0T81EqvMLwubJpjAtZaPNvacBOBaHJGN/GXEDLeDfa
	HxGfnBWTa7TL+30RoL/RfWKwjMNRdh1XKDRajTs3XFtKkV1GHcm9LybpavyBIZRp8EImGODdd4N
	Sb1BrQcXMZppZzycv17sJM7YcIZvWhxLxiaA70m8Yy6qs4Ax27WUD6W9QQyG2HPGkXeHHNhKnio
	vzWpGtgVXLME06FM8oSyIL7dQwPGxQQNzq34BwNjfy2pooWnxc0FkVw/F5g/b7GnPfBEuXGxa4V
	vS+nuHjkYlIs9JADFmSuKe1fZc+4TnSSQzE83VcuDAAIO3EaRhTUqWsTHwU31CKezNCcnBevIE7
	p1fB3Obd99hzOqOhYFPEFGV//3Wyb+9lxXcioSkBIsw3Q3mZR5GOIuJcnRUJGdGr4qGk=
X-Received: by 2002:a05:6a00:1391:b0:77d:6a00:1cd1 with SMTP id d2e1a72fcca58-7ba3a3b0b01mr3109024b3a.12.1763104408157;
        Thu, 13 Nov 2025 23:13:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYEnJPB8sfwK1Ya6MaQJdg8+uU9hW0S/skdsyDB8d0932sb1u7sbTZdiYWG7pHfLjxCyGS4g==
X-Received: by 2002:a05:6a00:1391:b0:77d:6a00:1cd1 with SMTP id d2e1a72fcca58-7ba3a3b0b01mr3108992b3a.12.1763104407669;
        Thu, 13 Nov 2025 23:13:27 -0800 (PST)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be368bsm4295252b3a.9.2025.11.13.23.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 23:13:27 -0800 (PST)
Message-ID: <7732165a-4147-4917-b76a-1525aae13c25@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:13:18 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Only enable TRILED when LPG is
 used by LED
To: Bjorn Andersson <andersson@kernel.org>
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com>
 <7jf4xvqmlymwkyrdp2ulpazfwmhdmfegzigewc5esk2sj323a5@72skiavskrqt>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <7jf4xvqmlymwkyrdp2ulpazfwmhdmfegzigewc5esk2sj323a5@72skiavskrqt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6916d699 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OJW9EmQ22h_mY7tkj1EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfX/S89jjmm984I
 7oZpG8mPIaDY7WuIi710EvCL3szQFiWaOPuXpgoG8u+Mh7Yn6lMyP1cl1mgK9sMgZqcV5Db9XZ4
 3l4PC5A4YLejUE2yARtGDI8EvM1IvvFreLnzI3c0yWg7h/xfHdipPVhK7VOPHwrCDBR1mbLte/Z
 ddGUqXFWQs1OuMRYHogFXWdJkfc2ui1eLT2s6nVeJQ9hkYvdMNI0iyzv9Pc8IZHq/552WG40gO1
 91alOdosXet80h3bEGSMW374lIT4Df8R6h1OskQNGt+LiK+T24aO43RephCFbVbPVXoI6cyYikH
 vEcWWbcwPPtOIlW6kSKfIwCGKVU9PBka0wDCxMg9taPqqNoQ/Zhv/yPXtGRyfn5xbcmI+LqRs2M
 oPXLBziuFsOj/7dZH+NBOds+jhDuJA==
X-Proofpoint-ORIG-GUID: 3dBIYfb-5pR96WkrQdz8TOKjDjV7D8g_
X-Proofpoint-GUID: 3dBIYfb-5pR96WkrQdz8TOKjDjV7D8g_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140055


On 11/14/2025 12:58 PM, Bjorn Andersson wrote:
> If chan->in_use, then the channel is exposed as a LED and
> lpg_pwm_request() should have returned -EBUSY, so we should never reach
> lpg_pwm_apply()?

Yes, I agree.

Change is trying to ignore enabling TRILED channel when the LPG channel 
mapping to TRILED is not used for controlling the LED (not defining the 
LED child nodes).

So the fix should be just removing this line instead of adding the if check.

I will update it in patch v2.

>
> Why do you check chan->triled_mask? I guess we will still read/write the
> triled regiter, but don't make any changes if this is 0?
>
> Or is this the actual issue that you're fixing, that we read/write the
> registers when we shouldn't? If so this should be clarified in the
> commit message.

Yes, there was a case that a LPG channel mapping to TRILED is repurposed 
to control a fan, and it was seen that the BOB1 (supplies to TRILED) 
voltage bumped to higher voltage when the PWM channel was enabled.

>
> Regards,
> Bjorn

