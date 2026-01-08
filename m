Return-Path: <linux-leds+bounces-6572-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F90D023CF
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 11:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C20213007651
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 10:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13C6435311;
	Thu,  8 Jan 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyXLYG5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3QjcwIQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE59543531D
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864175; cv=none; b=qryKu5/ZCJ2Il0WfCnR1BTKFWjcUlPDtE+yO6U+9WfjuinImCc0aDGpQwb2obyABtExZ6qCLci6UPVK11mSMd+GlEOk0cPZo8TLz6ZKBSC7BCAQPMgceDE41k1iBgfYThtbYZRRhx/Z5qwWQgaINLV+SKky2sdAUz8v2gl7xM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864175; c=relaxed/simple;
	bh=vKerELevSng66xC6jQJ3bmm9PzkzjOX3+h984hOwKT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVwXUmYujfS4i+tjCJyEDPsAQ70144a9/Z+BVePT+wmgJVBC5vKwrRj/j7SS5a9rxHDFusOkDTTZ7t+PvZJ1L6RG1sCdBmm3XDcIg0IalggRTS+IEclilZXOcHs8gHg5nE82xloviEseW1VErHFBUyzDCzNgrjgxu03JIaGxKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyXLYG5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3QjcwIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60846s6d2785525
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 09:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=; b=dyXLYG5yvBoRM3zd
	6WqgKT4hyI+1vpzW4PiJe0R82IZCp66vnO68/+bRnJIo+zP2g9mEc3ZostpuRWxh
	HaqHYSOhJowCtwdgdo4sPoYfOYlJy45DkH3PH38GArau0/6cRabZu+ITGTlpNVrc
	mlZbfxE/SO+kT+pOubgVAb/GB4vwJI32Dz0tqp/DhjyTmZ1ugb30nGkjXZgyvMvS
	34NPMqzaSOTCsITASMJ6a0mU5kNZ822ijdhw4SNG3XP7/eF5rQPlr3DHY7Esaes2
	09cYOWI97/oI1pzSEBxx+5qvt0PPGxzFwOfR6gzCAS00gxcHKizZBcyjrJOgAjmY
	2/9hdA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugw9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 09:22:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a39073c8bso9098556d6.3
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 01:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864167; x=1768468967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=;
        b=N3QjcwIQVyCgjmWyPgZSKRgEjl6ZU74/pzOtVxrlY3KLJM+4RN6i+dE5S17HVcLhEh
         xAU0RwHgMlnq2PCUDhPjmSphftsg8oIihTV0FbXc1PD9Ub4oq6j8IM4e0BQ8qA1fafpB
         VY+oYz9PwbQMc10HI7fXYnRzWfwRobEC8N2Xp7RgivaRQZNSkaDVNgw+kwYNpP4LqqD9
         6RYyaeW7sSp3011iUbe2Y24gN3po7gDghEgQmX04Zs7P1PmU2AeKOfG5+ihSM9TuDxlJ
         4Rjn5l2+0rCWIsuSQbH/xIogjKVti9kLJvG66APONPGufcrlyPjZnv14bim5ErAVpkGj
         YayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864167; x=1768468967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur81gEXIS6mzyuOT+3mLeiSWiGD1gehijf5jkGbJanY=;
        b=b/z9JV7DihOB5LkmOdT4hxYh5nVZPujhAZG7pyn62a5VVQb4B5Lcys/kt2SwnQYc8W
         THH1SM+dKWAlbI/0i76dR32g/HH9+OIc0qFdht0d0tpL1nm3k0ZNAai3mOUa4ELyjZB0
         fferpfxOfeqaWzx2MITNJOslbnWfOQEE67JARN8ML9Ri/CPVf1oQRVQEycLcidHFhvUi
         8H7ReI5/Ca5NF8uYrUlbUdThLsYOceMoeTQGyZ2MUj82y425TTigpfK3LU0pOhvZ61QZ
         e0Z+GSCP8jYfVcS7DMLtxwJ/HKtU3LWwVj12KsDMJw1dRuQf9wJH0mXQ+4/4UVTrjOaw
         zuEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3c9TuVOBr2mumpbV+EhoLSSmTk9rexYC5fRK8Ef5Dqsmtu+bDj+IhHAVC20E/gKdvlqoFrAtX2w0D@vger.kernel.org
