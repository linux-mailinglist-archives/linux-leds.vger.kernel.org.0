Return-Path: <linux-leds+bounces-6158-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD9C62158
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 03:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE2E3ABD84
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 02:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C88236A73;
	Mon, 17 Nov 2025 02:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6YZpvcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiOFGbja"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3E1E3762
	for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763346155; cv=none; b=axNOrUEZcXTtoSzCafcHk54rs1YZMZFMOmZMvRaOahLGCfae2FKCpwK7gHfA8Q1V3VsdKoUfdqzD6cFzJJmQF2n3Sx+W1eE8rmGgCEfgRzYs4quNMHdlVBogZpz2x7H1qvSFf9v+ed7zXeonvTaAqFDz/uvRyPfJp+qMV9fv0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763346155; c=relaxed/simple;
	bh=e+p48IaoIhLfXRpESvp6/pHVPXSO99iUgRfoHczmL14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmAoQHEclq/oR4gec8z04QreTF7fPZxG9ix5u2vi7w2neDlKhVHFwlpRVKsGwfmYoBJfroMybhmmRJLJNNea6C9IGwPQ2TZJScI2cNiqPnfrDTE05kvgJ4JUCNewbWiaod3+v7PdxGF9YgiW9f1HNYJeAhhTU2UJQIcAc2aNBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6YZpvcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiOFGbja; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGH2dnS1680204
	for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 02:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYlVhddMHWTqti30RONS2XolCrlKESX7cb8t/mBL6EM=; b=i6YZpvcEazbBUaFJ
	o9oxWg0gtdveZ+InITy6kEk6LNd8vy3ZYbbs7D4+9PJD90gnYSdgnWIXYwQaLtuF
	8AjNQ4aiJFXi0BNbMTdTNq8c7ueltsH5Qle/2uhqvI1jTbWTY88yPKr7Xhd8wzD5
	yS8sSyD7wxfUw3S/60m5nHhWc9qiX5pgNpK5T8v2rMY76ZYx0TQ49vFH/4/N7K3v
	Y80H8coHI0Bt5++kSf3GAk9aK8gR6qUrU4d0+DV6cqLQdmsQOsAaVpI6CuYAMYcz
	CyzPkEpnWkOIMQAB4+fXBZ0avOQ9EtGFO8R4FainGLtSzcw2iNxLaKL/WhP8owzD
	Q7Xgkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejk1k1dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 02:22:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e5a18652so43567725ad.1
        for <linux-leds@vger.kernel.org>; Sun, 16 Nov 2025 18:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763346151; x=1763950951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYlVhddMHWTqti30RONS2XolCrlKESX7cb8t/mBL6EM=;
        b=FiOFGbjaRQ6IzE+rGwivZZD+SUfSl+VM5OqioHIMbhRnCoJjIO7wrjJ1VZ2V8M85aC
         N0TZ1lWrzwUePs/ikslWLM2cmgayqUwAaEZTSYXi+MoYlaf3N5oPvWSmD8FkaLCvntJv
         cWeWbPCcsSYB0Sg0hS9VZSWo54EgDMbEke4JrD3ovbWtgtRMIXJuFKXp9lGezlq9dsAX
         fu8QvILu3C6eEuu7R8urjEUVYo6MPSoQOpQ4zqgmk3v+J198qxquj/rLoGV3Roc+9L66
         SrAhsmQCkvRCmRQ1lY3NC+Hnj0AyCTzjxsOJKegwU2cgTFYl1OXh51sxC4UX1wFMN6vY
         RnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763346151; x=1763950951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYlVhddMHWTqti30RONS2XolCrlKESX7cb8t/mBL6EM=;
        b=gvuawYpEIgHepEjm5wjnGXhTnXlg6pCtzsHmHUKyPR8e+FgUSzjGb+8g5alpnW5wcK
         HBCTCH8lbHaqyEWYMGPLklyww1R6eAHi2KcriUfTuTJzVIhNjoRDljgxMZi/tzhb7cYW
         wHx68ygK+sLfxt+irl6e2oHcpb6cAdblz+/NIlKLCdAHJzCVpliIeH/dQhl6qAPu/q4G
         bvdN4uDkrKw0lY8po1/PgT6AhdMZ9Amxv04TlQu0/nCRgMZ4L5BhtZGrHCremWBnPcSu
         1R0/dd6BesoeC0VPQALJ1cXZvWISzOMqf6umSb//hjHMjGT3bfXpMg4bpzF519fJHdtw
         WEow==
X-Forwarded-Encrypted: i=1; AJvYcCVb69nflCupSU1b6YQmktIMp5qGuXuTI4l2WSm95xAxItAuavW6mqezayD2T82t3+5eqojW8tKtiAPX@vger.kernel.org
X-Gm-Message-State: AOJu0YzaIRoqctgZYs6s6XXJlRDlf6Xi7ynN6q3CP45pTjY80ZvNu178
	ELaOVUJj4BImTsf7KwuzHyfTPiRfXhCMaoj5Ozd9g60Or6YaCXKyrw0cB3WtAumoj4MtMBq6Hi1
	u5FeGOO6d/ooC9lmQ3/lNfauyaqNuzbt5MG/BasZ2dunmM5T8iZkwB69xH6cElPoQ
