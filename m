Return-Path: <linux-leds+bounces-2213-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E4929AFA
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2024 04:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DA6F1F211AD
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2024 02:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194786138;
	Mon,  8 Jul 2024 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WN4v4FeZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD86469D;
	Mon,  8 Jul 2024 02:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720407589; cv=none; b=KlYG6V8PDzoSBGdA/pxAYmlxL0jW1+bATTFz8iaZSWgbwu+xQS0ECick4OlkqV0fwarLsU8HEFM+iyQBqf1aUyTd4ei2oLxDAKFH1tjLUQx2VdtMtqWdEoqyJQIzFEaJGqmV9oCD/yb+WRu7b1JTZ1dW7nSNft/aMIqOcya/b9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720407589; c=relaxed/simple;
	bh=A1FQ2BG5XM8p1fshxHOyJ7FQDlUasavHLtnXZJmCBN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uo0v6hYupDUoqrou1EexqxpTyoRh3Pp4bDi7nlTDhU2Rvarg27RlCehaSld7glycui+Phx8h9r4oGQzbrgYqdVyrczp0WT5SsVDjPVv4b8fi+c8GY3ZUNuWxq4xC2ugq9kj3dvWitq7hJ5uIZtEXs9ES23aIoISp/tlPo0Yk/Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WN4v4FeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4682EFSP012919;
	Mon, 8 Jul 2024 02:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nTchpMjfhBevEBM42fp3Ef+mrykdVch3hUrrS7l5hto=; b=WN4v4FeZ6gYCnk17
	TK6o9QM1XX7+H4GcrObDY0ZUDbn8vIGUqrcy1JT3c/K3SNKuiufbZty2G0IE90r2
	qwNxSOyxPYl14WUtM0IN5XGXn1MP54IMLQ8JyXvpO0zNniJHzo7jcLyarXciaLkQ
	wjgOQSvd04C7hsByoQurHmLGASTYgSIAHHZJ4GYvA/2yZIH/OXw2ty4CPKxyN44K
	GqAvHzhGGi7HmqWey9rKDCnDF1VdKQay6FcGF22zImNEn6it20W0EGEzKedCaikm
	A0VBtzO0l1QOerSOMYdTu6e3WRxDCrw64ASwYYVX5VGBXEWHXsltXyOaF/R33SxW
	KKwAJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x512edr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 02:59:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4682xcwo012098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 02:59:38 GMT
Received: from [10.239.154.73] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 7 Jul 2024
 19:59:33 -0700
Message-ID: <40dfeb9c-e420-4695-939f-ef9b1985d61c@quicinc.com>
Date: Mon, 8 Jul 2024 10:59:31 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] leds: flash: leds-qcom-flash: limit LED current
 based on thermal condition
To: Luca Weiss <luca.weiss@fairphone.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones
	<lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "David
 Collins" <quic_collinsd@quicinc.com>,
        Subbaraman Narayanamurthy
	<quic_subbaram@quicinc.com>
References: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
 <D2HO9CAE81NA.3UIL5UZ1N5I4W@fairphone.com>
Content-Language: en-US
From: Fenglin Wu <quic_fenglinw@quicinc.com>
In-Reply-To: <D2HO9CAE81NA.3UIL5UZ1N5I4W@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cbG9am1QUBLpZ3l3KeuYeJbmyqb9REpU
X-Proofpoint-ORIG-GUID: cbG9am1QUBLpZ3l3KeuYeJbmyqb9REpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_10,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=711 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080023



On 7/5/2024 10:23 PM, Luca Weiss wrote:
> On Fri Jul 5, 2024 at 9:55 AM CEST, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>>
>> The flash module has status bits to indicate different thermal
>> conditions which are called as OTSTx. For each OTSTx status,
>> there is a recommended total flash current for all channels to
>> prevent the flash module entering into higher thermal level.
>> For example, the total flash current should be limited to 1000mA/500mA
>> respectively when the HW reaches the OTST1/OTST2 thermal level.
> 
> Hi Fenglin,
> 
> Only semi-related to this patch, but I wanted to ask.
> 
> Since most phones with a flash also have a thermistor for the flash led,
> is there any plan to add support to be able to declare the flash led to
> be a "cooling-device" for the relevant thermal zone? That way from a
> Linux thermal API standpoint when the zone gets too hot that it can ask
> the driver to throttle the brightness or turn the LED off completely.
> 
> Right now the only action the kernel can take is with type 'critical' to
> just kill the entire system to mitigate the thermal situation.
> 
> Regards
> Luca
> 

Hi Luca,

This change provides the ability to throttle flash current based on the 
thermal status sensed by the temperature sensor inside the flash module 
HW , it doesn't need to register anything in Linux thermal framework.

For the case that you mentioned, when an external thermistor is 
installed nearby the flash LED component and normally the ADC_TM driver 
registers a thermal_zone device with it, I agree that having the flash 
LED driver providing a thermal_cooling device so that any cooling 
mapping policy could be defined between the thermal sensor and the 
cooling device would be a good option for better system level thermal 
control. I would assume that this could be added in flash LED framework 
driver instead of the client drivers considering this should be a common 
request because of the big thermal dissipation of flash LED?

Fenglin
>>
>> ---
>> base-commit: ca66b10a11da3c445c9c0ca1184f549bbe9061f2
>> change-id: 20240507-qcom_flash_thermal_derating-260b1f3c757c
>>
>> Best regards,
> 

