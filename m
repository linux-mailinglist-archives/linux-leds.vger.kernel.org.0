Return-Path: <linux-leds+bounces-6570-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F452D033EE
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 15:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 223603115FC0
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 13:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CB64308A0;
	Thu,  8 Jan 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plQhJESP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Re+uvKy1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289D41C2E5
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864142; cv=none; b=Viavo8I6+dITIhOryn2HJ/TzvtcXojK1RZk82YCCe7L5XK+HTLamPClctl1Tl/Rn8whUoySE/m2jNSFMD1fHdkPHeZFfzWg+R4nfNky8D3DvYtNKygIWz4RNvP7DQLUNI2oSQ5M19JpDPSc1X3qfmPJKOFgxwFljaWSM91le8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864142; c=relaxed/simple;
	bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpmlFhcGsmXKL7bI1NPiptnycEp0qDeWcmP5CgTZhUC1b+HfLIZBO2Zt/EUE1eRdUrDLlWlJxSYLzSXzhBOl0kBRrJL/S//XIKtv3raneROLPpSPBJVYvKXaAUnzF7sjFPlT9rOAkkE8pRSdlUVBYEpsoZ228GGug3XbrJQuJmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plQhJESP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Re+uvKy1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088wAGx1570573
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=; b=plQhJESPDxEeM+e6
	WXA3kc/FSUTvnZS1khnkQ/Vjx0lvvLW6JQ0AE4QeMbPjlI/iVXQ98yXUt3SLs8F/
	0VGcfTyI2POoi/JlLLyev8vCDbJlIy9LP6BBYnGD6SpbVlrRB4e/NicTKFXxKnBJ
	nBDzQ9QVlHg2CBAHq7ubQ2swcWWqDXD3UeZ/zyhpb649EQV45S24Qv4KGgFhM3nQ
	f7OFya0bzEfnloulgLTlSqfxe6qBs7xiFDREP9FU2hj3fip1f60e53LDINSpBOsf
	G0RdJ7zWPVd/tpneNzO8uO5uACEd050IBCJVc5KuQy6HXi9R1rMB+RzadENkNLd6
	Vnqs1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqr39e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 09:22:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ffc6560f05so308311cf.3
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864133; x=1768468933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
        b=Re+uvKy1XG/zRpfe+uhQOjfwedit7InXKmvml4t4Ghh/cfeR4ZYCQ3uh3pr6QoobWQ
         M7C1yhKc8CXmZg4yY/hKFvXiD+On/zdSL9NDZ1KsulHSfIEo6Ia0GPs6/6yVvsUtROeQ
         l32ro5ptfk3vA96Z4Ud7IGDIcK2nfmKTy29KvC8Ugk/tafEcruWbW5H0+W8REBuiyiM9
         Fs+7NB+XsRgLzzZD+moX9QBoliIH+TbmdJLa+Y0dTlWDl7HxQjD+KOTK7OkKOunlGjmg
         TvLItDF1uppMNZD3qj57BNT1Nk2d/hmbHZNYwaaffPMz+Jo3nRtKMd8x78Sa57EUvhnT
         geKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864133; x=1768468933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NykHxiLesQcmL2nusIInhtRLoMtoWy5GzdgE9w8Y6EM=;
        b=F4E9obaXx9GjhkOYW/Wked3oK+i4ZhZXRQsW64tu6HhdXqZrQhm3kPYr11SEgFg9vH
         Q7nd9R3tp2ddfDND1vAQxhG29uNPeGXtJeYC41Qjs8ufkSYrFXyacYG8YSpqmqnZakuq
         zm0UpQhOVeoo5RIxkHqKBlufgCovcPI2pAHF+VuV3n+zjaiv7yNuY0Bi3wejGmUrHVF7
         0xlq6/AUhtTloju6jhajh56RYKiGAI/MxQAqly4irsOMKXAj5S07TndIvAv3u1tdnFyJ
         9Ee1aYqAQDaRCECUfMYjD3KPeb7GOMLoFurY6GCU4hnHoHsEyVg+bhle0eMnQgRQ5zB6
         s7dw==
