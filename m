Return-Path: <linux-leds+bounces-5480-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2F0B516C7
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 14:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08601C844DC
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 12:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D6331A541;
	Wed, 10 Sep 2025 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bt7UpaHG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AD31A056
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506970; cv=none; b=DffBLa9r3PDJ7OWnB2LBFgzQONZZgd1TlVQaWjExxpH/q8q99EGTnoWqmWOH9XUMyBoZheA+9b9qsI05YYmgDW07OHLXMzJzXSj342HnN4OaD9WCNcxM/2SFxWW9GdKg6P0x0DNi/wVA04HIWsPYhAU/dnSGGEYUXu0dczEoazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506970; c=relaxed/simple;
	bh=vymP7SZBRqYD9TXG8E8GG5R4bEZaDPWBI5kRzRHzE8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVqlD0zwKpn6MIa+TatPH3NR0tI/ca29o0g1T6vIMEATJvE+0gz+OPBbWde7U9Z1qTM/7TbbtBX0LAH98VwFhwzGy+f+9XK33h9472fKNzow0E+W3xxFRdAJKgevn29Ojnk3N7KUfvZey3dC2L7VyYxsGK/vWeM7jpCMamKbEdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bt7UpaHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFFIW021336
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 12:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/bVuPEBsh2YXnfDsGyxWB+08ksXo2EZydxB1awYjm0=; b=bt7UpaHGoUvYS6iI
	/kAJ7Vjm5Yv6vlIbQeUcsBwNhWBmag7+obJUyCmpk7nNR95wdy9m2VvSgbB7oPoK
	Jmoop+10eNEyCouFT4LIPZWnumIL3MSWl+m8M2QItjaIeQOyMqZS8VFluEIcFH1X
	FLVO4ymeorHcc1uTNUEvmJH18WU/ZFnmogLLXu8csy4OeTrjvreO+5v4IvlQt0x+
	Wpw26rRj/Aets/VA3fI+D7biJlIBTs0O6ej0RgEVELnjI59Dke1iMyeBjF5gA/Cq
	I7QQkquc4n+EdCYCwXe6RRLqYdsPraFyXJvvb7Lx0zjJOJPUDgdMNcEFJdolwnxM
	JE1jfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8abpym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 12:22:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5eb710c8eso14300611cf.3
        for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 05:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757506967; x=1758111767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/bVuPEBsh2YXnfDsGyxWB+08ksXo2EZydxB1awYjm0=;
        b=qK1SFmU6mNZnEW0bewifBkGYCvsGv/whXdZogA4B8ahT7JoMohXjStwCl52eO2HVAr
         KhZI7LL2FyRuKf90dZK3s8pUqFHOsCSc/hq4lweNU/qgvfOO13Wx0UQKATR2bDBrWzCF
         OJWQVCUXveN8p8yQsRSbjISZ3tP1ku2IKvEfSqX7WiTYVEhvKOeE2Aeb1I7GNShBMg8i
         DHiEzts3wzgGOOzADUASa7o6uH8hWg2zQgnhv9zfE/j2RpFK3O8VytuNmfcSmjCwYmx+
         QeO0qeaFl9H3nmVsajE8MYHxeYEaqMs65ba9Pb/gmhJhUulxQ1vFpWOoIlbB6g2lldy1
         WKeQ==
X-Gm-Message-State: AOJu0Yy8iIypmBX3ICsteXbd0PcgohUuIb4hIlbbPcRSgxXj6vN3kYXI
	1kYLTyvI+ZLFi9D6t+WaygdIbbfTpNhCUIkYLmhxuwlurB911ylexVmFLem2DYJDfRJfYSz0Omn
	lAz6aCZmRqNIvUMQEVuD9pxKr3m+nIBTJQhnNtv3lub7ABVh87LUj2F640ndIMu1W
X-Gm-Gg: ASbGnctLzleMaUbytAOLQqhlJsIELP97w7xW7SXXakdVMIi/8fujueBt4XYNbpqWrjJ
	Dtz0zIPgvc3zOOFvmwY6v+gFt+t5DDx5pefnZEvvc/O6X74KSnG4p6vikcFbAiQnl7l1pZMXqKk
	WpJAuYWTKa6MwC0oB8SwyvlEIYxvQmdoItty1f1uHRtLA/MwTV5n8An2sK9sF1+4Zlmv72qfZ5N
	yqaWcQcEru2BNcDmu0XavN7y1VVGHOyhCi5/+dCM2aiSQUGYPkIq0XtPX1iP1zGNFmfHklGSKFG
	721R1Pg9KuL+Jj79ZqnQ5Qop4AH0AAhxw5RUdWmdTruRGg57kbwna1V8uas1ZDVUirCq7DVn82f
	b5ZXK3xg24tLderSdZdVdyw==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id d75a77b69052e-4b5f856938fmr104411671cf.12.1757506965976;
        Wed, 10 Sep 2025 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK96mIjsi7BIczF8k3Y4/aamKeJ97m8Mi+OeD++eGrVhR+uItPR0oN5U4hm/goOgUc9ybqVw==
X-Received: by 2002:ac8:5ac4:0:b0:4b5:f7fe:4e25 with SMTP id d75a77b69052e-4b5f856938fmr104409021cf.12.1757506964359;
        Wed, 10 Sep 2025 05:22:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0783411a3csm159621866b.100.2025.09.10.05.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:22:43 -0700 (PDT)
Message-ID: <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
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
        Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c16d98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=I76Qk8w-AAAA:8 a=hKb3k0M6aziuvKwtClIA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: RRLXsFPchbQ9_Z1v1XEmVUpiXgiIja3b
X-Proofpoint-ORIG-GUID: RRLXsFPchbQ9_Z1v1XEmVUpiXgiIja3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX64dSNP0BIFye
 bidUsq/sW1CgFAD0NdVqQ60B7ze/KW5hjkjNISndT5sMAr0buc2+mUpPCOpHJ4jS1mI8ub6m+wR
 1PefLvebib5xnSxrQ16oGnW8iJZMh4jzlmUJTMbv4uNQmA3ZPiYohN4eOMlGvbPRm1bjJOBH7Uv
 Q2/dSYpfKxoPXTXYlaqUaSUFAe2wK9QEVQibEUGEy1Gmn8uenGExVV0he48fx7jQUSwr5kEcQA2
 t8n8UmjRhnOCMTcisv/HkWjCn58xCdKcv/NMvWsfAnttKnKnhcAZCoIGjdeGOwLeBdxxsdNVX5/
 ID3EQlP5LaSNQ8Kxr1Y2cnMYr36jlmiNTWcX4KH40bVtAnKEfgSpTqsVYd2231MdHtklN4nYDrm
 z1QwvEHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
> From: Hans de Goede <hansg@kernel.org>
> 
> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> devicetree by either name or index.
> 
> And use this modified function to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
> 
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Lee Jones <lee@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

I was thinking, perhaps we should introduce some sort of an exclusive
access mechanism, so that the e.g. user (or malware) can't listen to
uevents and immediately shut down the LED over sysfs

Konrad