X-Gm-Gg: ASbGncs9VFWbwO5LCpGP3OE5W6M5hQ+SECv1y/OSObmYkS0ZdYpP3DxaBtU+9h7T9De
	Pilp/6VfFfca8mifeulh3JtYR7rAWMD9yqJBnSiD6rJrZlx7ZgJ97NVhfsXZx6n8SJvPHca1KPv
	7cMI5StOjdDC1pJz9p/vnUSmls++Q7d0D2yfoRyN+Q+R00Brj3KwHp8FJRXJAbNYs2ETWsk7rpF
	xE/1EhgkN9w6p/hwbCOfFBGY8q2gX3JPmwpglXs15KqfyVrlcT3QD1vQFxrQnszkqzccV0RHxCT
	1KL559YOFqDow9LsBtJ/RUXujYftLrILA2PflU5ovIzxDLtAwRo5JuFuJde59GH94PYa0DEbMRS
	4Lgfshs+B0bo6FPagG4v2KiMloJuqJGaW/IEhVoveZ+JKvT+NnIv7eO/Ufp9FPpkKT/I=
X-Received: by 2002:a17:902:e947:b0:295:7b8c:6622 with SMTP id d9443c01a7336-2986a6b8751mr131260995ad.11.1763346151450;
        Sun, 16 Nov 2025 18:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3D3b+HBgeuxjjE3vKDtxkEEvpqpfT69zOTS4Ccxq4aUIezvfTp6KMVKhasPkouV5wkn+nGw==
X-Received: by 2002:a17:902:e947:b0:295:7b8c:6622 with SMTP id d9443c01a7336-2986a6b8751mr131260715ad.11.1763346150967;
        Sun, 16 Nov 2025 18:22:30 -0800 (PST)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bebe1sm120036205ad.82.2025.11.16.18.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 18:22:30 -0800 (PST)
Message-ID: <cc41233d-f270-4cbe-b355-64f4dcd0652d@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:22:23 +0800
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
 <7732165a-4147-4917-b76a-1525aae13c25@oss.qualcomm.com>
 <t453czpauswdttsl5cqxwk5ryc7aau3bz4jfwfe4istkffgp43@ffoiicvnbxzh>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <t453czpauswdttsl5cqxwk5ryc7aau3bz4jfwfe4istkffgp43@ffoiicvnbxzh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ypt2omYBKWEAWRPi7mkFG76g6VnQBlTL
X-Authority-Analysis: v=2.4 cv=OpZCCi/t c=1 sm=1 tr=0 ts=691a86e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sxwf-mhpPifykftr7pEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAxNyBTYWx0ZWRfXx3AEX16T50YR
 u/wqcJtyTrYCDPDJz9B/1lZKHSHONHCAZgykuUOSCFIif0Xc1ijFAH/1kpdAU9c3mgzMNOc226P
 jn1U3ldH3nuFnYATPbrwXwyO3c1DGthU4HusVanuRQOinUAWXqLatdaraGYzvzEb97YEdWhQJVH
 mv1ZDXIdag2dUVMBHcGchhdbnU4PQwaweHO93oSMigq44w0sOoNvtmXfuq3+zlWLQGzOGCQkLaQ
 v45cjYcJsjmULgF41kaVqK1zd+1PjugjF5lx5lzPoD9bRYXHWi9bmpIpCpuSbqG4JiI8//zUMOc
 +4JjjgtnvwvxOrXYz+IKAyEg11wUWDnB09o/1RXFV37Vhv1UQ92it54bTmVgePLbillYkkYLNy0
 EPh9UmDz2YWQUCIKsOchQhw8KkKJqQ==
X-Proofpoint-ORIG-GUID: Ypt2omYBKWEAWRPi7mkFG76g6VnQBlTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170017


On 11/14/2025 10:56 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 03:13:18PM +0800, Fenglin Wu wrote:
>> On 11/14/2025 12:58 PM, Bjorn Andersson wrote:
>>> If chan->in_use, then the channel is exposed as a LED and
>>> lpg_pwm_request() should have returned -EBUSY, so we should never reach
>>> lpg_pwm_apply()?
>> Yes, I agree.
>>
>> Change is trying to ignore enabling TRILED channel when the LPG channel
>> mapping to TRILED is not used for controlling the LED (not defining the LED
>> child nodes).
>>
>> So the fix should be just removing this line instead of adding the if check.
>>
> Sorry, it's been a while since I looked at this code, but isn't it
> possible to configure a channel going through the triled to be exposed
> as a PWM channel and if so, don't we need to enable the TRILED driver
> for this channel in those cases?

Yes, this is possible, and enabling TRILED is not necessary in this 
case. The signals from the LPG channels mapped to the TRILED channels 
can also be routed to the PMIC GPIOs by setting the GPIO pinctrl state 
to the "funcx" function. For example, for LPG channels in PMH0101, based 
on the PMIC GPIO usage table, these GPIOs can be used to output the PWM 
signals if they are configured to the "func1" function.

GPIO05 -- PWM1

GPIO06 -- PWM2

GPIO11 -- PWM3

GPIO08 -- PWM4

GPIO09 -- PWM4

>
>> I will update it in patch v2.
>>
>>> Why do you check chan->triled_mask? I guess we will still read/write the
>>> triled regiter, but don't make any changes if this is 0?
>>>
>>> Or is this the actual issue that you're fixing, that we read/write the
>>> registers when we shouldn't? If so this should be clarified in the
>>> commit message.
>> Yes, there was a case that a LPG channel mapping to TRILED is repurposed to
>> control a fan, and it was seen that the BOB1 (supplies to TRILED) voltage
>> bumped to higher voltage when the PWM channel was enabled.
>>
> Is the signal still routed through the TRILED, or is it muxed to another
> driver?
No, the signals will not be routed to TRILED but through other PMIC GPIOs.
>
> Regards,
> Bjorn
>
>>> Regards,
>>> Bjorn