X-Forwarded-Encrypted: i=1; AJvYcCXO2V2ATrNhvKA9R5yDpCk7cEppxJtSh9VJA+Uo39nQ2E2JZWHWWm66UmZfhSEoMytQv3SlHZ5VtuMZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6mAAGqtWpp0H3BwMkE8vjNVEMAOhimyh8OPMs7iuPBWI944YT
	JY56SvMg1XOi1aafluBJpUwfetqZvAJr8Tx284AMpscncahxQsT4+neJIurnSQa3njUgjXzSM5x
	mUq0a5Qi6k2MkK38FWjDy7bsV5Tqe/C5jB0DFhDdqLiuur98050TzaxKCnMoTR9pm
X-Gm-Gg: AY/fxX5UXhWRqss260pl1RhOX5dwkB+OD8IWvWJg5xXrmytSEmtamitBGQ8bKL3SyJL
	5RBMNT+p6miOmT1BazKZs09By+LcG/cwqi4NJaLzzuO9Xl6kX/rJZ7i4tc69YD84CYnciiXK560
	dC8VmY006SAOOI0nBcVcvya2A807/3stzzNT999K3tjYkYJYfh//Hsl2S9PBgtqdUeHK5+ovfDR
	Ymwe3w35o2WgmWeIXvBIexxYLhALipZllEANzqkamkqPOiZaDNi8hWJaNqptySJB3cRkJSI/gtB
	nm9LnoY+reDFPSOUTvLU9nHReh4wVcIJ5igipPrIab4JbOXxXK37tDVtJWhrvysvk0JNoCDNDxC
	hvRLV/pqyVCK86ADqU/F2aHkmZZ/WHscRcOuOQWob+bxVO8yUA0KluE60lFajjWPnpv4=
X-Received: by 2002:a05:622a:211:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ffb4a73847mr53808901cf.9.1767864132601;
        Thu, 08 Jan 2026 01:22:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY4wdNCuBrMFoo9DDpE5DqvPtrXyk71CRz9mJOSVhhSxeHi/+bMqRghkU10RrDVSHGxOxCIg==
X-Received: by 2002:a05:622a:211:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ffb4a73847mr53808561cf.9.1767864132191;
        Thu, 08 Jan 2026 01:22:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be641e0sm6930953a12.22.2026.01.08.01.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:11 -0800 (PST)
Message-ID: <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: barnabas.czeman@mainlining.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
 <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=695f7745 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=mtDAOQl0mCcS2X4wXL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 35NX7rwx0-b6TrV3Ehs4V9D-jp06Bfb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX7FBhZoKzZbh6
 40Le0dLQFWWUFX6wufpS0ldgl4Xt+rXeEZiKEFG5q0Vbuo5cuqEti8UTTgbeFJhvkui4BuUYxic
 WhRLdwfI5UOi3YUrr73/wN4Tjm6JVgtyWAwqonGIkwSj8H4s5OSMd2q5oxrDfoqL3sHjppXpX1P
 q7TkI66vkHInNoBYkKIeqzHb6MT8AOMt0/L4NchvDYvFyDXq9/lmgHdsOzdztHOElDrSRJLdSHb
 PTVBe6h9pRb2GNTVL3rppNvkPku71sDeo7jDdQq1WtBJnycc+v4CYUO87/HtaPLPSp9qHMeokG2
 qjWUYsFG9mVM5CwQlfGlJTDsxdZMeb4QahzvHH7eOvaieno7v7VJgvvBeIvfs1QxzLNj5zFMg+0
 YY2+eLkJlutF4ooqmcEromItytTuwIK7iIT5gVpTs3IbilRjuA6kvG77VwXy8uxL4l0QWV/6scN
 dDS7QW4dEFVd53iz84g==
X-Proofpoint-ORIG-GUID: 35NX7rwx0-b6TrV3Ehs4V9D-jp06Bfb8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/8/26 10:17 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-08 09:54, Konrad Dybcio wrote:
>> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>>> Document ovp values supported by wled found in PMI8994.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I reviewed a version of this that said PMI8950, which is very much
>> not the same..
>>
>> Let me try and get some more docs to confirm or deny what you're
>> saying..
> I have sent it for the previous revision msm-4.4 contains the documentation.
> https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u

Right, but I didn't send any reply acknowledging that.

On v1, my review tag meant "I concur this is the case for PMI8950"

Because you carried it in v2, it appears as if I said "I concur this
is the case for PMI8994", which is not what I then said.

Konrad