X-Gm-Message-State: AOJu0YzrETRB1EyDm4QjZBzbDJc1iSoBLzDbLZtMmqHjYe/eG7jUm1Ux
	AuCGMwX0962s9NmZEeDV4ytY150ag0dqNgkhT4cRhLy/WseR2nJAjXg3Bkt73HyaRyyp3Y3D92m
	cL2Ig+gafvyYzgGcElh8wzHL787GWfjWblMBCwsMRzlBb1ePcL3Pcd2SssNaBuZ5U
X-Gm-Gg: AY/fxX7/VKdfn9QO3KWB+LDzSzopc2D3tJaM0xGBYtTXmNW7uKu/+tIHloB9oBARKX3
	vbzpe2eppmAGOycZJFtc0f6Ht1xmGZyrlsem1a3Ig/Ax48jtDWUFvRwCMoZScDpkoLT9tDxKHfD
	Rl1cprmak1HJ9wqufsen6jIBWFV4vInNISiiuqS2fcHljQIN3xPQ6/ZJfQOV6rtfPHjFMzU5lt9
	PtgaTQWC++pG64lxccu342RyrBSOahskIjk/J7iCA8H3o4lAJjaI+vOKIWUJ5S494gnphsMJKjM
	slA9D7GFJyE+uJ0wUqpbCX3azOgA7tRkhjEaIPhjm9UUK0QGwbJLTOOM0PGqPUJ5WhsjwJ+a+10
	J+qUZOnrmvoUwrw1Rw57erkAlgN/ZGsVfsCgwTclUsEZODcrXAwQXVWGy58n1OmfaOxc=
X-Received: by 2002:a05:622a:307:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ffb48b558dmr58978791cf.5.1767864167513;
        Thu, 08 Jan 2026 01:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESz7XxqM9XjQeyJC6Vabm1GdmsiTvWUlPsr3BFnCnOv6Uphl9e+re+AckjETMw29nhVuUAjA==
X-Received: by 2002:a05:622a:307:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ffb48b558dmr58978571cf.5.1767864166971;
        Thu, 08 Jan 2026 01:22:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm767583766b.2.2026.01.08.01.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:46 -0800 (PST)
Message-ID: <88beddf1-2a76-42d5-9798-3840e0e86cea@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
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
 <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX34zNb9cxSVVb
 w/GENXyAOmueFxpGp02uFuF7ya3zxE8NN4TA8isukkKRTsao9rQEm55NAlM3Fe62Gysbvm/m+Rh
 asmhNFZdrJApCbv5H4yp4qzdDaDWY39qOj3SqobtZ0OwUqtXaRbe5vDYkHEMZPG/nCZwV5SqDkr
 ezFE4tK/Zu+2ZuOlfrvJ0YknTEnOHrUpMWHaCPAW03FGJqDEvhMI6edqmRuHtafVTmATBhJ+dcU
 DXYxl38vHcpS0I+jXdS3swGR1n+o3veLnrIO+TXARn+VwfJDEbBNhvRuBesillVcHJWqnyQYDfY
 YN3XzFtsVVzrJiCkjnO6YlUOz/24q04TscIj7ze7DKAlAc9HjY7VTQLNCVNQVxec7YdOMxExe+P
 BIUzNIjziidRfKSHeweO+b2TJH+idMYfLAdXSIs7r5wWj1t/JdplVVHD3Y0VAIIBbCK58dcx8MK
 dQlQcZDkf7+stwan1fA==
X-Proofpoint-GUID: qOFHVDLycqIHvTUJFMC18t_gXMnYSWju
X-Proofpoint-ORIG-GUID: qOFHVDLycqIHvTUJFMC18t_gXMnYSWju
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f7768 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=TDiaKIjp1V8PvaA6ZvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8950.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


